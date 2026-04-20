if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.g.neovide_scale_factor = 0.8
  vim.cmd "autocmd VimEnter * NeovideSetScaleFactor 0.8"
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

return {
  {
    "AstroNvim/astrocore",
    opts = {
      rooter = {
        enabled = true,
        notify = true,
        autochdir = true,
      },
      options = {
        g = {
          neovide_scale_factor = 0.8,
        },
      },
    },
  },
  {
    "Olical/conjure",
    ft = { "clojure", "janet", "fennel", "racket", "hy", "scheme", "guile", "julia", "lua", "lisp", "python", "sql" },
  },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.git.gitlinker-nvim" },
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.marks-nvim" },
  -- causing issues?
  -- { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.project.projectmgr-nvim" },
  { import = "astrocommunity.ai.opencode-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.fugit2-nvim" },
  {
    "sindrets/winshift.nvim",
    specs = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<Leader>w"] = { "<cmd>WinShift<cr>", desc = "WinShift" }
        end,
      },
    },
  },
  -- Snacks Customisation
  {
    "folke/snacks.nvim",
    opts = {
      -- log level: TRACE DEBUG ERROR WARN INFO  OFF
      notifier = { level = vim.log.levels.INFO },
    },
  },
  {
    "linrongbin16/gitlinker.nvim",
    opts = function(opts, _)
      local utils = require "astrocore"
      return utils.extend_tbl(opts, {
        router = {
          browse = {
            ["^git%.viasat%.com"] = require("gitlinker.routers").github_browse,
          },
        },
      })
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.options.opt.guifont = "FiraCode Nerd Font:h14"
      local maps = opts.mappings
      local astro = require "astrocore"
      -- maps.n["<Leader>tc"] = { "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send Current Line" }
      maps.n["<Leader>tc"] = {
        function()
          local line = vim.api.nvim_get_current_line()
          local col = vim.fn.col "."
          local indent = line:match "^%s+"
          print("[DEBUG] line:", line)
          print("[DEBUG] row:", row, "col:", col)
          print("[DEBUG] indent:", vim.inspect(indent))
          if not indent then
            print "[DEBUG] Sending current line"
            vim.cmd "ToggleTermSendCurrentLine"
          else
            -- Find block boundaries
            local row = vim.fn.line "."
            local start, finish = row, row
            while start > 1 do
              local l = vim.fn.getline(start - 1)
              start = start - 1
              -- if l:match "^%s*$" or not l:match "^%s" then break end
              if l:match "^%S" then break end
            end
            local last = vim.fn.line "$"
            while finish < last do
              local l = vim.fn.getline(finish + 1)
              finish = finish + 1
              print("[DEBUG] Downward scan line:", l)
              -- if l:match "^%s*$" or not l:match "^%s" then break end
              if l:match "^%S" then break end
            end
            print("[DEBUG] Sending block:", start, finish)
            -- Visually select the block before sending
            vim.api.nvim_win_set_cursor(0, { start, 1 })
            vim.cmd("normal! V" .. (finish - start) .. "j")
            vim.cmd "ToggleTermSendVisualLines"
            vim.api.nvim_win_set_cursor(0, { row, col - 1 })
          end
        end,
        desc = "Send Current Line or Block",
      }
      maps.v["<Leader>tc"] = { "<cmd>ToggleTermSendVisualLines<cr>", desc = "Send Visual Lines" }
      maps.i["<C-CR>"] = { "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send Current Line" }
      maps.i["<C-s>"] = { "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Send Current Line" }
      maps.n["<Leader>Mv"] = { "<cmd>OverseerRun Restart\\ viabox<cr>", desc = "Restart viabox" }

      -- I have to do this, or I get a stack trace. The `args` in the original is sometimes unset.
      -- Original is here: https://github.com/AstroNvim/AstroNvim/blob/e3434ed8ba30af34b36d270b0197b91e444b9363/lua/astronvim/plugins/telescope.lua#L71-L77
      if vim.fn.executable "rg" == 1 then
        maps.n["<Leader>fw"] = {
          function() require("snacks").picker.grep { hidden = true, ignored = false } end,
          desc = "Find words",
        }
      end

      -- gh-dash support
      if vim.fn.executable "git" == 1 and vim.fn.executable "gh-dash" == 1 then
        maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
        local gh_dash = {
          callback = function()
            -- local worktree = astro.file_worktree()
            -- local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir)
            --   or ""
            -- astro.toggle_term_cmd { cmd = "gh-dash " .. flags, direction = "float" }
            astro.toggle_term_cmd { cmd = "GH_HOST=git.viasat.com gh-dash ", direction = "float" }
          end,
          desc = "ToggleTerm gh-dash",
        }
        maps.n["<Leader>g-"] = { gh_dash.callback, desc = gh_dash.desc }
        -- maps.n["<Leader>tl"] = { gh_dash.callback, desc = gh_dash.desc }
      end

      -- copy current file path
      maps.n["yP"] = {
        function()
          vim.fn.setreg("+", vim.fn.expand "%:p")
          print("Copied full path: " .. vim.fn.expand "%:p")
        end,
        desc = "Copy full path of current buffer",
      }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    specs = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local astro = require "astrocore"
          -- <C-'>, for some reason, doesn't work in tmux or screen
          -- so, change it to <C-\\>
          maps.n["<C-\\>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
          maps.t["<C-\\>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
          maps.i["<C-\\>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "Toggle terminal" } -- requires terminal that supports binding <C-'>
          maps.t["jk"] = { "<C-\\><C-n>", desc = "Escape terminal" }

          if vim.fn.executable "lazydocker" == 1 then
            maps.n["<Leader>td"] = {
              function() astro.toggle_term_cmd { cmd = "lazydocker", direction = "float" } end,
              desc = "ToggleTerm lazydocker",
            }
          end
        end,
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      formatting = {
        format_on_save = {
          enabled = true, -- enable or disable
          ignore_filetypes = { -- disable format on save for specified filetypes
            "cpp",
            "c",
          },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          always_show = { ".github" },
        },
      },
    },
  },
}

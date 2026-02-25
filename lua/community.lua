-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- NOTE: additional key binding defined in `lua/plugins/practicalli.lua`

---@type LazySpec
return {

  -- ----------------------------------------------
  -- Astrocommunity - include one of the following

  -- Astrocommunity Git Repository
  -- "AstroNvim/astrocommunity",  -- default release

  { "AstroNvim/astrocommunity", branch = "v6" }, -- AstroNvim v6
  -- Local plugin development - Astrocommunity fork in ~/project/astrocommunity
  -- { "AstroNvim/astrocommunity", dev = true },

  -- Local plugin development - specify path to Astrocommunity fork
  -- { dir = "~/projects/community/neovim/astrocommunity" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Themes and Color
  --
  -- Colorscheme (Themes)
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- color picker and highlighter
  { import = "astrocommunity.color.ccc-nvim" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Completion

  -- Emojis everywhere
  { import = "astrocommunity.completion.blink-cmp-emoji" },
  -- ----------------------------------------------

  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Editing Support

  -- Rainbow parens
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },

  -- Multiple Cursors
  { import = "astrocommunity.editing-support.vim-visual-multi" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Motion plugins
  { import = "astrocommunity.motion.nvim-surround" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Packs (code-runner, treesitter, lsp & lint/format support)

  { import = "astrocommunity.pack.clojure" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Search

  -- Search and replace across projects
  { import = "astrocommunity.search.grug-far-nvim" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Recipes

  -- Neovide GUI configuration
  { import = "astrocommunity.recipes.neovide" },

  -- LSP Mappings for Snacks or Telescope
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Source Control

  -- Diffview with neogit integration
  { import = "astrocommunity.git.diffview-nvim" },

  -- Manage GitHub Gists
  { import = "astrocommunity.git.gist-nvim" },

  -- Neogit interactive git client
  { import = "astrocommunity.git.neogit" },

  -- GitHub Pull Requests and Issues
  { import = "astrocommunity.git.octo-nvim" },
  -- ----------------------------------------------

  -- ----------------------------------------------
  -- Utility

  -- rich command prompt
  { import = "astrocommunity.utility.noice-nvim" },
  -- ----------------------------------------------
}

# Unreleased

# 2026-04-08

- astronvim: switch to released v6
- practicalli: remove neo-tree, replace with snacks.picker.explorer
- community: add markdown pack including marksman tool
- community: add bash pack to support zsh and bash scripts
- readme: update repo name and overview

# 2026-03-31

Final AstroNvim v5 based version

## Added
- none-ls: use configuration file for markdown lint cli
- clojure: add conjure debug option as comment example

# 2025-07-03

## Added
- community: add rainbow-delimiters with theme support
- community: add color picker ccc-nvim
- community: add emoji completion blink-cmp-emoji
- community: add advanced surround nvim-surround
- community: add search & replace grug-far-nvim
- ftdetect: set *.bb files as clojure filetype #49

## Changed
- practicalli: revert to upstream other.nvim
- practicalli: remove parpar in favor of clojure pack
- dev: ci scheduled stale issue & pr check (monthly)
- practicalli: snacks notifier wrap text

# 2025-04-24

## Added
- readme: describe purpose & use of project
- dev: ci workflows including stylua & stale actions
- dev: git ignore inclusive patterns
- community: neogit plugin rich git client
- community: clojure pack & sub-menu descriptions
- practicalli: personal preferences with conditional skip
- practicalli: startup dashboard logo
- community: proffered plugins from astrocommunity
- colorscheme: load and set catppuccin as theme
- snippets: include vscode snippets from practicalli astro
- practicalli: neovim & plugin preferences, custom key maps
- termux: use locally installed lsp servers
- snippets: comment header & section snippets for lua
- practicalli: toggle between Clojure src and test files
- practicalli: showkeys visualise key presses in neovim
- community: neovide GUI recipe from Astrocommunity
- snippets: neovim api examples in lua from folke/dots
- practicalli: git related key mappings (neogit, gist-nvim)
- ftplugin: parinfer toggle key map for clojure
- practicalli: notifier log level WARN
- practicalli: buffer tab navigation key mappings

## Changed
- lazy: enable zipPlugin to view src inside jar files
- community: picker-lsp-mappings recipe replaces custom code
- practicalli: disable snacks indent guides by default
- community: remove gitlinker-nvim (replaced by snack gitbrowse)
- practicalli: configure showkeys for lazy loading
- practicalli: configure trim for lazy loading
- practicalli: configure other for lazy loading
- practicalli: disable default_mappings in better-escape (#32)
- config: remove unused files from astronvim template
- practicalli: use other-nvim from astrocommunity
- practicalli: rename user-practicalli.lua to practicalli.lua
- practicalli: use other.nvim from practicalli fork (until pr merged)
- community: include parpar.nvim until Astrocommunity Clojure pack updated
- practicalli: vertical split for other-nvim `,tS` key map
- practicalli: fix troubleshoot options for conjure
- community: remove parpar-nvim in favour of clojure pack

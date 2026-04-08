# Practicalli Nvim-Astro Neovim Configuration

```none
███╗   ██╗██╗   ██╗██╗███╗   ███╗       █████╗ ███████╗████████╗██████╗  ██████╗
████╗  ██║██║   ██║██║████╗ ████║      ██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗
██╔██╗ ██║██║   ██║██║██╔████╔██║█████╗███████║███████╗   ██║   ██████╔╝██║   ██║
██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██╔══██║╚════██║   ██║   ██╔══██╗██║   ██║
██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║      ██║  ██║███████║   ██║   ██║  ██║╚██████╔╝
╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝

```

> NOTE: Ascii Art Generator: https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=Nvim-Astro&x=none


## Overview

A lazy loading rich feature configuration for [Neovim 0.12.x](https://neovim.org/), providing common development tooling, including an effective Clojure REPL workflow.

This configuration is built upon [AstroNvim version 6](https://github.com/AstroNvim/AstroNvim), extending the AstroNvim v6 template with valuable plugins, options and key mappings.

[Practicalli Neovim](https://practical.li/neovim/) describes the Clojure REPL workflow, rich Git and GitHub clients and easy management of plugins and tools using this configuration.


## 🛠️ Installation

Recommended tools:

- [Kitty Terminal](https://practical.li/engineering-playbook/command-line/kitty-terminal/)
- [Neovim and supporting tools](https://practical.li/neovim/install/neovim/)
- [Clojure CLI](https://practical.li/clojure/install/)

Clone the Practicalli Nvim-Astro repository (create a fork if customisation desired)

```shell
git clone git@github.com:practicalli/nvim-astro $HOME/.config/nvim
```

Run `nvim` command and wait for all plugins  to automatically install and Treesitter language parsers to compile.

```shell
nvim
```

### Multiple Neovim configs

Clone to `$HOME/.config/nvim-astro` and use the `NVIM_APPNAME=astronvim nvim` command to start Neovim with AstroNvim configuration

```shell
git clone git@github.com:practicalli/nvim-astro $HOME/.config/nvim-astro
```

Create a shell alias to run the new configuration, e.g. in `.bashrc` or `.zshrc` (or a `~/.config/shell-aliases` file that each shell rc file sources)

```config
alias astro="NVIM_APPNAME=nvim-astro nvim"
```

Load the alias into the current shell from the rc file or shell-aliases (or open a new shell), e.g.

```shell
source ~/.config/shell-aliases
```

Run `astro` and allow neovim plugins to automatically install and Treesitter language parsers to compile.

```shell
astro
```


## Configuration overview

The configuration is based on the AstroNvim v6 template config.  Changes to existing file have been kept to a minimum, except for `lua/community.lua` which has additional plugins from the AstroNvim Community repository.

`lua/plugins/practicalli.lua` contains Practicalli specific configuration (plugins, preferences & key maps).  This also provides an example of how to modify and extend the AstroNvim configuration yourself.


To skip the Practicalli config without changing the configuration, set an environment variable called `PRACTICALLI_ASTRO` to false.


Create a `lua/plugins/user-yourname.lua` file to:

- override default plugin configuration
- add new plugins (or create a new file for a plugin to make them easier to be optional)
- customise key bindings

[Practicalli Astro config design](https://practical.li/neovim/reference/nvim-astro-configuration/) provides a complete breakdown of this configuration.

> NOTE: Lua files in the `lua/plugins` directory are loaded in alphabetical order so plugin overrides should be the last file to load, e.g `lua/plugins/user-*`


### LSP Servers

Install an LSP server for each programming language used, allowing the Neovim LSP client to obtain diagnostic information.

Mason is used to automatically install LSP servers, format & lint tools.  [Mason Registry](https://mason-registry.dev/registry/list) maintains a list of the latest release for each tool (automatically updated).

Mason can be configured to use a locally installed Clojure LSP server (using the [instructions for your operating system](https://clojure-lsp.io/installation/)).

[lua/plugins/termux.lua](https://github.com/practicalli/nvim-astro/blob/main/lua/plugins/termux.lua) shows how to configure mason to use a local Clojure and Lua LSP server (preventing Mason from automatically installing these tools)


## Sponsor Practicalli

[![Sponsor Practicalli via GitHub](https://raw.githubusercontent.com/practicalli/graphic-design/live/buttons/practicalli-github-sponsors-button.png)](https://github.com/sponsors/practicalli-johnny/)

All sponsorship funds are used to support the continued development of [Practicalli series of books and videos](https://practical.li/), although most work is done at personal cost and time. Infrastructure costs are kept to zero.

Thanks to [Cognitect](https://www.cognitect.com/), [Nubank](https://nubank.com.br/) and a wide range of other [sponsors](https://github.com/sponsors/practicalli-johnny#sponsors) for your continued support

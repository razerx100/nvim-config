# Instructions

* Install NeoVim.

* Copy the `nvim` folder to `~/.config/` on UNIX systems. `~\AppData\Local\` on Windows.

## External dependencies

### nvim-treesitter
  * `node`, `git`, `tree-sitter`(cli) and a C compiler must be installed.

### nvim-web-devicons
  * Patched Nerd font

### telescope
  * ripgrep
  * fd
### telescope-fzf-native
  * cmake and a C++ compiler

### mason
  * git
  * A zip manager and a tar manager
  * curl/wget on UNIX

### external LSPs
  * bash-language-server
  * clangd - Must link the `compile_commands.json` to the project root if it is in a different folder.
  * lua-language-server
  * neocmakelsp
  * pyright
  * vscode-langservers-extracted - json, css, html, eslint

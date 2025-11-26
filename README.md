# Instructions

* Install NeoVim.
  *On Windows, building and installing is difficult. And the latest release*
  *version might not be the latest. So, in that case the pre-release version*
  *can be installed instead, which should be a daily build.*

* Copy the `nvim` folder to `~/.config/` on UNIX systems. `~\AppData\Local\` on Windows.

## External dependencies

### nvim-treesitter
  * `node`, `git`, `tree-sitter`(cli) and a C compiler must be installed.
  *On Windows, cl.exe, the command line program for MSVC should work.*
  *But to get it, Visual Studio Build Tools + C++ Desktop Development need*
  *to be installed. And also the binary path might need to be added to PATH*
  *Or MinGW, since we would need that for clang*
  *tree-sitter-cli can be installed with cargo or npm*

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

### linters
  * pylint

### formatter
  * stylua

### dap
  * cpptools - Mason
  * codelldb - Mason
  * debugpy - Installed via pip

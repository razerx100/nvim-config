# Instructions

* Install NeoVim.
  *On Windows, I installed the release build from GitHub but it was kinda old.*
  *So, also tried building and installing the repo but it wouldn't let me without*
  *admin access. So, I installed the release build and replaced its binaries with*
  *the ones I built.*

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

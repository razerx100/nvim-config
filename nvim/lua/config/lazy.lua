local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazyPath) then
    local lazyRepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyRepo, lazyPath })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
	    { "\nPress any key to exit..." }
        }, true, {})

	vim.fn.getchar()
	os.exit(1)
    end
end

vim.opt.rtp:prepend(lazyPath)

vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

-- Turn netrw off
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("lazy").setup({
    spec    = { import = "plugins" },
    checker = { enable = true }
})

require("config.options")
require("config.keybindings")

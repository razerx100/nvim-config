-- set theme
do
	vim.cmd[[colorscheme tokyonight]]
end

-- NvimTree
do
	local nvimTree = require("nvim-tree")
	nvimTree.setup(nvimTree.opts)
end

-- Lualine
do
	local lualine = require("lualine")
	lualine.setup(lualine.opts)
end

-- Telescope 
do
	local tsBuiltin = require("telescope.builtin")

	vim.keymap.set("n", "<space>fg", tsBuiltin.find_files)
	vim.keymap.set("n", "<space>fh", tsBuiltin.help_tags)
	vim.keymap.set("n", "<space>ft", tsBuiltin.live_grep)
end

-- LSP

return {
    {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts  = {
	    indent    = { enable = true },
	    folds     = { enable = true },
	    highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	    },
	    ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"diff",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"jsonc",
		"lua",
		"luadoc",
		"luap",
		"markdown",
		"markdown_inline",
		"printf",
		"python",
		"typescript",
		"vim",
		"vimdoc",
		"xml",
		"yaml"
	    }
	}
    }
}

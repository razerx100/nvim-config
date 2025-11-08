return {
    {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts  = {
	    indent       = { enable = true },
	    folds        = { enable = true },
	    auto_install = true,
	    highlight    = {
		enable                            = true,
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
        },
	config = function(_, opts)
	    local tree_sitter = require("nvim-treesitter.configs")

	    tree_sitter.setup(opts)
	end
    }
}

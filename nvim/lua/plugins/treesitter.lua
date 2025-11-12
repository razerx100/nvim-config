return {
    {
	    "nvim-treesitter/nvim-treesitter",
        branch  = "master", -- Should update to main
        version = false,
	    build   = ":TSUpdate",
        event   = { "VeryLazy", "BufReadPost", "BufWritePost", "BufNewFile" },
        opts_extend = { "ensure_installed" },
	    opts    = {
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
        }
    },
    -- {
    --    "nvim-treesitter/nvim-treesitter-textobjects",
    --    branch = "master"
    -- },
    -- This needs a config function call, otherwise it calls
    -- nvim-treesitter-textobjects.configs, which doesn't exist.
    -- Should be fixed in the main branch though. So, will add
    -- it when I move treesitter to main as well.
}

return {
    {
	    "nvim-treesitter/nvim-treesitter",
        branch  = "main",
	    build   = ":TSUpdate",
        event   = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
	    opts    = {
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
            local treesitter = require("nvim-treesitter")

            treesitter.install(opts.ensure_installed)

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match)

                    if lang and vim.treesitter.language.add(lang) then
                        vim.treesitter.start(args.buf)

                        vim.wo.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event   = { "VeryLazy" },
        opts   = {
            select = {
                lookahead       = true,
                selection_modes = {
                    ["@parameter.outer"] = "v",
                    ["@function.outer"]  = "v",
                    ["@class.outer"]     = "<c-v>"
                },
                include_surrounding_whitespace = false
            }
        }
    }
}

return {
    {
	    "nvim-treesitter/nvim-treesitter",
        branch  = "main",
	    build   = ":TSUpdate",
        lazy    = false,
        opts    = {},
	    init    = function()
	        local ensure_installed = {
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

            local to_install = vim.tbl_filter(function(lang)
                return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
            end, ensure_installed)

            if #to_install > 0 then
                require("nvim-treesitter").install(to_install)
            end

            local filetypes = {}
            for _, lang in ipairs(ensure_installed) do
                for _, filetype in ipairs(vim.treesitter.language.get_filetypes(lang)) do
                    table.insert(filetypes, filetype)
                end
            end

            vim.api.nvim_create_autocmd("FileType", {
                desc     = "Start treesitter",
                pattern  = filetypes,
                callback = function(args)
                   vim.treesitter.start(args.buf)

                   vim.wo.foldexpr   = "v:lua.vim.treesitter.foldexpr()"
                   vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event  = { "VeryLazy" },
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

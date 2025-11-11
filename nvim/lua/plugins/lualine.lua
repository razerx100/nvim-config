return {
	"nvim-lualine/lualine.nvim",
	event        = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/trouble.nvim"
	},
	opts         = function()
		local opts = {
			options = {
				theme = "palenight"
			},
			sections = {
				lualine_a = {"mode"},
				lualine_b = {"branch"},
				lualine_c = {
					{ "diagnostics" },
					{
						"filetype",
						icon_only = true,
						separator = "",
						padding   = { left = 1, right = 0 }
					}
				},
				lualine_x = {"fileformat", "diff"},
				lualine_y = {"progress"},
				lualine_z = {"location"}
			},
			extensions = { "lazy" }
		}

		-- trouble
		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode   = "symbols",
			groups = {},
			title  = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			hl_group = "lualine_c_normal"
		})

		table.insert(opts.sections.lualine_c, {
			symbols and symbols.get,
			cond = function()
				return vim.b.trouble_lualine and symbols.has()
			end
		})

		return opts
	end
}

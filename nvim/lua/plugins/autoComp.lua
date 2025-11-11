return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{
		"hrsh7th/nvim-cmp",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts  = {
			sources = {
				{ name = "nvim_lsp" },
				{
					name   = "buffer",
					option = {
						get_bufnrs = function()
							local buf       = vim.api.nvim_get_current_buf()
							local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))

							if byte_size > 1024 * 1024 then -- 1 Megabyte max
							   return {}
							end

							return { buf }
						end
					}
				}
			}
		}
	}
}

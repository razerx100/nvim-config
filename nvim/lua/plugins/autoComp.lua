return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{
		"hrsh7th/nvim-cmp",
        event = { "InsertEnter" },
		opts  = function()
	        local cmp = require("cmp")
		    local opts = {
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
		    	},
		        mapping = {
			        ["<Tab>"] = cmp.mapping(function(fallback)
			    	    if cmp.visible() then
			    		    local entry = cmp.get_selected_entry()

			                if not entry then
			                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			                end

			    	        cmp.confirm()
			            else
			                fallback()
			            end
			        end, {"i","s",}),
			        ["<C-w>"]     = cmp.mapping.select_prev_item(),
			        ["<C-s>"]     = cmp.mapping.select_next_item(),
			        ["<C-Space>"] = cmp.mapping.complete(),
			        ["<C-e>"]     = cmp.mapping.abort()
		        }
		    }

            return opts
        end
	}
}

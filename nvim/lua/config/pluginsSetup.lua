vim.cmd[[colorscheme tokyonight]]

vim.g.trouble_lualine = true

vim.diagnostic.config({ virtual_text = true })

-- Telescope 
do
	local tsBuiltin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>fg", tsBuiltin.find_files)
	vim.keymap.set("n", "<leader>fr", tsBuiltin.buffers)
	vim.keymap.set("n", "<leader>fh", tsBuiltin.help_tags)
	vim.keymap.set("n", "<leader>ft", tsBuiltin.live_grep)
end

-- Auto-complete
do
	local cmp = require("cmp")

	cmp.setup({
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
			["<C-e>"]     = cmp.mapping.abort(),
		}
	})
end


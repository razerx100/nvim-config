return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"hrsh7th/nvim-cmp",
		opts = {
			sources = {
				{ name = 'nvim_lsp' }
			}
		}
	}
}

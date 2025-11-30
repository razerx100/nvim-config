return {
	{
		"custom-tools",
		virtual = true,
		config = function()
			require("custom-tools.floating-terminal").setup()
		end,
	},
}

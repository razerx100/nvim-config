return {
	{
		"custom-tools",
		virtual = true,
		config = function()
			require("custom-tools.floating-terminal").setup()
			require("custom-tools.change-inclusion-style").setup()
		end,
	},
}

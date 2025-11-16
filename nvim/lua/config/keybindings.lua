-- Telescope
do
	local tsBuiltin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>ff", tsBuiltin.find_files)
	vim.keymap.set("n", "<leader>fr", tsBuiltin.oldfiles)
	vim.keymap.set("n", "<leader>fh", tsBuiltin.help_tags)
	vim.keymap.set("n", "<leader>fl", tsBuiltin.live_grep)

	-- LSP
	vim.keymap.set("n", "<leader>lr", tsBuiltin.lsp_references)
	vim.keymap.set("n", "<leader>li", tsBuiltin.lsp_implementations)
	vim.keymap.set("n", "<leader>ld", tsBuiltin.lsp_definitions)

	-- Git
	vim.keymap.set("n", "<leader>gc", tsBuiltin.git_commits)
	vim.keymap.set("n", "<leader>gb", tsBuiltin.git_branches)
	vim.keymap.set("n", "<leader>gs", tsBuiltin.git_status)
end

-- Treesitter-textobject
do
	vim.keymap.set({ "x", "o" }, "af", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "if", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
	end)
end

-- LSP
do
	vim.keymap.set("n", "<leader>ch", function()
        for _, client in ipairs(vim.lsp.get_clients()) do
            if client.name == "clangd" then
		        vim.cmd("LspClangdSwitchSourceHeader")
                break
            end
        end
	end)
end

-- Format
do
	vim.keymap.set("n", "<leader>cf", function()
		require("conform").format({
			timeout_ms = 3000,
			lsp_format = "fallback",
		})
	end)
end

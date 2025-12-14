-- Misc
do
	vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
	vim.keymap.set("n", "<leader>tt", "<CMD>Floaterminal<CR>", { desc = "Toggle floating Terminal" })
end

do
	vim.keymap.set("v", "<leader>/", "<esc>/\\%V", { desc = "Search in Visual selection" })
end

do
	vim.keymap.set("n", "<leader>td", function()
		local opts = vim.diagnostic.config()

		if opts then
			opts.virtual_lines = not opts.virtual_lines

			vim.diagnostic.config(opts)
		end
	end, { desc = "Toggle diagnostic virtual-lines" })
end

do
	vim.keymap.set("n", "<leader>cf", function()
		require("conform").format({
			timeout_ms = 3000,
			lsp_format = "fallback",
		})
	end, { desc = "Format" })
end

-- Oil
do
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

-- Telescope
do
	local tsBuiltin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>ff", tsBuiltin.find_files, { desc = "Find files" })
	vim.keymap.set("n", "<leader>fr", tsBuiltin.oldfiles, { desc = "Recent files" })
	vim.keymap.set("n", "<leader>fh", tsBuiltin.help_tags, { desc = "Help tags" })
	vim.keymap.set("n", "<leader>fl", tsBuiltin.live_grep, { desc = "Live grep" })

	-- LSP
	vim.keymap.set("n", "<leader>lr", tsBuiltin.lsp_references, { desc = "References" })
	vim.keymap.set("n", "<leader>li", tsBuiltin.lsp_implementations, { desc = "Implementations" })
	vim.keymap.set("n", "<leader>ld", tsBuiltin.lsp_definitions, { desc = "Definitions" })

	-- Git
	vim.keymap.set("n", "<leader>gc", tsBuiltin.git_commits, { desc = "Commits" })
	vim.keymap.set("n", "<leader>gb", tsBuiltin.git_branches, { desc = "Branches" })
	vim.keymap.set("n", "<leader>gs", tsBuiltin.git_status, { desc = "Status" })
end

-- Treesitter-textobject
do
	vim.keymap.set({ "x", "o" }, "af", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
	end, { desc = "around function" })
	vim.keymap.set({ "x", "o" }, "if", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
	end, { desc = "in function" })
	vim.keymap.set({ "x", "o" }, "ab", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects")
	end, { desc = "around block" })
	vim.keymap.set({ "x", "o" }, "ib", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects")
	end, { desc = "in block" })
	vim.keymap.set({ "x", "o" }, "il", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
	end, { desc = "in loop" })
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
	end, { desc = "Switch source-header" })
	vim.keymap.set("n", "<leader>lf", function()
		vim.lsp.buf.code_action({ apply = true })
	end, { desc = "Fix current line" })
end

-- Illuminate
do
	vim.keymap.set("n", "]]", function()
		require("illuminate").goto_next_reference()
	end, { desc = "Next reference" })
	vim.keymap.set("n", "[[", function()
		require("illuminate").goto_prev_reference()
	end, { desc = "Previous reference" })
end

-- Git Conflict
do
	vim.keymap.set("n", "<leader>cc", "<CMD>GitConflictChooseOurs<CR>", { desc = "Select current changes" })
	vim.keymap.set("n", "<leader>ci", "<CMD>GitConflictChooseTheirs<CR>", { desc = "Select incoming changes" })
	vim.keymap.set("n", "<leader>cb", "<CMD>GitConflictChooseBoth<CR>", { desc = "Select both changes" })
	vim.keymap.set("n", "<leader>c0", "<CMD>GitConflictChooseNone<CR>", { desc = "Select none of the changes" })
	vim.keymap.set("n", "]x", "<CMD>GitConflictNextConflict<CR>", { desc = "Next conflict" })
	vim.keymap.set("n", "[x", "<CMD>GitConflictPrevConflict<CR>", { desc = "Previous conflict" })
end

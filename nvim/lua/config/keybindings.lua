-- Terminal
do
    vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
    vim.keymap.set({ "n", "t" }, "<leader>tt", "<CMD>Floaterminal<CR>", { desc = "Toggle floating Terminal" })
end

-- Search in Visual
do
	vim.keymap.set("v", "<leader>/", "<esc>/\\%V", { desc = "Search in Visual selection" })
end
-- Oil
do
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory." })
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
end

-- Format
do
	vim.keymap.set("n", "<leader>cf", function()
		require("conform").format({
			timeout_ms = 3000,
			lsp_format = "fallback",
		})
	end, { desc = "Format" })
end

-- Toggle diagnostic virtual lines
do
    vim.keymap.set("n", "<leader>td", function()
        local opts = vim.diagnostic.config()

        if opts then
            opts.virtual_lines = not opts.virtual_lines

            vim.diagnostic.config(opts)
        end
	end, { desc = "Toggle diagnostic virtual-lines" })
end

-- Illuminate
do
    vim.keymap.set("n", "]]", function()
        require("illuminate").goto_next_reference()
	end, { desc = "Next reference" })
    vim.keymap.set("n", "[[", function()
        require("illuminate").goto_prev_reference()
	end, { desc = "Prev reference" })
end

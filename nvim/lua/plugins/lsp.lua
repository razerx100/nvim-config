return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"mason-lspconfig.nvim",
	},
	opts_extend = { "servers.*.keys" },
	opts = {
		servers = {
			["*"] = {
				capabilities = {
					workspace = {
						fileOperations = {
							didRename = true,
							willRename = true,
						},
					},
				},
			},
			bashls = {},
			clangd = {
				root_markers = {
					"compile_commands.json",
					"compile_flags.txt",
					"Makefile",
					"configure.ac",
					"configure.in",
					"config.h.in",
					"meson.build",
					"meson_options.txt",
					"build.ninja",
					".git",
				},
				capabilities = {
					offsetEncoding = { "utf-16" },
				},
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
				},
				init_options = {
					usePlaceHolders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
			},
			jsonls = {},
			lua_ls = {
				settings = {
					Lua = {
						workspace = { enable = true },
						completion = { callSnippet = "Replace" },
						doc = { privateName = { "^_" } },
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
					},
				},
			},
			neocmake = {},
			pyright = {},
		},
		setup = {
			jsonls = function(_, opt_server)
				opt_server.capabilities.textDocument.completion.completionItem.snippetSupport = true
			end,
			neocmake = function(_, opt_server)
				opt_server.capabilities.textDocument.completion.completionItem.snippetSupport = true
			end,
		},
	},
	config = vim.schedule_wrap(function(_, opts)
		local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		if opts.servers["*"] then
			vim.lsp.config("*", opts.servers["*"])
		end

		local function configure(server)
			if server == "*" then
				return false
			end

			local opt_server = opts.servers[server]
			local setup = opts.setup[server] or opts.setup["*"]

			opt_server.capabilities = opt_server.capabilities and opt_server.capabilities
				or opts.servers["*"].capabilities
			opt_server.capabilities = vim.tbl_deep_extend("force", opt_server.capabilities, cmp_capabilities)

			if not (setup and setup(server, opt_server)) then
				vim.lsp.config(server, opt_server)

                vim.lsp.inlay_hint.enable(true)
			end

			return true
		end

		local install = vim.tbl_filter(configure, vim.tbl_keys(opts.servers))

		require("mason-lspconfig").setup({
			ensure_installed = install,
			automatic_enable = install,
		})
	end),
}

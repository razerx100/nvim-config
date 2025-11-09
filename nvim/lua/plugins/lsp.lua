return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason.nvim",
		"mason-lspconfig.nvim"
	},
	opts = function()
		local ret = {
			servers = {
				["*"] = {
					capabilities = {
						workspace = {
							fileOperations = {
								didRename  = true,
								willRename = true
							}
						}
					}
				},
				lua_ls = {
					settings = {
						Lua = {
							workspace  = { enable = true },
							completion = { callSnippet = "Replace" },
							doc        = { privateName = { "^_" } },
							hint       = {
								enable     = true,
								setType    = false,
								paramType  = true,
								paramName  = "Disable",
								semicolon  = "Disable",
								arrayIndex = "Disable"
							}
						}
					}
				},
				pyright = {},
				clangd = {}
			},
			setup = {
				-- Can have setup functions here. That's why opts is a function instead of a table.
			}
		}

		return ret
	end,
	config = vim.schedule_wrap(function(_, opts)
		local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

		if opts.servers["*"] then
			vim.lsp.config("*", opts.servers["*"])
		end

		local function configure(server)
			if server == "*" then
				return false
			end

			local opt_server = opts.servers[server]
			local setup      = opts.setup[server] or opts.setup["*"]

			opt_server.capabilities = opt_server.capabilities and opt_server.capabilities or opts.servers["*"].capabilities
			opt_server.capabilities = vim.tbl_deep_extend("force", opt_server.capabilities, cmp_capabilities)

			if not (setup and setup(server, opt_server)) then
				vim.lsp.config(server, opt_server)
			end

			return true
		end

		local install = vim.tbl_filter(configure, vim.tbl_keys(opts.servers))

		require("mason-lspconfig").setup({
			ensure_installed = install,
			automatic_enable = install
		})
	end)
}

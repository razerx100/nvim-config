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
				}
			},
			setup = {
				-- Can have setup functions here. That's why opts is a function instead of a table.
			}
		}

		return ret
	end,
	config = vim.schedule_wrap(function(_, opts)
		if opts.servers["*"] then
			vim.lsp.config("*", opts.servers["*"])
		end

		local mason_all = vim.tbl_keys(require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package)
		local mason_exclude = {}

		local function configure(server)
			if server == "*" then
				return false
			end

			local opt_server = opts.servers[server]
			opt_server = opt_server and {} or not opt_server and { enable = false } or opt_server

			if not opt_server.enabled then
				mason_exclude[#mason_exclude + 1] = server
				return
			end

			local use_mason = opt_server.mason and vim.tbl_contains(mason_all, server)
			local setup     = opts.setup[server] or opts.setup["*"]

			if setup and setup(server, opt_server) then
				mason_exclude[#mason_exclude + 1] = server
			else
				vim.lsp.config(server, opt_server)

				if not use_mason then
					vim.lsp.enable(server)
				end
			end

			return use_mason
		end

		local install = vim.tbl_filter(configure, vim.tbl_keys(opts.servers))

		require("mason-lspconfig").setup({
			ensure_installed = install,
			automatic_enable = { exclude = mason_exclude }
		})
	end)
}

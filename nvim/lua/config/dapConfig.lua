function ArgSplitter(arg)
	local arg_list = {}

	for str in string.gmatch(arg, "%S+") do
		table.insert(arg_list, str)
	end

	return arg_list
end

function ParseArgs(args)
	if type(args) == "string" then -- For now assume, we only need to parse if there is one arg. Which should be a string.
		return ArgSplitter(args)
	end

	return args
end

local dap = require("dap")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
	enrich_config = function(config, on_config)
		if config.args then
			config.args = ParseArgs(config.args)
		end

		on_config(config)
	end,
}

dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		local port = (config.connect or config).port
		local host = (config.connect or config).host or "127.0.0.1"
		cb({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = {
				source_filetype = "python",
			},
			enrich_config = function(eConfig, on_config)
				if eConfig.args then
					eConfig.args = ParseArgs(eConfig.args)
				end

				on_config(eConfig)
			end,
		})
	else
		cb({
			type = "executable",
			command = "python3",
			args = { "-m", "debugpy.adapter" },
			options = {
				source_filetype = "python",
			},
			enrich_config = function(eConfig, on_config)
				if eConfig.args then
					eConfig.args = ParseArgs(eConfig.args)
				end

				on_config(eConfig)
			end,
		})
	end
end
dap.adapters.debugpy = dap.adapters.python

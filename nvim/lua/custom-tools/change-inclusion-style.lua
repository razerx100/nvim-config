local M = {}

local function toggle_inclusion_style(line)
	local pattern = '^(%s*#include%s+)([<"])(.-)([>"])'

	local prefix, open_char, header_name, close_char = line:match(pattern)

	if not prefix then
		return line
	end

	local new_open, new_close = "", ""

	if open_char == "<" or close_char == ">" then
		new_open = '"'
		new_close = '"'
	elseif open_char == '"' or close_char == '"' then
		new_open = "<"
		new_close = ">"
	end

	return prefix .. new_open .. header_name .. new_close
end

function M.toggle_multiline(opts)
	local start_line = opts.line1 - 1 -- Convert to 0-based index.
	local end_line = opts.line2

	local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

	local new_lines = {}
	local is_changed = false

	for _, line in ipairs(lines) do
		local new_line = toggle_inclusion_style(line)
		table.insert(new_lines, new_line)

		if not is_changed and new_line ~= line then
			is_changed = true
		end
	end

	if is_changed then
		vim.api.nvim_buf_set_lines(0, start_line, end_line, false, new_lines)
	end
end

function M.setup()
	vim.api.nvim_create_user_command("ToggleInclude", M.toggle_multiline, { range = true })
end

return M

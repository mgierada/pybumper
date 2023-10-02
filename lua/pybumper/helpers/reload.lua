local parser = require("pybumper.parser")
local virtual_text = require("pybumper.virtual_text")
local state = require("pybumper.state")

--- Reloads the buffer if it's pyproject.toml
-- @return nil
local reload_buffer = function()
	local current_buffer_number = vim.fn.bufnr()
	if current_buffer_number == state.buffer.id then
		vim.bo.autoread = true
		vim.cmd(":checktime")
	end
end

--- Rereads the current buffer value and reloads the buffer
-- @return nil
return function()
	if not state.is_loaded then
		return
	end
	reload_buffer()
	parser.parse_buffer()
	if state.is_virtual_text_displayed then
		virtual_text.clear()
		virtual_text.display()
	end
	reload_buffer()
end

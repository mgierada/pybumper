--- Strips ^ and ~ from version
-- @param value: string - value from which to strip ^ and ~ from
-- @return string?
return function(value)
	if value == nil then
		return nil
	end

	value = value:gsub("%^", ""):gsub("~", "")

	-- Remove >=, >, <, and <= characters
	value = value:gsub(">=", ""):gsub(">", ""):gsub("<", ""):gsub("<=", "")
	return value
end

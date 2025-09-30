return function(directory)
	-- Form the shell command
	local command = "ls " .. directory

	-- Execute the command and capture the output
	local fileHandle = io.popen(command)
	if fileHandle == nil then
		return {}
	end

	local commandOutput = fileHandle:read("*a")
	fileHandle:close()

	-- Process the output (assuming it's a newline-separated list of file names)
	local files = {}
	for file in commandOutput:gmatch("[^\r\n]+") do
		table.insert(files, file)
	end

	return files
end

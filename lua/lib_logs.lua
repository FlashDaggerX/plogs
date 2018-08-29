-- GLua Script

-- Initializes the log table for the NetLib.
logs = {}

local hurt = {}
local cmd = {}
local kills = {}

function logs:GetHurtLog()
	return hurt
end

function logs:GetCommandLog()
	return cmd
end

function logs:GetKillLog()
	return kills
end


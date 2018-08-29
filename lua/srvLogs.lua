-- Initializes the log table for the NetLib.

local hurt = {}
local cmd = {}
local kills = {}

function GetHurtLog()
	return hurt
end

function GetCommandLog()
	return cmd
end

function GetKillLog()
	return kills
end


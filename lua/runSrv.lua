-- Initializes the serverside.
include("srvLogs.lua")
include("srvHooks.lua")

-- Net PreCache
util.AddNetworkString("LogC")
util.AddNetworkString("Logs")

-- Instances
local id
local append

-- Handle client-to-server pipe
net.Receive("LogC", function(len, ply)
	net.Start("LogS")
	id = net.ReadInt(32)
	if id < 10 then
		net.WriteInt(id, 32)
		if id == 1 then 
			net.WriteTable(GetHurtLog()) 
		elseif id == 2 then 
			net.WriteTable(GetCommandLog())
		elseif id == 3 then 
			net.WriteTable(GetKillLog())
		end
		net.Send(ply)
	elseif id >= 10 then
		append = net.ReadString()
	end
end)

-- Run Hooks
hook.Add("PlayerHurt", "RecordHurt", OnHurt)
hook.Add("PlayerDeath", "RecordDeathReg", OnDeathReg)


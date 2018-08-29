-- GLua Script
include("log_hooks.lua")
include("lib_logs.lua")

util.AddNetworkString("net_cli_log")
util.AddNetworkString("net_srv_log")

net.Receive("net_cli_log", function(len, ply)
	net.Start("net_srv_log")
	
	local id = net.ReadInt(32)
	if id < 10 then
		net.WriteInt(id, 32)
		
		if 	id == 1 then 	net.WriteTable(GetHurtLog()) 
		elseif 	id == 2 then 	net.WriteTable(GetCommandLog())
		elseif 	id == 3 then 	net.WriteTable(GetKillLog())
		else			net.WriteTable({"Empty."})
		end
		
		net.Send(ply)
	elseif id >= 10 then
		append = net.ReadString()
	end
end)

-- Run Hooks
hook.Add("PlayerHurt", "PLogHurt", srv:OnHurt)
hook.Add("PlayerDeath", "PLogDeath", srv:OnDeath)

-- GLua Script
include("log_hooks.lua")

net.Receive("net_srv_log", function(len, ply)
	local ToDrawServer = net.ReadInt(32)
	local tab = net.ReadTable()
	
	if tab[0] != nil then
		if ToDrawServer == 1 then 
			CreateLogWindow("Damage", tab) 
		elseif ToDrawServer == 2 then
			CreateLogWindow("Commands", tab)
		elseif ToDrawServer == 3 then
			CreateLogWindow("Kills", tab)
		end
	else CreatePopup("This log is empty.") end
end)

concommand.Add(
	"plog", 
	-- Callback
	function(ply, cmd, args, argsStr)
		cli:MakeLogs()
	end, 
	-- AutoComplete
	function(cmd, args)
		print(cmd)
	end, 
	"plog", 0)

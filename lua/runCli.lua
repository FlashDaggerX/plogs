-- Initiates the clientside.
include("cliHooks.lua")

-- Instances
local tab
local ToDrawServer

function Callback(ply, cmd, args, argsStr)
	MakeLogs()
end

function AutoComplete(cmd, args)
	print(cmd)
end

-- Handle server-to-client pipe
net.Receive("LogS", function(len, ply)
	ToDrawServer = net.ReadInt(32)
	tab = net.ReadTable()
	if tab[0] != nil then
		if ToDrawServer == 1 then 
			CreateLogWindow("Damage", tab) 
		elseif ToDrawServer == 2 then
			CreateLogWindow("Commands", tab)
		elseif ToDrawServer == 3 then
			CreateLogWindow("Kills", tab)
		end
	else CreatePopup("This log is empty.") end
	tab = nil
end)

-- Run Hooks
concommand.Add("plog", Callback, AutoComplete, "plog", 0)


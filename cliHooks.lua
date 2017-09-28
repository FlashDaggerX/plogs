-- Includes all the hooks for the clientside.
include("winLib.lua")
include("netLib.lua")

-- Instances
local append

-- Creation of the main window and it's children are described here
function MakeLogs()
	CreateImmediateWindow(400, 320, "pLogs", function()
		Cleanup()
	end)
	CreateButton(10, 30, 75, 25, "Damage", function()
		SendServerPacket(1)
	end)
	CreateButton(10, 60, 75, 25, "Commands", function()
		CreatePopup("The command logs are still in development.")
	end)
	CreateButton(10, 90, 75, 25, "Kills", function()
		SendServerPacket(3)
	end)
end


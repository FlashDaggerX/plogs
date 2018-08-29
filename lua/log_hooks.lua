-- GLua Script

if (CLIENT) then
	cli = {}
	
	include("lib_window.lua")
	include("lib_net.lua")

	-- Creation of the main window and it's children are described here
	function cli:MakeLogs()
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

elseif (SERVER) then
	srv = {}
	
	include("log_hooks.lua")

	function srv:OnHurt(vic, att, rem, dam)
		local append = ""
	
		if att:IsPlayer() then
			append = att:Nick().." > "..vic:Nick().." ("..rem.."-"..dam..")"
		else
			append = att:GetClass().." > "..vic:Nick().." ("..rem.."-"..dam..")"
		end
		
		if rem == 0 then append = append.." (FATAL)" end
		
		if GetHurtLog()[0] == nil then
			GetHurtLog()[0] = append
		else table.insert(GetHurtLog(), append) end
	end

	function srv:OnDeath(vic, inf, att)
		local append = ""
	
		if att:IsPlayer() then
			append = att:Nick().." > "..vic:Nick().." ("..inf:GetClass()..")"
		else
			append = att:GetClass().." > "..vic:Nick().." ("..inf:GetClass()..")"
		end
	
		if GetKillLog()[0] == nil then
			GetKillLog()[0] = append
		else table.insert(GetKillLog(), append) end
	end
end

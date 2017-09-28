-- Includes all the hooks for the serverside.
include("srvLogs.lua")

-- Instances
local append

function OnHurt(vic, att, rem, dam)
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

function OnDeathReg(vic, inf, att)
	if att:IsPlayer() then
		append = att:Nick().." > "..vic:Nick().." ("..inf:GetClass()..")"
	else
		append = att:GetClass().." > "..vic:Nick().." ("..inf:GetClass()..")"
	end
	if GetKillLog()[0] == nil then
		GetKillLog()[0] = append
	else table.insert(GetKillLog(), append) end
end


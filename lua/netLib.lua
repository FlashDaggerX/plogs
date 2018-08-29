-- Net Library for pLogs

-- Above ten for strings
function SendServerPacket(tabRequest, message)
	net.Start("LogC")
	if tabRequest < 10 then
		net.WriteInt(tabRequest, 32)
	elseif tabRequest >= 10 then
		net.WriteInt(tabRequest, 32)
		net.WriteString(message)
	end
	net.SendToServer()
end


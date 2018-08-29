-- Used to create different windows and buttons.

-- Provides reference to the current instance.
local win
local but
local log

-- For Non-Logged usage.
local any1
local any2
local any3
local any4
local any5

-- Table Instances (Starts at 1)
local winTab = {}
local butTab = {}
local logTab = {}

function CreateImmediateWindow(w, h, title, onclose)
	win = vgui.Create("DFrame")
	win:Center()
	win:SetSize(w, h)
	win:SetTitle(title)
	win:SetVisible(true)
	win:SetDraggable(true)
	win:MakePopup()
	win.OnClose = onclose
	table.insert(winTab, win)
end

function CreateNonLoggedWindow(w, h, title, onclose)
	any1 = vgui.Create("DFrame")
	any1:Center()
	any1:SetSize(w, h)
	any1:SetTitle(title)
	any1:SetVisible(true)
	any1:SetDraggable(true)
	any1:MakePopup()
	any1.OnClose = onclose
end

-- These build functions apply to the current window.
function CreateButton(x, y, w, h, text, action)
	but = vgui.Create("DButton", win)
	but:SetPos(x, y)
	but:SetSize(w, h)
	but:SetText(text)
	but.DoClick = action
	table.insert(butTab, but)
end

function CreateNonLoggedButton(x, y, w, h, text, action)
	any2 = vgui.Create("DButton", any1)
	any2:SetPos(x, y)
	any2:SetSize(w, h)
	any2:SetText(text)
	any2.DoClick = action
end

function CreateImmediateLog(w, h, logTable)
	log = vgui.Create("DListView", win)
	log:Center()
	log:SetSize(w, h)
	log:Dock(FILL)
	log:SetMultiSelect(false)
	log:AddColumn("Entry #")
	log:AddColumn("Message")
	for i = 0, #logTable do
		log:AddLine(i, tostring(logTable[i]))
	end
	table.insert(logTab, log)
end

function CreateNonLoggedLog(w, h, logTable)
	any3 = vgui.Create("DListView", any1)
	any3:Center()
	any3:SetSize(w, h)
	any3:Dock(FILL)
	any3:SetMultiSelect(false)
	any3:AddColumn("Entry #")
	any3:AddColumn("Message")
	for i = 0, #logTable do
		any3:AddLine(i, tostring(logTable[i]))
	end
end

-- Customed for quick use, usually for a window.
function CreatePopup(message)
	CreateNonLoggedWindow(300, 200, "pLogError", function()
		print("Closed window: pLogError")
	end)
	any4 = vgui.Create("DPanel", any1)
	any4:SetPos(2, 25)
	any4:SetSize(296, 173)
	any5 = vgui.Create("DLabel", any4)
	any5:SetText("There was an error while using the pLogs: \n"..message)
	any5:SizeToContents()
	any5:SetDark(3)
end

-- Customed for quick use.
function CreateLogWindow(windowName, useTable)
	CreateImmediateWindow(400, 420, windowName, function()
		print("Closed log: "..windowName)
	end)
	CreateImmediateLog(400, 400, useTable)
end


function Cleanup()
	for i = 0, #winTab do
		winTab[i] = nil
	end
	for i = 0, #butTab do
		butTab[i] = nil
	end
	for i = 0, #logTab do
		logTab[i] = nil
	end
	-- Cleans the 'any' variables
	any1 = nil
	any2 = nil
	any3 = nil
	any4 = nil
	any5 = nil
end

function GetCurrentWindow()
	return win
end

function GetCurrentButton()
	return but
end

function GetCurrentLog()
	return log
end

function GetWindowList()
	return winTab
end

function GetButtonList()
	return butTab
end

function GetLogList()
	return logTab
end


-- p0s_0 - https://github.com/p0s0/openblox
-- init.client.lua - prepare client stuff

local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui

local scriptContext = require(game.ReplicatedStorage:WaitForChild("Common"):WaitForChild("ScriptContext"))

function _G.LoadLibrary(lib)
    if game.ReplicatedStorage:WaitForChild("LoadLibrary"):FindFirstChild(lib) then return require(game.ReplicatedStorage.LoadLibrary[lib]) else return 0 end
end

function CreateRobloxGui()
    local robloxGui = Instance.new("ScreenGui")
    robloxGui.Name = "RobloxGui"
    robloxGui.IgnoreGuiInset = true
    robloxGui.DisplayOrder = 9000 -- change this depending on your needs
    robloxGui.ResetOnSpawn = false
    robloxGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    robloxGui.Parent = playerGui

    local controlFrame = Instance.new("Frame")
    controlFrame.Name = "ControlFrame"
    controlFrame.Size = UDim2.new(1, 0, 1, 0)
    controlFrame.BackgroundTransparency = 1
    controlFrame.Parent = robloxGui

    local bottomLeftControl = Instance.new('Frame')
	bottomLeftControl.Name = "BottomLeftControl"
	bottomLeftControl.Size = UDim2.new(0, 130, 0, 46)
	bottomLeftControl.Position = UDim2.new(0, 0, 1, -46)
	bottomLeftControl.BackgroundTransparency = 1
	bottomLeftControl.Parent = robloxGui

    -- TODO: Move to StarterScript
    scriptContext.AddCoreScriptLocal("CoreScripts/Settings", robloxGui)
end

function Init()
    local year = game.ReplicatedStorage:WaitForChild("OPENBLOXEF"):WaitForChild("GetYear"):InvokeServer()
    local yearType = game.ReplicatedStorage:WaitForChild("OPENBLOXEF"):WaitForChild("GetYearType"):InvokeServer()
    local time = DateTime.now().UnixTimestampMillis
    print("OPENBLOX by p0s_0 at p0s0/openblox on github - Preparing simulation " .. tostring(year) .. tostring(yearType) .. " for " .. player.Name)
    CreateRobloxGui()

    print("OPENBLOX by p0s_0 at p0s0/openblox on github - Prepared simulation " .. tostring(year) .. tostring(yearType) .. " for " .. player.Name .. " in " .. tostring(DateTime.now().UnixTimestampMillis - time) .. "ms")

end

Init()
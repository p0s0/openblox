-- p0s_0 - https://github.com/p0s0/openblox
-- init.client.lua - prepare client stuff

local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui

function CreateRobloxGui()
    local robloxGui = Instance.new("ScreenGui")
    robloxGui.Name = "RobloxGui"
    robloxGui.IgnoreGuiInset = true
    robloxGui.DisplayOrder = 9000 -- change this depending on your needs
    robloxGui.ResetOnSpawn = false
    robloxGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    robloxGui.Parent = playerGui
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
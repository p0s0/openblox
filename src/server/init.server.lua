-- p0s_0 - https://github.com/p0s0/openblox
-- init.server.lua - prepare everything

local ss = game.ServerStorage
local coreScripts = ss:WaitForChild("CoreScripts")
local simulationFolderHolder = ss:WaitForChild("SimulationFolders")

-- Change these 2 variables below, depending on where you place these values & what you call them. If you don't understand this, DYOR before using this.
local year = ss:WaitForChild("SimulationYear")
local yearType = ss:WaitForChild("SimulationYearType")

local eventFunctionFolder = game.ReplicatedStorage:WaitForChild("OPENBLOXEF")
eventFunctionFolder:WaitForChild("GetYear").OnServerInvoke = function() return year.Value end
eventFunctionFolder:WaitForChild("GetYearType").OnServerInvoke = function() return yearType.Value end

local simulationFolder

if simulationFolderHolder:FindFirstChild(tostring(year.Value) .. tostring(yearType.Value)) then -- this can probably be improved
    simulationFolder = simulationFolderHolder[tostring(year.Value) .. tostring(yearType.Value)]
end

function extractFolder(folderToExtract, extractTo)
    if not folderToExtract or extractTo then return end

    for v,i in pairs(folderToExtract:GetChildren()) do
        i.Parent = extractTo
    end

    folderToExtract:Destroy()
end

function LoadSimulation(folder)
    for v,i in pairs(folder:GetChildren()) do
        if i.Name ~= "StarterPlayerScripts" and i.Name ~= "StarterCharacterScripts" and i.Name ~= "CoreScripts" then
            i.Parent = game[i.Name]
        elseif i.Name == "StarterPlayerScripts" or i.Name == "StarterCharacterScripts" then
            i.Parent = game.StarterPlayer[i.Name]
        elseif i.Name == "CoreScripts" then
            extractFolder(i, coreScripts)
        else
            i.Parent = game[i.Name]
        end

        for b,o in pairs(i:GetDescendants()) do
            if o:IsA("Script") or o:IsA("LocalScript") and o.Disabled == true then
                o.Disabled = false
            end
        end
    end
end

if not simulationFolder then
    print("OPENBLOX by p0s_0 at p0s0/openblox on github - Simulation folder not found! Will not continue.")
else
    LoadSimulation(simulationFolder)
end
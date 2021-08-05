-- p0s_0 - https://github.com/p0s0/openblox
-- init.server.lua - prepare everything

local coreScripts = game.ServerStorage:WaitForChild("CoreScripts")

-- Change these 2 variables below, depending on where you place these values & what you call them. If you don't understand this, DYOR before using this.
local year = game.ServerStorage:WaitForChild("SimulationYear")
local yearType = game.ServerStorage:WaitForChild("SimulationYearType")

local eventFunctionFolder = game.ReplicatedStorage:WaitForChild("OPENBLOXEF")
eventFunctionFolder:WaitForChild("GetYear").OnServerInvoke = function() return year.Value end
eventFunctionFolder:WaitForChild("GetYearType").OnServerInvoke = function() return yearType.Value end
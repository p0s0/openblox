local sc = {}

local coreScripts = game.ServerStorage:WaitForChild("CoreScripts")

function sc.AddCoreScriptLocal(coreScriptName, parent)
    if not coreScripts:FindFirstChild(coreScriptName) then return 0 end
    if not coreScriptName or parent then return 1 end
    if coreScriptName == "" then return 2 end

    local coreScriptClone = coreScripts:WaitForChild(coreScriptName)
    if coreScriptClone.Disabled then coreScriptClone.Disabled = false end
    coreScriptName.Parent = parent

    return coreScriptClone
end

return sc
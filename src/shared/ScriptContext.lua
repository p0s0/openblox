local sc = {}

local coreScripts = game.ReplicatedStorage:WaitForChild("CoreScripts")

function sc.AddCoreScriptLocal(coreScriptName, parent)
    if not coreScripts:FindFirstChild(coreScriptName) then print("0") return 0 end
    if coreScriptName == nil then print("1") return 1 end
    if coreScriptName == "" then print("2") return 2 end
    if parent == nil then print("3") return 3 end

    local coreScriptClone = coreScripts:WaitForChild(coreScriptName):Clone()
    if coreScriptClone.Disabled then coreScriptClone.Disabled = false end
    coreScriptClone.Parent = parent

    return coreScriptClone
end

return sc
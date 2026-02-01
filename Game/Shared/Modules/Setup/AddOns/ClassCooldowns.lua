local NUI = unpack(NaowhUI)
local SE = NUI:GetModule("Setup")

local classKeys = {
    ["DEATHKNIGHT"] = "deathknight",
    ["DEMONHUNTER"] = "demonhunter",
    ["DRUID"] = "druid",
    ["EVOKER"] = "evoker",
    ["HUNTER"] = "hunter",
    ["MAGE"] = "mage",
    ["MONK"] = "monk",
    ["PALADIN"] = "paladin",
    ["PRIEST"] = "priest",
    ["ROGUE"] = "rogue",
    ["SHAMAN"] = "shaman",
    ["WARLOCK"] = "warlock",
    ["WARRIOR"] = "warrior",
}

local function getPlayerClassKey()
    local _, className = UnitClass("player")

    return classKeys[className]
end

function SE.ImportClassCooldowns()
    if InCombatLockdown and InCombatLockdown() then
        NUI:Print("Cannot import cooldowns in combat")

        return false
    end

    if not (C_CooldownViewer and C_CooldownViewer.SetLayoutData) then
        NUI:Print("C_CooldownViewer API not available")

        return false
    end

    if C_CooldownViewer.IsCooldownViewerAvailable then
        local available = C_CooldownViewer.IsCooldownViewerAvailable()

        if not available then
            NUI:Print("Cooldown Manager not enabled (check Advanced Options)")

            return false
        end
    end

    local D = NUI:GetModule("Data")
    local classKey = getPlayerClassKey()

    if not classKey then
        NUI:Print("Could not determine player class")

        return false
    end

    local classData = D[classKey]

    if not classData then
        NUI:Print("No cooldown data for class: " .. classKey)

        return false
    end

    local ok, err = pcall(C_CooldownViewer.SetLayoutData, classData)

    if not ok then
        NUI:Print("Cooldown import failed: " .. tostring(err))

        return false
    end

    return true
end

function SE.ClassCooldownDataExists()
    local D = NUI:GetModule("Data")
    local classKey = getPlayerClassKey()

    if not classKey then return false end

    return D[classKey] ~= nil
end

function SE.ClassCooldowns(addon, import, resolution)
    if import then
        SE.ApplyEditModeProfile(true)

        if SE.ImportClassCooldowns() then
            SE.CompleteSetup(addon)

            NUI.db.char.loaded = true
            NUI.db.global.version = NUI.version
        end
    end
end

function SE.GetPlayerClassDisplayName()
    local _, className = UnitClass("player")
    local localizedClass = LOCALIZED_CLASS_NAMES_MALE[className]

    return localizedClass or className
end

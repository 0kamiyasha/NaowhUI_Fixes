local NUI = unpack(NaowhUI)
local SE = NUI:GetModule("Setup")

local InCombatLockdown = InCombatLockdown

local function AreAddOnsEnabled()
    local addons = {
        ["BigWigs"] = true,
        ["Details"] = true,
        ["HidingBar"] = true,
        ["Plater"] = true
    }

    for k in pairs(addons) do
        if NUI:IsAddOnEnabled(k) then

            return true
        end
    end
end

NUI.options = {
    name = "NaowhUI",
    type = "group",
    args = {
        profiles = {
            name = "Profiles",
            order = 1,
            hidden = function()
                if not NUI:IsTokenValid(true) or NUI:IsAddOnEnabled("ElvUI") or (not NUI.Retail and not AreAddOnsEnabled()) or InCombatLockdown() then

                    return true
                end
            end,
            type = "group",
            args = {
                bettercooldownmanager = {
                    name = "BetterCooldownManager",
                    desc = "Setup BetterCooldownManager",
                    hidden = function()
                        if not NUI.Retail or not NUI:IsAddOnEnabled("BetterCooldownManager") then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function() SE:Setup("BetterCooldownManager", true) end
                },
                bigwigs = {
                    name = "BigWigs",
                    desc = "Setup BigWigs",
                    hidden = function()
                        if not NUI:IsAddOnEnabled("BigWigs") then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function() SE:Setup("BigWigs", true) end
                },
                blizzard_editmode = {
                    name = "Blizzard_EditMode",
                    desc = "Setup Blizzard_EditMode",
                    hidden = function()
                        if not NUI.Retail then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function() SE:Setup("Blizzard_EditMode", true) end
                },
                details = {
                    name = "Details",
                    desc = "Setup Details",
                    hidden = function()
                        if not NUI:IsAddOnEnabled("Details") then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function() SE:Setup("Details", true) end
                },
                hidingbar = {
                    name = "HidingBar",
                    desc = "Setup HidingBar",
                    hidden = function()
                        if NUI.Retail or not NUI:IsAddOnEnabled("HidingBar") then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function()
                        SE:Setup("HidingBar", true)

                        ReloadUI()
                    end
                },
                plater = {
                    name = "Plater",
                    desc = "Setup Plater",
                    hidden = function()
                        if not NUI:IsAddOnEnabled("Plater") then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function()
                        SE:Setup("Plater", true)

                        ReloadUI()
                    end
                },
                warpdeplete = {
                    name = "WarpDeplete",
                    desc = "Setup WarpDeplete",
                    hidden = function()
                        if not NUI.Retail or not NUI:IsAddOnEnabled("WarpDeplete") then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function() SE:Setup("WarpDeplete", true) end
                }
            }
        },
        general_weakauras = {
            name = "General WeakAuras",
            order = 2,
            hidden = function()
                if not NUI.Retail or not NUI:IsTokenValid(true) or not NUI:IsAddOnEnabled("WeakAuras") or InCombatLockdown() then

                    return true
                end
            end,
            type = "group",
            args = {
                core = {
                    name = "Core",
                    desc = "Import the Core General WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "core") end
                }
            }
        },
        class_weakauras = {
            name = "Class WeakAuras",
            order = 3,
            hidden = function()
                if NUI.Retail or not NUI:IsTokenValid(true) or not NUI:IsAddOnEnabled("WeakAuras") or InCombatLockdown() then

                    return true
                end
            end,
            type = "group",
            args = {
                death_knight = {
                    name = "Death Knight",
                    desc = "Import the Death Knight Class WeakAura",
                    hidden = function()
                        if not NUI.Mists then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "deathknight") end
                },
                druid = {
                    name = "Druid",
                    desc = "Import the Druid Class WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "druid") end
                },
                hunter = {
                    name = "Hunter",
                    desc = "Import the Hunter Class WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "hunter") end
                },
                mage = {
                    name = "Mage",
                    desc = "Import the Mage Class WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "mage") end
                },
                monk = {
                    name = "Monk",
                    desc = "Import the Monk Class WeakAura",
                    hidden = function()
                        if not NUI.Mists then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "monk") end
                },
                paladin = {
                    name = "Paladin",
                    desc = "Import the Paladin Class WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "paladin") end
                },
                priest = {
                    name = "Priest",
                    desc = "Import the Priest Class WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "priest") end
                },
                rogue = {
                    name = "Rogue",
                    desc = "Import the Rogue Class WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "rogue") end
                },
                shaman = {
                    name = "Shaman",
                    desc = "Import the Shaman Class WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "shaman") end
                },
                warlock = {
                    name = "Warlock",
                    desc = "Import the Warlock Class WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "warlock") end
                },
                warrior = {
                    name = "Warrior",
                    desc = "Import the Warrior Class WeakAura",
                    type = "execute",
                    func = function() SE:Setup("WeakAuras", nil, nil, "warrior") end
                }
            }
        },
        advanced = {
            name = "Advanced",
            order = -1,
            type = "group",
            args = {
                load_profiles = {
                    name = "Load Profiles",
                    desc = "Load your installed profiles onto this character",
                    hidden = function()
                        if NUI:IsAddOnEnabled("ElvUI") or (not NUI.Retail and not AreAddOnsEnabled()) or not NUI.db.global.profiles or InCombatLockdown() then

                            return true
                        end
                    end,
                    type = "execute",
                    func = function() NUI:LoadProfiles() end
                },
                print_version = {
                    name = "Print Version",
                    desc = "Print the current version",
                    type = "execute",
                    func = function() NUI:Print(NUI.version) end
                }
            }
        }
    }
}
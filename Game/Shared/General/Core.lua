local NUI = unpack(NaowhUI)

local tonumber, ipairs, unpack = tonumber, ipairs, unpack
local format = format

local DisableAddOn = C_AddOns.DisableAddOn

NUI.title = format("|cff0091edNaowh|r|cffffa300UI|r")
NUI.version = tonumber(C_AddOns.GetAddOnMetadata("NaowhUI", "Version"))
NUI.myname = UnitName("player")

function NUI:Initialize()
    local Details = Details
    local E
    local addons = {
        "NaowhUI_Installer",
        "NephUI",
        "NephUI Cooldown Manager",
        "SharedMedia_Naowh"
    }

    if self:IsAddOnEnabled("Details") then
        if Details.is_first_run and #Details.custom == 0 then
            Details:AddDefaultCustomDisplays()
        end

        Details.character_first_run = false
        Details.is_first_run = false
        Details.is_version_first_run = false
    end

    if self:IsAddOnEnabled("ElvUI") then
        E = unpack(ElvUI)

        if E.InstallFrame and E.InstallFrame:IsShown() then
            E.InstallFrame:Hide()

            E.private.install_complete = E.version
        end

        E.global.ignoreIncompatible = true
    end

    if self.db.global.profiles and not self.db.char.loaded and not InCombatLockdown() then
        StaticPopupDialogs["LoadProfiles"] = {
            text = "Do you wish to load your installed profiles onto this character?",
            button1 = "Yes",
            button2 = "No",
            OnAccept = function() self:LoadProfiles() end,
            OnCancel = function() self.db.char.loaded = true end
        }

        StaticPopup_Show("LoadProfiles")
    end

    for _, v in ipairs(addons) do
        if self:IsAddOnEnabled(v) then
            DisableAddOn(v)
        end
    end
end
local NUI = unpack(NaowhUI)
local I = NUI:GetModule("Installer")
local SE = NUI:GetModule("Setup")

I.installer = {
    Title = format("%s %s", NUI.title, "Installation"),
    Name = NUI.title,
    tutorialImage = "Interface\\AddOns\\NaowhUI\\Game\\Shared\\Media\\Textures\\LogoTop.tga",
    Pages = {
        [1] = function()
            PluginInstallFrame.SubTitle:SetFormattedText("Welcome to %s", NUI.title)

            if not NUI.db.global.profiles then
                PluginInstallFrame.Desc1:SetText("To start the installation process, click on 'Continue'")

                return
            end

            PluginInstallFrame.Desc1:SetText("To load your installed profiles onto this character, click on 'Load Profiles'")
            PluginInstallFrame.Desc3:SetText("To start the installation process again, click on 'Continue'")
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:LoadProfiles() end)
            PluginInstallFrame.Option1:SetText("Load Profiles")
        end,
        [2] = function()
            PluginInstallFrame.SubTitle:SetText("ElvUI")
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("ElvUI", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            --[[PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("ElvUI", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p (NYI)")]]
        end,
        [3] = function()
            PluginInstallFrame.SubTitle:SetText("BigWigs")

            if not NUI:IsAddOnEnabled("BigWigs") then
                PluginInstallFrame.Desc1:SetText("Enable BigWigs to unlock this step")

                return
            end

            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("BigWigs", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            --[[PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("BigWigs", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p (NYI)")]]
        end,
        [4] = function()
            PluginInstallFrame.SubTitle:SetText("Details")

            if not NUI:IsAddOnEnabled("Details") then
                PluginInstallFrame.Desc1:SetText("Enable Details to unlock this step")

                return
            end

            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("Details", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            --[[PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("Details", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p (NYI)")]]
        end,
        [5] = function()
            PluginInstallFrame.SubTitle:SetText("Plater")

            if not NUI:IsAddOnEnabled("Plater") then
                PluginInstallFrame.Desc1:SetText("Enable Plater to unlock this step")

                return
            end

            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("Plater", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            --[[PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("Plater", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p (NYI)")]]
        end,
        [6] = function()
            PluginInstallFrame.SubTitle:SetText("WarpDeplete")

            if not NUI:IsAddOnEnabled("WarpDeplete") then
                PluginInstallFrame.Desc1:SetText("Enable WarpDeplete to unlock this step")

                return
            end

            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("WarpDeplete", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            --[[PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("WarpDeplete", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p (NYI)")]]
        end,
        [7] = function()
            PluginInstallFrame.SubTitle:SetText("Class Cooldown Layouts")

            local className = SE.GetPlayerClassDisplayName and SE.GetPlayerClassDisplayName() or UnitClass("player")

            PluginInstallFrame.Desc1:SetText("Install Edit Mode and Cooldown Manager layouts for your class.")
            PluginInstallFrame.Desc2:SetText("|cffFFFF00Note:|r This only installs layouts for |cff00FF00" .. className .. "|r (all specs).")
            PluginInstallFrame.Desc3:SetText("Make sure the Cooldown Manager is enabled in Advanced Options.")

            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("ClassCooldowns", true) end)
            PluginInstallFrame.Option1:SetText("Install Class Layout")
        end,
        [8] = function()
            PluginInstallFrame.SubTitle:SetText("Placeholder")

            --[[if not NUI:IsAddOnEnabled("WarpDeplete") then
                PluginInstallFrame.Desc1:SetText("Enable WarpDeplete to unlock this step")

                return
            end]]

            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function()end)
            PluginInstallFrame.Option1:SetText("NYI")
            PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function()end)
            PluginInstallFrame.Option2:SetText("NYI")
        end,
        [9] = function()
            PluginInstallFrame.SubTitle:SetText("Installation Complete")
            PluginInstallFrame.Desc1:SetText("You have completed the installation process")
            PluginInstallFrame.Desc2:SetText("Please click on 'Reload' to save your settings and reload your UI")
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() ReloadUI() end)
            PluginInstallFrame.Option1:SetText("Reload")
        end
    },
    StepTitles = {
        [1] = "Welcome",
        [2] = "ElvUI",
        [3] = "BigWigs",
        [4] = "Details",
        [5] = "Plater",
        [6] = "WarpDeplete",
        [7] = "Class Cooldowns",
        [8] = "Placeholder",
        [9] = "Installation Complete"
    },
    StepTitlesColor = {1, 1, 1},
    StepTitlesColorSelected = {0, 179/255, 1},
    StepTitleWidth = 200,
    StepTitleButtonWidth = 180,
    StepTitleTextJustification = "RIGHT"
}
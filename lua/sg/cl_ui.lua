hook.Add("AddToolMenuCategories", "sg_base", function()
	spawnmenu.AddToolCategory("Options", "sg_base", "S&G Base")
end)

local function buildToolPreset(convars)
	local out = {}

	for _, name in ipairs(convars) do
		local convar = GetConVar(name)

		if convar and #convar:GetDefault() > 0 then
			out[name] = convar:GetDefault()
		end
	end

	return out
end

hook.Add("PopulateToolMenu", "sg_base", function()
	spawnmenu.AddToolMenuOption("Options", "sg_base", "sg_changelog", "Changelog (Last updated: N/A)", "", "", function(pnl)
		pnl:ClearControls()

		pnl:Help([[19 Nov 2036:

			- Initial release
			- Half-Life 3 is released
			]])
	end)

	spawnmenu.AddToolMenuOption("Options", "sg_base", "sg_client", "Client Settings", "", "", function(pnl)
		pnl:ClearControls()
		pnl:Help("Client Settings. These settings save automatically and only affect you.")

		pnl:ToolPresets("options_sg_client", buildToolPreset({
			"sg_sck_lod"
		}))

		pnl:Help("SCK Settings")

		pnl:CheckBox("Draw world models", "sg_sck_worldmodels")

		pnl:NumSlider("Level of Detail", "sg_sck_lod", 0, 10, 0)
		pnl:ControlHelp("Higher values make world models fade out faster at a distance, 0 = always render.")
	end)

	spawnmenu.AddToolMenuOption("Options", "sg_base", "sg_server", "Server Settings", "", "", function(pnl)
		pnl:ClearControls()
		pnl:Help("Server Settings. These settings can only be changed by the person who created the game server through the main menu.")

		pnl:ToolPresets("options_sg_client", buildToolPreset({
			"sg_infiniteammo",
			"sg_exp_recoil"
		}))

		pnl:CheckBox("Infinite ammo", "sg_infiniteammo")
		pnl:ControlHelp("Infinite ammo only applies to reserve ammo, not individual clips."):DockMargin(32, 4, 32, 8)
	end)
end)

return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`scoreboard_damage_done_plugin` encountered an error loading the Darktide Mod Framework.")

		new_mod("scoreboard_damage_done_plugin", {
			mod_script       = "scoreboard_damage_done_plugin/scripts/mods/scoreboard_damage_done_plugin/scoreboard_damage_done_plugin",
			mod_data         = "scoreboard_damage_done_plugin/scripts/mods/scoreboard_damage_done_plugin/scoreboard_damage_done_plugin_data",
			mod_localization = "scoreboard_damage_done_plugin/scripts/mods/scoreboard_damage_done_plugin/scoreboard_damage_done_plugin_localization",
		})
	end,
	packages = {},
}

return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`scoreboard_dodge_plugin` encountered an error loading the Darktide Mod Framework.")

		new_mod("scoreboard_dodge_plugin", {
			mod_script       = "scoreboard_dodge_plugin/scripts/mods/scoreboard_dodge_plugin/scoreboard_dodge_plugin",
			mod_data         = "scoreboard_dodge_plugin/scripts/mods/scoreboard_dodge_plugin/scoreboard_dodge_plugin_data",
			mod_localization = "scoreboard_dodge_plugin/scripts/mods/scoreboard_dodge_plugin/scoreboard_dodge_plugin_localization",
		})
	end,
	packages = {},
}

local mod = get_mod("scoreboard_damage_done_plugin")

return {
	name = mod:localize("mod_title"),
	description = mod:localize("mod_description"),
	is_togglable = false,
	options = {
		widgets = {
			{["setting_id"] = "show_row",
				["type"] = "checkbox",
				["default_value"] = true,
			},
			{["setting_id"] = "show_row_value",
				["type"] = "checkbox",
				["default_value"] = true,
			},
		},
	},
}

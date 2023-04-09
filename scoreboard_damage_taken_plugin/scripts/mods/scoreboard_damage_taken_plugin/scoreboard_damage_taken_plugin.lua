local mod = get_mod("scoreboard_dodge_plugin")
-- Get scoreboard reference
local scoreboard = get_mod("scoreboard")

-- Character states can be found here: https://github.com/Aussiemon/Darktide-Source-Code/tree/master/scripts/extension_systems/character_state_machine/character_states

-- Hook dodging state
mod:hook(CLASS.PlayerCharacterStateDodging, "on_enter", function(func, self, unit, dt, t, previous_state, params)
    local dodge_direction = params.dodge_direction
    func(self, unit, dt, t, previous_state, params)
    -- Check scoreboard; could not be installed
    if scoreboard then
        local player = scoreboard:player_from_unit(unit)
        if player then
            -- Get account id from player
            -- Bots don't have account ids; use name instead
            local account_id = player:account_id() or player:name()
            -- Update stat
            if dodge_direction == "dodge_left" then
                scoreboard:update_stat("scoreboard_dodge_left", account_id, 1)
            else if dodge_direction == "dodge_right" then
                scoreboard:update_stat("scoreboard_dodge_right", account_id, 1)
            else
                scoreboard:update_stat("scoreboard_dodge_bwd", account_id, 1)
        end
    end
end)

mod:hook(CLASS.HealthExtension, "add_damage", function(func, self, damage_amount, permanent_damage, hit_actor, damage_profile, attack_type, attack_direction, attacking_unit)
    func(func, self, damage_amount, permanent_damage, hit_actor, damage_profile, attack_type, attack_direction, attacking_unit)

end)

-- Define rows
mod.scoreboard_rows = {
    {name = "scoreboard_damage_taken",
		text = "row_scoreboard_damage_taken",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken",
		setting = "show_row",
	},
    {name = "scoreboard_dodge_right",
		text = "row_scoreboard_dodge_right",
		validation = "DESC",
		iteration = "ADD",
		group = "dodge",
		setting = "show_row",
	},
    {name = "scoreboard_dodge_bwd",
		text = "row_scoreboard_dodge_bwd",
		validation = "DESC",
		iteration = "ADD",
		group = "dodge",
		setting = "show_row",
	},
}

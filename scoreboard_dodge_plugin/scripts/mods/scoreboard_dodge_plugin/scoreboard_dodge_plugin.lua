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

-- Define rows
mod.scoreboard_rows = {
    {name = "scoreboard_dodge_left",
		text = "row_scoreboard_dodge_left",
		validation = "DESC",
		iteration = "ADD",
		group = "dodge",
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

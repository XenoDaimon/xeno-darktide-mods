local mod = get_mod("scoreboard_damage_done_plugin")
-- Get scoreboard reference
local scoreboard = get_mod("scoreboard")

-- Character states can be found here: https://github.com/Aussiemon/Darktide-Source-Code/tree/master/scripts/extension_systems/character_state_machine/character_states

local AttackSettings = mod:original_require("scripts/settings/damage/attack_settings")
local attack_types = AttackSettings.attack_types

mod:hook(CLASS.AttackReportManager, "add_attack_result", function(func, self, damage_profile, attacked_unit, attacking_unit, attack_direction, hit_world_position, hit_weakspot, damage,
	attack_result, attack_type, damage_efficiency, ...)

	mod:echo("Test value: %s", tostring(hit_actor))
    -- Check scoreboard; could not be installed
    if scoreboard then
        if damage > 0 then
            local player = scoreboard:player_from_unit(attacking_unit)

            if player then
                -- Get account id from player
                -- Bots don't have account ids; use name instead
                local account_id = player:account_id() or player:name()

                if attack_type == attack_types.melee then
                    scoreboard:update_stat("scoreboard_damage_done_melee", account_id, 1)
                    scoreboard:update_stat("scoreboard_damage_done_melee_value", account_id, damage)
                end
                if attack_type == attack_types.ranged then
                    scoreboard:update_stat("scoreboard_damage_done_ranged", account_id, 1)
                    scoreboard:update_stat("scoreboard_damage_done_ranged_value", account_id, damage)
                end
                if attack_type == attack_types.explosion then
                    scoreboard:update_stat("scoreboard_damage_done_explosion", account_id, 1)
                    scoreboard:update_stat("scoreboard_damage_done_explosion_value", account_id, damage)
                end
            	if attack_type == attack_types.shout then
                    scoreboard:update_stat("scoreboard_damage_done_shout", account_id, 1)
                    scoreboard:update_stat("scoreboard_damage_done_shout_value", account_id, damage)
                end
                if attack_type == attack_types.buff then
                    scoreboard:update_stat("scoreboard_damage_done_buff", account_id, 1)
                    scoreboard:update_stat("scoreboard_damage_done_buff_value", account_id, damage)
                end
            end
        end
    end

	return func(self, damage_profile, attacked_unit, attacking_unit, attack_direction, hit_world_position, hit_weakspot, damage, attack_result, attack_type, damage_efficiency, ...)
end)

-- Define rows
mod.scoreboard_rows = {
    {name = "scoreboard_damage_done_melee",
		text = "row_scoreboard_damage_done_melee",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done",
		setting = "show_row",
	},
    {name = "scoreboard_damage_done_ranged",
		text = "row_scoreboard_damage_done_ranged",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done",
		setting = "show_row",
	},
    {name = "scoreboard_damage_done_explosion",
		text = "row_scoreboard_damage_done_explosion",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done",
		setting = "show_row",
	},
    {name = "scoreboard_damage_done_shout",
		text = "row_scoreboard_damage_done_shout",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done",
		setting = "show_row",
	},
    {name = "scoreboard_damage_done_buff",
		text = "row_scoreboard_damage_done_buff",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done",
		setting = "show_row",
	},
    {name = "scoreboard_damage_done_melee_value",
		text = "row_scoreboard_damage_done_melee_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done_value",
		setting = "show_row_value",
	},
    {name = "scoreboard_damage_done_ranged_value",
		text = "row_scoreboard_damage_done_ranged_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done_value",
		setting = "show_row_value",
	},
    {name = "scoreboard_damage_done_explosion_value",
		text = "row_scoreboard_damage_done_explosion_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done_value",
		setting = "show_row_value",
	},
    {name = "scoreboard_damage_done_shout_value",
		text = "row_scoreboard_damage_done_shout_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done_value",
		setting = "show_row_value",
	},
    {name = "scoreboard_damage_done_buff_value",
		text = "row_scoreboard_damage_done_buff_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_done_value",
		setting = "show_row_value",
	},
}

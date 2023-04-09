local mod = get_mod("scoreboard_damage_taken_plugin")
-- Get scoreboard reference
local scoreboard = get_mod("scoreboard")

-- Character states can be found here: https://github.com/Aussiemon/Darktide-Source-Code/tree/master/scripts/extension_systems/character_state_machine/character_states

local AttackSettings = mod:original_require("scripts/settings/damage/attack_settings")
local attack_types = AttackSettings.attack_types

mod:hook(CLASS.PlayerUnitHealthExtension, "add_damage", function(func, self, damage_amount, permanent_damage, hit_actor, damage_profile, attack_type, attack_direction, attacking_unit)
    func(func, self, damage_amount, permanent_damage, hit_actor, damage_profile, attack_type, attack_direction, attacking_unit)
    -- Check scoreboard; could not be installed
    if scoreboard then
        if damage_amount > 0 then
            local player = scoreboard:player_from_unit(hit_actor)

            if player then
                -- Get account id from player
                -- Bots don't have account ids; use name instead
                local account_id = player:account_id() or player:name()

                -- if attack_type == attack_types.melee then
                --     scoreboard:update_stat("scoreboard_damage_taken_melee", account_id, 1)
                --     scoreboard:update_stat("scoreboard_damage_taken_melee_value", account_id, damage_amout)
                -- end
                -- if attack_type == attack_types.ranged then
                --     scoreboard:update_stat("scoreboard_damage_taken_ranged", account_id, 1)
                --     scoreboard:update_stat("scoreboard_damage_taken_ranged_value", account_id, damage_amout)
                -- end
                -- if attack_type == attack_types.explosion then
                --     scoreboard:update_stat("scoreboard_damage_taken_explosion", account_id, 1)
                --     scoreboard:update_stat("scoreboard_damage_taken_explosion_value", account_id, damage_amout)
                -- end
            	-- if attack_type == attack_types.shout then
                --     scoreboard:update_stat("scoreboard_damage_taken_shout", account_id, 1)
                --     scoreboard:update_stat("scoreboard_damage_taken_shout_value", account_id, damage_amout)
                -- end
                -- if attack_type == attack_types.buff then
                --     scoreboard:update_stat("scoreboard_damage_taken_buff", account_id, 1)
                --     scoreboard:update_stat("scoreboard_damage_taken_buff_value", account_id, damage_amout)
                -- end
            end
        end
    end
end)

-- Define rows
mod.scoreboard_rows = {
    {name = "scoreboard_damage_taken_melee",
		text = "row_scoreboard_damage_taken_melee",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken",
		setting = "show_row",
	},
    {name = "scoreboard_damage_taken_ranged",
		text = "row_scoreboard_damage_taken_ranged",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken",
		setting = "show_row",
	},
    {name = "scoreboard_damage_taken_explosion",
		text = "row_scoreboard_damage_taken_explosion",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken",
		setting = "show_row",
	},
    {name = "scoreboard_damage_taken_shout",
		text = "row_scoreboard_damage_taken_shout",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken",
		setting = "show_row",
	},
    {name = "scoreboard_damage_taken_buff",
		text = "row_scoreboard_damage_taken_buff",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken",
		setting = "show_row",
	},
    {name = "scoreboard_damage_taken_melee_value",
		text = "row_scoreboard_damage_taken_melee_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken_value",
		setting = "show_row_value",
	},
    {name = "scoreboard_damage_taken_ranged_value",
		text = "row_scoreboard_damage_taken_ranged_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken_value",
		setting = "show_row_value",
	},
    {name = "scoreboard_damage_taken_explosion_value",
		text = "row_scoreboard_damage_taken_explosion_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken_value",
		setting = "show_row_value",
	},
    {name = "scoreboard_damage_taken_shout_value",
		text = "row_scoreboard_damage_taken_shout_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken_value",
		setting = "show_row_value",
	},
    {name = "scoreboard_damage_taken_buff_value",
		text = "row_scoreboard_damage_taken_buff_value",
		validation = "ASC",
		iteration = "ADD",
		group = "damage_taken_value",
		setting = "show_row_value",
	},
}

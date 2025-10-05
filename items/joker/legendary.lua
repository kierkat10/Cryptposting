--[[ commented out due to returns ending everything for some reason
SMODS.Joker {
	key = "quantum",
	name = "Quantum Joker",
	config = {
		extra = {
			bonus_chips = 30,
			mult_mult = 4,
			glass_xmult = 2,
			light_xmult_mod = 0.2,
			lucky_mult = 20,
			lucky_mult_chance = 5, 
			lucky_money = 20,
			lucky_money_chance = 15,
			echo_retriggers = 2,
			echo_retrigger_chance = 2,
			abstract_emult = 1.15,
			steel_xmult = 1.5,
			gold_money = 3
		}
	},
	rarity = 4,
	atlas = "crp_placeholder",
    pos = { x = 6, y = 0 },
	cost = 20,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card.ability.set == 'Enhanced' then
			if #context.scoring_hand >= 5 then
        		context.other_card.ability.perma_x_mult = lenient_bignum(context.other_card.ability.perma_x_mult) + lenient_bignum(card.ability.extra.light_xmult_mod)
        		return {
        		    extra = { message = localize("k_upgrade_ex"), colour = G.C.MULT },
				}
			end
			if card.ability.extra.lucky_mult_chance == math.random(1, card.ability.extra.lucky_mult_chance) then
				return {
					mult = lenient_bignum(card.ability.extra.lucky_mult),
				}
			end
			if card.ability.extra.lucky_money_chance == math.random(1, card.ability.extra.lucky_money_chance) then
				return {
					message = "+" .. lenient_bignum(card.ability.extra.lucky_money) .. "$",
					ease_dollars(lenient_bignum(card.ability.extra.lucky_money)),
					colour = G.C.MONEY
				}
			end
			return {
				chips = lenient_bignum(card.ability.extra.bonus_chips),
				extra = {
					mult = lenient_bignum(card.ability.extra.mult_mult),
					extra = {
						Xmult = lenient_bignum(card.ability.extra.glass_xmult),
						extra = {
							message = "^" .. lenient_bignum(card.ability.extra.abstract_emult) .. " Mult",
							Emult_mod = lenient_bignum(card.ability.extra.abstract_emult),
							colour = G.C.DARK_EDITION,
						}
					}
				}
			}
		end
		if context.repetition and context.cardarea == G.play and context.other_card.ability.set == 'Enhanced' then
			if lenient_bignum(card.ability.extra.echo_retrigger_chance) == math.random(1, card.ability.extra.echo_retrigger_chance) then
				return {
					message = localize("k_again_ex"),
					repetitions = lenient_bignum(card.ability.extra.echo_retriggers),
				}
			end
		end
		if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card.ability.set == 'Enhanced' then
			return {
				Xmult = lenient_bignum(card.ability.extra.steel_xmult),
			}
		end
		if context.end_of_round and context.cardarea == G.play and context.other_card.ability.set == 'Enhanced' then
			return {
				message = "+" .. lenient_bignum(card.ability.extra.gold_money) .. "$",
				ease_dollars(card.ability.extra.gold_money),
				colour = G.C.MONEY,
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "Rainstar", "Glitchkat10" }
	}
}
]]--

SMODS.Joker {
	key = "270_bulgoescope",
	name = "270° Bulgoescope",
	config = { extra = { chips = 10888869450418352160768000000 } },
	atlas = "crp_joker",
	pos = { x = 7, y = 7 },
	soul_pos = { x = 8, y = 7 },
	rarity = 4,
	cost = 20,
	blueprint_compat = true,
	demicoloncompat = true,
	pools = { Bulgoe = true },
	pronouns = "bulgoe",
	calculate = function(self, card, context)
		if
		(context.individual
		and context.cardarea == G.play
		and (context.other_card:get_id() == 2 or context.other_card:get_id() == 7)
		and pseudorandom("crp_270_bulgoescope") < 1/27)
		or context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chips)
			}
		end
	end,
	crp_credits = {
		idea = { "Grahkon", "George The Rat" },
		art = { "Grahkon", "Glitchkat10" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
    key = "chibidoki",
	name = "Chibidoki",
    pos = { x = 8, y = 6 },
	soul_pos = { x = 9, y = 6 },
    config = { extra = { xchipsmult = 2.25 } },
    atlas = "crp_joker",
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    demicoloncompat = true,
    loc_vars = function(self, info_queue, center)
        return { vars = { number_format(lenient_bignum(center.ability.extra.xchipsmult)), colours = { { 0.8, 0.45, 0.85, 1 } } } }
    end,
    calculate = function(self, card, context)
        -- trigger when another qualifying joker triggers
        if context.other_joker and context.other_joker.ability.set == "Joker" and context.other_joker ~= card then
            local valid_rare_keys = {
				["crp_unrare"] = true,
				[3] = true,
				["crp_well-done"] = true,
				["cry_candy"] = true,
				["crp_meat"] = true,
				["crp_refined"] = true,
				["crp_joker"] = true,
				["crp_m"] = true,
				["cry_epic"] = true,
				["crp_cipe"] = true,
				["crp_incredible"] = true,
				[4] = true,
				["crp_awesome"] = true,
				["cry_exotic"] = true,
				["crp_exotic_2"] = true,
				["crp_mythic"] = true,
				["crp_exomythic"] = true,
				["crp_2exomythic4me"] = true,
                ["crp_22exomythic4mecipe"] = true,
                ["crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe"] = true,
				["crp_all"] = true,
            }
            
            local rarity = context.other_joker.config.center.rarity
            local is_qualifying = false
            
            -- check base game numeric rarities
            if type(rarity) == "number" and rarity >= 3 then
                is_qualifying = true
            -- check for known string-based rarities
            elseif type(rarity) == "string" and valid_rare_keys[rarity] then
                is_qualifying = true
            end
            
            if is_qualifying then
                if not (Talisman and Talisman.config_file and Talisman.config_file.disable_anims) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.other_joker:juice_up(0.5, 0.5)
                            return true
                        end,
                    }))
                end
                return { -- the biggest return you've ever seen (maybe)
					message = "X" .. number_format(lenient_bignum(card.ability.extra.xchipsmult)) .. " Chips and Mult",
					sound = "crp_multiplicativechipsmult",
					x_chips = lenient_bignum(card.ability.extra.xchipsmult),
					xmult = lenient_bignum(card.ability.extra.xchipsmult),
					remove_default_message = true,
					colour = { 0.8, 0.45, 0.85, 1 } -- plasma deck colors
                }
            end
        end
    end,

	crp_credits = {
		idea = { "Psychomaniac14" },
		art = { "Psychomaniac14" },
		code = { "Glitchkat10", "Psychomaniac14" }
	}
}

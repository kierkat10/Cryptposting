SMODS.Joker {
	key = "weather_machine",
	name = "Weather Machine",
	config = { extra = { mult_mod = 1e76, death_prevention_enabled = true, mult = 0 } },
	rarity = "crp_mythic",
	atlas = "crp_placeholder",
	pos = { x = 8, y = 0 },
	cost = 100,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult_mod), card.ability.extra.death_prevention_enabled, lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if context.game_over and to_big(lenient_bignum(G.GAME.chips) / lenient_bignum(G.GAME.blind.chips)) < to_big(1) and card.ability.extra.death_prevention_enabled == true then
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					card:start_dissolve()
					return true
				end
			}))
			card.ability.extra.death_prevention_enabled = false
			return {
				saved = true,
				message = localize({
					type = "variable",
					key = "k_saved",
					vars = { "Weather Machine" }
				}),
			}
		end
		if context.end_of_round and context.game_over and card.ability.extra.death_prevention_enabled == true then
			return {
				message = "Saved & Upgraded!",
				colour = G.C.RED,
			}
		end
		if context.joker_main and card.ability.extra.death_prevention_enabled == false or context.forcetrigger then
			card.ability.extra.mult = lenient_bignum(card.ability.extra.mult) + lenient_bignum(card.ability.extra.mult_mod)
			return {
				mult_mod = lenient_bignum(card.ability.extra.mult),
				message = "+" .. number_format(lenient_bignum(card.ability.extra.mult)) .. "Mult",
				colour = G.C.MULT,
			}
		end
	end,
	remove_from_deck = function(self, card, context)
		if not context.from_debuff then
			card.ability.extra.death_prevention_enabled = false
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "room_for_all",
	name = "Room For All",
	config = { extra = { slots = 1e100 } },
	rarity = "crp_mythic",
	atlas = "crp_placeholder",
	pos = { x = 8, y = 0 },
	cost = 100,
	blueprint_compat = false,
	demicoloncompat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.slots) } }
	end,
	add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.extra.slots)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slots
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.hand:change_size(-card.ability.extra.slots)
		G.hand:change_size(8)
		G.jokers.config.card_limit = 5
		G.consumeables.config.card_limit = 2
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "pentation_peter",
	name = "pentation peter",
	config = { extra = { EEEmult = 1.1 } },
	rarity = "crp_mythic",
	atlas = "peter",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 7, extra = { x = 0, y = 7 } },
	cost = 100,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.EEEmult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "^^^" .. lenient_bignum(card.ability.extra.EEEmult) .. " Mult",
				EEEmult_mod = lenient_bignum(card.ability.extra.EEEmult),
				colour = G.C.EDITION,
				
			}
		end
	end,
	animation = {
        macro = {
            type = "skim",
            pos = {
                include = { { x1 = 0, x2 = 3, y1 = 0, y2 = 6 } },
                exclude = { { x1 = 0, x2 = 3, y1 = 7, y2 = 7 } }
            }
        }
    },
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "MarioFan597" },
		code = { "Glitchkat10" }
	}
}

-- tetrationa's effect
local scie = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
local ret = scie(effect, scored_card, key, amount, from_edition)
	if
		(
			key == "e_mult"
			or key == "emult"
			or key == "Emult"
			or key == "e_mult_mod"
			or key == "emult_mod"
			or key == "Emult_mod"
		)
		and amount ~= 1
	then
		for k, v in pairs(SMODS.find_card("j_crp_tetrationa")) do
			local old = v.ability.extra.eemult
			v.ability.extra.eemult = lenient_bignum(to_big(v.ability.extra.eemult) + v.ability.extra.eemult_mod)
			card_eval_status_text(v, "extra", nil, nil, nil, {
				message = "Upgraded!",
			})
			Cryptid.apply_scale_mod(v, v.ability.extra.eemult_mod, old, v.ability.extra.eemult, {
				base = { { "extra", "eemult" } },
				scaler = { { "extra", "eemult_mod" } },
				scaler_base = { v.ability.extra.eemult_mod },
			})
		end
	end
	return ret
end

SMODS.Joker {
	key = "tetrationa",
	name = "Tetrationa",
	config = { extra = { eemult = 1, eemult_mod = 0.3 } },
	rarity = "crp_mythic",
	atlas = "crp_placeholder",
	pos = { x = 8, y = 0 },
	cost = 100,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.eemult), lenient_bignum(card.ability.extra.eemult_mod) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				eemult = lenient_bignum(card.ability.extra.eemult),
				eemult_message = {
					message = "^^" .. number_format(lenient_bignum(card.ability.extra.eemult)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_eemult"
				}
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
    key = "bulgoeship_card",
	name = "Bulgoeship Card",
    config = { extra = { eemult_mod = 0.1 } },
    rarity = "crp_mythic",
    atlas = "crp_joker",
    pos = { x = 1, y = 7 },
    soul_pos = { x = 2, y = 7, extra = { x = 3, y = 7 } },
    cost = 100,
    blueprint_compat = true,
    demicoloncompat = true,
	perishable_compat = false,
	pools = { Bulgoe = true },
    loc_vars = function(self, info_queue, card)
        return { vars = { number_format(card.ability.extra.eemult_mod), number_format(card.ability.extra.eemult_mod) * Cryptposting.member_count, }, }
    end,
    calculate = function(self, card, context)
        if (context.joker_main
		and to_big(lenient_bignum(card.ability.extra.eemult_mod) * lenient_bignum(Cryptposting.member_count)) > to_big(1))
		or context.forcetrigger then
			return {
				eemult = lenient_bignum(card.ability.extra.eemult_mod) * lenient_bignum(Cryptposting.member_count),
				eemult_message = {
					message = "^^" .. number_format(lenient_bignum(card.ability.extra.eemult_mod) * lenient_bignum(Cryptposting.member_count)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_eemult"
				}
			}
        end
    end,
    crp_credits = {
        idea = { "Poker The Poker" },
        art = { "Glitchkat10", "HexaCryonic" },
        code = { "Glitchkat10", "Tesseffex" }
    }
}

SMODS.Joker {
	key = "underflow",
	name = "Underflow",
	config = { extra = { xmult = 1, xmult_scale = 1 } },
	rarity = "crp_mythic",
	atlas = "crp_joker",
	pos = { x = 5, y = 6 },
	soul_pos = { x = 6, y = 6, extra = { x = 7, y = 6 } },
	cost = 100,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.xmult), lenient_bignum(card.ability.extra.xmult_scale) } }
	end,
	calculate = function(self, card, context)
		if ((context.joker_main) or context.forcetrigger) and to_big(card.ability.extra.xmult) ~= to_big(0) then
			return {
				xmult = lenient_bignum(card.ability.extra.xmult),
			}
		end
		if (context.end_of_round and not context.blueprint and context.main_eval and not context.retrigger_joker) or context.forcetrigger then
			if to_big(card.ability.extra.xmult) > to_big(-1) then
				card.ability.extra.xmult = lenient_bignum(card.ability.extra.xmult) - lenient_bignum(card.ability.extra.xmult_scale)
			end
			if to_big(card.ability.extra.xmult) <= to_big(-1) then
				card.ability.extra.xmult = 1.79769e308 -- oops
			end
		end
	end,
	crp_credits = {
		idea = { "MarioFan597", "Glitchkat10" },
		art = { "Tatteredlurker" },
		code = { "Glitchkat10" }
	}
}


SMODS.Joker {
	key = "highest_chip",
	name = "The Highest Chip",
	config = { extra = { echips = 1 } },
	rarity = "crp_mythic",
	atlas = "crp_placeholder",
	pos = { x = 8, y = 0 },
	cost = 100,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.echips) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			card.ability.extra.echips = mult
			return {
				message = "^" .. lenient_bignum(card.ability.extra.echips) .. " Chips",
				Echip_mod = lenient_bignum(card.ability.extra.echips),
				colour = G.C.EDITION,
				
			}
		end
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "2048",
	name = "2048",
	config = { extra = { } },
	rarity = "crp_mythic",
	atlas = "crp_placeholder",
	pos = { x = 8, y = 0 },
	cost = 100,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			local current_mult = lenient_bignum(mult)
			return {
				xmult = 0,
				extra = { -- altered to be kinda like chibidoki's return bc of some weird shit
					mult= 2 ^ current_mult,
					remove_default_message = true,
					message = "=2^" .. current_mult .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_emult"
				}
			}
		end
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "Rainstar" }
	}
}
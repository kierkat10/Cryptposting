SMODS.Joker {
	key = "duplex",
	name = "Duplex",
	config = { extra = { xmult = 1, xmult_gain = 0.25, retriggers = 1 } },
	rarity = "crp_outlandish",
	atlas = "crp_joker",
	pos = { x = 7, y = 5 },
	soul_pos = { x = 9, y = 5, extra = { x = 8, y = 5 } },
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.xmult), lenient_bignum(card.ability.extra.xmult_gain), lenient_bignum(card.ability.extra.retriggers) } }
	end,
	calculate = function(self, card, context) 
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= card then
			return {
				message = localize("k_again_ex"),
				repetitions = lenient_bignum(card.ability.extra.retriggers),
				
			}
		end
		if context.repetition and context.cardarea == G.play then
			return {
				message = localize("k_again_ex"),
				repetitions = lenient_bignum(card.ability.extra.retriggers),
			}
		end
		if context.post_trigger and context.other_joker ~= card then
			card.ability.extra.xmult = lenient_bignum(card.ability.extra.xmult) + lenient_bignum(card.ability.extra.xmult_gain)
			card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
		end
		if context.individual and context.cardarea == G.play then
			card.ability.extra.xmult = lenient_bignum(card.ability.extra.xmult) + lenient_bignum(card.ability.extra.xmult_gain)
			card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
		end
		if (context.joker_main) or context.forcetrigger then
			return {
				xmult = lenient_bignum(card.ability.extra.xmult),
			}
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "Tatteredlurker" },
		code = { "Rainstar" },
		custom = { key = "alt", text = "Duplicare" }
	}
}

-- potentia's scaling effect
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
		for k, v in pairs(SMODS.find_card("j_crp_potentia")) do
			local old = v.ability.extra.emult
			v.ability.extra.emult = lenient_bignum(to_big(v.ability.extra.emult) + v.ability.extra.emult_mod)
			card_eval_status_text(v, "extra", nil, nil, nil, {
				message = "Upgraded!",
			})
			Cryptid.apply_scale_mod(v, v.ability.extra.emult_mod, old, v.ability.extra.emult, {
				base = { { "extra", "emult" } },
				scaler = { { "extra", "emult_mod" } },
				scaler_base = { v.ability.extra.emult_mod },
			})
		end
	end
	return ret
end

SMODS.Joker {
	key = "potentia",
	name = "Potentia",
	config = { extra = { emult = 1, emult_mod = 0.3 } },
	rarity = "crp_outlandish",
	atlas = "crp_placeholder",
	pos = { x = 7, y = 0 },
	cost = 100,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.emult), lenient_bignum(card.ability.extra.emult_mod) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				emult = lenient_bignum(card.ability.extra.emult),
				emult_message = {
					message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_emult"
				}
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar" },
		custom = { key = "alt",text = "Exponentia" }
	}
}

SMODS.Joker {
	key = "repetitio",
	name = "Repetitio",
	config = { extra = { xmult = 1.05, retriggers = 10 }, immutable = { max_retriggers = 400 }, },
	rarity = "crp_outlandish",
	atlas = "crp_joker",
	pos = { x = 4, y = 5 },
	soul_pos = { x = 5, y = 5, extra = { x = 6, y = 5 } },
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.xmult), math.min(lenient_bignum(card.ability.immutable.max_retriggers), lenient_bignum(card.ability.extra.retriggers)), lenient_bignum(card.ability.immutable.max_retriggers) } }
	end,
	calculate = function(self, card, context)
		if context.repetition then
			if context.cardarea == G.play then
				return {
					message = localize("k_again_ex"),
					repetitions = tonumber(
						math.min(card.ability.immutable.max_retriggers, card.ability.extra.retriggers)
					),
				}
			end
		elseif context.individual then
			if context.cardarea == G.play then
				return {
					xmult = lenient_bignum(card.ability.extra.xmult),
				}
			end
		end
		if context.forcetrigger then
			return {
				xmult = lenient_bignum(card.ability.extra.xmult),
			}
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10", "MarioFan597" },
		art = { "Tatteredlurker" },
		code = { "Glitchkat10", "MathIsFun_" },
		custom = { key = "alt",text = "Iterum" }
	}
}
SMODS.Joker {
	key = "resurgo",
	name = "Resurgo",
	config = { extra = { emult = 1 } },
	rarity = "crp_outlandish",
	atlas = "crp_placeholder",
	pos = { x = 7, y = 0 },
	cost = 50,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(G.GAME.round_resets.ante) } }
	end,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function(self, card, context)
		if context.setting_blind then
			card.ability.extra.emult = lenient_bignum(G.GAME.round_resets.ante)
		end
		if (context.joker_main) or context.forcetrigger then
			if to_big(card.ability.extra.emult) > to_big(1) then
				return {
					emult = lenient_bignum(card.ability.extra.emult),
					emult_message = {
						message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
						colour = G.C.DARK_EDITION,
						sound = "talisman_emult"
					}
				}
			end
		end
	end,
	crp_credits = {
		idea = { "PurplePickle", "Glitchkat10" },
		code = { "ScarredOut" },
		custom = { key = "alt", text = "Redeo" }
	}
}

SMODS.Joker {
	key = "peripheria_ad_diametrum",
	name = "Peripheria ad Diametrum",
	config = { immutable = { digit = 1, pi = "314159265358979323846264338327950288419716939937510582097494459230781640628620899862803482534211706798214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196442881097566593344612847564823378678316527120190914564856692346034861045432664821339360726024914127" } }, -- i memorized all 300 digits here - wilfredlam0418
	rarity = "crp_outlandish",
	atlas = "crp_placeholder",
	pos = { x = 7, y = 0 },
	cost = 31,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		local pi = card.ability.immutable.pi
		local digit = card.ability.immutable.digit
		return {
			vars = {
				lenient_bignum(tonumber(pi:sub(digit, digit)) or 1),
				lenient_bignum(tonumber(pi:sub(digit + 1, digit + 1)) or 1),
				lenient_bignum(tonumber(pi:sub(digit + 2, digit + 2)) or 1),
				lenient_bignum(tonumber(pi:sub(digit + 3, digit + 3)) or 1),
				lenient_bignum(tonumber(pi:sub(digit + 4, digit + 4)) or 1),
				lenient_bignum(tonumber(pi:sub(digit + 5, digit + 5)) or 1)
			}
		}
	end,
	calculate = function(self, card, context)
		if (context.joker_main and G.GAME.current_round.hands_played == 0) or context.forcetrigger then
			return {
				echips = lenient_bignum(tonumber(card.ability.immutable.pi[card.ability.immutable.digit])) or 1,
				echip_message = {
					message = "^" .. number_format(lenient_bignum(tonumber(card.ability.immutable.pi[card.ability.immutable.digit] or 1))) .. " Chips",
					colour = G.C.DARK_EDITION,
					sound = "talisman_echip"
				}
			}
		end
		if (context.end_of_round and not context.blueprint and context.main_eval and not context.retrigger_joker) or context.forcetrigger then
			card.ability.immutable.digit = card.ability.immutable.digit + 1
			return {
				message = "Next Digit!",
				colour = G.C.FILTER
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown", "Glitchkat10" },
		code = { "wilfredlam0418", "Glitchkat10" },
		custom = { key = "alt", text = "Circulus Pistoris" }
	}
}

SMODS.Joker {
	key = "difficile",
	name = "Difficile",
	config = { extra = { emult = 10, total_triggers = 3, current_triggers = 0 } },
	rarity = "crp_outlandish",
	atlas = "crp_placeholder",
	pos = { x = 7, y = 0 },
	cost = 50,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.emult), lenient_bignum(card.ability.extra.total_triggers) } }
	end,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			card.ability.extra.current_triggers = card.ability.extra.current_triggers + 1
		end
		if (context.joker_main and card.ability.extra.current_triggers <= card.ability.extra.total_triggers) or context.forcetrigger then
			card.ability.extra.current_triggers = 0
			return {
				emult = lenient_bignum(card.ability.extra.emult),
				emult_message = {
					message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_emult"
				}
			}
		else
			card.ability.extra.current_triggers = 0
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar" },
		custom = { key = "alt", text = "Facile" }
	}
}


SMODS.Joker {
	key = "libum",
	name = "Libum",
	config = { extra = { chips_loss = 4, xmoney_per_reroll = 0.1, xmoney = 1 } },
	rarity = "crp_outlandish",
	atlas = "crp_placeholder",
	pos = { x = 7, y = 0 },
	cost = 50,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips_loss), lenient_bignum(card.ability.extra.xmoney_per_reroll), lenient_bignum(card.ability.extra.xmoney) } }
	end,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function(self, card, context)
		if context.reroll_shop and not context.blueprint then
			card.ability.extra.xmoney = card.ability.extra.xmoney + card.ability.extra.xmoney_per_reroll
			for k, v in pairs(G.GAME.hands) do
				G.GAME.hands[k].chips = math.max(G.GAME.hands[k].chips - card.ability.extra.chips_loss, 1)
			end
			return {
				message = "-" .. lenient_bignum(card.ability.extra.chips_loss) .. " Chips",
				colour = G.C.CHIPS,
				extra = {
					message = "+X" .. lenient_bignum(card.ability.extra.xmoney_per_reroll) .. "$",
					colour = G.C.MONEY
				}
			}
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1e100
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls - 1e100
	end,
	calc_dollar_bonus = function(self, card)
		return G.GAME.dollars * card.ability.extra.xmoney
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "Rainstar" },
		custom = { key = "alt", text = "Crustulum" }
	}
}

SMODS.Joker {
	key = "average_cryptposting_experience",
	name = "average cryptposting experience",
	config = { immutable = { chips = 2700000000000000 } }, -- 1 quadrillion bulgoes
	atlas = "crp_placeholder",
	pos = { x = 7, y = 0 },
	rarity = "crp_outlandish",
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_bulgoe
		return { vars = {  } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.immutable.chips)
			}
		end
	end,
	crp_credits = {
		idea = { "j man the f-zero/weezer fan" },
		code = { "Glitchkat10" },
		custom = { key = "alt", text = "average cryptid experience" }
	}
}
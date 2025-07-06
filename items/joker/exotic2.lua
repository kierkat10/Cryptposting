SMODS.Atlas {
	key = "joker",
	path = "atlas_joker.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "placeholder",
	path = "atlas_placeholder.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = "duplex",
	name = "Duplex",
	config = { extra = { Xmult = 1, Xmult_gain = 0.25, retriggers = 1 } },
	rarity = "crp_exotic_2",
	atlas = "crp_joker",
	pos = { x = 7, y = 5 },
	soul_pos = { x = 9, y = 5, extra = { x = 8, y = 5 } },
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.Xmult), lenient_bignum(card.ability.extra.Xmult_gain), lenient_bignum(card.ability.extra.retriggers) } }
	end,
	calculate = function(self, card, context) 
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= card then
			return {
				message = localize("k_again_ex"),
				repetitions = lenient_bignum(card.ability.extra.retriggers),
				card = card,
			}
		end
		if context.repetition and context.cardarea == G.play then
			return {
				message = localize("k_again_ex"),
				repetitions = lenient_bignum(card.ability.extra.retriggers),
				card = card,
			}
		end
		if context.post_trigger and context.other_joker ~= card then
			card.ability.extra.Xmult = lenient_bignum(card.ability.extra.Xmult) + lenient_bignum(card.ability.extra.Xmult_gain)
			card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
		end
		if context.individual and context.cardarea == G.play then
			card.ability.extra.Xmult = lenient_bignum(card.ability.extra.Xmult) + lenient_bignum(card.ability.extra.Xmult_gain)
			card_eval_status_text(card, "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
		end
		if (context.joker_main) or context.forcetrigger then
			return {
				Xmult = lenient_bignum(card.ability.extra.Xmult),
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
		and mult
	then
		for k, v in pairs(find_joker("j_crp_potentia")) do
			local old = v.ability.extra.Emult
			v.ability.extra.Emult = lenient_bignum(to_big(v.ability.extra.Emult) + v.ability.extra.Emult_mod)
			card_eval_status_text(v, "extra", nil, nil, nil, {
				message = localize({
					type = "variable",
					key = "a_powmult",
					vars = { number_format(v.ability.extra.Emult) },
				}),
			})
			Cryptid.apply_scale_mod(v, v.ability.extra.Emult_mod, old, v.ability.extra.Emult, {
				base = { { "extra", "Emult" } },
				scaler = { { "extra", "Emult_mod" } },
				scaler_base = { v.ability.extra.Emult_mod },
			})
		end
	end
	local ret = scie(effect, scored_card, key, amount, from_edition)
	return ret
end

--SMODS.Joker {
--	key = "potentia",
--	name = "Potentia",
--	config = { extra = { Emult = 1, Emult_mod = 0.3 } },
--	rarity = "crp_exotic_2",
--	atlas = "crp_placeholder",
--	pos = { x = 7, y = 0 },
--	cost = 100,
--	blueprint_compat = true,
--	demicoloncompat = true,
--	perishable_compat = false,
--	loc_vars = function(self, info_queue, card)
--		return { vars = { lenient_bignum(card.ability.extra.Emult), lenient_bignum(card.ability.extra.Emult_mod) } }
--	end,
--	calculate = function(self, card, context)
--		if (context.joker_main) or context.forcetrigger then
--			return {
--				message = "^" .. lenient_bignum(card.ability.extra.Emult) .. " Mult",
--				Emult_mod = lenient_bignum(card.ability.extra.Emult),
--				colour = G.C.DARK_EDITION,
--				card = card
--			}
--		end
--	end,
--	-- still stolen from cryptids exponentia
--	update = function(self, card, dt)
--		local scie = SMODS.calculate_individual_effect
--		SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
--			if
--				(
--					key == "e_mult"
--					or key == "emult"
--					or key == "Emult"
--					or key == "e_mult_mod"
--					or key == "emult_mod"
--					or key == "Emult_mod"
--				)
--				and amount ~= 1
--				and mult
--			then
--				for k, v in pairs(find_joker("j_crp_potentia")) do
--					local old = v.ability.extra.Emult
--					v.ability.extra.Emult = lenient_bignum(to_big(v.ability.extra.Emult) + v.ability.extra.Emult_mod)
--					card_eval_status_text(v, "extra", nil, nil, nil, {
--						message = localize({
--							type = "variable",
--							key = "a_powmult",
--							vars = { number_format(v.ability.extra.Emult) },
--						}),
--					})
--					Cryptid.apply_scale_mod(v, v.ability.extra.Emult_mod, old, v.ability.extra.Emult, {
--						base = { { "extra", "Emult" } },
--						scaler = { { "extra", "Emult_mod" } },
--						scaler_base = { v.ability.extra.Emult_mod },
--					})
--				end
--			end
--			local ret = scie(effect, scored_card, key, amount, from_edition)
--			return ret
--		end
--	end,
--	crp_credits = {
--		idea = { "Poker The Poker" },
--		code = { "Rainstar" },
--		custom = { key = "alt",text = "Exponentia" }
--	}
--}

SMODS.Joker {
	key = "repetitio",
	name = "Repetitio",
	config = { extra = { Xmult = 1.05, retriggers = 10 }, immutable = { max_retriggers = 400 }, },
	rarity = "crp_exotic_2",
	atlas = "crp_joker",
	pos = { x = 4, y = 5 },
	soul_pos = { x = 5, y = 5, extra = { x = 6, y = 5 } },
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.Xmult), math.min(lenient_bignum(card.ability.immutable.max_retriggers), lenient_bignum(card.ability.extra.retriggers)), lenient_bignum(card.ability.immutable.max_retriggers) } }
	end,
	calculate = function(self, card, context)
		if context.repetition then
			if context.cardarea == G.play then
				return {
					message = localize("k_again_ex"),
					repetitions = tonumber(math.min(to_big(card.ability.immutable.max_retriggers), to_big(card.ability.extra.retriggers))),
					card = card,
				}
			end
		elseif context.individual then
			if context.cardarea == G.play then
				return {
					message = "X" .. number_format(lenient_bignum(card.ability.extra.Xmult)) .. " Mult",
					Xmult_mod = lenient_bignum(card.ability.extra.Xmult),
					colour = G.C.MULT,
				}
			end
		end
		if context.forcetrigger then
			return {
				message = "X" .. number_format(lenient_bignum(card.ability.extra.Xmult)) .. " Mult",
				Xmult_mod = lenient_bignum(card.ability.extra.Xmult),
				colour = G.C.MULT,
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
	config = { extra = { Emult = 1 } },
	rarity = "crp_exotic_2",
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
			card.ability.extra.Emult = lenient_bignum(G.GAME.round_resets.ante)
		end
		if (context.joker_main) or context.forcetrigger then
			if to_big(card.ability.extra.Emult) > to_big(1) then
				return {
					Emult_mod = lenient_bignum(card.ability.extra.Emult),
					message = "^" .. number_format(lenient_bignum(card.ability.extra.Emult)) .. " Mult",
					colour = G.C.DARK_EDITION
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
	rarity = "crp_exotic_2",
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
				Echip_mod = lenient_bignum(tonumber(card.ability.immutable.pi[card.ability.immutable.digit])) or 1,
				message = "^" .. number_format(lenient_bignum(tonumber(card.ability.immutable.pi[card.ability.immutable.digit] or 1))) .. " Chips",
				colour = G.C.DARK_EDITION
			}
		end
		if (context.end_of_round and not context.blueprint and not context.individual and not context.repetition and not context.retrigger_joker) or context.forcetrigger then
			card.ability.immutable.digit = card.ability.immutable.digit + 1
			return {
				message = "Next Digit!",
				colour = G.C.FILTER
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown", "Glitchkat10" },
		code = { "wilfredlam0418" },
		custom = { key = "alt", text = "Circulus Pistoris" }
	}
}

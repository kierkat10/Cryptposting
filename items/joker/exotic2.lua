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
					repetitions = to_number(math.min(lenient_bignum(card.ability.immutable.max_retriggers), lenient_bignum(card.ability.extra.retriggers))),
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
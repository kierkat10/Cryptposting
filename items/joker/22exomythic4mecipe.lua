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
	key = "quetta_m",
	name = "Quetta M",
	config = { extra = { operator = -1, mult = 8, operator_increase = 8 }, immutable = { numerator = 13, denominator = 100 } },
	rarity = "crp_22exomythic4mecipe",
	atlas = "crp_joker",
	pos = { x = 2, y = 3 },
	soul_pos = { x = 3, y = 3, extra = { x = 4, y = 3 } },
	cost = 800,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.operator), lenient_bignum(card.ability.extra.mult), lenient_bignum(card.ability.extra.operator_increase), "{", "}" } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if card.ability.extra.operator <= -1 then
				return {
					mult = lenient_bignum(card.ability.extra.mult),
				}
			elseif card.ability.extra.operator == 0 then
				return {
					Xmult = lenient_bignum(card.ability.extra.mult),
				}
			elseif card.ability.extra.operator == 1 then
				return {
					Emult_mod = lenient_bignum(card.ability.extra.mult),
					message = "^" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
					colour = G.C.DARK_EDITION
				}
			elseif card.ability.extra.operator == 2 then
				return {
					EEmult_mod = lenient_bignum(card.ability.extra.mult),
					message = "^^" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
					colour = G.C.DARK_EDITION
				}
			elseif card.ability.extra.operator == 3 then
				return {
					EEEmult_mod = lenient_bignum(card.ability.extra.mult),
					message = "^^^" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
					colour = G.C.EDITION
				}
			else  -- guys the elseif chain isn't THAT massive syfm 🥀
				return {
					hypermult_mod = {
						lenient_bignum(card.ability.extra.operator),
						lenient_bignum(card.ability.extra.mult)
					},
					message = "{" .. lenient_bignum(card.ability.extra.operator) .. "}" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
					colour = G.C.EDITION
				}
			end
		end

		local roll = pseudorandom("quetta_m")
		local chance = lenient_bignum(card.ability.immutable.numerator) / lenient_bignum(card.ability.immutable.denominator)
		if (context.before and context.scoring_name == "Pair" and not context.blueprint) or context.forcetrigger then
			if roll <= chance then
				card.ability.extra.operator = card.ability.extra.operator + card.ability.extra.operator_increase
				return {
					message = "Upgraded!",
					card = card
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10", "superb_thing" },
		art = { "George The Rat" },
		code = { "Rainstar", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "playerrwon",
	name = "playerWon",
	config = { extra = { arrows = 1, placebo = 9, arrows_scale = 1, mult = 1e300 }, immutable = { max = 9827 } },
	rarity = "crp_22exomythic4mecipe",
	atlas = "crp_placeholder",
	pos = { x = 10, y = 0 },
	-- soul_pos = { x = 0, y = 0, extra = { x = 0, y = 0 } },
	cost = 800,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(math.min(lenient_bignum(card.ability.extra.arrows), lenient_bignum(card.ability.immutable.max))), lenient_bignum(card.ability.extra.placebo), lenient_bignum(card.ability.extra.arrows_scale), "{", "}" } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if to_big(card.ability.extra.arrows) < to_big(100) then
				card.ability.extra.mult = lenient_bignum(card.ability.extra.placebo)
			end
			return {
				hypermult_mod = {
					lenient_bignum(math.ceil(lenient_bignum(math.min(lenient_bignum(card.ability.extra.arrows), lenient_bignum(card.ability.immutable.max))))), -- do you like parentheses
					lenient_bignum(card.ability.extra.mult)
				},
				message = "{" .. lenient_bignum(math.min(lenient_bignum(card.ability.extra.arrows), lenient_bignum(card.ability.immutable.max))) .. "}" .. lenient_bignum(card.ability.extra.placebo) .. " Mult",
				colour = G.C.EDITION,
			}
		end
		if (context.end_of_round and not context.blueprint and not context.retrigger and not context.individual and not context.repetition) or context.forcetrigger then
			card.ability.extra.arrows = lenient_bignum(card.ability.extra.arrows) + lenient_bignum(card.ability.extra.arrows_scale)
			if to_big(card.ability.extra.arrows) > to_big(100) then
				card.ability.extra.mult = 1e300
			end
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}
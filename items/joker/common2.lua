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
	key = "sprinter",
	name = "Sprinter",
	config = { extra = { chips = 0, chips_scale = 75 } },
	rarity = "crp_common_2",
	atlas = "crp_joker",
	pos = { x = 4, y = 0 },
	cost = 5,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips), lenient_bignum(card.ability.extra.chips_scale) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chips),
			}
		end
		if (context.before and next(context.poker_hands["Straight Flush"]) and not context.blueprint) or context.forcetrigger then
			card.ability.extra.chips = lenient_bignum(card.ability.extra.chips) + lenient_bignum(card.ability.extra.chips_scale)
			return {
				message = "Upgraded!",
				colour = G.C.CHIPS,
				card = card
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "MarioFan597" },
		code = { "Glitchkat10" },
		custom = { key = "alt",text = "Runner" }
	}
}
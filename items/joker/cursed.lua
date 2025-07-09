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
	key = "evil_jolly_joker",
	name = "EVIL Jolly Joker",
	config = { extra = { mult = 8 } },
	rarity = "cry_cursed",
	atlas = "crp_joker",
	evil = "j_jolly",
	pos = { x = 9, y = 1 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main and not context.scoring_name == "Pair") or context.forcetrigger then
			return {
				message = "÷" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
				Xmult_mod = to_big(1) / to_big(card.ability.extra.mult),
				colour = G.C.MULT,
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown", "Glitchkat10" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "evil_joker",
	name = "EVIL Joker",
	config = { extra = { mult = 4 } },
	rarity = "cry_cursed",
	atlas = "crp_joker",
	evil = "j_joker",
	pos = { x = 8, y = 1 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "÷" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
				Xmult_mod = 1 / lenient_bignum(card.ability.extra.mult),
				colour = G.C.MULT,
			}
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "evil_bulgoe",
	name = "EVIL Bulgoe",
	config = { extra = { chips = 2.7 } },
	rarity = "cry_cursed",
	atlas = "crp_joker",
	evil = "j_crp_bulgoe",
	pos = { x = 8, y = 2 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	pools = { Bulgoe = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "÷" .. lenient_bignum(card.ability.extra.chips) .. " Chips",
				Xchip_mod = 1 / lenient_bignum(card.ability.extra.chips),
				colour = G.C.CHIPS,
			}
		end
	end,
	crp_credits = {
		idea = { "Grahkon", "Glitchkat10" },
		art = { "Lexi" },
		code = { "Glitchkat10" }
	}
}

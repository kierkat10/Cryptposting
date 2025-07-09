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
	key = "one_mans_trash",
	name = "One Man's Trash",
	pos = { x = 9, y = 7 },
	config = { extra = { mult = 7 } },
	rarity = "crp_2common4me",
	cost = 5,
	atlas = "crp_joker",
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if ((context.other_joker) and context.other_joker.config.center.rarity == "crp_trash") or context.forcetrigger then
			return {
				mult = lenient_bignum(card.ability.extra.mult)
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "ottermatter" },
		code = { "wilfredlam0418" },
	}
}
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
	key = "sine_wave",
	name = "Sine Wave",
	rarity = "crp_incredible",
	atlas = "crp_placeholder",
	pos = { x = 1, y = 1 },
	cost = 15,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		local total_mult = 0
		for i = 1, G.GAME.round do
			total_mult = lenient_bignum(total_mult + math.sin(i) + 1)
		end
		return { vars = { total_mult, "{", "}" } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			local total_mult = 0
			for i = 1, G.GAME.round do
				total_mult = lenient_bignum(total_mult + math.sin(i) + 1)
			end
			return {
				Xmult = lenient_bignum(total_mult)
			}
		end
	end,
	crp_credits = {
		idea = { "wilfredlam0418" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "another_mans_treasure",
	name = "Another Man's Treasure",
	config = { extra = { Xmult = 7 } },
	rarity = "crp_incredible",
	atlas = "crp_placeholder",
	pos = { x = 1, y = 1 },
	cost = 15,
	blueprint_compat = true,
	demicolon_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.Xmult) } }
	end,
	calculate = function(self, card, context)
		if ((context.other_joker) and context.other_joker.config.center.rarity == 4) or context.forcetrigger then
			return { 
				Xmult = lenient_bignum(card.ability.extra.Xmult)
			}
		end
	end,
	in_pool = function(self, args)
		return next(SMODS.find_card("j_crp_one_mans_trash"))
	end,
	crp_credits = {
		idea = { "BobGames" },
		code = { "wilfredlam0418" }
	}
}

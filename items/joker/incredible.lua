SMODS.Joker {
	key = "sine_wave",
	name = "Sine Wave",
	rarity = "crp_incredible",
	atlas = "crp_joker2",
	pos = { x = 0, y = 1 },
	soul_pos = { x = 1, y = 1 },
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
				total_mult = lenient_bignum(total_mult + math.sin(i) + 1) -- what
			end
			return {
				xmult = lenient_bignum(total_mult)
			}
		end
	end,
	crp_credits = {
		idea = { "wilfredlam0418" },
		art = { "Grahkon", "Glitchkat10" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "another_mans_treasure", -- is one man's treasure
	name = "Another Man's Treasure",
	config = { extra = { xmult = 7 } },
	rarity = "crp_incredible",
	atlas = "crp_placeholder",
	pos = { x = 1, y = 1 },
	cost = 15,
	blueprint_compat = true,
	demicolon_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.xmult) } }
	end,
	calculate = function(self, card, context)
		if ((context.other_joker) and context.other_joker.config.center.rarity == 4) or context.forcetrigger then
			return { 
				xmult = lenient_bignum(card.ability.extra.xmult)
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

SMODS.Joker {
	key = "microfiber",
	name = "Microfiber",
	config = { extra = { chips = 1.11, xvalue = 11.1 } },
	rarity = "crp_incredible",
	atlas = "crp_placeholder",
	pos = { x = 1, y = 1 },
	cost = 19,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips), lenient_bignum(card.ability.extra.xvalue) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chips)
			}
		end
		if (context.beat_boss and not context.blueprint and not context.retrigger and context.main_eval) or context.forcetrigger then
			card.ability.extra.chips = lenient_bignum(card.ability.extra.chips) * lenient_bignum(card.ability.extra.xvalue)
			card.ability.extra.xvalue = lenient_bignum(card.ability.extra.xvalue) * lenient_bignum(card.ability.extra.xvalue)
			return {
				message = "Upgraded!"
			}
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		code = { "Rainstar", "Glitchkat10" }
	}
}
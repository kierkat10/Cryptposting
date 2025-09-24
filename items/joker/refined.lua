SMODS.Joker {
	key = "progressive", -- isn't there like an insurance company named progressive
	name = "Progressive Joker",
	config = { extra = { mult = 1, xmult = 1 } },
	rarity = "crp_refined",
	atlas = "crp_placeholder",
	pos = { x = 13, y = 0 },
	cost = 13,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			card.ability.extra.mult = G.GAME.round
			card.ability.extra.xmult = G.GAME.round_resets.ante
		end
		if (context.joker_main) or context.forcetrigger then
			return {
				mult = card.ability.extra.mult,
				extra = {
					xmult = card.ability.extra.xmult
				}
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker", "Glitchkat10" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "microfiber",
	name = "Microfiber",
	config = { extra = { chips = 1.11, evalues = 1.11 } },
	rarity = "crp_refined",
	atlas = "crp_placeholder",
	pos = { x = 13, y = 0 },
	cost = 11,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.evalues } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				chips = card.ability.extra.chips
			}
		end
		if (context.end_of_round and not context.blueprint and not context.retrigger and context.main_eval) or context.forcetrigger then
			card.ability.extra.chips = card.ability.extra.chips ^ card.ability.extra.evalues
			card.ability.extra.evalues = card.ability.extra.evalues ^ card.ability.extra.evalues
			return {
				message = "Upgraded!"
			}
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		code = { "Rainstar" }
	}
}
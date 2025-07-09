SMODS.Joker {
	key = "progressive",
	name = "Progressive Joker",
	config = { extra = { mult = 1, Xmult = 1 } },
	rarity = "crp_refined",
	atlas = "crp_placeholder",
	pos = { x = 13, y = 0 },
	cost = 13,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult), lenient_bignum(card.ability.extra.Xmult) } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			card.ability.extra.mult = lenient_bignum(G.GAME.round)
			card.ability.extra.Xmult = lenient_bignum(G.GAME.round_resets.ante)
		end
		if (context.joker_main) or context.forcetrigger then
			return {
				mult = lenient_bignum(card.ability.extra.mult),
				extra = {
					Xmult = lenient_bignum(card.ability.extra.Xmult)
				},
				card = card
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker", "Glitchkat10" },
		code = { "Rainstar" }
	}
}
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
	key = "bulgoe_bot",
	name = "Bulgoe Bot",
	config = { extra = { mult = 27, chips = 27, odds = 27 } },
	rarity = "crp_abysmal",
	atlas = "crp_joker",
	pos = { x = 4, y = 6 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.mult),
				lenient_bignum(card.ability.extra.chips),
				cry_prob(
					card.ability.cry_prob,
					card.ability.extra.odds,
					card.ability.cry_rigged
				),
				card.ability.extra.odds,
			}
		}
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "÷" .. lenient_bignum(card.ability.extra.chips) .. " Chips",
				Xchip_mod = 1 / lenient_bignum(card.ability.extra.chips),
				colour = G.C.CHIPS,
				extra = {
					message = "÷" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
					Xmult_mod = 1 / lenient_bignum(card.ability.extra.mult),
					colour = G.C.MULT,
				},
			}
		end
		if (context.setting_blind and pseudorandom("crp_bulgoe_bot") < cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged) / card.ability.extra.odds) or context.forcetrigger then
			for i = 1, #G.jokers.cards do
				if not G.jokers.cards[i] == card and not G.jokers.cards[i].ability.eternal then
					G.jokers.cards[i]:start_dissolve()
					G.jokers.cards[i]:remove_from_deck()
				end
			end
		end
		if (context.setting_blind or context.forcetrigger) and pseudorandom("crp_bulgoe_bot_remove") < 1 / 27 then
			card:start_dissolve()
			card:remove_from_deck()
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		code = { "wilfredlam0418" },
	}
}
      

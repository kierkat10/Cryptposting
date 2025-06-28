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
	key = "progressive",
	name = "Progressive Joker",
	config = {
		extra = {
			mult = 1,
			Xmult = 1,
		}
	},
	rarity = "cry_epic",
	atlas = "crp_placeholder",
	pos = { x = 5, y = 0 },
	cost = 15,
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
				mult_mod = lenient_bignum(card.ability.extra.mult),
				Xmult_mod = lenient_bignum(card.ability.extra.Xmult),
				message = "Progressum!",
				colour = G.C.MULT,
				card = card
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker", "Glitchkat10" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "bulgoes_hiking_journey",
	name = "Bulgoe's Hiking Journey",
	config = { extra = { perma_x_chips = 0.27 } },
	rarity = "cry_epic",
	atlas =  "crp_joker",
	blueprint_compat = true,
	demicoloncompat = false,
	pos = { x = 0, y = 7 },
	cost = 13,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.perma_x_chips) } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_x_chips = lenient_bignum(context.other_card.ability.perma_x_chips) or 0
            context.other_card.ability.perma_x_chips = lenient_bignum(context.other_card.ability.perma_x_chips) + lenient_bignum(card.ability.extra.perma_x_chips)
            return {
                extra = { message = localize("k_upgrade_ex"), colour = G.C.CHIPS },
                card = card
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "Glitchkat10" },
		code = { "Poker The Poker" },
	}
}

SMODS.Joker {
	key = "10000_coins",
	name = "10,000 Coins Falling on You",
	config = { extra = { money = 10000 } },
	rarity = "cry_epic",
	atlas = "crp_placeholder",
	pos = { x = 5, y = 0 },
	cost = 20,
	blueprint_compat = false,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.money) } }
	end,
	calculate = function(self, card, context)
		if (context.selling_self) or context.forcetrigger then
			if pseudorandom("crp_10000_coins") > 0.5 then
				ease_dollars(lenient_bignum(card.ability.extra.money))
				return { message = "$" .. number_format(lenient_bignum(card.ability.extra.money)), colour = G.C.MONEY }
			else
				for i = 1, #G.jokers.cards do
					G.jokers.cards[i]:start_dissolve()
					G.jokers.cards[i]:remove_from_deck()
				end
			end
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker", "Glitchkat10" },
		code = { "wilfredlam0418" },
	}
}
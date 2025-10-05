
SMODS.Joker {
	key = "q",
	name = "q",
	config = { extra = { eqmult = 1200, eqmult_mod = 1200 } },
	rarity = "cry_epic",
	atlas = "crp_placeholder",
	pos = { x = 5, y = 0 },
	cost = 12,
	blueprint_compat = false,
	demicoloncompat = false,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_zany
		return { vars = { lenient_bignum(card.ability.extra.eqmult), lenient_bignum(card.ability.extra.eqmult_mod) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				xmult = 0,
				extra = {
					mult_mod = lenient_bignum(card.ability.extra.eqmult),
					message = "=" .. card.ability.extra.eqmult .. " Mult",
					colour = G.C.MULT,
				}
			}
		end
		if context.selling_card then
			if (context.card.config.center.key == "j_zany" or (context.card.edition and context.card.edition.crp_zany == true)) or context.forcetrigger then
				card.ability.extra.eqmult = card.ability.extra.eqmult + card.ability.extra.eqmult_mod
				return {
					message = "Upgraded!",
				}
			end
		end
	end,
	crp_credits = {
		idea = { "superb_thing" },
		code = { "Rainstar" },
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
	pools = { Bulgoe = true },
	pronouns = "bulgoe",
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.perma_x_chips) } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_x_chips = lenient_bignum(context.other_card.ability.perma_x_chips) or 0
            context.other_card.ability.perma_x_chips = lenient_bignum(context.other_card.ability.perma_x_chips) + lenient_bignum(card.ability.extra.perma_x_chips)
            return {
                extra = { message = localize("k_upgrade_ex"), colour = G.C.CHIPS },
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
	cost = 15,
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

SMODS.Joker {
	key = "coughing_baby_vs_hydrogen_bomb",
	name = "Coughing Baby vs. Hydrogen Bomb",
	config = { extra = { eemult = 2 } },
	rarity = "cry_epic",
	atlas = "crp_joker2",
	pos = { x = 2, y = 0 },
	cost = 14,
	blueprint_compat = false,
	demicoloncompat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.eemult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main and G.GAME.blind.config.blind.key == "bl_small") or context.forcetrigger then
			return {
				eemult = lenient_bignum(card.ability.extra.eemult),
				eemult_message = {
					message = "^^" .. number_format(lenient_bignum(card.ability.extra.eemult)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_eemult"
				}
			}
		end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		code = { "wilfredlam0418", "Glitchkat10" },
	}
}

SMODS.Joker {
	key = "how_many_pickles",
	name = "How Many Pickles?",
	config = { extra = { mult = 9 } },
	rarity = "cry_epic",
	atlas = "crp_placeholder",
	pos = { x = 5, y = 0 },
	cost = 20,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult), card.ability.extra.mult < 910 and " The ghost is not yet done writing..." or "" } }
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			return {
				mult = lenient_bignum(card.ability.extra.mult)
			}
		end
		if ((context.end_of_round and G.GAME.blind.boss) or context.forcetrigger) and card.ability.extra.mult < 910 then
			if card.ability.extra.mult >= 91 then
				card.ability.extra.mult = 910
			else
				card.ability.extra.mult = 91
			end
		end
	end,
	crp_credits = {
		idea = { "ottermatter", "Glitchkat10" },
		code = { "wilfredlam0418" },
	}
}

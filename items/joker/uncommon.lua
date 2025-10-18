SMODS.Joker {
	key = "vermillion",
	name = "Vermillion Joker",
	pos = { x = 0, y = 6 },
	config = { extra = { xmult = 3 } },
	rarity = 2,
	cost = 6,
	atlas = "crp_joker",
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
		return { vars = { lenient_bignum(card.ability.extra.xmult) } }
	end,
	add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			eligible_cards = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal then
					eligible_cards[#eligible_cards+1] = G.jokers.cards[i]
				end
			end
			if #eligible_cards > 0 then
				option = pseudorandom_element(eligible_cards, pseudoseed("crp_vermillion"))
			end
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == option then idx = i end
			end
			if idx and G.jokers.cards[idx] then
				G.jokers.cards[idx]:start_dissolve()
				G.jokers.cards[idx]:remove_from_deck()
				SMODS.add_card({key = "j_joker"})
			end
			option = nil
		end
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				xmult = lenient_bignum(card.ability.extra.xmult)
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "missingnumber" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "q_big",
	name = "Q",
	rarity = 2,
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		info_queue[#info_queue + 1] = G.P_CENTERS.j_zany
		return { vars = {  } }
	end,
	calculate = function(self, card, context)
		if (context.setting_blind and context.blind.boss) or context.forcetrigger then
			SMODS.add_card({ key = "j_zany", edition = "e_negative" })
		end
	end,
	crp_credits = {
		idea = { "superb_thing" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "money_card",
	name = "Money Card",
	config = { extra = { xmoney = 1.1 } },
	rarity = 2,
	atlas = "crp_joker",
	pos = { x = 5, y = 1 },
	cost = 6,
	blueprint_compat = false,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.xmoney) } }
	end,
	calculate = function(self, card, context)
		if context.forcetrigger then
			ease_dollars(math.floor(lenient_bignum(G.GAME.dollars) * (lenient_bignum(card.ability.extra.xmoney)) - 1))
			return {
				message = "$" .. number_format(lenient_bignum(card.ability.extra.xmoney)),
				colour = G.C.MONEY
			}
		end
	end,
	calc_dollar_bonus = function(self, card)
		return math.floor(lenient_bignum(G.GAME.dollars) * (lenient_bignum(card.ability.extra.xmoney) - 1))
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "water_bottle",
	name = "Water Bottle",
	config = { extra = { splash = 5 }, immutable = { max_spawn = 100 } },
	rarity = 2,
	atlas = "crp_joker",
	pos = { x = 1, y = 4 },
	cost = 4,
	eternal_compat = false,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_splash
		return { vars = { lenient_bignum(math.min(lenient_bignum(card.ability.extra.splash), lenient_bignum(card.ability.immutable.max_spawn))) } }
	end,
	calculate = function(self, card, context)
		if (context.selling_self) or context.forcetrigger then
			for i = 1, math.ceil(lenient_bignum(math.min(lenient_bignum(card.ability.extra.splash), lenient_bignum(card.ability.immutable.max_spawn)))) do
				local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_splash")
				card:add_to_deck()
				G.jokers:emplace(card)
			end
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "Tatteredlurker" },
		code = { "Anonymous", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "gamblecore",
	name = "Gamblecore",
	config = { immutable = { numerator = 1, denominator = 255, mult = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368 } },
	rarity = 2,
	atlas = "crp_joker",
	pos = { x = 9, y = 0 },
	cost = 5,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.immutable.numerator, card.ability.immutable.denominator, card.ability.immutable.mult } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if to_big(pseudorandom("gamblecore")) <= to_big(lenient_bignum(card.ability.immutable.numerator) / lenient_bignum(card.ability.immutable.denominator)) or context.forcetrigger then
				return {
					message = "+nane0 Mult",
					mult_mod = 1.79769e308,
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "GudUsername", "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "waldo",
	name = "Waldo",
	config = { extra = { mult = 10 } },
	rarity = 2,
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
	cost = 5,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				mult = lenient_bignum(card.ability.extra.mult),
			}
		end
	end,
	crp_credits = {
		idea = { "aqrlr" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "eye_for_an_eye",
	name = "E(ye) for an E(ye)",
	config = { extra = { chips = 10, xmult = 10 } }
	rarity = 2,
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
	cost = 5,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "÷" .. lenient_bignum(card.ability.extra.chips) .. " Chips",
				Xchip_mod = 1 / lenient_bignum(card.ability.extra.chips),
				colour = G.C.CHIPS,
				extra = {
					message = "X" .. lenient_bignum(card.ability.extra.xmult) .. " Mult",
					Xmult_mod = 1 / lenient_bignum(card.ability.extra.xmult),
					colour = G.C.MULT,
				},
			}
		end
	end,
	crp_credits = {
		idea = { "SageSeraph" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "tag_hoarder",
	name = "Tag Hoarder",
	rarity = 2,
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
	cost = 6,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			local bonus = 0
			for i = 1, #G.GAME.tags do
				bonus = bonus + (2^(G.GAME.tags[i].ability.level-1) or 1)
			end
			return {
				chips = lenient_bignum(bonus),
				mult = lenient_bignum(bonus),
			}
		end
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "ancient_debris",
	name = "Ancient Debris",
	config = { extra = { hasstone = 0, payout = 1, increase = 0.5 } },
	rarity = 2,
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
	cost = 6,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
		return { vars = { lenient_bignum(card.ability.extra.payout), lenient_bignum(card.ability.extra.increase) } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.blueprint then -- apply hasstone = 1
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                card.ability.extra.hasstone = 1
            end
        end
		if context.after then -- payout increase
            if card.ability.extra.hasstone == 1 then
                card.ability.extra.payout = lenient_bignum(card.ability.extra.payout) + lenient_bignum(card.ability.extra.increase)
				card.ability.extra.hasstone = 0
            end
        end
	end,
	calc_dollar_bonus = function(self, card)
		return lenient_bignum(card.ability.extra.payout) -- actual payout
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "loss",
	name = "Loss",
	config = { extra = { money = 1, mult = 2, hand_size = 2, chips = 50 } },
	rarity = 2,
	atlas = "crp_joker2",
	pos = { x = 0, y = 0 },
	cost = 7,
	pools = { Meme = true },
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		local vars = Cryptid.safe_get(center, "edition", "cry_oversat") and 
			{ "II", "IV", "IV", "C" } or 
			{ "I", "II", "II", "L" }
		return { vars = vars }
	end,
	add_to_deck = function(self, card, from_debuff)
		G.hand.config.card_limit = G.hand.config.card_limit + lenient_bignum(card.ability.extra.hand_size)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.hand.config.card_limit = G.hand.config.card_limit - lenient_bignum(card.ability.extra.hand_size)
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			ease_dollars(lenient_bignum(card.ability.extra.money))
			return {
				mult = lenient_bignum(card.ability.extra.mult),
				chips = lenient_bignum(card.ability.extra.chips)
			}
		end
	end,
	crp_credits = {
		idea = { "wilfredlam0418" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "fun_coin",
	name = "fun coin",
	config = { extra = { gain = 4, loss = 3, xmult = 2 } },
	rarity = 2,
	atlas = "crp_fun_coin",
	pos = { x = 0, y = 0 },
	display_size = { w = 1 * 71, h = 0.75 * 95 },
	cost = 7,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.gain), lenient_bignum(card.ability.extra.loss), lenient_bignum(card.ability.extra.xmult) } }
	end,
	calculate = function(self, card, context)
		if context.before or context.forcetrigger then
			ease_dollars(card.ability.extra.gain and pseudorandom("crp_fun_coin") > 0.5 or -card.ability.extra.loss)
		end
		if (context.joker_main and G.GAME.dollars < 0) or context.forcetrigger then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		art = { "PurplePickle" },
		code = { "wilfredlam0418", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "gomble",
	name = "Gomble",
	rarity = 2,
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
	blueprint_compat = true,
	demicoloncompat = true,
	cost = 8,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_goblin
		return { vars = {  } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main and pseudorandom("crp_gomble") < 0.5) or context.forcetrigger then
			SMODS.add_card({ key = "crp_goblin" })
			return {
				message = "Created!",
				colour = G.C.FILTER
			}
		end
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "issue_with_copper",
	name = "The Issue with Copper",
	config = { extra = { state = 1, mult = 15, xmult = 3 } },
	rarity = 2,
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
	blueprint_compat = true,
	demicoloncompat = true,
	pools = { Meme = true },
	cost = 6,
	loc_vars = function(self, info_queue, card)
		return {
			card.ability.extra.mult,
			card.ability.extra.xmult,
			colours = {
				G.C.RED and card.ability.extra.state == 1 or G.C.UI.TEXT_INACTIVE,
				G.C.RED and card.ability.extra.state == 2 or G.C.UI.TEXT_INACTIVE,
				G.C.RED and card.ability.extra.state == 3 or G.C.UI.TEXT_INACTIVE,
				G.C.RED and card.ability.extra.state == 4 or G.C.UI.TEXT_INACTIVE,
				G.C.RED and card.ability.extra.state == 5 or G.C.UI.TEXT_INACTIVE,
				G.C.RED and card.ability.extra.state == 6 or G.C.UI.TEXT_INACTIVE,
				G.C.RED and card.ability.extra.state == 7 or G.C.UI.TEXT_INACTIVE
			}
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			if card.ability.extra.state <= 3 then
				return { mult = card.ability.extra.mult }
			elseif card.ability.extra.state == 7 then
				return { xmult = card.ability.extra.xmult }
			end
		end

		if (context.end_of_round and not context.game_over and context.main_eval and not context.blueprint) or context.forcetrigger then
			card.ability.extra.state = card.ability.extra.state + 1
			return {
				message = "Next state!",
				colour = G.C.FILTER
			}
		end
	end,
	crp_credits = {
		idea = { "wilfredlam0418" },
		code = { "wilfredlam0418" }
	}
}

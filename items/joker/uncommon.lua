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

-- commented out due to the current effect being graveyarded
--[[ SMODS.Joker {
	key = "dead_joker",
	config = { immutable = { mult = 107 } },
	rarity = 2,
	atlas = "crp_joker",
	pos = { x = 6, y = 0 },
	cost = 7,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.immutable.mult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				mult = card.ability.immutable.mult
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "GudUsername" },
		code = { "Glitchkat10" }
	}
}
]]--

SMODS.Joker {
	key = "vermillion",
	name = "Vermillion Joker",
	pos = { x = 0, y = 6 },
	config = { extra = { Xmult = 3 } },
	rarity = 2,
	cost = 6,
	atlas = "crp_joker",
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.Xmult) } }
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
				Xmult = lenient_bignum(card.ability.extra.Xmult)
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "missingnumber" },
		code = { "wilfredlam0418" }
	}
}

SMOS.Joker {
	key = "q_big",
	name = "Q",
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 8
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function()
		if (context.setting_blind and context.blind.boss) or context.forcetrigger then
			SMODS.add_card({ key = "j_zany", edition = "e_negative" })
		end
	end,
	crp_credits = {
		idea = { "Superb_thing" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "money_card",
	name = "Money Card",
	config = { extra = { Xmoney = 1.1 } },
	rarity = 2,
	atlas = "crp_joker",
	pos = { x = 5, y = 1 },
	cost = 6,
	blueprint_compat = false,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.Xmoney) } }
	end,
	calculate = function(self, card, context)
		if context.forcetrigger then
			ease_dollars(math.floor(lenient_bignum(G.GAME.dollars) * (lenient_bignum(card.ability.extra.Xmoney)) - 1))
			return {
				message = "$" .. number_format(lenient_bignum(card.ability.extra.Xmoney)),
				colour = G.C.MONEY
			}
		end
	end,
	calc_dollar_bonus = function(self, card)
		return math.floor(lenient_bignum(G.GAME.dollars) * (lenient_bignum(card.ability.extra.Xmoney) - 1))
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
	cost = 6,
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
		code = { "Lexi", "Glitchkat10" }
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
					card = card
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
	key = "loss",
	name = "Loss",
	config = { extra = { money = 1, mult = 2, hand_size = 2, chips = 50 } },
	rarity = 2,
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
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
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
	cost = 7,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.gain, card.ability.extra.loss, card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.before or context.forcetrigger then
			ease_dollars(card.ability.gain and pseudorandom("crp_fun_coin") > 0.5 or -card.ability.loss)
		end
		if (context.joker_main and G.GAME.dollars < 0) or context.forcetrigger then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		code = { "wilfredlam0418" }
	}
}

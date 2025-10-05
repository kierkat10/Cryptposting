SMODS.Joker {
	key = "sigma-man",
	name = "Sigma-Man",
	pos = { x = 7, y = 4 },
	pools = { ["Meme"] = true },
	rarity = "crp_cipe",
	cost = 15,
	perishable_compat = true,
	atlas = "crp_joker",
	calculate = function(self, card, context)
		if
			context.selling_card
			and context.card.ability.name == "cry-Chad"
			and not context.retrigger_joker
			and not context.blueprint
		then
			return {}
		elseif
			(
				(
				context.selling_self
				or context.discard
				or context.before
				or context.reroll_shop
				or context.buying_card
				or context.skip_blind
				or context.using_consumeable
				or context.selling_card
				or context.setting_blind
				or context.skipping_booster
				or context.open_booster
				or context.forcetrigger
				)
				and 1 / 4 <= pseudorandom("sigma-man")
			)
			and #G.jokers.cards + G.GAME.joker_buffer < (context.selling_self and (G.jokers.config.card_limit + 1) or G.jokers.config.card_limit)
			and not context.retrigger_joker
			and not context.blueprint
		then
			local createjoker = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
				G.GAME.joker_buffer = G.GAME.joker_buffer + createjoker
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_chad")
			card:add_to_deck()
			G.jokers:emplace(card)
			G.GAME.joker_buffer = 0
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if not from_debuff then
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_cry_chad")
			card:set_edition("e_negative", true, nil, true)
			card.ability.cry_absolute = true
			card:add_to_deck()
			G.jokers:emplace(card)
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Anonymous" },
		code = { "Anonymous" },
		custom = { key = "alt",text = "Sob" }
	},
}

SMODS.Joker {
	key = "amazon_gift_card",
	name = "Amazon Gift Card",
	config = { extra = { emult = 7, odds = 16 } },
	rarity = "crp_cipe",
	atlas = "crp_joker2",
	pos = { x = 1, y = 0 },
	cost = 10,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		local prob = cry_prob(lenient_bignum(card.ability.cry_prob), lenient_bignum(card.ability.extra.odds), card.ability.cry_rigged)
		return {
			vars = {
				card.ability.cry_rigged and lenient_bignum(card.ability.extra.odds) or lenient_bignum(card.ability.extra.odds) - prob,
				lenient_bignum(card.ability.extra.odds),
				lenient_bignum(card.ability.extra.emult)
			}
		}
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if (pseudorandom("amazon_gift_card") < cry_prob(lenient_bignum(card.ability.cry_prob), lenient_bignum(card.ability.extra.odds), card.ability.cry_rigged) / lenient_bignum(card.ability.extra.odds)) or context.forcetrigger then
				return {
					emult = lenient_bignum(card.ability.extra.emult),
					emult_message = {
						message = "^" .. lenient_bignum(card.ability.extra.emult) .. " Mult",
						colour = G.C.DARK_EDITION,
						sound = "talisman_emult"
					}
				}
			end
		end
	end,
	crp_credits = {
		idea = { "SolvLyi" },
		art = { "Grahkon" },
		code = { "Glitchkat10" },
		custom = { key = "alt",text = "Googol Play Card" }
	}
}
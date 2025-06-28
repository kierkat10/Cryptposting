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

-- man.............. - rainstar
SMODS.Joker {
	key = "scones_bones",
	name = "Scones, Bones, Skibidi Scones",
	config = { extra = { death_prevention_enabled = true, score_percentage = 50, xchips = 3, xchips_mod = 0.01, stones = 2 } },
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.death_prevention_enabled, card.ability.extra.score_percentage, card.ability.extra.xchips, card.ability.extra.xchips_mod, card.ability.extra.stones } }
	end,
	calculate = function(self, card, context)
		-- ill be honest i just stole like most of the things here from cryptid lmao
		if context.game_over and to_big(G.GAME.chips / G.GAME.blind.chips) <= to_big(card.ability.extra.score_percentage / 100) and card.ability.extra.death_prevention_enabled == true then
			G.E_MANAGER:add_event(Event({
				func = function()
					G.hand_text_area.blind_chips:juice_up()
					G.hand_text_area.game_chips:juice_up()
					play_sound("tarot1")
					return true
				end,
			}))
		card.ability.extra.death_prevention_enabled = false
		return {
			message = localize("k_saved_ex"),
			saved = true,
			colour = G.C.RED,
		}
		end
		if context.selling_self then
			card.ability.extra.death_prevention_enabled = false
		end
		if (context.joker_main) or context.forcetrigger then
			return {
				card = card,
				Xchip_mod = lenient_bignum(card.ability.extra.xchips),
				message = "X" .. number_format(card.ability.extra.xchips),
				colour = G.C.CHIPS,
			}
		end
		if context.before and next(context.poker_hands["Flush"]) or context.forcetrigger then
			local stone_cards = lenient_bignum(card.ability.extra.stones)
        	G.E_MANAGER:add_event(Event({
        	    trigger = 'after',
        	    delay = 0.7,
        	    func = function() 
        	        local cards = {}
        	        for i=1, stone_cards do
        	            cards[i] = true
        	            local _suit, _rank = nil, nil
        	            _rank = pseudorandom_element({'A', 'K', 'Q', 'J', 'T','9','8','7','6','5','4','3','2'}, pseudoseed('stones'))
        	            _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('stones'))
        	            _suit = _suit or 'S'; _rank = _rank or 'T'
        	            local cen_pool = {}
        	            for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
        	                if v.key == 'm_stone' then 
        	                    cen_pool[#cen_pool+1] = v
        	                end
        	            end
        	            create_playing_card({front = G.P_CARDS[_suit..'_'.._rank], center = pseudorandom_element(cen_pool, pseudoseed('stones'))}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
        	        end
        	        playing_card_joker_effects(cards)
        	        return true end }))
		end
		if context.cry_press then
			if to_big(card.ability.extra.xchips) <= to_big(1) then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_eaten_ex"), colour = G.C.CHIPS }
				)
			else
				card.ability.extra.xchips =
					lenient_bignum(to_big(card.ability.extra.xchips) - card.ability.extra.xchips_mod)
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
					{ message = "-X" .. number_format(card.ability.extra.xchips_mod) .. "Chips", colour = G.C.CHIPS }
				)
			end
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "millipede",
	name = "Millipede",
	config = { extra = { chips = 1000, full_hand = 1 } },
	rarity = 3,
	atlas = "crp_joker",
	pos = { x = 6, y = 2 },
	cost = 10,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips), lenient_bignum(card.ability.extra.full_hand) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main and context.full_hand and #context.full_hand == lenient_bignum(card.ability.extra.full_hand)) or context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chips)
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "Tatteredlurker" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "pi_joker",
	name = "Pi Joker",
	config = { extra = {  } },
	rarity = 3,
	atlas = "crp_joker",
	pos = { x = 1, y = 3 },
	cost = 10,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = localize({
					type = "variable",
					key = "a_xchips",
					vars = { math.pi },
				}),
				Xchip_mod = math.pi,
				colour = G.C.CHIPS,
				extra = {
					Xmult = math.pi
				}
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "12345",
	name = "12345",
	config = { extra = { jokerslots = 1, consumeableslots = 2, money = 3, mult = 4, chips = 5 } },
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 10,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.jokerslots,
				card.ability.extra.consumeableslots,
				card.ability.extra.money,
				card.ability.extra.mult,
				card.ability.extra.chips
			}
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + lenient_bignum(card.ability.extra.jokerslots)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + lenient_bignum(card.ability.extra.consumeableslots)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - lenient_bignum(card.ability.extra.jokerslots)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - lenient_bignum(card.ability.extra.consumeableslots)
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chips),
				mult = lenient_bignum(card.ability.extra.mult)
			}
		end
	end,
	calc_dollar_bonus = function(self, card)
		return lenient_bignum(card.ability.extra.money)
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" },
	}
}

SMODS.Joker {
	key = "playerrkillerr",
	name = "playerKillerr",
	config = { immutable = { mult = 284 } },
	rarity = 3,
	atlas = "crp_joker",
	pos = { x = 4, y = 1 },
	cost = 9,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_black_hole
		info_queue[#info_queue + 1] = G.P_CENTERS.p_arcana_normal_1
		info_queue[#info_queue + 1] = G.P_CENTERS.p_celestial_normal_1
		info_queue[#info_queue + 1] = G.P_CENTERS.p_spectral_normal_1
		return { vars = { "{", "}" } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				mult = card.ability.immutable.mult
			}
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "MarioFan597" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "two_for_some",
	name = "Two for Some",
	config = { extra = { hand_size = 2, consumeableslots = 2, boosterpackslots = 2 } },
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 8,
	blueprint_compat = false,
	demicoloncompat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.hand_size, card.ability.extra.consumeableslots, card.ability.extra.boosterpackslots } }
	end,
	add_to_deck = function(self, card, from_debuff)
		SMODS.change_booster_limit(card.ability.extra.boosterpackslots)
		G.hand:change_size(card.ability.extra.hand_size)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consumeableslots
	end,
	remove_from_deck = function(self, card, from_debuff)
		SMODS.change_booster_limit(-card.ability.extra.boosterpackslots)
		G.hand:change_size(-card.ability.extra.hand_size)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.consumeableslots
	end,
	crp_credits = {
		idea = { "aqrlr" },
		code = { "ScarredOut" }
	}
}

SMODS.Joker {
	key = "dumpster_diver",
	name = "Dumpster Diver",
	config = { extra = { create = 2, rare_create = 1, odds = 20 } },
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.create), cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged), card.ability.extra.odds, lenient_bignum(card.ability.extra.rare_create) } }
	end,
	calculate = function(self, card, context)
		if (context.end_of_round and not context.individual and not context.repetition) or context.forcetrigger then
			local odds = card.ability.extra.odds or 20
			local create = lenient_bignum(card.ability.extra.create)
			local rare_create = lenient_bignum(card.ability.extra.rare_create)
			local roll = pseudorandom("crp_dumpster_diver")
			local chance = cry_prob(card.ability.cry_prob, odds, card.ability.cry_rigged) / odds
			if roll < chance or context.forcetrigger then
				G.GAME.joker_buffer = G.GAME.joker_buffer + rare_create
				for i = 1, rare_create do
					local rare = create_card("Joker", G.jokers, nil, 3, nil, nil, nil, "crp_dumpster_diver")
					rare:set_edition({ negative = true })
					rare:add_to_deck()
					G.jokers:emplace(rare)
					rare:start_materialize()
				end
				return {
					message = "+" .. lenient_bignum(card.ability.extra.rare_create) .. " Rare Joker",
					colour = G.C.RARITY[3],
				}
			else
				G.GAME.joker_buffer = G.GAME.joker_buffer + create
				for i = 1, create do
					local trash = create_card("Joker", G.jokers, nil, "crp_trash", nil, nil, nil, "crp_dumpster_diver")
					trash:set_edition({ negative = true })
					trash:add_to_deck()
					G.jokers:emplace(trash)
					trash:start_materialize()
				end
				return {
					message = "+" .. lenient_bignum(card.ability.extra.create) .. " Trash Jokers",
					colour = HEX("606060"),
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "low-fat_milk",
	name = "Low-Fat Milk",
	config = { extra = { mult = 1024 } },
	rarity = 3,
	atlas = "crp_joker",
	pos = { x = 9, y = 3 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				mult = lenient_bignum(card.ability.extra.mult),
			}
		end
		if (context.end_of_round and not context.individual and not context.repetition and not context.blueprint) or context.forcetrigger then
			card.ability.extra.mult = lenient_bignum(card.ability.extra.mult) / 2
			if lenient_bignum(card.ability.extra.mult) <= 8 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return {
					message = localize("k_drank_ex"),
					colour = G.C.FILTER,
				}
			end
		end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		art = { "PurplePickle", "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "normalgoe",
	name = "Normalgoe",
	config = { extra = { Xmult = 2.7 } },
	rarity = 3,
	atlas = "crp_joker",
	pos = { x = 0, y = 4 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.Xmult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				Xmult = lenient_bignum(card.ability.extra.Xmult)
			}
		end
	end,
	crp_credits = {
		idea = { "SageSeraph" },
		art = { "missingnumber" },
		code = { "wilfredlam0418" }
	}
}

--[[
 SMODS.Joker {
	key = "shit",
	name = "Shit",
	config = { extra = { create = 1 } },
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.create) } }
	end,
	calculate = function(self, card, context)
		if (context.end_of_round and not context.individual and not context.repetition) or context.forcetrigger then
			local create = lenient_bignum(card.ability.extra.create)
			G.GAME.joker_buffer = G.GAME.joker_buffer + create
			for i = 1, create do
				local trash = create_card("Joker", G.jokers, nil, "crp_self-insert", nil, nil, nil, "crp_shit")
				trash:set_edition({ negative = true })
				trash:add_to_deck()
				G.jokers:emplace(trash)
				trash:start_materialize()
			end
			return {
				message = "+" .. lenient_bignum(card.ability.extra.create) .. " Self-Insert Joker",
				colour = G.C.RARITY["crp_self-insert"],
			}
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}
--]]

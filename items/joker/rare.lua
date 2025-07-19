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
		return { vars = { card.ability.extra.death_prevention_enabled, lenient_bignum(card.ability.extra.score_percentage), lenient_bignum(card.ability.extra.xchips), lenient_bignum(card.ability.extra.xchips_mod), lenient_bignum(card.ability.extra.stones) } }
	end,
	calculate = function(self, card, context)
		if context.game_over and to_big(G.GAME.chips) / to_big(G.GAME.blind.chips) <= to_big(card.ability.extra.score_percentage) / to_big(100) and card.ability.extra.death_prevention_enabled == true then
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
				xchips = lenient_bignum(card.ability.extra.xchips),
				xchip_message = {
					message = "X" .. number_format(lenient_bignum(card.ability.extra.xchips)) .. " Chips",
					colour = G.C.CHIPS,
					sound = "talisman_xchip"
				},
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
					to_big(card.ability.extra.xchips) - to_big(card.ability.extra.xchips_mod)
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
		if (context.joker_main and context.full_hand and to_big(#context.full_hand) == to_big(card.ability.extra.full_hand)) or context.forcetrigger then
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
	cost = 9,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { colours = { { 0.8, 0.45, 0.85, 1 } } } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "Xpi Chips and Mult",
				sound = "crp_multiplicativechipsmult",
				x_chips = math.pi,
				xmult = math.pi,
				remove_default_message = true,
				colour = { 0.8, 0.45, 0.85, 1 } -- plasma deck colors
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
	key = "c_big",
	name = "C",
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function()
		if context.setting_blind or context.forcetrigger then
			SMODS.add_card({ key = "j_mad", edition = "e_negative" })
		end
	end,
	crp_credits = {
		idea = { "lord.ruby" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker { -- i counted to 5!!!!
	key = "12345",
	name = "12345",
	config = { extra = { jokerslots = 1, consumeableslots = 2, money = 3, mult = 4, chips = 5 } },
	rarity = 3,
	atlas = "crp_joker2",
	pos = { x = 9, y = 0 },
	cost = 10,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.jokerslots),
				lenient_bignum(card.ability.extra.consumeableslots),
				lenient_bignum(card.ability.extra.money),
				lenient_bignum(card.ability.extra.mult),
				lenient_bignum(card.ability.extra.chips)
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
		art = { "Grahkon" },
		code = { "wilfredlam0418" },
	}
}

SMODS.Joker {
	key = "inside_joker", -- goodbye playerkillerr
	name = "Inside Joke r",
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
				mult = lenient_bignum(card.ability.immutable.mult)
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
	key = "slot_guy",
	name = "Joker Slot Guy",
	config = { extra = { mult = 3, xmult = 1 } },
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = false,
	loc_vars = function(self, info_queue, card)
		local joker_count = G.jokers and G.jokers.cards and #G.jokers.cards or 0
		local card_limit = G.jokers and G.jokers.config and G.jokers.config.card_limit or 1
		return { 
			vars = { 
				lenient_bignum(card.ability.extra.mult),
				lenient_bignum(card.ability.extra.xmult),
				lenient_bignum(lenient_bignum(card.ability.extra.mult) * lenient_bignum(joker_count)),
				lenient_bignum(lenient_bignum(card.ability.extra.xmult) * lenient_bignum(math.max(0, card_limit - joker_count)))
			} 
		}
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if #G.jokers.cards >= G.jokers.config.card_limit then
				return {
					mult = lenient_bignum(card.ability.extra.mult) * lenient_bignum(#G.jokers.cards)
				}
			else
				return {
					mult = lenient_bignum(card.ability.extra.mult) * lenient_bignum(#G.jokers.cards),
					extra = {
						xmult = lenient_bignum(card.ability.extra.xmult) * lenient_bignum(G.jokers.config.card_limit - #G.jokers.cards)
					}
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "wilfredlam0418" },
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
		return { vars = { lenient_bignum(card.ability.extra.hand_size), lenient_bignum(card.ability.extra.consumeableslots), lenient_bignum(card.ability.extra.boosterpackslots) } }
	end,
	add_to_deck = function(self, card, from_debuff)
		SMODS.change_booster_limit(lenient_bignum(card.ability.extra.boosterpackslots))
		G.hand:change_size(lenient_bignum(card.ability.extra.hand_size))
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + lenient_bignum(card.ability.extra.consumeableslots)
	end,
	remove_from_deck = function(self, card, from_debuff)
		SMODS.change_booster_limit(-lenient_bignum(card.ability.extra.boosterpackslots))
		G.hand:change_size(-lenient_bignum(card.ability.extra.hand_size))
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - lenient_bignum(card.ability.extra.consumeableslots)
	end,
	crp_credits = {
		idea = { "aqrlr" },
		code = { "ScarredOut" }
	}
}

SMODS.Joker {
	key = "not_discovered",
	name = "Not Discovered",
	config = { extra = { }, discovered = false },
	rarity = 3,
	atlas = "crp_joker",
	pos = { x = 1, y = 2 },
	soul_pos = { x = 2, y = 2 },
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
	cost = 10,
	add_to_deck = function(self, card, from_debuff)
		local key = G.P_CENTER_POOLS.Joker[math.random(0, #G.P_CENTER_POOLS.Joker)].key
		G.E_MANAGER:add_event(Event({func = function()
			local card1 = create_card("Joker", G.jokers, nil, nil, nil, nil, key, "gotta_love_unweighted_possibilities")
			card1:add_to_deck()
			G.jokers:emplace(card1)
			card1:juice_up(0.3, 0.5)
			G.jokers:remove_card(card)
			card:remove()
			card = nil
			return true
		end }))
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		art = { "LocalThunk" },
		code = { "Rainstar" },
	}
}

SMODS.Joker {
	key = "photo_of_grouchy",
	name = "Photo of Grouchy Jimbo",
	config = { extra = { xmult = 30 } },
	rarity = 3,
	atlas = "crp_joker",
	pos = { x = 8, y = 9 },
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.xmult) } }
	end,
	cost = 6,
	calculate = function(self, card, context)
		if (context.cardarea == G.jokers and context.joker_main) or context.forcetrigger then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_crp_grouchy_jimbo" then
					return {
						xmult = card.ability.extra.xmult
					}
				end
			end
		end
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		art = { "BuilderBosc", "Psychomaniac14", "Glitchkat10" },
		code = { "Glitchkat10" },
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
		return { 
			vars = { 
				lenient_bignum(card.ability.extra.create),
				cry_prob(card.ability.cry_prob, lenient_bignum(card.ability.extra.odds), card.ability.cry_rigged),
				card.ability.extra.odds,
				lenient_bignum(card.ability.extra.rare_create) 
			} 
		}
	end,
	calculate = function(self, card, context)
		if (context.end_of_round and context.main_eval and not context.blueprint) or context.forcetrigger then
			if to_big(pseudorandom("crp_dumpster_diver")) < to_big((cry_prob(card.ability.cry_prob, to_big(card.ability.extra.odds), card.ability.cry_rigged) / to_big(card.ability.extra.odds))) or context.forcetrigger then
				G.GAME.joker_buffer = G.GAME.joker_buffer + math.ceil(lenient_bignum(card.ability.extra.rare_create))
				for i = 1, math.ceil(lenient_bignum(card.ability.extra.rare_create)) do
					local rare = create_card("Joker", G.jokers, nil, 3, nil, nil, nil, "crp_dumpster_diver")
					rare:set_edition({ negative = true })
					rare:add_to_deck()
					G.jokers:emplace(rare)
					rare:start_materialize()
				end
				return {
					message = "+" .. number_format(lenient_bignum(card.ability.extra.rare_create)) .. " Rare Joker",
					colour = G.C.RARITY[3],
				}
			else
				G.GAME.joker_buffer = G.GAME.joker_buffer + lenient_bignum(card.ability.extra.create)
				for i = 1, math.ceil(lenient_bignum(card.ability.extra.create)) do
					local trash = create_card("Joker", G.jokers, nil, "crp_trash", nil, nil, nil, "crp_dumpster_diver")
					trash:set_edition({ negative = true })
					trash:add_to_deck()
					G.jokers:emplace(trash)
					trash:start_materialize()
				end
				return {
					message = "+" .. number_format(lenient_bignum(card.ability.extra.create)) .. " Trash Jokers",
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
--[[
SMODS.Joker {
	key = "my_first_joker",
	name = "Hdbceifvf sj kjkhiooh jhiiohiouytc",
	config = { extra = { mult = 70.5, redeemed_vouchers = 0, chip_mod = 49, odds = 9, Xmult = 1.87, randommoney1 = 2.5, randommoney2 = 3 } },
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		local redeemed = card.ability.extra.redeemed_vouchers or 0
		return { 
			vars = { 
				lenient_bignum(card.ability.extra.mult),
				lenient_bignum(card.ability.extra.chip_mod),
				0,
				lenient_bignum(card.ability.extra.randommoney1),
				lenient_bignum(card.ability.extra.randommoney2),

				redeemed,
				redeemed * (card.ability.extra.chip_mod or 0)
			} 
		}
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then -- update redeemed vouchers count
			local redeemed = 0
			for k,v in pairs(G.GAME.used_vouchers or {}) do
				if v == true then
					redeemed = redeemed + 1
				end
			end
			card.ability.extra.redeemed_vouchers = redeemed
		end
		if context.joker_main then
			local chip_bonus = 0
			if card.ability.extra.redeemed_vouchers and card.ability.extra.chip_mod then
				chip_bonus = card.ability.extra.redeemed_vouchers * card.ability.extra.chip_mod
			end
			
			return {
				mult = lenient_bignum(card.ability.extra.mult),
				extra = {
					chips = chip_bonus
				}
			}
		end
		if context.selling_self and not context.blueprint then
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_jolly")
			card:add_to_deck()
			G.jokers:emplace(card)
			local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_gros_michel")
			card:add_to_deck()
			G.jokers:emplace(card)
		end
	end,
	calc_dollar_bonus = function(self, card)
		return math.random(card.ability.extra.randommoney1, card.ability.extra.randommoney2)
	end,
	in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		art = { "ottermatter" },
		code = { "Glitchkat10" }
	}
}
]]--

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
		if (context.end_of_round and context.main_eval and not context.blueprint) or context.forcetrigger then
			card.ability.extra.mult = lenient_bignum(card.ability.extra.mult) / 2
			if to_big(card.ability.extra.mult) <= to_big(8) then
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
	config = { extra = { xmult = 2.7 } },
	rarity = 3,
	atlas = "crp_joker",
	pos = { x = 0, y = 4 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	pools = { Bulgoe = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.xmult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				xmult = lenient_bignum(card.ability.extra.xmult)
			}
		end
	end,
	crp_credits = {
		idea = { "SageSeraph" },
		art = { "missingnumber" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "usain_bolt",
	name = "Usain Bolt",
	config = { extra = { chips = 0, chips_mod = 50000 } },
	rarity = 3,
	atlas = "crp_placeholder",
	pos = { x = 4, y = 0 },
	cost = 10,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips), lenient_bignum(card.ability.extra.chips_mod) } }
	end,
	calculate = function(self, card, context)
		if (context.before) or context.forcetrigger then
			local ids = {  }
			for i = 1, #G.play.cards do
				ids[G.play.cards[i]:get_id()] = (ids[G.play.cards[i]:get_id()] or 0) + 1
			end
			check = true
			for i = 2, 14 do
				if ids[i] ~= 1 then check = false end
			end
			if (#G.play.cards == 13 and check and context.scoring_name == "Straight") or context.forcetrigger then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
			end
		end
		if (context.joker_main) or context.forcetrigger then
			return {
				chips = card.ability.extra.chips
			}
		end
	end,
	crp_credits = {
		idea = { "SageSeraph" },
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
		if (context.end_of_round and context.main_eval) or context.forcetrigger then
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
]]--

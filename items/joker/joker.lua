SMODS.Joker {
	key = "joker_2",
	name = "Joker 2",
	config = { extra = { chips = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 7, y = 0 },
	cost = 1,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chips)
			}
		end
	end,
	crp_credits = {
		idea = { "borb43" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "joker_3",
	name = "Joker 3",
	config = { extra = { xmult = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 8, y = 0 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
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
		idea = { "Poker The Poker" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "joker_4",
	name = "Joker 4",
	config = { extra = { emult = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 0, y = 1 },
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.emult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				emult = lenient_bignum(card.ability.extra.emult),
				emult_message = {
					message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = 'talisman_emult'
				}
			}
		end
	end,
	crp_credits = {
		idea = { "borb43" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "joker_5",
	name = "Joker 5",
	config = { extra = { eemult = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 3, y = 2 },
	cost = (4^4)/(math.sqrt(4)),
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.eemult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
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
		idea = { "Poker The Poker" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "joker_6",
	name = "Joker 6",
	config = { extra = { money = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 6, y = 1 },
	cost = 9,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.money) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			ease_dollars(lenient_bignum(card.ability.extra.money))
			return { message = "$" .. number_format(lenient_bignum(card.ability.extra.money)), colour = G.C.MONEY }
		end
	end,
	crp_credits = {
		idea = { "borb43" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "joker_7",
	name = "Joker 7",
	config = { extra = { create = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 7, y = 1 },
	cost = 16,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.create) } }
	end,
	calculate = function(self, card, context)
		local tarots_to_create = lenient_bignum(card.ability.extra.create)
      		G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + tarots_to_create
		for i = 1, tarots_to_create do
			if (context.joker_main) or context.forcetrigger then
        		local card_type = "Tarot"
        		G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        		G.E_MANAGER:add_event(Event({
          			trigger = "before",
         			delay = 0.0,
          			func = (function()
              			local n_card = create_card(card_type,G.consumeables, nil, nil, nil, nil, nil, "jk7")
              			n_card:add_to_deck()
              			G.consumeables:emplace(n_card)
              			G.GAME.consumeable_buffer = 0
           			return true
          			end)}))
			end
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "joker_8",
	name = "Joker 8",
	config = { extra = { xchips = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 0, y = 3 },
	cost = 10,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.xchips) } }
	end,
	calculate = function(self, card, context)
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
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "joker_9",
	name = "Joker 9",
	config = { extra = { level_ups = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 7, y = 3 },
	cost = 10,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.level_ups) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
            return {
                card = self,
                level_up = lenient_bignum(card.ability.extra.level_ups),
                message = localize('k_level_up_ex')
            }
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "joker?",
	name = "Joker?",
	config = { extra = { mult = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 5, y = 4 },
	cost = 4.4,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if
				next(SMODS.find_card("j_joker"))
				and next(SMODS.find_card("j_crp_joker_2"))
				and next(SMODS.find_card("j_crp_joker_3"))
				and next(SMODS.find_card("j_crp_joker_4"))
				and next(SMODS.find_card("j_crp_joker_5"))
				and next(SMODS.find_card("j_crp_joker_6"))
				and next(SMODS.find_card("j_crp_joker_7"))
				and next(SMODS.find_card("j_crp_joker_8"))
				and next(SMODS.find_card("j_crp_joker_9"))
				and next(SMODS.find_card("j_crp_joker_0")) 
			then
				return {
					hypermult_mod = {
						4,
						lenient_bignum(card.ability.extra.mult)
					},
					hypermult_message = {
						message = "{4}" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
						colour = G.C.EDITION,
						sound = "talisman_emult"
					}
				}
			else
				return {
					mult = lenient_bignum(card.ability.extra.mult)
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Unknown", "Glitchkat10" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "joker_0",
	name = "Joker 0",
	config = { extra = { create = 4 } },
	rarity = "crp_joker",
	atlas = "crp_joker",
	pos = { x = 8, y = 4 },
	cost = 9,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_joker
		return { vars = { lenient_bignum(card.ability.extra.create) } }
	end,
	calculate = function(self, card, context)
		local jokers_to_create = lenient_bignum(card.ability.extra.create)
      	G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
		for i = 1, math.ceil(jokers_to_create) do
			if (context.joker_main) or context.forcetrigger then
				local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_joker")
				card:add_to_deck()
				card:start_materialize()
				G.jokers:emplace(card)
			end
		end
	end,
	crp_credits = {
		idea = { "lord.ruby" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}
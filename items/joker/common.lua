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
	key = "bulgoe",
	name = "Bulgoe",
	config = { extra = { chips = 2.7 } },
	rarity = 1,
	atlas =  "crp_joker",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 0, y = 0 },
	cost = 1,
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
		idea = { "Poker The Poker" },
		art = { "Poker The Poker" },
		code = { "Glitchkat10" },
		custom = { key = "everything",text = "Bulgoe" }
	}
}

SMODS.Joker {
	key = "pillaring",
	name = "Pillaring Joker",
	pos = { x = 2, y = 0 },
	config = { extra = { mult = 4 } },
	rarity = 1,
	cost = 4,
	atlas = "crp_placeholders",
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card.ability.played_this_ante then
			return { mult = lenient_bignum(card.ability.extra.mult) }
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "participation_trophy",
	name = "Participation Trophy",
	config = { extra = { mult_mod = 0.1 } },
	rarity = 1,
	atlas = "crp_placeholders",
	pos = { x = 2, y = 0 },
	cost = 3,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult_mod), lenient_bignum(G.PROFILES[G.SETTINGS.profile].career_stats.c_losses * card.ability.extra.mult_mod) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				mult = lenient_bignum( G.PROFILES[G.SETTINGS.profile].career_stats.c_losses * card.ability.extra.mult_mod )
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Sound {
	key = "eat",
	path = "eat.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Joker {
	key = "apple",
	name = "Apple",
	config = { extra = { mult = 1, rounds_remaining = 10 } },
	rarity = 1,
	atlas =  "crp_joker",
	pos = { x = 3, y = 4 },
	cost = 1,
	blueprint_compat = true,
	demicoloncompat = true,
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult), lenient_bignum(card.ability.extra.rounds_remaining) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				mult = lenient_bignum(card.ability.extra.mult)
			}
		end
		if
			(context.end_of_round
			and not context.blueprint
			and not context.individual
			and not context.repetition
			and not context.retrigger_joker)
			or context.forcetrigger
		then
			card.ability.extra.rounds_remaining = lenient_bignum(lenient_bignum(card.ability.extra.rounds_remaining) - 1)
			if
				lenient_bignum(card.ability.extra.rounds_remaining) <= 0
			then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("crp_eat")
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
					message = localize("k_eaten"),
					colour = G.C.FILTER,
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Lexi" },
		code = { "Lexi" }
	}
}

SMODS.Joker {
    key = "purist_jolly",
	name = "Purist Jolly Joker",
    config = { extra = { mult = 16 } },
    rarity = 1,
    atlas = "crp_joker",
    pos = { x = 5, y = 3 },
    cost = 4,
    blueprint_compat = true,
	demicoloncompat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.mult) } }
    end,
    calculate = function(self, card, context)
        if (context.joker_main and context.scoring_name == "Pair") or context.forcetrigger then
            return {
                mult = lenient_bignum(card.ability.extra.mult)
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
	key = "bulgoe_prize",
	name = "Bulgoe Prize",
	config = { extra = { create = 1 } },
	rarity = 1,
	atlas =  "crp_joker",
	pos = { x = 4, y = 4 },
	cost = 3,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.create) } }
	end,
	calculate = function(self, card, context)
		if (context.skipping_booster) or context.forcetrigger then
		    local jokers_to_create = lenient_bignum(card.ability.extra.create)
      	    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
		    for i = 1, jokers_to_create do
				local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_crp_bulgoe")
				card:add_to_deck()
				card:start_materialize()
				G.jokers:emplace(card) 
				card:juice_up(0.3, 0.4)
			end
			return {
				message = localize("k_bulgoe_spawn"),
				colour = G.C.BLUE,
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Lexi" },
		code = { "Lexi", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "bullshit",
	name = "Bullshit",
	config = { extra = { amount = 1 } },
	rarity = 1,
	atlas = "crp_placeholder",
	pos = { x = 2, y = 0 },
	cost = 5,
	blueprint_compat = false,
	demicoloncompat = true,
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.j_bull
		return { vars = { lenient_bignum(card.ability.extra.amount) } }
	end,
	calculate = function(self, card, context)
		if (context.selling_self) or context.forcetrigger then
			for i = 1, lenient_bignum(card.ability.extra.amount) do -- usually amount will be 1, making this joker mutable isn't needed but it's very funny
				-- flip coin essentially to decide which to make
				local tableofcreation = {}
				local pickedside = pseudorandom_element({ 1, 2 }, pseudoseed("advancedchessbattle"))
				if pickedside == 1 then -- bull
					tableofcreation = {
						set = "Joker",
						key = "j_bull"
					}
				else -- trash
					tableofcreation = {
						set = "Joker",
						rarity = "crp_trash"
					}
				end
				SMODS.add_card(tableofcreation) -- make the card (SMODS.add_card my beloved)
			end
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "ScarredOut" }
	}
}

SMODS.Joker {
	key = "skibidi_toilet",
	name = "Skibidi Toilet",
	config = {},
	rarity = 1,
	atlas = "crp_placeholder",
	pos = { x = 2, y = 0 },
	blueprint_compat = true,
	demicoloncompat = true,
	cost = 4,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				mult = lenient_bignum(G.GAME.hands["Flush"].mult),
				chips = lenient_bignum(G.GAME.hands["Flush"].chips),
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Poker The Poker", "Glitchkat10" },
	}
}

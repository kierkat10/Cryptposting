SMODS.Joker {
	key = "low-fqt_milk", -- not a typo (but like originally was but then it was made real for some reason (yeah idk))
	name = "Low-Fqt Milk",
	config = { extra = { chips = 2048 } },
	rarity = "crp_well-done",
	atlas = "crp_joker",
	pos = { x = 9, y = 4 },
	cost = 8,
	blueprint_compat = true,
	demicoloncompat = true,
	eternal_compat = false,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chips),
			}
		end
		if (context.end_of_round and context.main_eval and not context.blueprint) or context.forcetrigger then
			card.ability.extra.chips = lenient_bignum(card.ability.extra.chips) * 0.8
			if to_big(card.ability.extra.chips) <= to_big(512) then
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
			return {
				message = "-" .. (lenient_bignum(card.ability.extra.chips)) .. " Chips",
				colour = G.C.CHIPS
			}
		end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		art = { "PurplePickle", "Glitchkat10" },
		code = { "Glitchkat10" },
		custom = { key = "alt",text = "Low-Fat Milk" }
	}
}
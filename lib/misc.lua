local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
	local ret = oldfunc(change_context)
	-- adds bulgoe to the main menu
	local newcard = Card(
		G.title_top.T.x,
		G.title_top.T.y,
		G.CARD_W,
		G.CARD_H,
		G.P_CARDS.empty,
		G.P_CENTERS.j_crp_bulgoe,
		{ bypass_discovery_center = true }
	)
    newcard:set_edition("e_crp_overloaded")
	-- recenter the title
	G.title_top.T.w = G.title_top.T.w * 1.7675
	G.title_top.T.x = G.title_top.T.x - 0.8
	G.title_top:emplace(newcard)
	-- make the card look the same way as the title screen ace of spades
	newcard.T.w = newcard.T.w * 1.4
	newcard.T.h = newcard.T.h * 1.4
	newcard:set_sprites(newcard.config.center)
	newcard.no_ui = true
	newcard.states.visible = false
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0,
		blockable = false,
		blocking = false,
		func = function()
			if change_context == "splash" then
				newcard.states.visible = true
				newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 2.5)
			else
				newcard.states.visible = true
				newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 1.2)
			end
			return true
		end,
	}))
	return ret
end

Cryptid.mod_whitelist["Cryptposting"] = true

SMODS.Atlas({
	key = "modicon",
	path = "crp_icon.png",
	px = 34,
	py = 34,
})

SMODS.Joker:take_ownership("invisible", {
	loc_vars = function(self, info_queue, card)
		local main_end
		if G.jokers and G.jokers.cards then
			for _, joker in ipairs(G.jokers.cards) do
				if joker.edition and (joker.edition.negative or joker.edition.crp_really_negative or joker.edition.crp_super_negative or joker.edition.crp_photon_readings_negative or joker.edition.crp_photon_readings_really_negative or joker.edition.crp_photon_readings_gone) then
					main_end = {}
					localize { type = "other", key = "remove_negative", nodes = main_end, vars = {} }
					break
				end
			end
		end
		return { vars = { card.ability.extra, card.ability.invis_rounds }, main_end = main_end }
	end,
	calculate = function(self, card, context)
		if (context.selling_self and (card.ability.extra.invis_rounds >= card.ability.extra.total_rounds) and not context.blueprint) or context.forcetrigger then
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
			end
			if #jokers > 0 then
				if #G.jokers.cards <= G.jokers.config.card_limit then
					local chosen_joker = pseudorandom_element(jokers, "invisible")
					local copied_joker = copy_card(chosen_joker, nil, nil, nil,
						chosen_joker.edition and (chosen_joker.edition.negative or chosen_joker.edition.crp_really_negative or chosen_joker.edition.crp_super_negative or chosen_joker.edition.crp_photon_readings_negative or chosen_joker.edition.crp_photon_readings_really_negative or chosen_joker.edition.crp_photon_readings_gone))
					copied_joker:add_to_deck()
					G.jokers:emplace(copied_joker)
					return { message = localize("k_duplicated_ex") }
				else
					return { message = localize("k_no_room_ex") }
				end
			else
				return { message = localize("k_no_other_jokers") }
			end
		end
		if (context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint) or context.forcetrigger then
			card.ability.extra.invis_rounds = card.ability.extra.invis_rounds + 1
			if card.ability.extra.invis_rounds == card.ability.extra.total_rounds then
				local eval = function(card) return not card.REMOVED end
				juice_card_until(card, eval, true)
			end
			return {
				message = (card.ability.extra.invis_rounds < card.ability.extra.total_rounds) and
					(card.ability.extra.invis_rounds .. "/" .. card.ability.extra.total_rounds) or
					localize("k_active_ex"),
				colour = G.C.FILTER
			}
		end
	end
})

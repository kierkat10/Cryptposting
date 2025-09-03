SMODS.Joker { -- hank is DEAD
	key = "hexation_henry",
	name = "hexation henry",
	config = { immutable = { arrows = 4 }, extra = { hypermult = 1.1 } },
	rarity = "crp_exomythic",
	atlas = "crp_henry",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 7, extra = { x = 0, y = 7 } },
	cost = 200,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.hypermult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				hypermult = {lenient_bignum(card.ability.immutable.arrows), lenient_bignum(card.ability.extra.hypermult)},
				hypermult_message = {
					message = "^^^^" .. number_format(lenient_bignum(card.ability.extra.hypermult)) .. " Mult",
					colour = G.C.EDITION,
					sound = "crp_hexationalmult"
				}
			}
		end
	end,
	animation = {
        macro = {
            type = "skim",
            pos = {
                include = { { x1 = 0, x2 = 3, y1 = 0, y2 = 6 } },
                exclude = { { x1 = 0, x2 = 3, y1 = 7, y2 = 7 } }
            }
        }
    },
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "MarioFan597" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "morble",
	name = "Morble",
	config = { extra = { emoney = 2 } },
	rarity = "crp_exomythic",
	atlas = "crp_placeholder",
	pos = { x = 9, y = 0 },
	-- soul_pos = { x = 0, y = 0, extra = { x = 0, y = 0 } },
	cost = 200,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.emoney) } }
	end,
	calculate = function(self, card, context)
		if (context.other_joker) or context.forcetrigger then
			G.GAME.dollars = G.GAME.dollars ^ lenient_bignum(card.ability.extra.emoney)
			return {
				message = "^$" .. number_format(lenient_bignum(card.ability.extra.emoney)),
				colour = G.C.MONEY
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "statically_charged",
	name = "Statically Charged",
	config = { extra = {  } },
	rarity = "crp_exomythic",
	atlas = "crp_joker",
	pos = { x = 1, y = 6 },
	soul_pos = { x = 2, y = 6, extra = { x = 3, y = 6 } },
	cost = 200,
	blueprint_compat = true,
	demicoloncompat = false,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_crp_overloaded
		return { vars = {  } }
	end,
	add_to_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_edition_from_deck then
			G.GAME.modifiers.cry_force_edition_from_deck = G.GAME.modifiers.cry_force_edition
		elseif not G.GAME.modifiers.cry_force_edition_from_deck then
			G.GAME.modifiers.cry_force_edition = "crp_overloaded"
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.cry_force_edition_from_deck ~= "Nope!" then
			G.GAME.modifiers.cry_force_edition = G.GAME.modifiers.cry_force_edition_from_deck
		else
			G.GAME.modifiers.cry_force_edition = nil
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "Tatteredlurker" },
		code = { "Glitchkat10", "MathIsFun_" }
	}
}

SMODS.Joker {
	key = "inquisitio_hominis",
	name = "Inquisitio Hominis Nomine Waldo",
	config = { extra = { echipsmult = 1, echipsmult_mod = 23.112415 } },
	rarity = "crp_exomythic",
	atlas = "crp_placeholder",
	pos = { x = 9, y = 0 },
	cost = 200,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_waldo
		return { vars = { lenient_bignum(card.ability.extra.echipsmult), lenient_bignum(card.ability.extra.echipsmult_mod) } }
	end,
	calculate = function(self, card, context)
		card.ability.extra.echipsmult = 1 + (card.ability.extra.echipsmult_mod * #SMODS.find_card("j_crp_waldo"))
		if (context.joker_main) or context.forcetrigger then
			return {
				echips = lenient_bignum(card.ability.extra.echipsmult),
				Emult_mod = lenient_bignum(card.ability.extra.echipsmult),
				echip_message = {
					message = "^" .. number_format(lenient_bignum(card.ability.extra.echipsmult)) .. " Chips & Mult",
					colour = G.C.DARK_EDITION,
					sound = "crp_exponentialchipsmult"
				}
			}
		end
		if context.selling_card and 0.75 <= pseudorandom("crp_inquisitio_hominis") then	
			G.E_MANAGER:add_event(Event({func = function()
				local card1 = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_crp_waldo", "inquisitio_hominis")
				card1:add_to_deck()
				G.jokers:emplace(card1)
				card1:set_edition({ negative = true })
				card1:juice_up(0.3, 0.5)
				return true
			end }))
		end
	end,
	crp_credits = {
		idea = { "aqrlr" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "fiorello_giraud",
	name = "Fiorello Giraud",
	config = { extra = { eeemult = 1, eeemult_mod = 1 } },
	rarity = "crp_exomythic",
	atlas = "crp_placeholder",
	pos = { x = 9, y = 0 },
	cost = 200,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.eeemult), lenient_bignum(card.ability.extra.eeemult_mod) } }
	end,
	calculate = function(self, card, context)
        if context.remove_playing_cards then
            for k, v in ipairs(context.removed) do
                if v:is_face() then
					card.ability.extra.eeemult = lenient_bignum(card.ability.extra.eeemult) + lenient_bignum(card.ability.extra.eeemult_mod)
                end
            end
			return {
				message = localize("k_upgrade_ex"),
				colour = G.C.EDITION,
				
			}
		end
		if (context.joker_main) or context.forcetrigger then
			return {
				eeemult = lenient_bignum(card.ability.extra.eeemult),
				eeemult_message = {
					message = "^^^" .. number_format(lenient_bignum(card.ability.extra.eeemult)) .. " Mult",
					colour = G.C.EDITION,
					sound = "talisman_eeemult"
				}	
			}
		end
	end,
	crp_credits = {
		idea = { "SageSeraph" },
		code = { "Rainstar", "Glitchkat10" },
	}
}

SMODS.Joker {
	key = "fevrial",
	name = "Fevrial",
	config = { extra = { eeemult = 2 } },
	rarity = "crp_exomythic",
	atlas = "crp_placeholder",
	pos = { x = 9, y = 0 },
	cost = 200,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.eeemult) } }
	end,
	calculate = function(self, card, context)
		if (context.individual and context.cardarea == G.play and context.other_card and (context.other_card:get_id() == 12 or context.other_card:get_id() == 13)) or context.forcetrigger then
			return {
				eeemult = lenient_bignum(card.ability.extra.eeemult),
				eeemult_message = {
					message = "^^^" .. number_format(lenient_bignum(card.ability.extra.eeemult)) .. " Mult",
					colour = G.C.EDITION,
					sound = "talisman_eeemult"
				}
			}
		end
	end,
	crp_credits = {
		idea = { "SageSeraph" },
		code = { "wilfredlam0418", "Glitchkat10" },
	}
}

SMODS.Joker {
	key = "richard_tarlton",
	name = "Richard Tarlton",
	config = { extra = { eemult = 1, eemult_mod = 23 } },
	rarity = "crp_exomythic",
	atlas = "crp_placeholder",
	pos = { x = 9, y = 0 },
	cost = 200,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.eemult), lenient_bignum(card.ability.extra.eemult_mod) } }
	end,
	calculate = function(self, card, context)
		if (context.discard and not context.other_card.debuff and not context.blueprint) or context.forcetrigger then
			card.ability.extra.eemult = lenient_bignum(card.ability.extra.eemult) + lenient_bignum(card.ability.extra.eemult_mod)
			return {
				message = localize("k_upgrade_ex"),
				colour = G.C.DARK_EDITION,
			}
		end

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
		idea = { "SageSeraph" },
		code = { "wilfredlam0418", "Glitchkat10" },
	}
}

SMODS.Joker {
	key = "jean_antoine",
	name = "Jean-Antoine d'Anglerais",
	config = { extra = { disables = math.min(14, 14) } }, -- this is what i meant, john glitchkat10
	rarity = "crp_exomythic",
	atlas = "crp_joker",
	pos = { x = 3, y = 8 },
	soul_pos = { x = 4, y = 8 },
	cost = 200,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.disables) } }
	end,
	calculate = function(self, card, context)
        if context.setting_blind and G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
			for i = 1, card.ability.extra.disables do
            	G.GAME.blind:disable()
            	play_sound('timpani')
            	card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('ph_boss_disabled') })
			end
		end
	end,
	crp_credits = {
		idea = { "SageSeraph" },
		art = { "Rainstar" },
		code = { "Rainstar" },
	}
}

SMODS.Joker {
	key = "bulgoelly_west",
	name = "Bulgoelly West",
	config = { extra = { eante = 2, xante = -7, eqante = 0 } },
	rarity = "crp_exomythic",
	atlas = "crp_joker2",
	pos = { x = 5, y = 1 },
	pools = { Bulgoe = true },
	soul_pos = { x = 7, y = 1, extra = { x = 6, y = 1 } },
	cost = 400,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.eante), lenient_bignum(card.ability.extra.xante), lenient_bignum(card.ability.extra.eqante) } }
	end,
	update = function(self, card, dt)
		if G.deck and card.added_to_deck then
			for i, v in pairs(G.deck.cards) do
				if v:is_suit("Hearts") then
					v:set_debuff(false)
				end
			end
		end
		if G.hand and card.added_to_deck then
			for i, v in pairs(G.hand.cards) do
				if v:is_suit("Hearts") then
					v:set_debuff(false)
				end
			end
		end
	end,
	add_to_deck = function(self, card, from_debuff)
        local card1 = create_playing_card({
        front = G.P_CARDS.H_2,
        center = nil
        }, G.hand, true, false, nil, true)
        card1.ability.cry_global_sticker = true
        card1:set_edition("e_negative", true)
        G.E_MANAGER:add_event(Event({
            func = function()
                card1:start_materialize()
                G.deck:emplace(card1)
                return true
            end
        }))
        SMODS.calculate_context({ playing_card_added = true, cards = { card1 } })
        local card2 = create_playing_card({
        front = G.P_CARDS.H_7,
        center = nil
        }, G.hand, true, false, nil, true)
        card2.ability.cry_global_sticker = true
        card2:set_edition("e_negative", true)
        G.E_MANAGER:add_event(Event({
            func = function()
                card2:start_materialize()
                G.deck:emplace(card2)
                return true
            end
        }))
        SMODS.calculate_context({ playing_card_added = true, cards = { card2 } })
	end,
	calculate = function(self, card, context)
		if context.before and context.full_hand then
			local eante_active = false
			local xante_active = false
			for k, v in ipairs(context.full_hand) do
				if v:get_id() == 2 then
					eante_active = true
					--print("eante active")
				end
				if v:get_id() == 7 then
					xante_active = true
					--print("xante active")
				end
				if xante_active and eante_active then
					--print("eqante active")
				end
			end
			if eante_active and not xante_active then
				local antechange = (G.GAME.round_resets.ante ^ card.ability.extra.eante) - G.GAME.round_resets.ante
				ease_ante(antechange)
				return { 
					message = "^" .. lenient_bignum(card.ability.extra.eante) .. " Ante",
				}
			else if xante_active and not eante_active then
				local antechange = (G.GAME.round_resets.ante * card.ability.extra.xante) - G.GAME.round_resets.ante
				ease_ante(antechange)
				return {
					message = "X" .. lenient_bignum(card.ability.extra.xante) .. " Ante",
				}
			else if xante_active and eante_active then
				local antechange = card.ability.extra.eqante - G.GAME.round_resets.ante
				ease_ante(antechange)
				return {
					message = "=" .. lenient_bignum(card.ability.extra.eqante) .. " Ante",
				}
			end
			end
			end
		end
	end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "Rainstar" }
	},
}
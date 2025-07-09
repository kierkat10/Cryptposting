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
	key = "infinitum",
	name = "Infinitum",
	config = { extra = { chipsmult = 2 } },
	rarity = "crp_2exomythic4me",
	atlas = "crp_jokers",
	pos = { x = 0, y = 8 },
	soul_pos = { x = 1, y = 8, extra = { x = 2, y = 8 } },
	cost = 400,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chipsmult), "{", "}" } }
	end,
	calculate = function(self, card, context)
		-- jokers, doesnt work as of now

	    --if context.other_joker then
		--	local arrow_number_jokers = 0
		--	for k, v in ipairs(G.jokers.cards) do
		--		if v == context.other_joker then
		--			arrow_number_jokers = k
		--			break
		--		end
		--	end
		--	if context.other_joker == G.jokers.cards[arrow_number_jokers] then
		--		if arrow_number_jokers == 1 then
		--			return {
		--				message = localize({
		--					type = "variable",
		--					key = "a_powmultchips",
		--					vars = { number_format(lenient_bignum(card.ability.extra.chipsmult)) },
		--				}),
		--				Echip_mod = card.ability.extra.chipsmult,
		--				Emult_mod = card.ability.extra.chipsmult
		--			}
		--		elseif arrow_number_jokers == 2 then
		--			return {
		--				message = "^^" .. lenient_bignum(card.ability.extra.chipsmult) .. " Chips & Mult",
		--				colour = G.C.EDITION,
		--				EEchip_mod = card.ability.extra.chipsmult,
		--				EEmult_mod = card.ability.extra.chipsmult
		--			}
		--		elseif arrow_number_jokers == 3 then
		--			return {
		--				message = "^^^" .. lenient_bignum(card.ability.extra.chipsmult) .. " Chips & Mult",
		--				colour = G.C.EDITION,
		--				EEEchip_mod = card.ability.extra.chipsmult,
		--				EEEmult_mod = card.ability.extra.chipsmult
		--			}
		--		elseif arrow_number_jokers >= 4 then
		--			return {
		--				message = "{" .. arrow_number_jokers .. "} " .. lenient_bignum(card.ability.extra.chipsmult) .. " Chips & Mult",
		--				colour = G.C.EDITION,
		--				hyperchip_mod = {arrow_number_jokers, card.ability.extra.chipsmult},
		--				hypermult_mod = {arrow_number_jokers, card.ability.extra.chipsmult}
		--			}
		--		end
		--	end
		--end

		-- playing cards
		local arrow_number_cards = 0
		if context.individual and context.cardarea == G.play then
			local arrow_number_cards = 1
			for k, v in ipairs(G.play.cards) do
				if v == context.other_card then
					arrow_number_cards = k
					break
				end
			end
			if lenient_bignum(arrow_number_cards) == 1 then
				return {
					message = "^" .. lenient_bignum(card.ability.extra.chipsmult) .. " Chips & Mult",
					colour = G.C.DARK_EDITION,
					Echip_mod = lenient_bignum(card.ability.extra.chipsmult),
					Emult_mod = lenient_bignum(card.ability.extra.chipsmult)
				}
			elseif lenient_bignum(arrow_number_cards) == 2 then
				return {
					message = "^^" .. lenient_bignum(card.ability.extra.chipsmult) .. " Chips & Mult",
					colour = G.C.DARK_EDITION,
					EEchip_mod = lenient_bignum(card.ability.extra.chipsmult),
					EEmult_mod = lenient_bignum(card.ability.extra.chipsmult)
				}
			elseif lenient_bignum(arrow_number_cards) == 3 then
				return {
					message = "^^^" .. lenient_bignum(card.ability.extra.chipsmult) .. " Chips & Mult",
					colour = G.C.EDITION,
					EEEchip_mod = lenient_bignum(card.ability.extra.chipsmult),
					EEEmult_mod = lenient_bignum(card.ability.extra.chipsmult)
				}
			elseif lenient_bignum(arrow_number_cards) >= 4 then
				return {
					message = "{" .. lenient_bignum(arrow_number_cards) .. "} " .. lenient_bignum(card.ability.extra.chipsmult) .. " Chips & Mult",
					colour = G.C.EDITION,
					hyperchip_mod = {lenient_bignum(arrow_number_cards), lenient_bignum(card.ability.extra.chipsmult)},
					hypermult_mod = {lenient_bignum(arrow_number_cards), lenient_bignum(card.ability.extra.chipsmult)}
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Tatteredlurker" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "exodiac",
	name = "Exodiac",
	config = { extra = { hypermult = 1.13 }, immutable = { arrows = 5 } },
	rarity = "crp_2exomythic4me",
	atlas = "crp_placeholder",
	pos = { x = 11, y = 0 },
	-- soul_pos = { x = 0, y = 0, extra = { x = 0, y = 0 } },
	cost = 400,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { "{", lenient_bignum(card.ability.immutable.arrows), "}", lenient_bignum(card.ability.extra.hypermult) } }
	end,
	calculate = function(self, card, context)
		if context.ending_shop and G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
			local success, new_card = pcall(create_card, "Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "exotic_generator_moment")
			if success and new_card and type(new_card) == 'table' then
				if new_card.set_edition then 
					pcall(new_card.set_edition, new_card, { negative = true }, true)
				end
				if new_card.add_to_deck then 
					pcall(new_card.add_to_deck, new_card)
				end
				if G.jokers and G.jokers.emplace then
					pcall(function() 
						G.jokers:emplace(new_card)
					end)
				end
			end
		end
		if context.other_joker and context.other_joker.config.center.rarity == "cry_exotic" then
			return {
				hypermult_mod = {
					lenient_bignum(card.ability.immutable.arrows),
					lenient_bignum(card.ability.extra.hypermult)
				},
				message = "{" .. number_format(lenient_bignum(card.ability.immutable.arrows)) .. "}" .. number_format(lenient_bignum(card.ability.extra.hypermult)) .. " Mult",
				colour = G.C.EDITION,
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "cryptposted",
	name = "Cryptposted Joker",
	config = { immutable = { arrows = 0 }, extra = { hypermult = 2 } },
	rarity = "crp_2exomythic4me",
	atlas = "crp_joker",
	pos = { x = 3, y = 9 },
	soul_pos = { x = 5, y = 9, extra = { x = 4, y = 9 } },
	cost = 400,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { "{", "}", lenient_bignum(card.ability.extra.hypermult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			card.ability.immutable.arrows = 0
			for i = 1, #G.jokers.cards do
				local joker = G.jokers.cards[i]
				if joker and joker.config and joker.config.center and joker.config.center.mod and joker.config.center.mod.id == "cryptposting" then
					card.ability.immutable.arrows = lenient_bignum(card.ability.immutable.arrows) + 1
				end
			end
			return {
				hypermult_mod = {
					lenient_bignum(card.ability.immutable.arrows),
					lenient_bignum(card.ability.extra.hypermult)
				},
				message = "{" .. number_format(lenient_bignum(card.ability.immutable.arrows)) .. "}" .. number_format(lenient_bignum(card.ability.extra.hypermult)) .. " Mult",
				colour = G.C.EDITION,
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "Tatteredlurker" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "eternity",
	name = "Eternity",
	config = { extra = { echipsmult = 1000000, echipsmultmod = 1, jokerpowmod = 0.1, jokerslots = 1e100, active = false, echipsmultold = 1000000, jokerexponentiation = 1, chipsmultoperator = 1, chipsmultoperatormod = 1, jokeroperator = 1, jokeroperatormod = 1 } },
	rarity = "crp_2exomythic4me",
	atlas = "crp_placeholders",
	pos = { x = 11, y = 0 },
	cost = 400,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.echipsmult),
				lenient_bignum(card.ability.extra.echipsmultmod),
				lenient_bignum(card.ability.extra.jokerpowmod),
				lenient_bignum(card.ability.extra.echipsmultold),
				lenient_bignum(card.ability.extra.jokerexponentiation),
				lenient_bignum(card.ability.extra.chipsmultoperator),
				lenient_bignum(card.ability.extra.chipsmultoperatormod),
				lenient_bignum(card.ability.extra.jokeroperator),
				lenient_bignum(card.ability.extra.jokeroperatormod),
				colours = { { 0.78, 0.35, 0.52, 1 } },
				'{',
				'}'
			}
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.active = true
	end,
	remove_from_deck = function(self, card, from_debuff)
		card.ability.extra.active = false
	end,
	update = function(self, card, dtt)
		if card.ability.extra.active == true and card.ability.extra.echipsmult >= 1 then
			card.ability.extra.echipsmult = card.ability.extra.echipsmult - card.ability.extra.echipsmultmod
			card.ability.extra.jokerexponentiation = card.ability.extra.jokerexponentiation + card.ability.extra.jokerpowmod
		elseif card.ability.extra.active == true and card.ability.extra.echipsmult <= 0 then
			card.ability.extra.echipsmult = card.ability.extra.echipsmultold
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
			card.ability.extra.chipsmultoperator = card.ability.extra.chipsmultoperator + card.ability.extra.chipsmultoperatormod
			card.ability.extra.jokeroperator = card.ability.extra.jokeroperator + card.ability.extra.jokeroperatormod
		else
			return
		end
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				hypermult_mod = {card.ability.extra.chipsmultoperator, card.ability.extra.echipsmult},
				hyperchip_mod = {card.ability.extra.chipsmultoperator, card.ability.extra.echipsmult},
				message = "{" .. lenient_bignum(card.ability.extra.chipsmultoperator) .. "}" .. lenient_bignum(card.ability.extra.echipsmult) .. " Chips & Mult",
				colour = G.C.DARK_EDITION,
			}
		end
        if (context.ending_shop and not context.blueprint and not context.retrigger_joker and not context.individual) or context.forcetrigger then
            for i, v in pairs(G.jokers.cards) do
                local check = false
                if not Card.no(G.jokers.cards[i], "immutable", true) and (G.jokers.cards[i].config.center.key ~= "j_crp_eternity" or context.forcetrigger) then
                    check = true
					Cryptid.manipulate(G.jokers.cards[i], { value = {arrows = card.ability.extra.jokeroperator, height = card.ability.extra.jokerexponentiation}, type = "hyper" })
                end
			    if check then
				    card_eval_status_text(
					context.blueprint_card or G.jokers.cards[i],
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_upgrade_ex"), colour = G.C.GREEN }
				    )
                end
            end
            card.ability.extra.jokerexponentiation = 1
        end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar" }
	}
}
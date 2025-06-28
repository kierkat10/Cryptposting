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
	config = {
		extra = {
			chipsmult = 2
		}
	},
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

	    --if context.other_card ~= self and context.cardarea == G.jokers then
		--	local arrow_number_jokers = 0
		--	for i = 1, #G.jokers.cards do
		--		if context.other_card == G.jokers.cards[i] then
		--			arrow_number_jokers = i
		--		end
		--	end
		--	if context.post_trigger and context.other_card == G.jokers.cards[arrow_number_jokers] then
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
	config = { extra = { EEEmult = 1.13 } },
	rarity = "crp_2exomythic4me",
	atlas = "crp_placeholder",
	pos = { x = 11, y = 0 },
	-- soul_pos = { x = 0, y = 0, extra = { x = 0, y = 0 } },
	cost = 400,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.EEEmult) } }
	end,
	calculate = function(self, card, context)
		if context.ending_shop then
			local card = create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "exotic_generator_moment") -- this is true
			card:set_edition({ negative = true }, true)
			card:add_to_deck()
			G.jokers:emplace(card)
		end
		if context.other_joker and context.other_joker.config.center.rarity == "cry_exotic" then
			return {
				EEEmult_mod = lenient_bignum(card.ability.extra.EEEmult),
				message = "^^^" .. lenient_bignum(card.ability.extra.EEEmult) .. " Mult",
				colour = G.C.EDITION,
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "cryptposted",
	name = "Cryptposted Joker",
	config = { immutable = { arrows = 0 }, extra = { hypermult = 2 } },
	rarity = "crp_2exomythic4me",
	atlas = "crp_placeholders",
	pos = { x = 11, y = 0 },
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
				if G.jokers.cards[i].config.center.mod.id == "cryptposting" then
					card.ability.immutable.arrows = lenient_bignum(card.ability.immutable.arrows) + 1
				end
			end
			return {
				hypermult_mod = {
					lenient_bignum(card.ability.immutable.arrows),
					lenient_bignum(card.ability.extra.hypermult)
				},
				message = "{" .. tostring(lenient_bignum(card.ability.immutable.arrows)) .. "}" .. lenient_bignum(card.ability.extra.hypermult) .. " Mult",
				colour = G.C.EDITION,
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "eternity",
	name = "Eternity",
	config = { extra = { echipsmult = 1000000, echipsmultmod = 1, jokerpowmod = 0.1, jokerslots = 1e100, active = false, echipsmultold = 1000000, jokerexponentiation = 1 } },
	rarity = "crp_2exomythic4me",
	atlas = "crp_placeholders",
	pos = { x = 11, y = 0 },
	cost = 400,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.echipsmult), lenient_bignum(card.ability.extra.echipsmultmod), lenient_bignum(card.ability.extra.jokerpowmod), lenient_bignum(card.ability.extra.jokerslots), card.ability.extra.active, lenient_bignum(card.ability.extra.echipsmultold), lenient_bignum(card.ability.extra.jokerexponentiation) } }
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
			add_tag(Tag("tag_crp_better_better_better_better_better_better_better_better_top-up_tag"))
			add_tag(Tag("tag_crp_better_better_better_better_better_better_better_better_better_top-up_tag"))
			add_tag(Tag("tag_crp_better_better_better_better_better_better_better_better_better_top-up_tag"))
			--add_tag(Tag(best_top-up_tag))
		else
			return
		end
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				Emult_mod = card.ability.extra.echipsmult,
				Echip_mod = card.ability.extra.echipsmult,
				message = "^" .. lenient_bignum(card.ability.extra.echipsmult) .. " Chips & Mult",
				colour = G.C.EDITION,
			}
		end
        if (context.ending_shop and not context.blueprint and not context.retrigger_joker) or context.forcetrigger then
            for i, v in pairs(G.jokers.cards) do
                local check = false
                if not Card.no(G.jokers.cards[i], "immutable", true) and (G.jokers.cards[i].config.center.key ~= "j_crp_eternity" or context.forcetrigger) then
                    Cryptid.with_deck_effects(v, function(card2)
                        Cryptid.misprintize(card2, { min=card.ability.extra.jokerexponentiation, max=card.ability.extra.jokerexponentiation }, nil, true, "^", 1)
                    end)
                    check = true
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


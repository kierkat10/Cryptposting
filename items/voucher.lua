SMODS.Voucher {
    key = "reduction",
    atlas = "crp_placeholder",
    pos = { x = 5, y = 2 },
    config = { extra = { ante_scaling = 0.8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.ante_scaling) } }
    end,
    redeem = function(self, card)
        G.GAME.starting_params.ante_scaling = lenient_bignum(card.ability.extra.ante_scaling)
    end
}

SMODS.Voucher {
    key = "pacification",
    atlas = "crp_placeholder",
    pos = { x = 6, y = 2 },
    config = { extra = { ante_scaling = 0.6 } },
	requires = { "v_crp_reduction" },
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.ante_scaling) } }
    end,
    redeem = function(self, card)
        G.GAME.starting_params.ante_scaling = lenient_bignum(card.ability.extra.ante_scaling)
    end
}

SMODS.Voucher {
    key = "domination",
    atlas = "crp_placeholder",
    pos = { x = 7, y = 2 },
    config = { extra = { ante_scaling = 0.4 } },
	requires = { "v_crp_pacification" },
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.ante_scaling) } }
    end,
    redeem = function(self, card)
        G.GAME.starting_params.ante_scaling = lenient_bignum(card.ability.extra.ante_scaling)
    end
}

SMODS.Voucher {
    key = "reign",
    atlas = "crp_placeholder",
    pos = { x = 7, y = 2 },
    config = { extra = { ante_scaling = 0.2 } },
	requires = { "v_crp_domination" },
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.ante_scaling) } }
    end,
    redeem = function(self, card)
        G.GAME.starting_params.ante_scaling = lenient_bignum(card.ability.extra.ante_scaling)
    end
}

SMODS.Voucher {
    key = "supremacy",
    atlas = "crp_placeholder",
    pos = { x = 7, y = 2 },
    config = { extra = { } },
	requires = { "v_crp_reign" },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.hand then
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
					{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
				)
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						play_sound("tarot1")
						return true
					end,
				}))
				update_hand_text({ delay = 0 }, { mult = "+", StatusText = true })
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.9,
					func = function()
						play_sound("tarot1")
						return true
					end,
				}))
				update_hand_text({ delay = 0 }, { chips = "+", StatusText = true })
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.9,
					func = function()
						play_sound("tarot1")
						return true
					end,
				}))
				update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "+" .. math.ceil(math.log(G.GAME.blind.chips, 64)) })
				delay(1.3)
				for k, v in pairs(G.GAME.hands) do
					G.GAME.hands[k].level = G.GAME.hands[k].level + math.ceil(math.log(G.GAME.blind.chips, 64))
				end
				update_hand_text(
					{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
					{ mult = 0, chips = 0, handname = "", level = "" }
				)
        end
    end
}

SMODS.Voucher {
    key = "godhood",
    atlas = "crp_placeholder",
    pos = { x = 7, y = 2 },
    config = { extra = {  } },
	requires = { "v_crp_supremacy" },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    redeem = function(self, card)
    end
}

SMODS.Voucher {
    key = "ascension",
    atlas = "crp_placeholder",
    pos = { x = 7, y = 2 },
    config = { extra = {  } },
	requires = { "v_crp_godhood" },
    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
    calculate = function(self, card, context)
		if context.setting_blind then
            G.GAME.blind.chips = 1
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind:disable()
            play_sound('timpani')
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('ph_boss_disabled') })
		end
    end
}

-- i love bulgoe
SMODS.Voucher {
    key = "bulgoverstock",
    name = "Bulgoverstock",
    atlas = "crp_placeholder",
    pos = { x = 5, y = 2 },
    config = { extra = { shop_slots = 1 } },
    pronouns = "bulgoe",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_bulgoe
        return { vars = { lenient_bignum(card.ability.extra.shop_slots) } }
    end,
    redeem = function(self, card)
        local card = SMODS.create_card({key = "j_crp_bulgoe"})
        create_shop_card_ui(card, "Joker", G.shop_jokers)
        card:set_cost()
        card:start_materialize()
        G.shop_jokers:emplace(card)
    end,
    calculate = function(self, card, context)
        if (context.reroll_shop or context.starting_shop) and not G.GAME.used_vouchers.bulgscension then
            local card = SMODS.create_card({key = "j_crp_bulgoe"})
		    create_shop_card_ui(card, "Joker", G.shop_jokers)
		    card:set_cost()
		    card:start_materialize()
            G.shop_jokers:emplace(card)
        end
    end,
    crp_credits = {
		idea = { "ScarredOut" },
		code = { "Rainstar", "Glitchkat10" }
	}
}

SMODS.Voucher {
    key = "bulgoestocks",
    name = "Bulgoestocks",
    atlas = "crp_placeholder",
    pos = { x = 6, y = 2 },
    config = { extra = { money = 2.7 } },
	requires = { "v_crp_bulgoverstock" },
    pronouns = "bulgoe",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_bulgoe
        return { vars = { lenient_bignum(card.ability.extra.money) } }
    end,
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == "j_crp_bulgoe" then
            ease_dollars(lenient_bignum(card.ability.extra.money))
        end
    end,
    crp_credits = {
		idea = { "Gudusername" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "bulgadicioe",
    name = "Bulgadicioe",
    atlas = "crp_placeholder",
    pos = { x = 7, y = 2 },
    config = { extra = { money = 2.7 } },
	requires = { "v_crp_bulgoestocks" },
    pronouns = "bulgoe",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_bulgoe
        return { vars = { lenient_bignum(card.ability.extra.money) } }
    end,
    calculate = function(self, card, context)
        if context.open_booster then
			SMODS.add_card({key = "j_crp_bulgoe"})
            ease_dollars(lenient_bignum(card.ability.extra.money))
        end
    end,
    crp_credits = {
		idea = { "Gudusername" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "rabbulgoe_hole",
    name = "Rabbulgoe Hole",
    atlas = "crp_placeholder",
    pronouns = "bulgoe",
    pos = { x = 7, y = 2 },
    config = { extra = { prev_bulgoes = 0, current_bulgoes = 0 } },
	requires = { "v_crp_bulgadicioe" },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "bulgoe-themed_joker" }
        return { vars = {  } }
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.prev_bulgoes = 0 -- store the previous count when added to deck
        card.ability.extra.current_bulgoes = 0 -- store the current count when added to deck
    end,
    calculate = function(self, card, context)
        if (context.end_of_round or context.buying_card) and not context.other_card and not context.repetition then
            card.ability.extra.prev_bulgoes = card.ability.extra.current_bulgoes
            card.ability.extra.current_bulgoes = 0
            if G.jokers then
                for i = 1, #G.jokers.cards do
                    local joker = G.jokers.cards[i]
                    if joker.config and joker.config.center and joker.config.center.pools and joker.config.center.pools.Bulgoe then
                        card.ability.extra.current_bulgoes = card.ability.extra.current_bulgoes + 1
                    end
                end
            end
            if card.ability.extra.prev_bulgoes ~= card.ability.extra.current_bulgoes then -- only update if count changed
                local diff = card.ability.extra.current_bulgoes - card.ability.extra.prev_bulgoes
                if diff > 0 then
                    SMODS.change_free_rerolls(diff) -- only add the difference so it doesn't reset and make big reroll numbers
                end
                card.ability.extra.prev_bulgoes = card.ability.extra.current_bulgoes -- update stored count
            end
        end
    end,
    remove_from_deck = function(self, card, from_debug)
        SMODS.change_free_rerolls(-card.ability.extra.current_bulgoes)
    end,
    crp_credits = {
		idea = { "Gudusername" },
		code = { "Glitchkat10" }
	}
}

SMODS.Voucher {
    key = "bulgnation",
    name = "Bulgnation",
    atlas = "crp_placeholder",
    pos = { x = 7,  y = 2 },
    config = { extra = { } },
    requires = { "v_crp_rabbulgoe_hole" },
    pronouns = "bulgoe",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_bulgoe
        info_queue[#info_queue + 1] = G.P_CENTERS.e_crp_really_negative
        return { vars = {  } }
    end,
    calculate = function(self, card, context)
        if context and context.buying_card and context.card and context.card.config and context.card.config.center and context.card.config.center.key == "j_crp_bulgoe" then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                blockable = false,
                blockable_auto = true,
                once = true,
                func = function()
                    if context.card and context.card.config and context.card.config.center and context.card.config.center.key == "j_crp_bulgoe" then
                        context.card:set_edition("e_crp_really_negative")
                        return true
                    end
                    return true
                end
            }))
        end
    end,
    crp_credits = {
        idea = { "ScarredOut" },
        code = { "Rainstar", "Glitchkat10" }
    }
}

SMODS.Voucher {
    key = "bulgcrowd",
    name = "Bulgcrowd",
    atlas = "crp_placeholder",
    pos = { x = 7, y = 2 },
    config = { extra = { money = 27} },
	requires = { "v_crp_bulgnation" },
    pronouns = "bulgoe",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.v_crp_bulgnation
        info_queue[#info_queue + 1] = G.P_CENTERS.v_crp_bulgoestocks
        info_queue[#info_queue + 1] = { set = "Other", key = "bulgoe-themed_joker" }
        return { vars = { lenient_bignum(card.ability.extra.money) } }
    end,
    redeem = function(self, card)
		if G.jokers then
			for i = 1, #G.jokers.cards do
				local joker = G.jokers.cards[i]
				if joker.config and joker.config.center and joker.config.center.pools and joker.config.center.pools.Bulgoe then
                    joker:set_edition("e_crp_really_negative")
                end
            end
        end
    end,
    calculate = function(self, card, context)
        if context.buying_card and card.config and card.config.center and card.config.center.pools and card.config.center.pools.Bulgoe then
            ease_dollars(lenient_bignum(card.ability.extra.money))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                blockable = false,
                blockable_auto = true,
                once = true,
                func = function()
                    if context.card and context.card.config and context.card.config.center and context.card.config.center.pools and context.card.config.center.pools.Bulgoe then
                        context.card:set_edition("e_crp_really_negative")
                        return true
                    end
                    return true
                end
            }))
        end
    end,
    crp_credits = {
		idea = { "ScarredOut", "Gudusername" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "bulgscension",
    name = "Bulgscension",
    atlas = "crp_placeholder",
    pos = { x = 7, y = 2 },
    config = { extra = { } },
	requires = { "v_crp_bulgcrowd" },
    pronouns = "bulgoe",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "bulgoe-themed_joker" }
        return { vars = { } }
    end,
    redeem = function(self, card)
        local card = SMODS.create_card({set = "Bulgoe"})
        create_shop_card_ui(card, "Joker", G.shop_jokers)
        card:set_cost()
        card:start_materialize()
        G.shop_jokers:emplace(card)
    end,
    calculate = function(self, card, context)
        if context.reroll_shop or context.starting_shop then
            local card = SMODS.create_card({set = "Bulgoe"})
		    create_shop_card_ui(card, "Joker", G.shop_jokers)
		    card:set_cost()
		    card:start_materialize()
            G.shop_jokers:emplace(card)
        end
    end,
    crp_credits = {
		idea = { "ScarredOut" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "patience",
    name = "Patience",
    atlas = "crp_placeholder",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    redeem = function(self, card)
    end,
	crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "patience_2",
    name = "More Patience",
    atlas = "crp_placeholder",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience" },
    redeem = function(self, card)
    end,
    crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "patience_3",
    name = "Even More Patience",
    atlas = "crp_placeholder",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience_2" },
    redeem = function(self, card)
    end,
    crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "patience_4",
    name = "Even More Patience Again",
    atlas = "crp_placeholder",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience_3" },
    redeem = function(self, card)
    end,
    crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "patience_5",
    name = "So Much Patience",
    atlas = "crp_placeholder",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience_4" },
    redeem = function(self, card)
    end,
    crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "payoff",
    name = "Payoff", -- +4 chips!!1!1!!!
    atlas = "crp_placeholder",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience_5" },
    redeem = function(self, card)
		for k, v in pairs(G.GAME.hands) do
			G.GAME.hands[k].chips = G.GAME.hands[k].chips + 4
        end
    end,
    crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "just_kidding",
    name = "Just Kidding, This Is the Real Payoff", -- oh
    atlas = "crp_placeholder",
    pos = { x = 7, y = 2 },
    config = { extra = { all_count = 1 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return { vars = { lenient_bignum(card.ability.extra.all_count) } }
    end,
	requires = { "v_crp_payoff" },
    redeem = function(self, card)
        for i = 1, lenient_bignum(card.ability.extra.all_count) do
			local card = create_card("Joker", G.jokers, nil, "crp_all", nil, nil, nil, "just_kidding")
			card:set_edition({ negative = true }, true)
			card:add_to_deck()
			G.jokers:emplace(card)
        end
    end,
    crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar" }
	}
}
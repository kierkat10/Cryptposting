SMODS.Atlas {
	key = "vouchers",
	path = "atlas_voucher.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "placeholders",
	path = "atlas_placeholder.png",
	px = 71,
	py = 95
}

-- commented out due to crashing on use cuz i don't think change_ante_scaling exists and idk how to fix it :sob: - glitch
--[[ SMODS.Voucher {
    key = "reduction",
    atlas = "crp_placeholders",
    pos = { x = 5, y = 2 },
    config = { extra = { ante_scaling = 0.8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.ante_scaling } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                change_ante_scaling(card.ability.extra.ante_scaling)
                return true
            end
        }))
    end
} ]]--

SMODS.Voucher {
    key = "patience",
    atlas = "crp_placeholders",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    redeem = function(self, card)
    end
}

SMODS.Voucher {
    key = "patience_2",
    atlas = "crp_placeholders",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience" },
    redeem = function(self, card)
    end
}

SMODS.Voucher {
    key = "patience_3",
    atlas = "crp_placeholders",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience_2" },
    redeem = function(self, card)
    end
}

SMODS.Voucher {
    key = "patience_4",
    atlas = "crp_placeholders",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience_3" },
    redeem = function(self, card)
    end
}

SMODS.Voucher {
    key = "patience_5",
    atlas = "crp_placeholders",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience_4" },
    redeem = function(self, card)
    end
}

SMODS.Voucher {
    key = "payoff",
    atlas = "crp_placeholders",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience_5" },
    redeem = function(self, card)
    end
}

SMODS.Voucher {
    key = "just_kidding",
    atlas = "crp_placeholders",
    pos = { x = 7, y = 2 },
    config = { extra = { exomythic_count = 3, twoexomythic4me_count = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.exomythic_count, card.ability.extra.twoexomythic4me_count } }
    end,
	requires = { "v_crp_payoff" },
    redeem = function(self, card)
        for i = 1, card.ability.extra.exomythic_count do
			local card = create_card("Joker", G.jokers, nil, "crp_exomythic", nil, nil, nil, "truly_fair")
			card:set_edition({ negative = true }, true)
			card:add_to_deck()
			G.jokers:emplace(card)
        end
        for i = 1, card.ability.extra.twoexomythic4me_count do
			local card = create_card("Joker", G.jokers, nil, "crp_2exomythic4me", nil, nil, nil, "truly_fair")
			card:set_edition({ negative = true }, true)
			card:add_to_deck()
			G.jokers:emplace(card)
        end
    end
}
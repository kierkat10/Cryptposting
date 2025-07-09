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
        return { vars = { lenient_bignum(card.ability.extra.ante_scaling) } }
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
    name = "Patience",
    atlas = "crp_placeholders",
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
    atlas = "crp_placeholders",
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
    atlas = "crp_placeholders",
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
    atlas = "crp_placeholders",
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
    atlas = "crp_placeholders",
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
    name = "Payoff",
    atlas = "crp_placeholders",
    pos = { x = 5, y = 2 },
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
	requires = { "v_crp_patience_5" },
    redeem = function(self, card)
    end,
    crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar" }
	}
}

SMODS.Voucher {
    key = "just_kidding",
    name = "Just Kidding, This Is the Real Payoff",
    atlas = "crp_placeholders",
    pos = { x = 7, y = 2 },
    config = { extra = { all_count = 1 } },
    loc_vars = function(self, info_queue, card)
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
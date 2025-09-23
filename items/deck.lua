SMODS.Back {
	key = "cyan",
    config = { hand_size = 2, discards = -1 },
	atlas = "crp_deck",
	pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue)
		return { vars = { lenient_bignum(self.config.hand_size), lenient_bignum(self.config.discards) * -1 } }
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "GudUsername" },
		code = { "Glitchkat10" }
	}
}

SMODS.Back {
    key = "brown",
    config = { hands = -1, cardselectionlimit = 2 },
    loc_vars = function(self, info_queue)
        return { vars = { lenient_bignum(self.config.hands) * -1, lenient_bignum(self.config.cardselectionlimit)} }
    end,
    apply = function(self, back)
        -- add card selection effect
        G.E_MANAGER:add_event(Event(
            { -- i'm not sure why you have to put this in an event to function but it crashes without this (thanks cryptid infinite deck)
                trigger = "after",
                delay = 0.5,
                func = function()
                    SMODS.change_play_limit(self.config.cardselectionlimit)
                    SMODS.change_discard_limit(self.config.cardselectionlimit)
                    return true
                end
            }
		))
    end,
    atlas = "crp_deck",
    pos = {
        x = 3,
        y = 0
    },
    crp_credits = {
        idea = { "Poker the Poker" },
        art = { "GudUsername" },
        code = { "ScarredOut" }
    }
}

SMODS.Back {
	key = "gray",
	config = { vouchers = { "v_seed_money", "v_money_tree" }, dollars = -4 },
	atlas = "crp_deck",
	pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue)
		return { vars = {  } }
	end,
    crp_credits = {
		idea = { "Poker The Poker" },
		art = { "GudUsername" },
		code = { "Glitchkat10" }
	}
}

SMODS.Back {
	key = "white",
    config = { joker_slot = -1, hands = 1 },
	atlas = "crp_deck",
	pos = { x = 2, y = 0 },
    loc_vars = function(self, info_queue)
		return { vars = { lenient_bignum(self.config.joker_slot) * -1, lenient_bignum(self.config.hands) } }
	end,
    crp_credits = {
		idea = { "Poker The Poker" },
		art = { "GudUsername" },
		code = { "Glitchkat10" }
	}
}

SMODS.Back {
    key = "creativemode",
    config = { consumables = { "c_cry_pointer" } },
    atlas = "crp_placeholder",
    pos = { x = 4, y = 2 },
    crp_credits = {
        idea = { "Psychomaniac14", "Glitchkat10" },
        code = { "ScarredOut" }
    }
}

SMODS.Back {
	key = "kiddie",
    config = { hands = -2, discards = -1, joker_slot = -2, consumable_slot = -1, hand_size = -1, ante_scaling = 0.3 },
	atlas = "crp_placeholder",
	pos = { x = 4, y = 2 },
    loc_vars = function(self, info_queue)
		return { vars = { lenient_bignum(self.config.hands) * -1, lenient_bignum(self.config.discards) * -1, lenient_bignum(self.config.joker_slot) * -1, lenient_bignum(self.config.consumable_slot) * -1, lenient_bignum(self.config.hand_size) * -1, lenient_bignum(self.config.ante_scaling) * 100 } }
	end,
	crp_credits = {
		idea = { "SolvLyi" },
		code = { "Glitchkat10" }
	}
}

SMODS.Back {
	key = "adult",
    config = { hands = 2, discards = 1, joker_slot = 2, consumable_slot = 1, hand_size = 1, ante_scaling = 3 },
	atlas = "crp_placeholder",
	pos = { x = 4, y = 2 },
    loc_vars = function(self, info_queue)
		return { vars = { lenient_bignum(self.config.hands), lenient_bignum(self.config.discards), lenient_bignum(self.config.joker_slot), lenient_bignum(self.config.consumable_slot), lenient_bignum(self.config.hand_size), lenient_bignum(self.config.ante_scaling) * 100 } }
	end,
	crp_credits = {
		idea = { "playeronenotfake", "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Back {
    key = "glyphic",
	name = "Glyphic Deck",
    config = { ante = 0 },
	atlas = "crp_placeholder",
    pos = { x = 4, y = 2 },
    loc_vars = function(self, info_queue)
        return { vars = { lenient_bignum(self.config.ante) } }
    end,
    apply = function(self, back)
		G.GAME.round_resets.ante = self.config.ante
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.ante
	end,
    crp_credits = {
        idea = { "Glitchkat10" },
        code = { "Glitchkat10" }
    }
}
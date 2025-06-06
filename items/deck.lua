SMODS.Atlas {
	key = "decks",
	path = "atlas_deck.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "placeholders",
	path = "atlas_placeholder.png",
	px = 71,
	py = 95
}

SMODS.Back {
	key = "cyan",
    config = { hand_size = 2, discards = -1 },
	atlas = "crp_decks",
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
	key = "gray",
	config = { vouchers = { "v_seed_money", "v_money_tree" }, dollars = -4 },
	atlas = "crp_decks",
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
	atlas = "crp_decks",
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
	key = "kiddie",
    config = { hands = -2, discards = -1, joker_slot = -2, consumable_slot = -1, hand_size = -1, ante_scaling = 0.3 },
	atlas = "crp_placeholders",
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
	atlas = "crp_placeholders",
	pos = { x = 4, y = 2 },
    loc_vars = function(self, info_queue)
		return { vars = { lenient_bignum(self.config.hands), lenient_bignum(self.config.discards), lenient_bignum(self.config.joker_slot), lenient_bignum(self.config.consumable_slot), lenient_bignum(self.config.hand_size), lenient_bignum(self.config.ante_scaling) * 100 } }
	end,
	crp_credits = {
		idea = { "playeronenotfake", "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}
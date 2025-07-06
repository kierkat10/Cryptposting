SMODS.Atlas {
	key = "consumable",
	path = "atlas_consumable.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "placeholder",
	path = "atlas_placeholder.png",
	px = 71,
	py = 95
}

SMODS.ConsumableType {
	key = "Pot",
	primary_colour = { 1, 1, 1, 1 },
	secondary_colour = { 0.75, 0.75, 0.75, 1 },
	collection_rows = { 4, 4 },
	shop_rate = 0,
	loc_txt = {},
	default = "c_crp_desires",
	can_stack = true,
	can_divide = true
}

SMODS.Consumable {
	key = "desires",
	name = "Pot of Desires",
	set = "Pot",
	pos = { x = 10, y = 2 },
	config = { max_highlighted = 2 },
	atlas = "crp_placeholder",
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.max_highlighted) } }
	end,
	use = function()
		for i = 1, #G.hand.highlighted do
			G.hand.highlighted[i]:start_dissolve()
			G.hand.highlighted[i]:remove_from_deck()
		end
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "wlfredlam0418" }
	}
}

SMODS.Consumable {
	key = "greed",
	name = "Pot of Greed",
	set = "Pot",
	pos = { x = 10, y = 2 },
	config = { extra = { cards = 3 } },
	atlas = "crp_placeholder",
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.cards) } }
	end,
	can_use = function()
		return true
	end,
	use = function(self, card)
		SMODS.draw_cards(card.ability.extra.cards)
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "wlfredlam0418" }
	}
}

SMODS.Consumable {
	key = "gold",
	name = "Pot of Gold",
	set = "Pot",
	pos = { x = 10, y = 2 },
	config = { extra = { cards = 1 } }
	atlas = "crp_placeholder",
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.cards) } }
	end,
	can_use = function()
		return true
	end,
	use = function(self, card)
		for i = 1, card.ability.extra.cards do
			SMODS.add_card({ set = "Playing Card", enhancement = "m_gold" })
		end
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "wlfredlam0418" }
	}
}

SMODS.Consumable {
	key = "potluck",
	name = "Potluck",
	set = "Pot",
	pos = { x = 10, y = 2 },
	config = { max_highlighted = 1, extra = { jokers = 1 } },
	atlas = "crp_placeholder",
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.max_highlighted), lenient_bignum(card.ability.extra.jokers) } }
	end,
	use = function(self, card)
		for i = 1, #G.hand.highlighted do
			G.hand.highlighted[i]:start_dissolve()
			G.hand.highlighted[i]:remove_from_deck()
		end
		for i = 1, card.ability.extra.jokers do
			SMODS.add_card({ set = "Food" })
		end
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "wlfredlam0418" }
	}
}

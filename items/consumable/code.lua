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

SMODS.Consumable {
	key = "decrement",
	name = "Decrement",
	set = "Code",
	pos = { x = 9, y = 2 },
	config = { extra = { ante = 1 } },
	atlas = "crp_placeholder",
	loc_vars = function(self, info_queue, card)
		if not card or not card.ability or not card.ability.extra or not card.ability.extra.ante then
			return { vars = { 0 } } 
		end
		return { vars = { lenient_bignum(card.ability.extra.ante) } }
	end,
	can_use = function()
		return G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante % G.hand.config.card_limit == 0
	end,
	use = function(self, card)
		if not card or not card.ability or not card.ability.extra or not card.ability.extra.ante then
			return 
		end
		ease_ante(-lenient_bignum(card.ability.extra.ante))
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wlfredlam0418" }
	}
}

SMODS.Consumable {
	key = "ip_192",
	name = "://IP_192.168.1.1",
	set = "Code",
	pos = { x = 9, y = 2 },
	config = { immutable = { odds = 2727 } },
	atlas = "crp_placeholder",
	loc_vars = function(self, info_queue, card)
		if not card or not card.ability or not card.ability.immutable or not card.ability.immutable.odds then
			return { vars = { 0 } }
		end
		return { vars = { lenient_bignum(card.ability.immutable.odds) } }
	end,
	can_use = function()
		return #G.jokers.cards < G.jokers.config.card_limit
	end,
	use = function(self, card)
		for i = 1, math.max(G.jokers.config.card_limit - #G.jokers.cards, 100) do
			if pseudorandom("crp_ip_192.168.1.1") < 1 / lenient_bignum(card.ability.immutable.odds) then
				SMODS.add_card("j_crp_normalis")
			else
				SMODS.add_card("j_crp_bulgoe")
			end
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" }
	}
}
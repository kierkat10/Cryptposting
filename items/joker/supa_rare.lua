
SMODS.Scoring_Calculation {
    key = "supa",
    func = function(self, chips, mult, flames) return to_big(chips):arrow(27272, mult) end,
    colour = G.C.DARK_EDITION,
    text = "{27272}"
}

-- thank you smods.scoring_calculation for existing
SMODS.Joker {
	key = "supagoe",
	name = "Supagoe",
	config = { },
	rarity = "crp_supa_rare",
	atlas = "crp_placeholder",
	pos = { x = 3, y = 1 },
	cost = 2727272727272727272727272727,
	blueprint_compat = true,
	demicoloncompat = true,
	pronouns = "bulgoe",
	loc_vars = function(self, info_queue, card)
		return { vars = { "{27272}" } }
	end,
	add_to_deck = function(self, card, from_debuff)
		SMODS.set_scoring_calculation("crp_supa")
	end,
	remove_from_deck = function(self, card, from_debuff)
		SMODS.set_scoring_calculation("multiply")
	end,
	crp_credits = {
		idea = { "superb_thing" },
		code = { "Rainstar" }
	}
}

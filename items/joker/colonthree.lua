SMODS.Atlas {
	key = "joker",
	path = "atlas_joker.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = ":3",
	name = ":3",
	rarity = "crp_:3",
	atlas = "crp_joker",
	pos = { x = 6, y = 3 },
	cost = 0,
	blueprint_compat = false,
	demicoloncompat = false,
	in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end,
	crp_credits = {
		idea = { "lord.ruby" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" },
		custom = { key = "colon_3", text = "why are you here; this joker literally does nothing" }
	}
}
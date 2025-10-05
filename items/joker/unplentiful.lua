SMODS.Joker {
	key = "snake_eyes",
	name = "Snake Eyes",
	rarity = "crp_unplentiful",
	atlas = "crp_placeholder",
	pos = { x = 3, y = 0 },
	cost = 5,
	blueprint_compat = false,
	demicoloncompat = false,
	add_to_deck = function(self, card, from_debuff)
		for k, v in pairs(G.GAME.probabilities) do
			G.GAME.probabilities[k] = v / 2
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		for k, v in pairs(G.GAME.probabilities) do
			G.GAME.probabilities[k] = v * 2
		end
	end,
	crp_credits = {
		idea = { "TheLampster" },
		code = { "wilfredlam0418" },
		custom = { key = "alt", text = "Oops! All 6s" }
	}
}
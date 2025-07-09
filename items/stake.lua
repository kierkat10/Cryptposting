SMODS.Stake {
	key = "violet",
	applied_stakes = { "cry_diamond" },
	--[[
	atlas = "?",
	pos = { x = ?, y = ? },
	sticker_atlas = "?",
	sticker_pos = { x = ?, y = ? },
	]]
	shiny = true,
	colour = HEX("8a71e1"),
	above_stake = "cry_diamond",
	modifiers = function()
		G.GAME.starting_params.ante_scaling = 2
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" },
	}
}

SMODS.Stake {
	key = "square",
	applied_stakes = { "cry_ascendant" },
	--[[
	atlas = "?",
	pos = { x = ?, y = ? },
	sticker_atlas = "?",
	sticker_pos = { x = ?, y = ? },
	]]
	shiny = true,
	modifiers = function()
		G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - 1
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" },
	}
}

SMODS.Stake {
	key = "stencil",
	applied_stakes = { "cry_square" },
	--[[
	atlas = "?",
	pos = { x = ?, y = ? },
	sticker_atlas = "?",
	sticker_pos = { x = ?, y = ? },
	]]
	shiny = true,
	colour = HEX("bccacc"),
	modifiers = function()
		G.jokers.config.card_limit = G.jokers.config.card.limit - 1
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" },
	}
}

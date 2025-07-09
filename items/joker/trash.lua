SMODS.Atlas {
	key = "jokers",
	path = "atlas_joker.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "placeholders",
	path = "atlas_placeholder.png",
	px = 71,
	py = 95
}

SMODS.Joker {
    key = "jonkler",
	name = "Jonkler",
    config = { immutable = { arrows = 25000, EEEmult = 1 } },
    rarity = "crp_trash",
    atlas = "crp_joker",
    pos = { x = 8, y = 3 },
    cost = 0,
    blueprint_compat = true,
	demicoloncompat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { "{", "}", } }
    end,   
    calculate = function(self, card, context)
        if (context.joker_main) or context.force_trigger then
            return {
				EEEmult_mod = card.ability.immutable.EEEmult,
                message = "{" .. card.ability.immutable.arrows .. "}" .. card.ability.immutable.EEEmult .. " Mult",
                colour = G.C.EDITION,
                card = card
            }
		end
    end,
	in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end,
    crp_credits = {
        idea = { "Unknown", "Glitchkat10" },
        code = { "Glitchkat10" }
    }
}

SMODS.Joker {
	key = "semicolon",
	name = "Semicolon",
	config = { extra = {  } },
	rarity = "crp_trash",
	atlas = "crp_joker",
	pos = { x = 0, y = 5 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			local ind = nil
			for i, v in pairs(G.jokers.cards) do
				if v == card then ind = i+1 end
			end
			if ind and G.jokers.cards[ind] then
				card_eval_status_text(card, "extra", nil, nil, nil, { message = "plz", colour = { 0.8, 0.45, 0.85, 1 }, delay = 5 } )
				return {
					message = "Nope!",
					delay = 1,
					colour = G.C.PURPLE,
					card = G.jokers.cards[ind]
				}
			end
		end
		return nil
	end,
	in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end,
	crp_credits = {
		idea = { "lord.ruby", "Glitchkat10" },
		art = { "Tatteredlurker" },
		code = { "Glitchkat10", "lord.ruby" }
	}
}

SMODS.Joker {
	key = "googologist",
	name = "Googologist",
	rarity = "crp_trash",
	atlas = "crp_joker",
	pos = { x = 5, y = 0 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { "{", "}" } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "What does that even mean??",
				colour = G.C.EDITION
			}
		end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		art = { "Tatteredlurker" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "none",
    name = "None Joker",
	rarity = "crp_trash",
	atlas = "crp_joker",
	pos = { x = 9, y = 2 },
	cost = 0,
	blueprint_compat = false,
	demicoloncompat = false,
	crp_credits = {
		idea = { "Psychomaniac14" },
		art = { "Psychomaniac14" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "chi_cot",
	name = "Chi Cot",
	rarity = "crp_trash",
	atlas = "crp_placeholder",
	pos = { x = 1, y = 0 },
	cost = 0,
	blueprint_compat = false,
	demicoloncompat = false,
	calculate = function(self, card, context)
		if context.setting_blind and G.GAME.blind.config.blind.key == "bl_small" then
			G.GAME.blind:disable()
			return {
				message = "Blind Disabled!",
				colour = G.C.FILTER
			}
		end
	end,
	crp_credits = {
		idea = { "ScarredOut" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Joker {
	key = "three",
	name = "3.",
	config = { extra = { threes = 0, threes_mod = 3 } },
	rarity = "crp_trash",
	atlas = "crp_joker",
	pos = { x = 4, y = 2 },
	cost = 0,
	blueprint_compat = false,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.threes), lenient_bignum(card.ability.extra.threes_mod) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			card.ability.extra.threes = lenient_bignum(card.ability.extra.threes) + lenient_bignum(card.ability.extra.threes_mod)
			return {
				message = "+" .. lenient_bignum(card.ability.extra.threes_mod) .. " 3s",
				colour = G.C.FILTER
			}
		end
	end,
	crp_credits = {
		idea = { "lunarisillustratez" },
		art = { "lunarisillustratez" },
		code = { "wilfredlam0418" }
	}
}

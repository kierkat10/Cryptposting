SMODS.Atlas {
	key = "blind",
    atlas_table = "ANIMATION_ATLAS",
	path = "atlas_blind.png",
	px = 34,
	py = 34,
	frames = 21
}

SMODS.Blind {
	key = "chance",
	pos = { x = 0, y = 0 },
	boss = { min = 3 },
    mult = 0.5,
    boss_colour = HEX("709284"),
	set_blind = function(self, card, from_blind)
        ease_discard(-G.GAME.current_round.discards_left, nil, true)
    	ease_hands_played(-G.GAME.current_round.hands_left + 1, nil, true)
	end,
	defeat = function(self, card, from_blind)
        ease_discard(G.GAME.current_round.discards_left, nil, true)
    	ease_hands_played(G.GAME.current_round.hands_left, nil, true)
	end,
	disable = function(self, card, from_blind)
        ease_discard(G.GAME.current_round.discards_left, nil, true)
    	ease_hands_played(G.GAME.current_round.hands_left, nil, true)
	end,
    crp_credits = {
		idea = { "Unknown" },
		code = { "Rainstar" }
	}
}

SMODS.Blind {
	key = "skill",
	pos = { x = 0, y = 0 },
	boss = { min = 4 },
    mult = 2,
    boss_colour = HEX("709284"),
	set_blind = function(self, card, from_blind)
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v / 1000000
        end
	end,
	defeat = function(self, card, from_blind)
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v * 1000000
        end
	end,
	disable = function(self, card, from_blind)
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v * 1000000
        end
	end,
    crp_credits = {
		idea = { "Unknown" },
		code = { "Rainstar" }
	}
}

SMODS.Blind {
	key = "dice",
	pos = { x = 0, y = 2 },
	boss = { min = 3, max = 10 },
	atlas = "blind",
    mult = math.random(1, 6),
	boss_colour = HEX("26bc55"),
	disable = function(self, card, from_blind)
		G.GAME.blind.chips = G.GAME.blind.chips / self.mult
	end,
    crp_credits = {
		idea = { "Poker The Poker" },
        art = { "George The Rat" },
		code = { "Glitchkat10" }
	}
}

SMODS.Blind {
	key = "the",
	pos = { x = 0, y = 1 },
	boss = { min = 1, max = 10 },
	atlas = "blind",
	boss_colour = HEX("757575"),
    crp_credits = {
		idea = { "Poker The Poker" },
        art = { "SolvLyi" },
		code = { "Glitchkat10" }
	}
}

SMODS.Blind {
	key = "evil_plant",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
    mult = 2,
    boss_colour = HEX("709284"),
	recalc_debuff = function(self, card, from_blind)
		if card.area ~= G.jokers and not G.GAME.blind.disabled then
			if
					card.base.value == "2"
					or card.base.value == "3"
					or card.base.value == "4"
					or card.base.value == "5"
					or card.base.value == "6"
					or card.base.value == "7"
					or card.base.value == "8"
					or card.base.value == "9"
					or card.base.value == "10"
					or card.base.value == "Ace"
			then
				return true
			end
			return false
		end
	end,
    crp_credits = {
		idea = { "Unknown" },
		code = { "Rainstar" }
	}
}

SMODS.Blind {
	key = "small...?",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
    mult = -1,
    boss_colour = HEX("3a55ab"),
    crp_credits = {
		idea = { "superb_thing" },
        art = { "LocalThunk" },
		code = { "Glitchkat10" }
	}
}

SMODS.Blind {
	key = "big...?",
	pos = { x = 0, y = 1 },
	boss = { min = 2, max = 10 },
    mult = -1.5,
    boss_colour = HEX("e0a23a"),
    crp_credits = {
		idea = { "aqrlr" },
        art = { "LocalThunk" },
		code = { "Glitchkat10" }
	}
}
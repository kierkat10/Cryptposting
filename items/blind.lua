ogblind = Blind.disable
function Blind:disable() -- hook to not let legendary blinds+ be disabled unless you have jean
	if next(SMODS.find_card("j_crp_jean_antoine")) then -- if jean is present, go
		ogblind(self)
	end
	if not self.config.blind.blindrarity then -- if blind doesn't have a special rarity set, go
		ogblind(self)
	end
	-- else, don't disable blind
end
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
	name = "The Chance",
	pos = { x = 0, y = 0 },
	atlas = "blind",
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
	name = "The Skill",
	pos = { x = 0, y = 0 },
	atlas = "blind",
	boss = { min = 4 },
    mult = 2,
    boss_colour = HEX("709284"),
	set_blind = function(self, card, from_blind)
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v / 1.79769e308
        end
	end,
	defeat = function(self, card, from_blind)
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v * 1.79769e308
        end
	end,
	disable = function(self, card, from_blind)
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v * 1.79769e308
        end
	end,
    crp_credits = {
		idea = { "Unknown" },
		code = { "Rainstar" }
	}
}

SMODS.Blind {
	key = "dice",
	name = "The Dice",
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
	name = "The",
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
	name = "The EVIL Plant",
	pos = { x = 0, y = 19 },
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
	name = "Small Blind...?",
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
	name = "Big Blind...?",
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
SMODS.Blind {
	key = "joker",
	name = "Joker",
	pos = { x = 0, y = 0 },
	boss = { min = 1, max = 10 },
	atlas = "blind",
	mult = 1,
	set_blind = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips + 4
	end,
	disable = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips - 4
	end,
	boss_colour = HEX("f7343e"),
    crp_credits = {
		idea = { "Unknown" },
		code = { "ScarredOut" }
	}
}
SMODS.Blind {
	key = "gloom",
	name = "Gloom",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
	atlas = "blind",
	mult = 2,
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and not G.GAME.blind.disabled and card:is_jolly() then -- since this is a cryptid addon we'll use cryptids function for this
			return true
		end
		return false
	end,
	boss_colour = HEX("364961"),
    crp_credits = {
		idea = { "Unknown" },
		code = { "ScarredOut" }
	}
}
SMODS.Blind {
	key = "monochrome_m",
	name = "Monochrome M",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10, showdown = true},
	atlas = "blind",
	mult = 0.13,
	disable = function(self)
		
	end,
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and not G.GAME.blind.disabled and not (card:is_jolly()) and not card.key == "j_chicot" and not card.key == "j_crp_jean_antoine" then -- since this is a cryptid addon we'll use cryptids function for this
			return true -- also manually doing that sucks but whatever
		end
		return false
	end,
	debuff_hand = function(self, cards, hand, handname, check)
		if not (handname == "Pair") and not G.GAME.blind.disabled then
			G.GAME.blind.triggered = true
			return true
		end
		return false
	end,
	get_loc_debuff_text = function(self) -- we do a little cryptid stealing
		return localize("bl_crp_debuff_monochrome_m")
	end,
	boss_colour = HEX("000000"),
    crp_credits = {
		idea = { "Unknown" },
		code = { "ScarredOut" }
	}
}

SMODS.Blind {
	key = "eternal_eclipse",
	name = "Eternal Eclipse",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10, showdown = true },
	atlas = "blind",
	mult = 2,
	set_blind = function(self)
		local planets_used -- set variable up
		local sizeperplanet = 0.1
		if G.GAME.consumeable_usage_total then
			planets_used = G.GAME.consumeable_usage_total.planet or 0 -- how many planets used
		else
			planets_used = 0
		end
		G.GAME.blind.chips = G.GAME.blind.chips * (1 + (planets_used * sizeperplanet))
	end,
	disable = function(self)
		local planets_used -- set variable up
		local sizeperplanet = 0.1
		if G.GAME.consumeable_usage_total then
			planets_used = G.GAME.consumeable_usage_total.planet or 0 -- how many planets used
		else
			planets_used = 0
		end
		G.GAME.blind.chips = G.GAME.blind.chips / (1 + (planets_used * sizeperplanet)) -- NOTE: this will probably reduce further if you use a planet card during a blind, but the only way i can think of to do that is luchador so i don't feel like fixing it rn
	end,
	boss_colour = HEX("4fb1db"),
    crp_credits = {
		idea = { "lunarisillustratez" },
		code = { "ScarredOut" }
	}
}

-- Legendary Blinds (Only appear when a Legendary+ Joker is owned)

local valid_leg_blind_keys = { -- List of rarities that will allow these to spawn
	[4] = true,
	["crp_awesome"] = true,
	["cry_exotic"] = true,
	["crp_exotic_2"] = true,
	["crp_mythic"] = true,
	["crp_exomythic"] = true,
	["crp_2exomythic4me"] = true,
	["crp_22exomythic4mecipe"] = true,
	["crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe"] = true,
	["crp_hyperexomythicepicawesomeuncommon2mexotic2gigaomegaalphaomnipotranscendant2exomythic4mecipe"] = true,
}

SMODS.Blind {
	key = "roadblock",
	name = "The Roadblock (L+)",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
	blindrarity = "Legendary",	
	in_pool = function(self)
		if G.jokers then
			for _, joker in pairs(G.jokers.cards) do
				local rarity = joker.config.center.rarity -- stolen from chibidoki code
				if type(rarity) == "number" and rarity >= 4 then
					return true
					-- check for known string-based rarities
				elseif type(rarity) == "string" and valid_leg_blind_keys[rarity] then
					return true
				end
			end
		end
		-- if we're out of the loop then there isn't a joker that allows this to spawn
		return false
	end,
	atlas = "blind",
	mult = 1,
	set_blind = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips ^ 2
	end,
	disable = function(self)
		G.GAME.blind.chips = math.sqrt(G.GAME.blind.chips) -- reverse the effect
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips) -- make sure it shows up
	end,
	boss_colour = HEX("404215"),
    crp_credits = {
		idea = { "Unknown" },
		code = { "ScarredOut", "Psychomaniac14" }
	}
}

-- ExoMythic Blinds
local valid_exomyth_blind_keys = { -- ist of rarities that will allow these to spawn
	["crp_exomythic"] = true,
	["crp_2exomythic4me"] = true,
	["crp_22exomythic4mecipe"] = true,
	["crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe"] = true,
	["crp_hyperexomythicepicawesomeuncommon2mexotic2gigaomegaalphaomnipotranscendant2exomythic4mecipe"] = true,
}

SMODS.Blind {
	key = "epioxus",
	name = "Epioxus (EM+)",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
	blindrarity = "ExoMythic",
	mult = 1e100, -- a miniscule amount of trolling
	in_pool = function(self)
		if G.jokers then
			for _, joker in pairs(G.jokers.cards) do
				local rarity = joker.config.center.rarity -- stolen from chibidoki code
				if type(rarity) == "string" and valid_exomyth_blind_keys[rarity] then
					return true
				end
			end
		end
		-- if we're out of the loop then there isn't a joker that allows this to spawn
		return false
	end,
	atlas = "blind",
	defeat = function(self) -- filthy evil fucked up hack in the next line
		if not next(SMODS.find_card("j_crp_jean_antoine")) then  -- not sure how i would go about using disable for this so we'll just do it like this for now
			local anteval = G.GAME.round_resets.ante * 10
			ease_ante(anteval)
		end
	end,
	boss_colour = HEX("b8bf11"),
    crp_credits = {
		idea = { "Grahkon" },
		code = { "ScarredOut" }
	}
}
SMODS.Blind {
	key = "calamitus",
	name = "Calamitus (EM+)",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
	blindrarity = "ExoMythic",
	mult = 1e100, -- a miniscule amount of trolling
	in_pool = function(self)
		if G.jokers then
			for _, joker in pairs(G.jokers.cards) do
				local rarity = joker.config.center.rarity -- stolen from chibidoki code
				if type(rarity) == "string" and valid_exomyth_blind_keys[rarity] then
					return true
				end
			end
		end
		-- if we're out of the loop then there isn't a joker that allows this to spawn
		return false
	end,
	atlas = "blind",
	debuff_card = function(self, card, from_blind)
        if (card.area ~= G.jokers) and (card:is_suit("Hearts", true) or card:is_suit("Diamonds", true) or card:is_suit("Spades", true) or card:is_suit("Clubs", true)) and not next(SMODS.find_card("j_crp_jean_antoine")) then
            return true
        end
        return false
    end,
	boss_colour = HEX("ff0055"),
    crp_credits = {
		idea = { "Grahkon" },
		code = {"ScarredOut"}
	}
}
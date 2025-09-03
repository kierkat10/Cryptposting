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
-- Pokios effect hook
ogupdate = Game.update
function Game:update(dt)
	ogupdate(self, dt)
	if G.GAME.blind then -- prevent exploding if theres no blind active
		if G.GAME.blind.name == "Pokios (EM+)" then -- if blind is pokios...
			if not next(SMODS.find_card("j_crp_jean_antoine")) then -- and no jean...
				G.GAME.blind.chips = G.GAME.blind.chips ^ 2 -- destroy the game
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		elseif G.GAME.blind.name == "Hermes (S, EM+)" then -- if blind is hermes...
			if not next(SMODS.find_card("j_crp_jean_antoine")) then -- and no jean...
				local eeeblindchips = 1.00001
				G.GAME.blind.chips = G.GAME.blind.chips:arrow(3, eeeblindchips) -- destroy the game even more
				eeeblindchips = eeeblindchips + 0.00001
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
	end
end

SMODS.Blind {
	key = "chance",
	name = "The Chance",
	pos = { x = 0, y = 0 },
	atlas = "blind",
	boss = { min = 3 },
    mult = 0.5,
    boss_colour = HEX("6f9e00"), -- the needle's main art color with saturation at 100
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
	boss_colour = HEX("1a515f"), -- border color of the doctor's cap in the "diagnosis: skill issue" meme
    mult = 2,
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

--[[
SMODS.Blind {
	key = "evil",
	name = "The EVIL",
	pos = { x = 0, y = 0 },
	atlas = "blind",
	boss = { min = 5 },
	boss_colour = HEX("ff0000"), -- yeah idk what this could POSSIBLY be referencing
	set_blind = function(self, card, from_blind)
		if (card.area == G.jokers) and not G.GAME.blind.disabled and card.config.center.evil then
			local card_id = card.config.center.evil
			card:start_dissolve()
			card:remove_from_deck()
			SMODS.add_card({ key = card_id })
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "wilfredlam0418" }
	}
}
]]--

SMODS.Blind {
	key = "dice",
	name = "The Dice",
	pos = { x = 0, y = 2 },
	boss = { min = 3, max = 10 },
	atlas = "blind",
	mult = math.random(1, 6), -- i really wish this could use pseudoseed, but the game crashes if i try
	boss_colour = HEX("4bc292"), -- oops! all 6s main color
	disable = function(self, card, from_blind)
		G.GAME.blind.chips = G.GAME.blind.chips / self.mult
	end,
    crp_credits = {
		idea = { "Poker The Poker" },
        art = { "George The Rat", "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Blind {
	key = "garbage",
	name = "The Garbage",
	pos = { x = 0, y = 0 },
	boss = { min = 3 },
	atlas = "blind",
	boss_colour = HEX("606060"), -- average of trash's gradient
	set_blind = function(self, card, from_blind)
		if not G.GAME.blind_disabled then
			for i = 1, #G.consumeables.cards do
				G.consumeables.cards[i]:start_disssolve()
				G.consumeables.cards[i]:remove_from_deck()
			end
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Blind {
	key = "the",
	name = "The",
	pos = { x = 0, y = 1 },
	boss = { min = 1, max = 10 },
	atlas = "blind",
	boss_colour = HEX("757575"), -- was the main color of the pre-existing art
    crp_credits = {
		idea = { "Poker The Poker" },
        art = { "SolvLyi", "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Blind {
	key = "evil_plant",
	name = "The EVIL Plant",
	pos = { x = 0, y = 19 },
	boss = { min = 2, max = 10 },
    mult = 2,
    boss_colour = HEX("709284"), -- same color as the plant
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
    boss_colour = HEX("3a55ab"), -- same color as small blinds
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
    boss_colour = HEX("e0a23a"), -- same color as big blinds
    crp_credits = {
		idea = { "aqrlr" },
        art = { "LocalThunk" },
		code = { "Glitchkat10" }
	}
}

SMODS.Blind {
	key = "joker",
	name = "The Joker",
	pos = { x = 0, y = 0 },
	boss = { min = 1, max = 10 },
	atlas = "blind",
	boss_colour = HEX("fd812b"), -- joker rarity color (which in of itself is the average of jimbo's red and orange hat colors)
	mult = 1,
	set_blind = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips + 4
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
	disable = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips - 4
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
    crp_credits = {
		idea = { "Unknown" },
		code = { "ScarredOut" }
	}
}

SMODS.Blind {
	key = "serious",
	name = "The Serious",
	pos = { x = 0, y = 0 },
	boss = { min = 5 },
	atlas = "blind",
	boss_colour = HEX("a0a0a0"), -- just a general gray color
	mult = 1.75,
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and card.config.center.mod and card.config.center.mod.id == "cryptposting" then
			return true
		end
		return false
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Blind {
	key = "shitpost",
	name = "The Shitpost",
	pos = { x = 0, y = 0 },
	boss = { min = 5 },
	atlas = "blind",
	boss_colour = HEX("0a0a0a"), -- idk
	mult = 0.75,
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and card.config.center.mod and card.config.center.mod.id == "cryptposting" then
			return false
		end
		return false
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Blind {
	key = "balance",
	name = "The Balance",
	pos = { x = 0, y = 0 },
	boss = { min = 5 },
	atlas = "blind",
	mult = 1.75,
	boss_colour = HEX("8924d2"), -- main color of cryptid's purple scalae
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and card.config.center.mod and card.config.center.mod.id == "Cryptid" then
			return true
		end
		return false
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Blind {
	key = "offset",
	name = "The Offset",
	pos = { x = 0, y = 0 },
	boss = { min = 5 },
	atlas = "blind",
	mult = 0.75,
	boss_colour = HEX("96ffb0"), -- border color of code cards (referencing ://OFF_BY_ONE)
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and card.config.center.mod and card.config.center.mod.id == "Cryptid" then
			return false
		end
		return true
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Blind {
	key = "gloom",
	name = "Gloom",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
	atlas = "blind",
	boss_colour = HEX("a66943"), -- complementary color of cryptid's jolly color
	mult = 2,
	recalc_debuff = function(self, card, from_blind)
		if (card.area == G.jokers) and not G.GAME.blind.disabled and (card:is_jolly() or (Cryptid.safe_get(card.config.center, "pools", "M"))) then -- since this is a cryptid addon we'll use cryptids function for this
			return true
		end
		return false
	end,
    crp_credits = {
		idea = { "Unknown" },
		code = { "ScarredOut" }
	}
}

SMODS.Blind {
	key = "monochrome_m",
	name = "Monochrome M",
	pos = { x = 0, y = 8 },
	boss = { min = 2, max = 10, showdown = true },
	atlas = "blind",
	mult = 0.13,
	recalc_debuff = function(self, card, from_blind)
		if ((card.area == G.jokers)
		and not G.GAME.blind.disabled
		and (card:is_jolly() or (Cryptid.safe_get(card.config.center, "pools", "M"))))
		and (card.config.center.key ~= "j_chicot" and card.config.center.key ~= "j_crp_jean_antoine") then -- since this is a cryptid addon we'll use cryptids function for this
			return false
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
	boss_colour = HEX("4f6367"), -- balatro black (*monochrome* m)
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
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
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
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
	boss_colour = HEX("4fb1db"), -- yeah idk
    crp_credits = {
		idea = { "lunarisillustratez" },
		code = { "ScarredOut" }
	}
}

SMODS.Blind {
	key = "hazard",
	name = "The Hazard",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
	atlas = "blind",
	mult = 2,
	set_blind = function(self)
        for i, v in pairs(G.jokers.cards) do
            local check = false
            if not Card.no(G.jokers.cards[i], "immutable", true) then
                check = true
				Cryptid.manipulate(G.jokers.cards[i], { value = 0.5 })
            end
        end
	end,
	disable = function(self)
        for i, v in pairs(G.jokers.cards) do
            local check = false
            if not Card.no(G.jokers.cards[i], "immutable", true) then
                check = true
				Cryptid.manipulate(G.jokers.cards[i], { value = 2 })
            end
        end
	end,
	boss_colour = HEX("4fb1db"),
    crp_credits = {
		idea = { "Unknown" },
		code = { "Rainstar" }
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
	["crp_all"] = true,
}

SMODS.Blind {
	key = "roadblock",
	name = "The Roadblock (L+)",
	pos = { x = 0, y = 3 },
	boss = { min = 2, max = 10 },
	boss_colour = HEX("98a1b2"), -- same color as the pre-existing art
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
    crp_credits = {
		idea = { "Unknown" },
		art = { "yahooyowza", "Glitchkat10" },
		code = { "ScarredOut", "Psychomaniac14" }
	}
}


SMODS.Blind {
	key = "roulette",
	name = "The Roulette (L+)",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
	boss_colour = HEX("98a1b2"),
	blindrarity = "Legendary",
	in_pool = function(self)
		if G.jokers then
			for _, joker in pairs(G.jokers.cards) do
				local rarity = joker.config.center.rarity
				if type(rarity) == "number" and rarity >= 4 then
					return true
				elseif type(rarity) == "string" and valid_leg_blind_keys[rarity] then
					return true
				end
			end
		end
		return false
	end,
	atlas = "blind",
	mult = 1,
	set_blind = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips ^ math.random(1, 1.6)
	end,
	defeat = function(self, card, from_blind)
		ease_dollars((G.GAME.dollars * 3.6) - G.GAME.dollars)
	end,
	disable = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips ^ math.random(1, 0.625) -- so like i had this funny idea where the blind size reduction when disabled is ALSO randomized
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
    crp_credits = {
		idea = { "Unknown" },
		art = { "superb_thing" },
		code = { "Rainstar" }
	}
}

-- ExoMythic Blinds
local valid_exomyth_blind_keys = { -- list of rarities that will allow these to spawn
	["crp_exomythic"] = true,
	["crp_2exomythic4me"] = true,
	["crp_22exomythic4mecipe"] = true,
	["crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe"] = true,
	["crp_hyperexomythicepicawesomeuncommon2mexotic2gigaomegaalphaomnipotranscendant2exomythic4mecipe"] = true,
	["crp_all"] = true,
}

SMODS.Blind {
	key = "epioxus",
	name = "Epioxus (EM+)",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
	blindrarity = "ExoMythic",
	mult = 1e100, -- a miniscule amount of trolling
	dollars = 5,
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
			ease_ante(G.GAME.round_resets.ante * 10)
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
	dollars = 5,
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
		code = { "ScarredOut" }
	}
}
SMODS.Blind {
	key = "pokios",
	name = "Pokios (EM+)",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10 },
	blindrarity = "ExoMythic",
	mult = 2,
	defeat = function(self, card, from_blind)
		ease_dollars((G.GAME.dollars ^ 22) - G.GAME.dollars)
	end,
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
	-- effect of this boss is in the hook at the top of this file (can't do what eternity did, trust me I tried that)
	boss_colour = HEX("2b7037"),
    crp_credits = {
		idea = { "Unknown" },
		code = { "ScarredOut" }
	}
}
SMODS.Blind {
	key = "quettus",
	name = "Quettus (S, EM+)",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10, showdown = true },
	blindrarity = "ExoMythic",
	mult = 1,
	defeat = function(self, card, from_blind)
		ease_dollars((G.GAME.dollars * 5e8) - G.GAME.dollars)
	end,
	in_pool = function(self)
		if G.jokers then
			for _, joker in pairs(G.jokers.cards) do
				local rarity = joker.config.center.rarity -- stolen from chibidoki code
				if type(rarity) == "string" and valid_exomyth_blind_keys[rarity] then
					-- now we do a "is this a showdown ante" check
					if G.GAME.round_resets.ante % G.GAME.win_ante == 0 then
						return true
					end
				end
			end
		end
		-- if we're out of the loop then there isn't a joker that allows this to spawn
		return false
	end,
	set_blind = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips ^ 10 -- scoring req effect
		if not next(SMODS.find_card("j_crp_jean_antoine")) then -- reuse code to check if rarity is legendary or above
			if G.jokers then -- jean still solos (it'd be lame if your boss disabling joker didn't disable the boss)
				for _, joker in pairs(G.jokers.cards) do
					local rarity = joker.config.center.rarity
					if type(rarity) == "number" and rarity >= 4 then
						if not (joker.ability.cry_absolute or joker.ability.eternal) then -- still check for eternal so theres interesting counterplay to this
							-- KILL............
							joker:start_dissolve()
						end
					elseif type(rarity) == "string" and valid_leg_blind_keys[rarity] then
						if not (joker.ability.cry_absolute or joker.ability.eternal) then
							-- KILL............
							joker:start_dissolve()
						end
					end
				end
			end
		end
	end,
	disable = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips ^ 0.1 -- reverse the effect
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips) -- make sure it shows up
	end,
	atlas = "blind",
	boss_colour = HEX("000000"),
    crp_credits = {
		idea = { "superb_thing" },
		code = { "ScarredOut" }
	}
}


SMODS.Blind {
	key = "hermes",
	name = "Hermes (S, EM+)",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10, showdown = true },
	blindrarity = "ExoMythic",
	mult = 1e100,
	defeat = function(self, card, from_blind)
		ease_dollars((G.GAME.dollars ^ 300) - G.GAME.dollars)
	end,
	in_pool = function(self)
		if G.jokers then
			for _, joker in pairs(G.jokers.cards) do
				local rarity = joker.config.center.rarity -- stolen from chibidoki code
				if type(rarity) == "string" and valid_exomyth_blind_keys[rarity] then
					-- now we do a "is this a showdown ante" check
					if G.GAME.round_resets.ante % G.GAME.win_ante == 0 then
						return true
					end
				end
			end
		end
		-- if we're out of the loop then there isn't a joker that allows this to spawn
		return false
	end,
	-- effect is also in the hook at the top of the file (thanks scarred)
	atlas = "blind",
	boss_colour = HEX("000000"),
    crp_credits = {
		idea = { "Grahkon" },
		code = { "Rainstar" }
	}
}

SMODS.Blind {
	key = "lacum_draconis",
	name = "Lacum Draconis (S, EM+)",
	pos = { x = 0, y = 0 },
	boss = { min = 2, max = 10, showdown = true },
	blindrarity = "ExoMythic",
	mult = 1e100,
	defeat = function(self, card, from_blind)
		ease_dollars((G.GAME.dollars ^ 187.3) - G.GAME.dollars)
	end,
	in_pool = function(self)
		if G.jokers then
			for _, joker in pairs(G.jokers.cards) do
				local rarity = joker.config.center.rarity -- stolen from chibidoki code
				if type(rarity) == "string" and valid_exomyth_blind_keys[rarity] then
					-- now we do a "is this a showdown ante" check
					if G.GAME.round_resets.ante % G.GAME.win_ante == 0 then
						return true
					end
				end
			end
		end
		-- if we're out of the loop then there isn't a joker that allows this to spawn
		return false
	end,
	set_blind = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips:arrow(4, math.random(1, 20))
	end,
	disable = function(self)
		G.GAME.blind.chips = G.GAME.blind.chips:arrow(4, math.random(1, 0.05))
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips) -- make sure it shows up
	end,
	atlas = "blind",
	boss_colour = HEX("000000"),
    crp_credits = {
		idea = { "Grahkon" },
		code = { "Rainstar" }
	}
}

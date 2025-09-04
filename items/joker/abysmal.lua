SMODS.Joker {
	key = "bulgoe_bot",
	name = "Bulgoe Bot",
	config = { extra = { mult = 27, chips = 27, odds = 27 } },
	rarity = "crp_abysmal",
	atlas = "crp_joker",
	pos = { x = 4, y = 6 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	pools = { Bulgoe = true },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.mult),
				lenient_bignum(card.ability.extra.chips),
				cry_prob(
					card.ability.cry_prob,
					lenient_bignum(card.ability.extra.odds),
					card.ability.cry_rigged
				),
				lenient_bignum(card.ability.extra.odds),
			}
		}
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "÷" .. lenient_bignum(card.ability.extra.chips) .. " Chips",
				Xchip_mod = 1 / lenient_bignum(card.ability.extra.chips),
				colour = G.C.CHIPS,
				extra = {
					message = "÷" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
					Xmult_mod = 1 / lenient_bignum(card.ability.extra.mult),
					colour = G.C.MULT,
				},
			}
		end
		if (context.setting_blind and pseudorandom("crp_bulgoe_bot") < cry_prob(card.ability.cry_prob, lenient_bignum(card.ability.extra.odds), card.ability.cry_rigged) / lenient_bignum(card.ability.extra.odds)) or context.forcetrigger then
			for i = 1, #G.jokers.cards do
				if not G.jokers.cards[i] == card and not G.jokers.cards[i].ability.eternal then
					G.jokers.cards[i]:start_dissolve()
					G.jokers.cards[i]:remove_from_deck()
				end
			end
		end
		if (context.setting_blind or context.forcetrigger) and pseudorandom("crp_bulgoe_bot_remove") < 1 / 27 then
			card:start_dissolve()
			card:remove_from_deck()
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		code = { "wilfredlam0418" },
	}
}

-- tries to kill itself like a thousand times when cursed jokers detected, even in the collection
--[[
SMODS.Joker {
	key = "evil_riff_raff",
	name = "EVIL Riff-Raff",
	config = { extra = { cards = 2 } },
	rarity = "crp_abysmal",
	atlas = "crp_placeholder",
	evil = "j_riff_raff",
	pos = { x = 0, y = 0 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.cards) } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind or context.forcetrigger then
			for i = 1, card.ability.extra.cards do
				if #G.jokers.cards < G.jokers.config.card_limit or context.forcetrigger then
					SMODS.add_card({ set = "Joker", rarity = "cry_cursed" })
				end
			end
		end
	end,
	update = function(self, card)
		if #Cryptid.advanced_find_joker(nil, "cry_cursed", nil, nil, true) >= 10 then
			card:start_dissolve()
			card:remove_from_deck()
		end
	end,
	crp_credits = {
		idea = { "wilfredlam0418" },
		code = { "wilfredlam0418" }
	}
}
]]--

SMODS.Joker {
	key = "heptation_hank",
	name = "Heptation Hank",
	config = { immutable = { arrows = 5, self_destruct = 10 ^ 10 ^ 1.1 }, extra = { mantissa = 0.9 } },
	rarity = "crp_abysmal",
	atlas = "crp_placeholder",
	pos = { x = 0, y = 0 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				lenient_bignum(card.ability.extra.mantissa),
				lenient_bignum(math.log10(math.log10(card.ability.immutable.self_destruct))),
			}
		}
	end,
	remove_from_deck = function(self, card, from_debuff)
		for i = 1, #G.jokers.cards do
			if
				G.jokers.cards[i].config.center.key == "j_crp_tetration_timmy" or
				G.jokers.cards[i].config.center.key == "j_crp_pentation_peter" or
				G.jokers.cards[i].config.center.key == "j_crp_hexation_henry" or
				G.jokers.cards[i].config.center.key == "septingentiquinvigintation_stevie"
			then
				G.jokers.cards[i]:set_debuff(false)
			end
		end
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				hypermult = {
					lenient_bignum(card.ability.immutable.arrows),
					lenient_bignum(card.ability.extra.mantissa)
				},
				hypermult_message = {
					message = "^^^^^" .. lenient_bignum(card.ability.extra.mantissa) .. " Mult",
					colour = G.C.EDITION,
					sound = "crp_heptationalmult"
				}
			}
		end
		if context.before or context.after then
			for i = 1, #G.jokers.cards do
				if
					G.jokers.cards[i].config.center.key == "j_crp_tetration_timmy" or
					G.jokers.cards[i].config.center.key == "j_crp_pentation_peter" or
					G.jokers.cards[i].config.center.key == "j_crp_hexation_henry" or
					G.jokers.cards[i].config.center.key == "septingentiquinvigintation_stevie"
				then
					G.jokers.cards[i]:set_debuff(true)
				end
			end
		end
		if context.after and (to_big(G.GAME.chips or 0)) > to_big(card.ability.immutable.self_destruct) then
			card:start_dissolve()
			card:remove_from_deck()
		end
	end,
	crp_credits = {
		idea = { "Psychomaniac14" },
		code = { "wilfredlam0418" }
	}
}

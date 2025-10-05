SMODS.Joker {
	key = "souper_m",
	name = "SOUPER m!!!",
	config = { extra = { xmult = 13, emult = 1, emult_mod = 13 } },
	atlas = "crp_joker",
	pos = { x = 1, y = 1 },
    soul_pos = { x = 2, y = 1 },
	rarity = "crp_divine",
	cost = 35,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_duo
		return { vars = { lenient_bignum(card.ability.extra.xmult), lenient_bignum(card.ability.extra.emult), lenient_bignum(card.ability.extra.emult_mod) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				xmult = lenient_bignum(card.ability.extra.xmult),
				colour = G.C.MULT,
				extra = {
					emult = lenient_bignum(card.ability.extra.emult),
					emult_message = {
						message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
						colour = G.C.DARK_EDITION,
						sound = "talisman_emult"
					}
				}
			}
		end
		if context.selling_card and context.card.config.center.key == "j_duo" then
			card.ability.extra.emult = lenient_bignum(card.ability.extra.emult) + lenient_bignum(card.ability.extra.emult_mod)
			return {
				message = localize("k_upgrade_ex"),
				colour = G.C.DARK_EDITION,
			}
		end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		code = { "Rainstar", "Glitchkat10" }
	}
}
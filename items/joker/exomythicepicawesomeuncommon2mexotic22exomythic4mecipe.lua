SMODS.Joker {
	key = "septingentiquinvigintation_stevie",
	name = "septingentiquinvigintation stevie",
	config = { immutable = { arrows = 723 }, extra = { mantissa = 1e111, placebo = 1.1 } },
	rarity = "crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
	atlas = "crp_placeholder",
	pos = { x = 12, y = 0 },
	cost = 1600,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.placebo) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				hypermult = {
					lenient_bignum(card.ability.immutable.arrows),
					lenient_bignum(card.ability.extra.mantissa)
				},
				hypermult_message = { -- oh god
					message = "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" .. lenient_bignum(card.ability.extra.placebo) .. " Mult",
					colour = G.C.EDITION,
					sound = "crp_heptationalmult"
				}
			}
		end
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker { -- septingentiquinvigintation stevie is no longer lonely
	key = "expansion",
	name = "Expansion",
	config = { },
	rarity = "crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
	atlas = "crp_placeholder",
	pos = { x = 12, y = 0 },
	cost = 1600,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { "{{1}}" } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			local currentmult = mult
			if currentmult < to_big(1e308) then
				return {
					hypermult = {
						math.floor(lenient_bignum(currentmult) + 0.5),
						math.floor(lenient_bignum(currentmult) + 0.5)
					},
					hypermult_message = {
						message = "{" .. math.floor(lenient_bignum(currentmult) + 0.5) .. "}" .. math.floor(lenient_bignum(currentmult) + 0.5) .. " Mult",
						colour = G.C.EDITION,
						sound = "crp_heptationalmult"
					}
				}
			else
				return {
					hypermult = {
						1e308,
						1e308
					},
					hypermult_message = {
						message = "{1e308}1e308 Mult",
						colour = G.C.EDITION,
						sound = "crp_heptationalmult"
					}
				}
			end
		end
	end,
	crp_credits = {
		idea = { "wilfredlam0418" },
		code = { "Rainstar" }
	}
}
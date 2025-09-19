SMODS.Atlas {
	key = "joker",
	path = "atlas_joker.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = "quetta_m",
	name = "Quetta M",
	config = { extra = { operator = -1, mult = 8, operator_increase = 8 }, immutable = { numerator = 13, denominator = 100 } },
	rarity = "crp_22exomythic4mecipe",
	atlas = "crp_joker",
	pos = { x = 2, y = 3 },
	soul_pos = { x = 3, y = 3, extra = { x = 4, y = 3 } },
	cost = 800,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.operator), lenient_bignum(card.ability.extra.mult), lenient_bignum(card.ability.extra.operator_increase), "{", "}" } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if to_big(card.ability.extra.operator) <= to_big(-1) then
				return {
					mult = lenient_bignum(card.ability.extra.mult)
				}
			elseif to_big(card.ability.extra.operator) == to_big(0) then
				return {
					Xmult = lenient_bignum(card.ability.extra.mult)
				}
			elseif to_big(card.ability.extra.operator) == to_big(1) then
				return {
					emult = lenient_bignum(card.ability.extra.mult),
					emult_message = {
						message = "^" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
						colour = G.C.DARK_EDITION,
						sound = "talisman_emult"
					}
				}
			elseif to_big(card.ability.extra.operator) == to_big(2) then
				return {
					eemult = lenient_bignum(card.ability.extra.mult),
					eemult_message = {
						message = "^^" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
						colour = G.C.DARK_EDITION,
						sound = "talisman_eemult"
					}
				}
			elseif to_big(card.ability.extra.operator) == to_big(3) then
				return {
					eeemult = lenient_bignum(card.ability.extra.mult),
					eeemult_message = {
						message = "^^^" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
						colour = G.C.EDITION,
						sound = "talisman_eeemult"
					}
				}
			elseif to_big(card.ability.extra.operator) == to_big(4) then
				return {
					hypermult = {
						lenient_bignum(card.ability.extra.operator),
						lenient_bignum(card.ability.extra.mult)
					},
					hypermult_message = {
						message = "{" .. number_format(lenient_bignum(card.ability.extra.operator)) .. "}" .. number_format(lenient_bignum(card.ability.extra.mult)) .. " Mult",
						colour = G.C.EDITION,
						sound = "crp_hexationalmult"
					}
				}
			elseif to_big(card.ability.extra.operator) >= to_big(5) then  -- guys the elseif chain isn't THAT massive syfm 🥀
				return {
					hypermult = {
						lenient_bignum(card.ability.extra.operator),
						lenient_bignum(card.ability.extra.mult)
					},
					hypermult_message = {
						message = "{" .. number_format(lenient_bignum(card.ability.extra.operator)) .. "}" .. number_format(lenient_bignum(card.ability.extra.mult)) .. " Mult",
						colour = G.C.EDITION,
						sound = "crp_heptationalmult"
					}
				}
			end
		end
		if (context.before and context.scoring_name == "Pair" and not context.blueprint) or context.forcetrigger then
			if to_big(pseudorandom("quetta_m")) <= to_big(lenient_bignum(card.ability.immutable.numerator) / lenient_bignum(card.ability.immutable.denominator)) then
				card.ability.extra.operator = lenient_bignum(card.ability.extra.operator) + lenient_bignum(card.ability.extra.operator_increase)
				return {
					message = "Upgraded!",
					colour = G.C.EDITION
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10", "superb_thing" },
		art = { "George The Rat" },
		code = { "Rainstar", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "generic_scaling_operator", -- goodbye playerrwon
	name = "Generic Scaling Hyperoperator Joker",
	config = { extra = { arrows = 1, placebo = 2, arrows_scale = 1, mult = 2 }, immutable = { max = 9827 } },
	rarity = "crp_22exomythic4mecipe",
	atlas = "crp_placeholder",
	pos = { x = 10, y = 0 },
	-- soul_pos = { x = 0, y = 0, extra = { x = 0, y = 0 } },
	cost = 800,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(math.min(lenient_bignum(card.ability.extra.arrows), lenient_bignum(card.ability.immutable.max))), lenient_bignum(card.ability.extra.placebo), lenient_bignum(card.ability.extra.arrows_scale), "{", "}" } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			if to_big(card.ability.extra.arrows) < to_big(100) then
				card.ability.extra.mult = lenient_bignum(card.ability.extra.placebo)
			end
			if to_big(card.ability.extra.operator) == to_big(1) then
				return {
					emult = lenient_bignum(card.ability.extra.mult),
					emult_message = {
						message = "^" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
						colour = G.C.DARK_EDITION,
						sound = "talisman_emult"
					}
				}
			elseif to_big(card.ability.extra.operator) == to_big(2) then
				return {
					eemult = lenient_bignum(card.ability.extra.mult),
					eemult_message = {
						message = "^^" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
						colour = G.C.DARK_EDITION,
						sound = "talisman_eemult"
					}
				}
			elseif to_big(card.ability.extra.operator) == to_big(3) then
				return {
					eeemult = lenient_bignum(card.ability.extra.mult),
					eeemult_message = {
						message = "^^^" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
						colour = G.C.EDITION,
						sound = "talisman_eeemult"
					}
				}
			elseif to_big(card.ability.extra.operator) == to_big(4) then
				return {
					hypermult = {
						lenient_bignum(card.ability.extra.operator),
						lenient_bignum(card.ability.extra.mult)
					},
					hypermult_message = {
						message = "{" .. number_format(lenient_bignum(card.ability.extra.operator)) .. "}" .. number_format(lenient_bignum(card.ability.extra.mult)) .. " Mult",
						colour = G.C.EDITION,
						sound = "crp_hexationalmult"
					}
				}
			elseif to_big(card.ability.extra.operator) >= to_big(5) then
				return {
					hypermult = {
						lenient_bignum(card.ability.extra.operator),
						lenient_bignum(card.ability.extra.mult)
					},
					hypermult_message = {
						message = "{" .. number_format(lenient_bignum(card.ability.extra.operator)) .. "}" .. number_format(lenient_bignum(card.ability.extra.mult)) .. " Mult",
						colour = G.C.EDITION,
						sound = "crp_heptationalmult"
					}
				}
			end
		end
		if (context.end_of_round and not context.blueprint and not context.retrigger and context.main_eval) or context.forcetrigger then
			card.ability.extra.arrows = lenient_bignum(card.ability.extra.arrows) + lenient_bignum(card.ability.extra.arrows_scale)
			if to_big(card.ability.extra.arrows) > to_big(100) then
				card.ability.extra.mult = lenient_bignum(1e300)
			end
			if card.ability.extra.arrows_scale == 1 then
				return {
					message = "+" .. (lenient_bignum(card.ability.extra.arrows_scale)) .. " Arrow",
					colour = G.C.EDITION
				}
			else
				return {
					message = "+" .. (lenient_bignum(card.ability.extra.arrows_scale)) .. " Arrows",
					colour = G.C.EDITION
				}
			end
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "finale",
	name = "FINALE",
	config = { immutable = { hyperchipsmult = 7 } },
	rarity = "crp_22exomythic4mecipe",
	atlas = "crp_placeholder",
	pos = { x = 10, y = 0 },
	-- soul_pos = { x = 0, y = 0, extra = { x = 0, y = 0 } },
	cost = 800,
	blueprint_compat = true,
	demicoloncompat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.immutable.hyperchipsmult, '{7}' } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				hypermult = {
					7,
					card.ability.immutable.hyperchipsmult
				},
				hyperchips = {
					7,
					card.ability.immutable.hyperchipsmult
				},
				hyperchips_message = {
					message = "{7}" .. card.ability.immutable.hyperchipsmult .. " Chips & Mult",
					colour = G.C.EDITION,
					sound = "crp_heptationalchipsmult"
				},
			}
		end
	end,
	crp_credits = {
		idea = { "SageSeraph" },
		code = { "Rainstar" }
	}
}
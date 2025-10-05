SMODS.Joker {
	key = "evil_jolly_joker",
	name = "EVIL Jolly Joker",
	config = { extra = { mult = 8 } },
	rarity = "cry_cursed",
	atlas = "crp_joker",
	evil = "j_jolly",
	pos = { x = 9, y = 1 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main and not context.scoring_name == "Pair") or context.forcetrigger then
			return {
				message = "÷" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
				Xmult_mod = to_big(1) / to_big(card.ability.extra.mult),
				colour = G.C.MULT,
			}
		end
	end,
	crp_credits = {
		idea = { "Unknown", "Glitchkat10" },
		code = { "Rainstar" }
	}
}

SMODS.Joker {
	key = "evil_joker",
	name = "EVIL Joker",
	config = { extra = { mult = 4 } },
	rarity = "cry_cursed",
	atlas = "crp_joker",
	evil = "j_joker",
	pos = { x = 8, y = 1 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "÷" .. lenient_bignum(card.ability.extra.mult) .. " Mult",
				Xmult_mod = 1 / lenient_bignum(card.ability.extra.mult),
				colour = G.C.MULT,
			}
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "evil_bulgoe",
	name = "EVIL Bulgoe",
	config = { extra = { chips = 2.7 } },
	rarity = "cry_cursed",
	atlas = "crp_joker",
	evil = "j_crp_bulgoe",
	pos = { x = 8, y = 2 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	pools = { Bulgoe = true },
	pronouns = "bulgoe",
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				message = "÷" .. lenient_bignum(card.ability.extra.chips) .. " Chips",
				Xchip_mod = 1 / lenient_bignum(card.ability.extra.chips),
				colour = G.C.CHIPS,
			}
		end
	end,
	crp_credits = {
		idea = { "Grahkon", "Glitchkat10" },
		art = { "Anonymous" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "cryptoposting",
	name = "Cryptoposting",
	config = { immutable = { xmoneyfloor = 67, xmoneyceil = 100 } },
	rarity = "cry_cursed",
	atlas = "crp_placeholder",
	pos = { x = 0, y = 0 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.immutable.xmoneyfloor / 100, card.ability.immutable.xmoneyceil / 100 } }
	end,
	calculate = function(self, card, context)
		if (context.before or context.pre_discard) or context.forcetrigger then
			local xmoney = pseudorandom("crp_cryptoposting", card.ability.immutable.xmoneyfloor, card.ability.immutable.xmoneyceil) / 100
			ease_dollars(G.GAME.dollars * (xmoney - 1))
			return {
				message = "X$" .. number_format(xmoney),
				colour = G.C.MONEY
			}
		end
	end,
	set_ability = function(self, card, initial)
        card:add_sticker("rental", true)
    end,
	crp_credits = {
		idea = { "SageSeraph" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "the_horse",
	name = "The Horse",
	config = { extra = { emult = 0, emult_mod = 1 } },
	rarity = "cry_cursed",
	atlas = "crp_joker",
	pos = { x = 0, y = 2 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_apple
		return { vars = { lenient_bignum(card.ability.extra.emult), lenient_bignum(card.ability.extra.emult_mod) } }
	end,
	calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
			return {
				emult = lenient_bignum(card.ability.extra.emult),
				emult_message = {
					message = "^" .. number_format(lenient_bignum(card.ability.extra.emult)) .. " Mult",
					colour = G.C.DARK_EDITION,
					sound = "talisman_emult"
				}
			}
		end
		if context.selling_card and not context.blueprint and not context.retrigger_joker and context.card.config.center.key == "j_crp_apple" then
			card.ability.extra.emult = card.ability.extra.emult + card.ability.extra.emult_mod
			return {
				message = "Upgraded!",
				colour = G.C.ATTENTION,
			}
		end
	end,
	crp_credits = {
		idea = { "lord.ruby" },
		code = { "Rainstar" }
	}
}
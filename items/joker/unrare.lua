SMODS.Joker {
	key = "all_trades",
	name = "Joker of all Trades",
	config = { extra = { chips = 150, mult = 15, money = 3 } },
	rarity = "crp_unrare",
	atlas = "crp_joker",
	pos = { x = 3, y = 1 },
	cost = 7,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips), lenient_bignum(card.ability.extra.mult), lenient_bignum(card.ability.extra.money) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chips),
				extra = {
					mult = lenient_bignum(card.ability.extra.mult)
				}
			}
		end
		if context.forcetrigger then
			ease_dollars(lenient_bignum(card.ability.extra.money))
			return { message = "$" .. lenient_bignum(card.ability.extra.money), colour = G.C.MONEY }
		end
	end,
	calc_dollar_bonus = function(self, card)
		return lenient_bignum(card.ability.extra.money)
	end,
	crp_credits = {
		idea = { "Poker The Poker" },
		art = { "GudUsername" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "jollymoon",
    name = "Piano Falling from the Jolly Moon",
    config = {
        extra = {
            mult = 8,
            levels = 1
		}
	},
	atlas = "crp_placeholder",
    pos = { x = 14, y = 0 },
    cost = 7,
    rarity = "crp_unrare",
    blueprint_compat = true,
	demicolon_compat = true,
	loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.mult) } }
    end,
    calculate = function(self, card, context)
        if (context.joker_main) or context.forcetrigger then
            return {
                mult = lenient_bignum(card.ability.extra.mult),
                extra = {
                    level_up = lenient_bignum(card.ability.extra.levels),
            		level_up_hand = "Pair",
                    message = localize("k_level_up_ex"),
                    colour = G.C.PLANET
                }
            }
        end
    end,
	crp_credits = {
		idea = { "Glitchkat10" },
		code = { "lunarisillustratez", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "one_bulgoe_bill",
	name = "One Bulgoe Bill",
	config = { extra = { sprite = nil, money = 2.7, money_bonus = 27 } },
	rarity = "crp_unrare",
	atlas = "crp_joker",
	pos = { x = 8, y = 8 },
	cost = 7,
	blueprint_compat = false,
	demicoloncompat = true,
	pools = { Bulgoe = true },
	pronouns = "bulgoe",
	set_ability = function(self, card, initial, delay_sprites)
		card.ability.extra.sprite = math.floor(pseudorandom("crp_one_bulgoe_bill") * 2)
		if self.discovered and not (card.area and card.area.config.collection) then
			card.children.center:set_sprite_pos({ x = 8 + card.ability.extra.sprite, y = 8 })
		end
	end,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "bulgoe-themed_joker" }
		return { vars = { lenient_bignum(card.ability.extra.money), lenient_bignum(card.ability.extra.money_bonus) } }
	end,
	calculate = function(self, card, context)
		if context.forcetrigger then
			ease_dollars(lenient_bignum(card.ability.extra.money_bonus))
		end
	end,
	calc_dollar_bonus = function(self, card)
		for i = 1, #G.jokers.cards do
			local joker = G.jokers.cards[i]
			if joker ~= card and joker.config and joker.config.center and joker.config.center.pools and joker.config.center.pools.Bulgoe then
				return lenient_bignum(card.ability.extra.money_bonus)
			end
		end
		return lenient_bignum(card.ability.extra.money)
	end,
	crp_credits = {
		idea = { "CLAUDEMACH", "Poker The Poker" },
		art = { "CLAUDEMACH" },
		code = { "wilfredlam0418" }
	}
}
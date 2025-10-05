SMODS.Joker {
	key = "bulgoe_candy",
	name = "Bulgoe Candy",
	config = { extra = { jokers = 2, money = 7 } },
	rarity = "cry_candy",
	atlas = "crp_placeholder",
	pos = { x = 2, y = 1 },
	cost = 3,
	blueprint_compat = true,
	demicoloncompat = true,
	eternal_compat = false,
	pools = { Bulgoe = true, Food = true },
	pronouns = "bulgoe",
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "bulgoe-themed_joker" }
		return { vars = { lenient_bignum(card.ability.extra.jokers), lenient_bignum(card.ability.extra.money) } }
	end,
	calculate = function(self, card, context)
		if (context.selling_self) or context.forcetrigger then
			for i = 1, math.ceil(lenient_bignum(card.ability.extra.jokers)) do
				SMODS.add_card({ set = "Bulgoe" }) -- why
			end
			ease_dollars(lenient_bignum(card.ability.extra.money))
		end
	end,
	crp_credits =  {
		idea = { "wilfredlam0418" },
		code = { "wilfredlm0418", "Glitchkat10" }
	}
}
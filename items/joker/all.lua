SMODS.Atlas {
    key = "joker",
    path = "atlas_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker { -- IT'S ALIVE
	key = "all",
	name = "All",
	rarity = "crp_all",
	atlas = "crp_joker",
	pos = { x = 4, y = 7 },
	soul_pos = { x = 6, y = 7, extra = { x = 5, y = 7 } },
	cost = 9827982798279827,
	blueprint_compat = false,
	demicoloncompat = true,
	perishable_compat = false,
	config = {
		extra = {
			jokers = 1,
			consumables = 1,
			tags = 1,
			vouchers = 1,
			increase = 1,
			joker_slots = 1,
			consumable_slots = 1,
			total_joker_slots_added = 0,
			total_consumable_slots_added = 0
		}
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				math.min(25, card.ability.extra.jokers),
				math.min(25, card.ability.extra.consumables),
				math.min(25, card.ability.extra.tags),
				math.min(25, card.ability.extra.vouchers),
				card.ability.extra.increase,
				card.ability.extra.joker_slots,
				card.ability.extra.consumable_slots,
				card.ability.extra.total_joker_slots_added,
				card.ability.extra.total_consumable_slots_added
			}
		}
	end,
	calculate = function(self, card, context)
		if (context.before and context.cardarea == G.jokers) or context.forcetrigger then
			G.GAME.all_joker_key = G.GAME.all_joker_key or #G.P_CENTER_POOLS.Joker
			G.GAME.all_consumable_key = G.GAME.all_consumable_key or #G.P_CENTER_POOLS.Consumeables
			G.GAME.all_tag_key = G.GAME.all_tag_key or #G.P_CENTER_POOLS.Tag
			G.GAME.all_voucher_key = G.GAME.all_voucher_key or #G.P_CENTER_POOLS.Voucher

			local jokers_added, consumables_added = 0, 0

			for _ = 1, math.min(25, card.ability.extra.jokers) do
				if G.GAME.all_joker_key < 1 then G.GAME.all_joker_key = #G.P_CENTER_POOLS.Joker end
				local key = G.P_CENTER_POOLS.Joker[G.GAME.all_joker_key].key
				-- Skip creating this joker if it's the "all" joker
				if not (key == "all" or key == self.key) then
					local j = create_card("Joker", G.jokers, nil, nil, nil, nil, key, "literally_fucking_everything")
					j:add_to_deck()
					G.jokers:emplace(j)
					jokers_added = jokers_added + 1
				end
				G.GAME.all_joker_key = G.GAME.all_joker_key - 1
			end

			for _ = 1, math.min(25, card.ability.extra.consumables) do
				if G.GAME.all_consumable_key < 1 then G.GAME.all_consumable_key = #G.P_CENTER_POOLS.Consumeables end
				local key = G.P_CENTER_POOLS.Consumeables[G.GAME.all_consumable_key].key
				local c = create_card("Consumeable", G.consumeables, nil, nil, nil, nil, key, "literally_fucking_everything")
				c:add_to_deck()
				G.consumeables:emplace(c)
				G.GAME.all_consumable_key = G.GAME.all_consumable_key - 1
				consumables_added = consumables_added + 1
			end

			for _ = 1, math.min(25, card.ability.extra.tags) do
				if G.GAME.all_tag_key < 1 then G.GAME.all_tag_key = #G.P_CENTER_POOLS.Tag end
				local key = G.P_CENTER_POOLS.Tag[G.GAME.all_tag_key].key
				add_tag(Tag(key))
				G.GAME.all_tag_key = G.GAME.all_tag_key - 1
			end

			for _ = 1, math.min(25, card.ability.extra.vouchers) do
				if G.GAME.all_voucher_key < 1 then G.GAME.all_voucher_key = #G.P_CENTER_POOLS.Voucher end
				local key = G.P_CENTER_POOLS.Voucher[G.GAME.all_voucher_key].key
				local area = (G.STATE == G.STATES.HAND_PLAYED and (G.redeemed_vouchers_during_hand or CardArea(G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, { type = "play", card_limit = 5 }))) or G.play

				if G.STATE == G.STATES.HAND_PLAYED and not G.redeemed_vouchers_during_hand then
					G.redeemed_vouchers_during_hand = area
				end
				local v = create_card("Voucher", area, nil, nil, nil, nil, key)
				v:start_materialize()
				area:emplace(v)
				v.cost = 0
				v.shop_voucher = false
				local prev = G.GAME.current_round.voucher
				v:redeem()
				G.GAME.current_round.voucher = prev
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0,
					func = function()
						v:start_dissolve()
						return true
					end
				}))
				G.GAME.all_voucher_key = G.GAME.all_voucher_key - 1
			end

			local j_slot_gain = jokers_added * card.ability.extra.joker_slots
			local c_slot_gain = consumables_added * card.ability.extra.consumable_slots
			G.jokers.config.card_limit = G.jokers.config.card_limit + j_slot_gain
			G.consumeables.config.card_limit = G.consumeables.config.card_limit + c_slot_gain

			card.ability.extra.total_joker_slots_added = (card.ability.extra.total_joker_slots_added or 0) + j_slot_gain
			card.ability.extra.total_consumable_slots_added = (card.ability.extra.total_consumable_slots_added or 0) + c_slot_gain

			card.ability.extra.jokers = card.ability.extra.jokers + card.ability.extra.increase
			card.ability.extra.consumables = card.ability.extra.consumables + card.ability.extra.increase
			card.ability.extra.tags = card.ability.extra.tags + card.ability.extra.increase
			card.ability.extra.vouchers = card.ability.extra.vouchers + card.ability.extra.increase
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit - (card.ability.extra.total_joker_slots_added or 0)
			G.consumeables.config.card_limit = G.consumeables.config.card_limit - (card.ability.extra.total_consumable_slots_added or 0)
		end
	end,
	crp_credits = {
		idea = { "lunarisIllustratez", "Glitchkat10" },
		art = { "thingifithinker" },
		code = { "Glitchkat10", "Rainstar" }
	}
}
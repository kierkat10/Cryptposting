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
		immutable = {
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
				math.min(10, card.ability.immutable.jokers),
				math.min(10, card.ability.immutable.consumables),
				math.min(10, card.ability.immutable.tags),
				math.min(10, card.ability.immutable.vouchers),
				card.ability.immutable.increase,
				card.ability.immutable.joker_slots,
				card.ability.immutable.consumable_slots,
				card.ability.immutable.total_joker_slots_added,
				card.ability.immutable.total_consumable_slots_added
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

			local jokers_to_add = (card.ability.immutable and type(card.ability.immutable.jokers) == "number") and math.min(10, card.ability.immutable.jokers) or 1
			for _ = 1, jokers_to_add do
				if G.GAME.all_joker_key < 1 then G.GAME.all_joker_key = #G.P_CENTER_POOLS.Joker end
				local joker_data = G.P_CENTER_POOLS.Joker[G.GAME.all_joker_key]
				if joker_data and type(joker_data) == 'table' and joker_data.key then
					local key = joker_data.key
					-- skip creating all
					if not (key == "all" or key == self.key) then
						local success, j = pcall(create_card, "Joker", G.jokers, nil, nil, nil, nil, key, "literally_fucking_everything")
						if success and j and type(j) == 'table' then
							if j.add_to_deck then pcall(j.add_to_deck, j) end
							if G.jokers and G.jokers.emplace then
								pcall(function() G.jokers:emplace(j) end)
								jokers_added = jokers_added + 1
							end
						end
					end
				end
				G.GAME.all_joker_key = G.GAME.all_joker_key - 1
			end

			local consumables_to_add = (card.ability.immutable and type(card.ability.immutable.consumables) == "number") and math.min(10, card.ability.immutable.consumables) or 1
			for _ = 1, consumables_to_add do
				if G.GAME.all_consumable_key < 1 then G.GAME.all_consumable_key = #G.P_CENTER_POOLS.Consumeables end
				local consumable_data = G.P_CENTER_POOLS.Consumeables[G.GAME.all_consumable_key]
				if consumable_data and type(consumable_data) == 'table' and consumable_data.key then
					local key = consumable_data.key
					local success, c = pcall(create_card, "Consumeable", G.consumeables, nil, nil, nil, nil, key, "literally_fucking_everything")
					if success and c and type(c) == 'table' then
						if c.add_to_deck then pcall(c.add_to_deck, c) end
						if G.consumeables and G.consumeables.emplace then 
							pcall(function() G.consumeables:emplace(c) end)
							consumables_added = consumables_added + 1 
						end
					end
				end
				G.GAME.all_consumable_key = G.GAME.all_consumable_key - 1
			end

			local tags_to_add = (card.ability.immutable and type(card.ability.immutable.tags) == "number") and math.min(10, card.ability.immutable.tags) or 1
			for _ = 1, tags_to_add do
				if G.GAME.all_tag_key < 1 then G.GAME.all_tag_key = #G.P_CENTER_POOLS.Tag end
				local tag_data = G.P_CENTER_POOLS.Tag[G.GAME.all_tag_key]
				if tag_data and type(tag_data) == 'table' and tag_data.key then
					local key = tag_data.key
					pcall(function() add_tag(Tag(key)) end)
				end
				G.GAME.all_tag_key = G.GAME.all_tag_key - 1
			end

			local vouchers_to_add = (card.ability.immutable and type(card.ability.immutable.vouchers) == "number") and math.min(10, card.ability.immutable.vouchers) or 1
			for _ = 1, vouchers_to_add do
				if G.GAME.all_voucher_key < 1 then G.GAME.all_voucher_key = #G.P_CENTER_POOLS.Voucher end
				local voucher_data = G.P_CENTER_POOLS.Voucher[G.GAME.all_voucher_key]
				if voucher_data and type(voucher_data) == 'table' and voucher_data.key then
					local key = voucher_data.key
					local area = (G.STATE == G.STATES.HAND_PLAYED and (G.redeemed_vouchers_during_hand or CardArea(G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, { type = "play", card_limit = 5 }))) or G.play

					if G.STATE == G.STATES.HAND_PLAYED and not G.redeemed_vouchers_during_hand then
						G.redeemed_vouchers_during_hand = area
					end

					local success, v = pcall(create_card, "Voucher", area, nil, nil, nil, nil, key)
					if success and v and type(v) == 'table' then
						pcall(function()
							if v.start_materialize then v:start_materialize() end
							if area and area.emplace then area:emplace(v) end
							v.cost = 0
							v.shop_voucher = false
							local prev = G.GAME.current_round.voucher
							v:redeem()
							G.GAME.current_round.voucher = prev
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								delay = 0,
								func = function()
									if v and v.start_dissolve then v:start_dissolve() end
									return true
								end
							}))
						end)
					end
				end
				G.GAME.all_voucher_key = G.GAME.all_voucher_key - 1
			end

			local j_slot_gain = jokers_added * card.ability.immutable.joker_slots
			local c_slot_gain = consumables_added * card.ability.immutable.consumable_slots
			G.jokers.config.card_limit = G.jokers.config.card_limit + j_slot_gain
			G.consumeables.config.card_limit = G.consumeables.config.card_limit + c_slot_gain

			card.ability.immutable.total_joker_slots_added = (card.ability.immutable.total_joker_slots_added or 0) + j_slot_gain
			card.ability.immutable.total_consumable_slots_added = (card.ability.immutable.total_consumable_slots_added or 0) + c_slot_gain

			card.ability.immutable.jokers = card.ability.immutable.jokers + card.ability.immutable.increase
			card.ability.immutable.consumables = card.ability.immutable.consumables + card.ability.immutable.increase
			card.ability.immutable.tags = card.ability.immutable.tags + card.ability.immutable.increase
			card.ability.immutable.vouchers = card.ability.immutable.vouchers + card.ability.immutable.increase
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if not from_debuff then
			G.jokers.config.card_limit = G.jokers.config.card_limit - (card.ability.immutable.total_joker_slots_added or 0)
			G.consumeables.config.card_limit = G.consumeables.config.card_limit - (card.ability.immutable.total_consumable_slots_added or 0)
		end
	end,
	in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end,
	crp_credits = {
		idea = { "lunarisIllustratez", "Glitchkat10" },
		art = { "thingifithinker" },
		code = { "Glitchkat10", "Rainstar" },
		custom = { key = "music", text = "ottermatter" }
	}
}
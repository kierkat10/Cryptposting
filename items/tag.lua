SMODS.Atlas {
	key = "tags",
	path = "atlas_tags.png",
	px = 34,
	py = 34
}

SMODS.Tag {
	key = "common_tag",
	name = "Common Tag",
	atlas = "crp_tags",
	pos = { x = 0, y = 0 },
	config = { type = "store_joker_create" },
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == 1 and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS[1] > rares_in_posession[1] then
				card = create_card('Joker', context.area, nil, 0, nil, nil, nil, 'uta')
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.Common, function()
					card:start_materialize()
					card.misprint_cost_fac = 0
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Tag {
	key = "legendary_tag",
	name = "Legendary Tag",
	atlas = "crp_tags",
	pos = { x = 1, y = 0 },
	min_ante = 3,
	config = { type = "store_joker_create" },
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == 4 and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS[4] > rares_in_posession[1] then
				card = create_card("Joker", context.area, true, 4, nil, nil, nil, "uta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.Legendary, function()
					card:start_materialize()
					card.misprint_cost_fac = 1
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Tag {
	key = "exotic_tag",
	name = "Exotic Tag",
	atlas = "crp_tags",
	pos = { x = 2, y = 0 },
	min_ante = 4,
	config = { type = "store_joker_create" },
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == "cry_exotic" and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.cry_exotic > rares_in_posession[1] then
				card = create_card("Joker", context.area, nil, "cry_exotic", nil, nil, nil, "cry_eta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.cry_exotic, function()
					card:start_materialize()
					card.misprint_cost_fac = 2
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Tag {
	key = "mythic_tag",
	name = "Mythic Tag",
	atlas = "crp_tags",
	pos = { x = 7, y = 0 },
	min_ante = 5,
	config = { type = "store_joker_create" },
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == "crp_mythic" and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.crp_mythic > rares_in_posession[1] then
				card = create_card("Joker", context.area, nil, "crp_mythic", nil, nil, nil, "cry_eta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", HEX("ffb300"), function()
					card:start_materialize()
					card.misprint_cost_fac = 4
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Tag {
	key = "better_better_top-up_tag",
	name = "Better Better Top-Up Tag",
	atlas = "crp_tags",
	pos = { x = 0, y = 1 },
	config = { extra = { amount = 2 } },
	min_ante = 8,
	loc_vars = function(self, info_queue, tag)
		return { vars = { lenient_bignum(tag.config.extra.amount) } }
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
							set = "Joker",
							rarity = 1
						}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	}
}

SMODS.Tag {
	key = "better_better_better_top-up_tag",
	name = "Better Better Better Top-Up Tag",
	atlas = "crp_tags",
	pos = { x = 1, y = 1 },
	min_ante = 13,
	config = { extra = { amount = 2 } },
	loc_vars = function(self, info_queue, tag)
		return { vars = { lenient_bignum(tag.config.extra.amount) } }
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
							set = "Joker",
							rarity = "cry_epic"
						}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	}
}

SMODS.Tag {
	key = "better_better_better_better_top-up_tag",
	name = "Better Better Better Better Top-Up Tag",
	atlas = "crp_tags",
	pos = { x = 2, y = 1 },
	min_ante = 27,
	config = { extra = { amount = 1 } },
	loc_vars = function(self, info_queue, tag)
		return { vars = { lenient_bignum(tag.config.extra.amount) } }
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
							set = "Joker",
							legendary = true
						}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	}
}

SMODS.Tag {
	key = "better_better_better_better_better_top-up_tag",
	name = "Better Better Better Better Better Top-Up Tag",
	atlas = "crp_tags",
	pos = { x = 3, y = 1 },
	min_ante = 39,
	config = { extra = { amount = 1 } },
	loc_vars = function(self, info_queue, tag)
		return { vars = { lenient_bignum(tag.config.extra.amount) } }
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
							set = "Joker",
							rarity = "cry_exotic"
						}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	}
}

SMODS.Tag {
    key = "better_better_better_better_better_better_top-up_tag",
    name = "Better Better Better Better Better Better Top-Up Tag",
    atlas = "crp_tags",
    pos = { x = 5, y = 1 },
	min_ante = 69,
    config = { extra = { amount = 1 } },
    loc_vars = function(self, info_queue, tag)
        return { vars = { lenient_bignum(tag.config.extra.amount) } }
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
        					set = "Joker",
        					rarity = "crp_mythic"
    					}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
    end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	}
}

SMODS.Tag {
	key = "better_better_better_better_better_better_better_top-up_tag",
	name = "Better Better Better Better Better Better Better Top-Up Tag",
	atlas = "crp_tags",
	pos = { x = 2, y = 2 },
	min_ante = 98,
	config = { extra = { amount = 1 } },
	loc_vars = function(self, info_queue, tag)
		return { vars = { lenient_bignum(tag.config.extra.amount) } }
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
							set = "Joker",
							rarity = "crp_exomythic"
						}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	}
}

SMODS.Tag {
    key = "better_better_better_better_better_better_better_better_top-up_tag",
    name = "Better Better Better Better Better Better Better Better Top-Up Tag",
    atlas = "crp_tags",
    pos = { x = 4, y = 2 },
	min_ante = 270,
    config = { extra = { amount = 1 } },
    loc_vars = function(self, info_queue, tag)
        return { vars = { lenient_bignum(tag.config.extra.amount) } }
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
        					set = "Joker",
        					rarity = "crp_2exomythic4me"
    					}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
    end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	},
}

SMODS.Tag {
    key = "better_better_better_better_better_better_better_better_better_top-up_tag",
    name = "Better Better Better Better Better Better Better Better Better Top-Up Tag",
    atlas = "crp_tags",
    pos = { x = 0, y = 2 },
	min_ante = 420,
    config = { extra = { amount = 1 } },
    loc_vars = function(self, info_queue, tag)
        return { vars = { lenient_bignum(tag.config.extra.amount) } }
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
        					set = "Joker",
        					rarity = "crp_22exomythic4mecipe"
    					}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
    end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	},
}

SMODS.Tag {
	key = ":3_top-up_tag",
	name = ":3 Top-Up Tag",
	atlas = "crp_tags",
	pos = { x = 0, y = 3 },
	min_ante = 0,
	config = { extra = { amount = 2 } },
	loc_vars = function(self, info_queue, tag)
		return { vars = { lenient_bignum(tag.config.extra.amount) } }
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
							set = "Joker",
							rarity = "crp_:3"
						}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "Glitchkat10" }
	}
}

SMODS.Tag {
	key = "candy_top-up_tag",
	name = "Candy Top-up Tag",
	atlas = "crp_tags",
	pos = { x = 4, y = 1 },
	min_ante = 8,
	config = { extra = { amount = 2 } },
	loc_vars = function(self, info_queue, tag)
		return { vars = { lenient_bignum(tag.config.extra.amount) } }
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
							set = "Joker",
							rarity = "cry_candy"
						}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	}
}

SMODS.Tag {
	key = "top-down_tag",
	name = "Top-down Tag",
	atlas = "crp_tags",
	pos = { x = 7, y = 2 },
	min_ante = -1,
	config = { extra = { amount = 2 } },
	loc_vars = function(self, info_queue, tag)
		return { vars = { lenient_bignum(tag.config.extra.amount) } }
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
							set = "Joker",
							rarity = "cry_cursed"
						}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "aqrlr", "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Tag {
	key = "trash_top-up_tag",
	name = "Trash Top-Up Tag",
	atlas = "crp_tags",
	pos = { x = 1, y = 3 },
	min_ante = 0,
	config = { extra = { amount = 2 } },
	loc_vars = function(self, info_queue, tag)
		return { vars = { lenient_bignum(tag.config.extra.amount) } }
	end,
	apply = function(self, tag, context)
		if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
							set = "Joker",
							rarity = "crp_trash"
						}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Tag {
    key = "overloaded_tag",
	name = "Overloaded Tag",
    atlas = "crp_tags",
    pos = { x = 2, y = 3 },
    config = { type = "store_joker_modify", edition = "crp_overloaded" },
    min_ante = 8,
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_crp_overloaded
        return { vars = {} }
    end,
    apply = function(self, tag, context)
        if context.type == "store_joker_modify" then
            local _applied = nil
            if Cryptid.forced_edition() then
                tag:nope()
            end
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep("+", G.C.DARK_EDITION, function()
                    context.card:set_edition({
                        crp_overloaded = true
                    }, true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    context.card.temp_edition = nil
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                _applied = true
                tag.triggered = true
            end
        end
    end,
	crp_credits = {
        idea = { "Glitchkat10" },
        art = { "Glitchkat10" },
        code = { "Glitchkat10" }
    }
}

SMODS.Tag {
    key = "four-dimensional_tag",
	name = "Four-Dimensional Tag",
    atlas = "crp_tags",
    pos = { x = 3, y = 3 },
    config = { type = "store_joker_modify", edition = "crp_four-dimensional" },
    min_ante = 6,
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS["e_crp_four-dimensional"]
        return { vars = {  } }
    end,
    apply = function(self, tag, context)
        if context.type == "store_joker_modify" then
            local _applied = nil
            if Cryptid.forced_edition() then
                tag:nope()
            end
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == "Joker" then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep("+", G.C.DARK_EDITION, function()
                    context.card:set_edition({
                        ["crp_four-dimensional"] = true
                    }, true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    context.card.temp_edition = nil
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                _applied = true
                tag.triggered = true
            end
        end
    end,
    crp_credits = {
        idea = { "Glitchkat10" },
        art = { "Glitchkat10" },
        code = { "Glitchkat10" }
    }
}

SMODS.Tag {
    key = "top-up_everything",
	name = "Top-up Everything",
    atlas = "crp_tags",
    pos = { x = 5, y = 3 },
	min_ante = 2798,
    config = {  },
    loc_vars = function(self, info_queue, tag)
		info_queue[#info_queue + 1] = G.P_CENTERS.j_crp_all
        return { vars = {  } }
    end,
    apply = function(self, tag, context)
        if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
        					set = "Joker",
        					rarity = "crp_all"
    					}
						SMODS.add_card(hittable)
					end
				return true
			end)
			tag.triggered = true
			return true
		end
    end,
	crp_credits = {
		idea = { "aqrlr" },
		art = { "Grahkon", "aqrlr" },
		code = { "Glitchkat10" }
	},
}

--[[ SMODS.Tag {
	key = "uncommon_2_tag",
	atlas = "crp_tags",
	pos = { x = 3, y = 0 },
	min_ante = 0,
	config = { type = "store_joker_create" },
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == "crp_uncommon_2" and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.crp_uncommon_2 > rares_in_posession[1] then
				card = create_card("Joker", context.area, nil, "crp_uncommon_2", nil, nil, nil, "cry_eta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.Uncommon, function()
					card:start_materialize()
					card.misprint_cost_fac = 0
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "lord.ruby" },
		code = { "lord.ruby" }
	}
}

SMODS.Tag {
	key = "rare_2_tag",
	atlas = "crp_tags",
	pos = { x = 4, y = 0 },
	min_ante = 0,
	config = { type = "store_joker_create" },
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == "crp_rare_2" and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.crp_rare_2 > rares_in_posession[1] then
				card = create_card("Joker", context.area, nil, "crp_rare_2", nil, nil, nil, "cry_eta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.Rare, function()
					card:start_materialize()
					card.misprint_cost_fac = 0
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
	crp_credits = {
		idea = { "Unknown" },
		art = { "lord.ruby"},
		code = { "lord.ruby" }
	}
}

 --[[ SMODS.Tag {
	key = "awesome_tag",
	atlas = "crp_tags",
	pos = { x = 5, y = 0 },
	min_ante = 0,
	config = { type = "store_joker_create" },
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == "crp_awesome" and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.crp_awesome > rares_in_posession[1] then
				card = create_card("Joker", context.area, nil, "crp_awesome", nil, nil, nil, "cry_eta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.crp_awesome, function()
					card:start_materialize()
					card.misprint_cost_fac = 0.5
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end,
}

SMODS.Tag {
	key = "m_tag",
	atlas = "crp_tags",
	pos = { x = 6, y = 0 },
	min_ante = 0,
	config = { type = "store_joker_create" },
	apply = function(self, tag, context)
		if context.type == "store_joker_create" then
			local rares_in_posession = { 0 }
			for k, v in ipairs(G.jokers.cards) do
				if v.config.center.rarity == "crp_m" and not rares_in_posession[v.config.center.key] then
					rares_in_posession[1] = rares_in_posession[1] + 1
					rares_in_posession[v.config.center.key] = true
				end
			end
			local card
			if #G.P_JOKER_RARITY_POOLS.crp_m > rares_in_posession[1] then
				card = create_card("Joker", context.area, nil, "crp_m", nil, nil, nil, "cry_eta")
				create_shop_card_ui(card, "Joker", context.area)
				card.states.visible = false
				tag:yep("+", G.C.RARITY.cry_exotic, function()
					card:start_materialize()
					card.misprint_cost_fac = 0
					card:set_cost()
					return true
				end)
			else
				tag:nope()
			end
			tag.triggered = true
			return card
		end
	end, ]]--

--[[
SMODS.Tag {
    key = "worse_worse_top-up_tag",
    atlas = "crp_tags",
    pos = { x = 5, y = 2 },
    config = { extra = { amount = 2 } },
    loc_txt = {
        name = "Worse Worse Top-down Tag",
        text = {
            "Create up to #1#",
            "{C:crp_abysmal}Abysmal{} {C:attention}Jokers{}",
            "{C:inactive}(Must have room){}"
        }
    },
    loc_vars = function(self, info_queue, tag)
        return { vars = { lenient_bignum(tag.config.extra.amount) } }
    end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	},
    apply = function(self, tag, context)
        if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
        					set = "Joker",
        					rarity = "crp_abysmal"
    					}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
    end
}
SMODS.Tag {
    key = "besttopuptag",
    atlas = "crp_tags",
    pos = { x = 7, y = 1 },
    config = { extra = { amount = 2 } },
    loc_txt = {
        name = "Best Top-up Tag",
        text = {
            "Create up to #1#",
            "{C:crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe}ExoMythicEpicAwesomeUncommon2MExotic22ExoMythic4meCipe{} {C:attention}Jokers{}",
            "{C:inactive}(Must have room){}"
        }
    },
    loc_vars = function(self, info_queue, tag)
        return { vars = { lenient_bignum(tag.config.extra.amount) } }
    end,
	crp_credits = {
		idea = { "Grahkon" },
		art = { "Grahkon" },
		code = { "ScarredOut" }
	},
    apply = function(self, tag, context)
        if context.type == "immediate" then
			tag:yep("+", G.C.RED, function()
				for i = 1, lenient_bignum(tag.config.extra.amount) do
					if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
						local hittable = {
        					set = "Joker",
        					rarity = "crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe"
    					}
						SMODS.add_card(hittable)
					end
				end
				return true
			end)
			tag.triggered = true
			return true
		end
    end
}
]]-- op tag commentation ends here

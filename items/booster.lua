SMODS.Booster{
    key = "very_rare_pack",
    name = "Very Rare Pack",
    atlas = "placeholder", 
    pos = { x = 8, y = 2 },
    discovered = true,
    draw_hand = false,
    config = { choose = 1, extra = 3 },
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.choose), lenient_bignum(card.ability.extra) } }
    end,
    weight = 0.1,
    cost = 50,
    create_card = function(self, card, i)
        local cards = {
            { key = "c_blackhole", weight = 10 },
            { key = "c_cry_gateway", weight = 10 },
            { key = "c_cry_white_hole", weight = 10 },
            { key = "c_cry_pointer", weight = 10 },
            { key = "c_crp_prayer", weight = 10 },
            { key = "c_crp_gate_of_prayers", weight = 10 },
            { key = "c_crp_stairway_to_heaven", weight = 10 },
            { key = "c_crp_path_of_solstice", weight = 10 },
            { key = "c_crp_reckoning", weight = 10 },
            { key = "c_crp_all_or_nothing", weight = 10 },
            { key = "c_soul", weight = 10 }
        }
        
        local total_weight = 0
        for _, card_data in ipairs(cards) do
            total_weight = total_weight + card_data.weight
        end
        
        local roll = pseudorandom("very_rare_pack") * total_weight
        local current_weight = 0
        
        for _, card_data in ipairs(cards) do
            current_weight = current_weight + card_data.weight
            if roll <= current_weight then
                return create_card("Spectral", G.pack_cards, nil, nil, true, nil, card_data.key, "very_rare")
            end
        end
        
        -- fallback (should never reach here)
        return create_card("Spectral", G.pack_cards, nil, nil, true, nil, "c_soul", "very_rare")
    end,
    select_card = "consumeables",
    in_pool = function() return true end,
    crp_credits = {
        idea = { "Grahkon" },
        code = { "Rainstar", "Glitchkat10" }
    }
}

SMODS.Booster{
    key = "very_balanced_pack",
    name = "Very Balanced Pack",
    atlas = "placeholder",
    pos = { x = 8, y = 2 },
    discovered = true,
    draw_hand = false,
    config = { choose = 1, extra = 5 },
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.choose), lenient_bignum(card.ability.extra) } }
    end,
    weight = 1 / 9827,
    cost = 0.69,
    create_card = function(self, card, i)
         return create_card("Joker", G.pack_cards, nil, "crp_exomythic", true, nil, nil, "totally_balanced")
    end,
    select_card = "jokers",
    in_pool = function() return true end,
    crp_credits = {
        idea = { "PurplePickle" },
        code = { "Rainstar" }
    }
}

SMODS.Booster{
    key = "bulgoe_pack",
    name = "Bulgoe Pack",
    atlas = "placeholder",
    pos = { x = 8, y = 2 },
    discovered = true,
    draw_hand = false,
    config = { choose = 1, extra = 3 },
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.choose), lenient_bignum(card.ability.extra) } }
    end,
    weight = 2.7,
    cost = 2.7,
    create_card = function(self, card, i)
        -- stole this from very rare pack's code because apparently just making it spawn cards based on a pool allows it to spawn literally any possible bulgoe with equal chances soooooo
        local cards = {
            { key = "j_crp_bulgoe", weight = 2727 },
            { key = "j_crp_bulgoe_prize", weight = 2727 },
            { key = "j_crp_bulgoelatro", weight = 2727 },
            { key = "j_crp_one_bulgoe_bill", weight = 2700 },
            { key = "j_crp_bulgoe_candy", weight = 2700/2 },
            { key = "j_crp_normalgoe", weight = 2700/4 },
            { key = "j_crp_bulgoes_hiking_journey", weight = 2700/8 },
            { key = "j_crp_270_bulgoescope", weight = 2700/16 },
            { key = "j_crp_normalis", weight = 270 },
            { key = "j_crp_bulgoeship_card", weight = 27 },
            { key = "j_crp_bulgoelly_west", weight = 2.7 },
            { key = "j_crp_supagoe", weight = 0.27 },
        }
        
        local total_weight = 0
        for _, card_data in ipairs(cards) do
            total_weight = total_weight + card_data.weight
        end
        
        local roll = pseudorandom("bulgoe_pack") * total_weight
        local current_weight = 0
        
        for _, card_data in ipairs(cards) do
            current_weight = current_weight + card_data.weight
            if roll <= current_weight then
                return create_card("Joker", G.pack_cards, nil, nil, true, nil, card_data.key, "bulgoe_pack")
            end
        end
        
        -- fallback (should never reach here)
        return create_card("Joker", G.pack_cards, nil, nil, true, nil, "j_crp_bulgoe", "bulgoe_pack")
    end,
    select_card = "jokers",
    in_pool = function() return true end,
    crp_credits = {
        idea = { "ottermatter" },
        code = { "Rainstar", "Glitchkat10" }
    }
}

SMODS.Booster{
    key = "big_bulgoe_pack",
    name = "BIG Bulgoe Pack",
    atlas = "placeholder",
    pos = { x = 8, y = 2 },
    discovered = true,
    draw_hand = false,
    config = { choose = 1, extra = 5 },
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.choose), lenient_bignum(card.ability.extra) } }
    end,
    weight = 2.7,
    cost = 7.2,
    create_card = function(self, card, i)
        -- stole this from very rare pack's code because apparently just making it spawn cards based on a pool allows it to spawn literally any possible bulgoe with equal chances soooooo
        local cards = {
            { key = "j_crp_bulgoe", weight = 2727 },
            { key = "j_crp_bulgoe_prize", weight = 2727 },
            { key = "j_crp_bulgoelatro", weight = 2727 },
            { key = "j_crp_one_bulgoe_bill", weight = 2700 },
            { key = "j_crp_bulgoe_candy", weight = 2700/2 },
            { key = "j_crp_normalgoe", weight = 2700/4 },
            { key = "j_crp_bulgoes_hiking_journey", weight = 2700/8 },
            { key = "j_crp_270_bulgoescope", weight = 2700/16 },
            { key = "j_crp_normalis", weight = 270 },
            { key = "j_crp_bulgoeship_card", weight = 27 },
            { key = "j_crp_bulgoelly_west", weight = 2.7 },
            { key = "j_crp_supagoe", weight = 0.27 },
        }
        
        local total_weight = 0
        for _, card_data in ipairs(cards) do
            total_weight = total_weight + card_data.weight
        end
        
        local roll = pseudorandom("bulgoe_pack") * total_weight
        local current_weight = 0
        
        for _, card_data in ipairs(cards) do
            current_weight = current_weight + card_data.weight
            if roll <= current_weight then
                return create_card("Joker", G.pack_cards, nil, nil, true, nil, card_data.key, "bulgoe_pack")
            end
        end
        
        -- fallback (should never reach here)
        return create_card("Joker", G.pack_cards, nil, nil, true, nil, "j_crp_bulgoe", "bulgoe_pack")
    end,
    select_card = "jokers",
    in_pool = function() return true end,
    crp_credits = {
        idea = { "ottermatter" },
        code = { "Rainstar", "Glitchkat10" }
    }
}

SMODS.Booster{
    key = "bountiful_bulgoe_pack",
    name = "Bountiful Bulgoe Pack",
    atlas = "placeholder",
    pos = { x = 8, y = 2 },
    discovered = true,
    draw_hand = false,
    config = { choose = 2, extra = 5 },
    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.choose), lenient_bignum(card.ability.extra) } }
    end,
    weight = 2.7,
    cost = 27/2,
    create_card = function(self, card, i)
        -- stole this from very rare pack's code because apparently just making it spawn cards based on a pool allows it to spawn literally any possible bulgoe with equal chances soooooo
        local cards = {
            { key = "j_crp_bulgoe", weight = 2727 },
            { key = "j_crp_bulgoe_prize", weight = 2727 },
            { key = "j_crp_bulgoelatro", weight = 2727 },
            { key = "j_crp_one_bulgoe_bill", weight = 2700 },
            { key = "j_crp_bulgoe_candy", weight = 2700/2 },
            { key = "j_crp_normalgoe", weight = 2700/4 },
            { key = "j_crp_bulgoes_hiking_journey", weight = 2700/8 },
            { key = "j_crp_270_bulgoescope", weight = 2700/16 },
            { key = "j_crp_normalis", weight = 270 },
            { key = "j_crp_bulgoeship_card", weight = 27 },
            { key = "j_crp_bulgoelly_west", weight = 2.7 },
            { key = "j_crp_supagoe", weight = 0.27 },
        }
        
        local total_weight = 0
        for _, card_data in ipairs(cards) do
            total_weight = total_weight + card_data.weight
        end
        
        local roll = pseudorandom("bulgoe_pack") * total_weight
        local current_weight = 0
        
        for _, card_data in ipairs(cards) do
            current_weight = current_weight + card_data.weight
            if roll <= current_weight then
                return create_card("Joker", G.pack_cards, nil, nil, true, nil, card_data.key, "bulgoe_pack")
            end
        end
        
        -- fallback (should never reach here)
        return create_card("Joker", G.pack_cards, nil, nil, true, nil, "j_crp_bulgoe", "bulgoe_pack")
    end,
    select_card = "jokers",
    in_pool = function() return true end,
    crp_credits = {
        idea = { "ottermatter" },
        code = { "Rainstar", "Glitchkat10" }
    }
}
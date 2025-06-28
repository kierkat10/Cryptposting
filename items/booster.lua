
SMODS.Booster{
    key = 'very_rare_pack',
    atlas = 'placeholders', 
    pos = { x = 0, y = 0 },
    discovered = true,
    draw_hand = false,
    config = {
        choose = 1,
        extra = 3
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    weight = 0.1,
    cost = 50,
    create_card = function(self, card, i)
        if 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_blackhole', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_cry_gateway', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_cry_white_hole', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_cry_pointer', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_crp_prayer', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_crp_gate_of_prayers', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_crp_stairway_to_heaven', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_crp_path_of_solstice', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_crp_path_of_solstice', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_crp_reckoning', 'very_rare')
        elseif 10 >= math.random(0, 100) then
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_crp_all_or_nothing', 'very_rare')
        else
            return create_card('Spectral', G.pack_cards, nil, nil, true, nil, 'c_soul', 'very_rare')
        end
    end,
    select_card = 'consumeables',
    in_pool = function() return true end
}


SMODS.Booster{
    key = 'very_balanced_pack',
    atlas = 'placeholders', 
    pos = { x = 0, y = 0 },
    discovered = true,
    draw_hand = false,
    config = {
        choose = 1,
        extra = 5
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    weight = 1 / 9827,
    cost = 0.69,
    create_card = function(self, card, i)
         return create_card('Joker', G.pack_cards, nil, 'crp_exomythic', true, nil, nil, 'totally_balanced')
    end,
    select_card = 'jokers',
    in_pool = function() return true end
}
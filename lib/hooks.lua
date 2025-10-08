-- make the box debuff plentiful jokers too
local og_box_debuff = SMODS.Blinds.bl_cry_box.recalc_debuff
SMODS.Blinds.bl_cry_box.recalc_debuff = function(self, card, from_blind)
    if og_box_debuff and og_box_debuff(self, card, from_blind) then
        return true
    end
    return card.config.center.rarity == "crp_plentiful"
end

-- make the windmill debuff unplentiful jokers too
local og_windmill_debuff = SMODS.Blinds.bl_cry_windmill.recalc_debuff
SMODS.Blinds.bl_cry_windmill.recalc_debuff = function(self, card, from_blind)
    if og_windmill_debuff and og_windmill_debuff(self, card, from_blind) then
        return true
    end
    return card.config.center.rarity == "crp_unplentiful"
end

-- make the pin debuff cipe+ jokers too
local og_pin_debuff = SMODS.Blinds.bl_cry_pin.recalc_debuff
SMODS.Blinds.bl_cry_pin.recalc_debuff = function(self, card, from_blind)
    if og_pin_debuff and og_pin_debuff(self, card, from_blind) then
        return true
    end
    return
        card.config.center.rarity == "crp_cipe" or
        card.config.center.rarity == "crp_incredible" or
        card.config.center.rarity == "crp_extraordinary" or
        card.config.center.rarity == "crp_awesome" or
        card.config.center.rarity == "crp_divine" or
        card.config.center.rarity == "crp_outlandish" or
        card.config.center.rarity == "crp_mythic" or
        card.config.center.rarity == "crp_exomythic" or
        card.config.center.rarity == "crp_2exomythic4me" or
        card.config.center.rarity == "crp_22exomythic4mecipe" or
        card.config.center.rarity == "crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe" or
        card.config.center.rarity == "crp_supa_rare" or
        card.config.center.rarity == "crp_all"
end
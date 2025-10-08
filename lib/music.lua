SMODS.Sound({
    key = "music_all",
    path = "music_all.ogg",
    select_music_track = function()
        --[[
        -- check if the music_all setting is enabled
        if not (cryptposting_config and cryptposting_config.music_all) then
            return false
        end
        ]]--
        if next(Cryptid.advanced_find_joker(nil, "crp_all", nil, nil, true)) then
            return 1.3e308
        --[[
        else
            return false
        ]]--
        end
    end,
})

SMODS.Sound({
    key = "music_mythic",
    path = "music_mythic.ogg",
    volume = 1.5,
    select_music_track = function()
        -- check if the music_mythic setting is enabled
        --[[
        if not (cryptposting_config and cryptposting_config.music_mythic) then
            return false
        end
        ]]--
        if next(Cryptid.advanced_find_joker(nil, "crp_mythic", nil, nil, true)) then
            return 1e308
        --[[
        else
            return false
        ]]--
        end
    end,
})

SMODS.Sound({
    key = "music_exomythic",
    path = "music_exomythic.ogg",
    volume = 1.5,
    select_music_track = function()
        -- check if the music_exomythic setting is enabled
        --[[
        if not (cryptposting_config and cryptposting_config.music_exomythic) then
            return false
        end
        ]]--
        if next(Cryptid.advanced_find_joker(nil, "crp_exomythic", nil, nil, true))
        or next(Cryptid.advanced_find_joker(nil, "crp_2exomythic4me", nil, nil, true)) then
            return 1.1e308
        --[[
        else
            return false
        ]]--
        end
    end,
})

SMODS.Sound({
    key = "music_22exomythic4mecipe",
    path = "music_22exomythic4mecipe.ogg",
    volume = 1.5,
    select_music_track = function()
        -- check if the music_22exomythic4mecipe setting is enabled
        --[[
        if not (cryptposting_config and cryptposting_config.music_22exomythic4mecipe) then
            return false
        end
        ]]--
        if next(Cryptid.advanced_find_joker(nil, "crp_22exomythic4mecipe", nil, nil, true))
        or next(Cryptid.advanced_find_joker(nil, "crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe", nil, nil, true))
        or next(Cryptid.advanced_find_joker(nil, "crp_supa_rare", nil, nil, true)) then
            return 1.2e308
        --[[
        else
            return false
        ]]--
        end
    end,
})

-- hook into the music_exotic select_music_track function thing to add outlandish
local og_track = SMODS.Sounds.cry_music_exotic.select_music_track
SMODS.Sounds.cry_music_exotic.select_music_track = function()
    return (og_track and og_track())
        or next(Cryptid.advanced_find_joker(nil, "crp_outlandish", nil, nil, true)) ~= nil
end
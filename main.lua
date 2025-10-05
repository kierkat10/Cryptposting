-- a file specifically to load all other lua files in the mod (and for config stuff)

-- load settings and config first
local files = {
    "lib/settings",
    "config",
    "lib/smods.", -- extra . is intentional
    -- then load everything else
    "items/consumable/tarot",
    "items/consumable/spectral",
    "items/consumable/code",
    "items/consumable/pot",
    "items/joker/abysmal",
    "items/joker/cursed",
    "items/joker/self-insert",
    "items/joker/trash",
    "items/joker/colonthree",
    "items/joker/common",
    "items/joker/plentiful",
    "items/joker/2common4me",
    "items/joker/uncommon",
    "items/joker/unplentiful",
    "items/joker/unrare",
    "items/joker/rare",
    "items/joker/well-done",
    "items/joker/candy",
    "items/joker/refined",
    "items/joker/joker",
    "items/joker/epic",
    "items/joker/cipe",
    "items/joker/incredible",
    "items/joker/legendary",
    "items/joker/divine",
    "items/joker/exotic",
    "items/joker/exotic2",
    "items/joker/mythic",
    "items/joker/exomythic",
    "items/joker/2exomythic4me",
    "items/joker/22exomythic4mecipe",
    "items/joker/exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
    "items/joker/supa_rare",
    "items/joker/all",
    "items/blind",
    "items/booster",
    "items/deck",
    "items/edition",
    "items/rarity",
    "items/stake",
    "items/tag",
    "items/voucher",
    "items/challenge",
    "lib/cardanim",
    "lib/cardanim_macros/skim",
    "lib/abysmal",
    "lib/http",
    "lib/misc",
    "lib/modbadge",
    "lib/music",
    "lib/pointerblist",
    "lib/pronouns",
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end

-- very important do not delete
-- https://gist.githubusercontent.com/MattIPv4/045239bc27b16b2bcf7a3a9a4648c08a/raw/2411e31293a35f3e565f61e7490a806d4720ea7e
-- a file specificlaly to load all other lua files in the mod (and for config stuff)

local files = {
	"items/blind",
	"items/booster",
	"items/consumable",
	"items/deck",
	"items/edition",
	"items/joker/abysmal",
	"items/joker/cursed",
	"items/joker/self-insert",
	"items/joker/trash",
	"items/joker/colonthree",
	"items/joker/common",
	"items/joker/common2",
	"items/joker/uncommon",
	"items/joker/rare",
	"items/joker/rare2",
	"items/joker/joker",
	"items/joker/epic",
	"items/joker/cipe",
	"items/joker/legendary",
	"items/joker/exotic",
	"items/joker/exotic2",
	"items/joker/mythic",
	"items/joker/exomythic",
	"items/joker/2exomythic4me",
	"items/joker/22exomythic4mecipe",
	"items/joker/exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
	"items/joker/all",
	"items/rarity",
	"items/tag",
	"items/voucher",
	"items/challenge",
	"lib/https",
	"lib/cardanim",
	"lib/cardanim_macros/skim",
	"lib/modbadge",
	"lib/pointerblist",
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end

local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
	local ret = oldfunc(change_context)
	-- adds bulgoe to the main menu
	local newcard = Card(
		G.title_top.T.x,
		G.title_top.T.y,
		G.CARD_W,
		G.CARD_H,
		G.P_CARDS.empty,
		G.P_CENTERS.j_crp_bulgoe,
		{ bypass_discovery_center = true }
	)
	-- recenter the title
	G.title_top.T.w = G.title_top.T.w * 1.7675
	G.title_top.T.x = G.title_top.T.x - 0.8
	G.title_top:emplace(newcard)
	-- make the card look the same way as the title screen ace of spades
	newcard.T.w = newcard.T.w * 1.4
	newcard.T.h = newcard.T.h * 1.4
	newcard:set_sprites(newcard.config.center)
	newcard.no_ui = true
	newcard.states.visible = false
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0,
		blockable = false,
		blocking = false,
		func = function()
			if change_context == "splash" then
				newcard.states.visible = true
				newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 2.5)
			else
				newcard.states.visible = true
				newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 1.2)
			end
			return true
		end,
	}))

	return ret
end

Cryptid.mod_whitelist["Cryptposting"] = true

SMODS.Atlas({
	key = "modicon",
	path = "crp_icon.png",
	px = 34,
	py = 34,
})

-- currently not used and a wip for self-insert jokers' ability to always be absolute
--[[
local _occ = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local _card = _occ(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	if _type == "Joker" and _card.ability.rarity== "crp_self-insert" then
		SMODS.Stickers["cry_absolute"]:apply(_card, true)
		print("skibidi hawk tuah big mac")
	end
	return _card
end
]]--

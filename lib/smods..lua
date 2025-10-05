-- atlases

SMODS.Atlas {
	key = "consumable",
	path = "atlas_consumable.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "joker",
	path = "atlas_joker.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "joker2",
	path = "atlas_joker_2.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "placeholder",
	path = "atlas_placeholder.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "timmy",
	path = "timmy.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "peter",
	path = "peter.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "henry",
	path = "henry.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "fun_coin",
	path = "fun_coin.png",
	px = 71,
	py = 71
}

SMODS.Atlas {
	key = "blind",
    atlas_table = "ANIMATION_ATLAS",
	path = "atlas_blind.png",
	px = 34,
	py = 34,
	frames = 21
}

SMODS.Atlas {
	key = "booster",
	path = "atlas_booster.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "deck",
	path = "atlas_deck.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "stake",
	path = "atlas_stake.png",
	px = 29,
	py = 29
}

SMODS.Atlas {
	key = "tag",
	path = "atlas_tag.png",
	px = 34,
	py = 34
}

SMODS.Atlas {
	key = "voucher",
	path = "atlas_voucher.png",
	px = 71,
	py = 95
}

-- shaders

SMODS.Shader {
	key = "overloaded",
	path = "overloaded.fs",
}

SMODS.Shader {
	key = "fourdimensional",
	path = "fourdimensional.fs",
}

SMODS.Shader {
	key = "psychic",
	path = "psychic.fs",
}

-- sounds

SMODS.Sound {
	key = "eat",
	path = "eat.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Sound {
	key = "additivechipsmult",
	path = "AdditiveChipsMult.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Sound {
	key = "multiplicativechipsmult",
	path = "MultiplicativeChipsMult.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Sound {
	key = "exponentialchipsmult",
	path = "ExponentialChipsMult.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Sound {
	key = "tetrationalchipsmult",
	path = "TetrationalChipsMult.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Sound {
	key = "pentationalchipsmult",
	path = "PentationalChipsMult.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Sound {
	key = "hexationalchips",
	path = "HexationalChips.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Sound {
	key = "hexationalmult",
	path = "HexationalMult.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Sound {
	key = "hexationalchipsmult",
	path = "HexationalChipsMult.ogg",
	loop = false,
	volume = 0.5,
}

SMODS.Sound {
	key = "heptationalchips",
	path = "HeptationalChips.ogg",
	loop = false,
	volume = 0.4,
}

SMODS.Sound {
	key = "heptationalmult",
	path = "HeptationalMult.ogg",
	loop = false,
	volume = 0.4,
}

SMODS.Sound {
	key = "heptationalchipsmult",
	path = "HeptationalChipsMult.ogg",
	loop = false,
	volume = 0.4,
}

SMODS.Sound {
	key = "e_overloaded",
	path = "e_overloaded.ogg",
}

SMODS.Sound {
	key = "e_four-dimensional",
	path = "e_four-dimensional.ogg",
}

-- objecttypes

SMODS.ConsumableType {
	key = "Pot",
	primary_colour = { 1, 0.910, 0.537, 1 },
	secondary_colour = { 0.75, 0.682, 0.403, 1 },
	collection_rows = { 4, 4 },
	shop_rate = 0,
	loc_txt = {},
	default = "c_crp_desires",
	can_stack = true,
	can_divide = true
}

SMODS.ObjectType {
	key = "Bulgoe",
	default = "j_crp_bulgoe",
}
local trash_gradient = SMODS.Gradient({
    key="trash",
    colours = {
        HEX("989898"),
        HEX("272727")
    },
	cycle = 5
})

local m = SMODS.Gradient({
    key="m",
    colours = {
        HEX("708b91"), 
        HEX("1e9eba")
    }
})

local mythic_gradient = SMODS.Gradient({
    key="mythic",
    colours = {
        HEX("ff6600"),
        HEX("ffff00")
    },
})

local exomythic_gradient = SMODS.Gradient({
    key="exomythic",
    colours = {
        HEX("ff6600"),
        HEX("708b91"), 
        HEX("1e9eba"),
        HEX("ffff00")
    }
})

local exomythic4me_gradient = SMODS.Gradient({
    key="2exomythic4me",
    colours = {
        HEX("ff6600"),
        HEX("708b91"), 
        HEX("1e9eba"),
        HEX("ffff00"),
		HEX("00ffff")
    },
	cycle = 7
})

local exomythic4mecipe_gradient = SMODS.Gradient({
    key="22exomythic4mecipe",
    colours = {
        HEX("ff6600"),
        HEX("708b91"), 
        HEX("1e9eba"),
        HEX("ffff00"),
		HEX("ef0098")
    },
	cycle = 3
})

local exomythicepicawesomeuncommon2mexotic22exomythic4mecipe_gradient = SMODS.Gradient({
	key="exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
	colours = {
		HEX("ff6600"),
		HEX("708b91"), 
		HEX("1e9eba"),
		HEX("ffff00"),
		HEX("ef0098"),
		HEX("00ffff"),
		HEX("4bc292"),
		HEX("708b91"), 
		HEX("1e9eba"),
		HEX("708b91"), 
		HEX("1e9eba"),
		HEX("ff6600"),
		HEX("708b91"), 
		HEX("1e9eba"),
		HEX("ffff00"),
		HEX("ef0098")
	},
	cycle = 2
})

SMODS.Rarity({
	key = "abysmal",
	badge_colour = HEX("49011c"),
	pools = { ["Joker"] = true },
})

SMODS.Rarity({
	key = "trash",
	badge_colour = trash_gradient,
	default_weight = 0.005,
	pools = { ["Joker"] = true },
	get_weight = function(self, weight, object_type)
		return weight
	end
})

SMODS.Rarity({
	key = ":3",
	badge_colour = HEX("ff00ff"),
	in_shop = true,
	default_weight = 0.005,
	pools = { ["Joker"] = true },
	get_weight = function(self, weight, object_type)
		return weight
	end
})

SMODS.Rarity({
	key = "common_2",
	badge_colour = G.C.RARITY[1],
	pools = { ["Joker"] = true },
	default_weight = 0.004, -- at some point, this will be as common as, well, common, but it will be very low for the time being due to there not being very many common 2 jokers
	get_weight = function(self, weight, object_type)
		return weight
	end
})

SMODS.Rarity({
	key = "2common4me",
	badge_colour = HEX("1badc3"),
	pools = { ["Joker"] = true },
})

SMODS.Rarity({
	key = "uncommon_2",
	badge_colour = HEX("4bc292"),
	pools = { ["Joker"] = true },
})

SMODS.Rarity({
	key = "unrare",
	badge_colour = HEX("b1e051"),
	pools = { ["Joker"] = true },
})

SMODS.Rarity({
	key = "rare_2",
	badge_colour = G.C.RARITY[3],
	pools = { ["Joker"] = true },
	default_weight = 0.004, -- see: common 2
	get_weight = function(self, weight, object_type)
		return weight
	end
})

SMODS.Rarity({
	key = "refined",
	badge_colour = HEX("ef005d"),
	pools = { ["Joker"] = true },
	default_weight = 0.003,
	get_weight = function(self, weight, object_type)
		return weight
	end
})

SMODS.Rarity({
	key = "joker",
	badge_colour = HEX("fd812b"),
	in_shop = true,
	default_weight = 0.004,
	pools = { ["Joker"] = true },
	get_weight = function(self, weight, object_type)
		return weight
	end
})

SMODS.Rarity({
	key = "meat",
	badge_colour = HEX("7f6000"),
	pools = { ["Joker"] = true },
})

SMODS.Rarity({
	key = "m",
	badge_colour = m,
})

SMODS.Rarity({
	key = "cipe",
	badge_colour = HEX("ef0098"),
	default_weight = 0.003,
	pools = { ["Joker"] = true },
	get_weight = function(self, weight, object_type)
		return weight
	end
})

SMODS.Rarity({
	key = "incredible",
	badge_colour = HEX("b52b9a"),
	pools = { ["Joker"] = true },
	default_weight = 0.001,
	get_weight = function(self, weight, object_type)
		return weight
	end
})

SMODS.Rarity({
	key = "extraordinary",
	badge_colour = HEX("b52b9a"),
	pools = { ["Joker"] = true },
	default_weight = 0.001,
	get_weight = function(self, weight, object_type)
		return weight
	end
})

SMODS.Rarity({
	key = "awesome",
	badge_colour = HEX("00ffff"),
	pools = { ["Joker"] = true },
})

SMODS.Rarity({
	key = "exotic_2",
	badge_colour = m,
	pools = { ["Joker"] = true }
})

SMODS.Rarity({
	key = "mythic",
	badge_colour = mythic_gradient,
	pools = { ["Joker"] = true }
})

SMODS.Rarity({
	key = "exomythic",
	badge_colour = exomythic_gradient,
	pools = { ["Joker"] = true }
})


SMODS.Rarity({
	key = "2exomythic4me",
	badge_colour = exomythic4me_gradient,
})

SMODS.Rarity({
	key = "22exomythic4mecipe",
	badge_colour = exomythic4mecipe_gradient,
})

SMODS.Rarity({
	key = "exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
	badge_colour = exomythicepicawesomeuncommon2mexotic22exomythic4mecipe_gradient,
})

SMODS.Rarity({
	key = "supa rare",
	badge_colour = HEX("000000")
})

SMODS.Rarity({
	key = "all",
	badge_colour = HEX("000000")
})

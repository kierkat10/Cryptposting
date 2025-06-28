SMODS.Challenge {
    key = "cecilchallenge",
    loc_txt = {
        name = "Sea Salt",
    },
    rules = {
        modifiers = {
            { id = "dollars", value = -7360002798 }
        }
    },
    consumeables = {
        { id = "c_judgement" },
        { id = "c_judgement" }
    },
    restrictions = {
		banned_cards = {},
		banned_other = {
            { id = "bl_ox", type = "blind" }
        }
	},
}

SMODS.Challenge {
    key = "marathon",
    loc_txt = {
        name = "Marathon",
    },
    rules = {
        modifiers = {
            { id = "joker_slots", value = -1e100 },
            { id = "hands", value = 1 },
            { id = "discards", value = 10 },
            { id = "hand_size", value = 6 },
        }
    },
    jokers = {
        { id = "j_crp_sprinter", stickers = { "eternal" } },
        { id = "j_cry_sync_catalyst", stickers = { "eternal" } },
    },
    deck = {
        type = "Challenge Deck"
    }
}

if CardPronouns then

CardPronouns.PronounClassification {
    key = "bulgoenouns",
    pronouns = { "bulgoe", "bul", "goe"  }
}

CardPronouns.Pronoun {
    colour = HEX("5865F2"),
    text_colour = G.C.WHITE,
    pronoun_table = { "bulgoe", "bul", "goe" },
    in_pool = function()
        return false
    end,
    key = "bulgoe"
}

end
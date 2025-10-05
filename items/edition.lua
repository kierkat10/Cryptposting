SMODS.Edition {
	key = "zany",
	weight = 0,
	shader = false,
	sound = {
        sound = "cry_e_jolly",
        per = 1,
        vol = 0.5,
    },
	pos = { x = 3, y = 0},
	in_shop = false,
	extra_cost = 0,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { mult = 12, trigger = nil },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.mult } }
	end,
	calculate = function(self, card, context)
		if
			(
				context.edition -- for when on jonklers
				and context.cardarea == G.jokers -- checks if should trigger
				and card.config.trigger -- fixes double trigger
			) or (
				context.main_scoring -- for when on playing cards
				and context.cardarea == G.play
			)
		then
			return { mult = self.config.mult } -- updated value
		end
		if context.joker_main then
			card.config.trigger = true -- context.edition triggers twice, this makes it only trigger once (only for jonklers)
		end

		if context.after then
			card.config.trigger = nil
		end
	end,
	-- gee i wonder where i stole this from
	on_apply = function(card)
		--Change name of cards with Jolly edition
		local gcui = generate_card_ui
		function generate_card_ui(
			_c,
			full_UI_table,
			specific_vars,
			card_type,
			badges,
			hide_desc,
			main_start,
			main_end,
			card
		)
			local full_UI_table =
				gcui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
			if
				card
				and Cryptid.safe_get(card, "edition", "crp_mad")
				and ((not card.ability) or card.ability.set ~= "Edition")
				and type(Cryptid.safe_get(full_UI_table, "name")) == "table"
				and Cryptid.safe_get(full_UI_table.name, 1, "nodes", 1, "config", "object", "config")
			then
				local conf = full_UI_table.name[1].nodes[1].config.object.config
				if conf.string and #conf.string > 0 then
					local function q_ify_word(text)
						-- Define a pattern for vowels
						local vowels = "AEIOUaeiou"

						-- Use gsub to replace the first consonant of each word with 'M'
						local result = text:gsub("(%a)(%w*)", function(first, rest)
							if vowels:find(first) then
								-- If the first character is a vowel, add an M
								if (not rest[1]) or (rest:lower()[1] == rest[1]) then --this check doesn't work properly
									return "Q" .. first:lower() .. rest
								else
									return "Q" .. first:upper() .. rest
								end
							elseif first:lower() == "q" then
								-- If the word already starts with 'z', keep it unchanged
								return first .. rest
							else
								-- Replace the first consonant with 'z'
								return "Z" .. rest
							end
						end)

						return result
					end
					function q_ify(text)
						-- Use gsub to apply the m_ify_word function to each word
						local result = text:gsub("(%S+)", function(word)
							return q_ify_word(word)
						end)

						return result
					end
					conf.string[1] = q_ify(conf.string[1])
					full_UI_table.name[1].nodes[1].config.object:remove()
					full_UI_table.name[1].nodes[1].config.object = DynaText(conf)
				end
			end
			return full_UI_table
		end
	end,
    crp_credits = {
        idea = { "superb_thing" },
		code = { "Rainstar" },
	},
}

SMODS.Edition {
	key = "mad",
	weight = 0,
	shader = false,
	sound = {
        sound = "cry_e_jolly",
        per = 1,
        vol = 0.5,
    },
	pos = { x = 4, y = 0},
	in_shop = false,
	extra_cost = 0,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { mult = 10, trigger = nil },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.mult } }
	end,
	calculate = function(self, card, context)
		if
			(
				context.edition -- for when on jonklers
				and context.cardarea == G.jokers -- checks if should trigger
				and card.config.trigger -- fixes double trigger
			) or (
				context.main_scoring -- for when on playing cards
				and context.cardarea == G.play
			)
		then
			return { mult = self.config.mult } -- updated value
		end
		if context.joker_main then
			card.config.trigger = true -- context.edition triggers twice, this makes it only trigger once (only for jonklers)
		end

		if context.after then
			card.config.trigger = nil
		end
	end,
	-- gee i still wonder where i stole this from
	on_apply = function(card)
		--Change name of cards with Jolly edition
		local gcui = generate_card_ui
		function generate_card_ui(
			_c,
			full_UI_table,
			specific_vars,
			card_type,
			badges,
			hide_desc,
			main_start,
			main_end,
			card
		)
			local full_UI_table =
				gcui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
			if
				card
				and Cryptid.safe_get(card, "edition", "crp_mad")
				and ((not card.ability) or card.ability.set ~= "Edition")
				and type(Cryptid.safe_get(full_UI_table, "name")) == "table"
				and Cryptid.safe_get(full_UI_table.name, 1, "nodes", 1, "config", "object", "config")
			then
				local conf = full_UI_table.name[1].nodes[1].config.object.config
				if conf.string and #conf.string > 0 then
					local function c_ify_word(text)
						-- Define a pattern for vowels
						local vowels = "AEIOUaeiou"

						-- Use gsub to replace the first consonant of each word with 'M'
						local result = text:gsub("(%a)(%w*)", function(first, rest)
							if vowels:find(first) then
								-- If the first character is a vowel, add an M
								if (not rest[1]) or (rest:lower()[1] == rest[1]) then --this check doesn't work properly
									return "C" .. first:lower() .. rest
								else
									return "C" .. first:upper() .. rest
								end
							elseif first:lower() == "c" then
								-- If the word already starts with 'M', keep it unchanged
								return first .. rest
							else
								-- Replace the first consonant with 'M'
								return "C" .. rest
							end
						end)

						return result
					end
					function c_ify(text)
						-- Use gsub to apply the m_ify_word function to each word
						local result = text:gsub("(%S+)", function(word)
							return c_ify_word(word)
						end)

						return result
					end
					conf.string[1] = c_ify(conf.string[1])
					full_UI_table.name[1].nodes[1].config.object:remove()
					full_UI_table.name[1].nodes[1].config.object = DynaText(conf)
				end
			end
			return full_UI_table
		end
	end,
    crp_credits = {
        idea = { "superb_thing" },
		code = { "Rainstar" },
	},
}

SMODS.Edition {
	key = "crazy",
	weight = 0,
	shader = false,
	sound = {
        sound = "cry_e_jolly",
        per = 1,
        vol = 0.5,
    },
	pos = { x = 5, y = 0},
	in_shop = false,
	extra_cost = 0,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { mult = 30, trigger = nil },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.mult } }
	end,
	calculate = function(self, card, context)
		if
			(
				context.edition -- for when on jonklers
				and context.cardarea == G.jokers -- checks if should trigger
				and card.config.trigger -- fixes double trigger
			) or (
				context.main_scoring -- for when on playing cards
				and context.cardarea == G.play
			)
		then
			return { mult = self.config.mult } -- updated value
		end
		if context.joker_main then
			card.config.trigger = true -- context.edition triggers twice, this makes it only trigger once (only for jonklers)
		end

		if context.after then
			card.config.trigger = nil
		end
	end,
	-- gee i once again still wonder where i stole this from
	on_apply = function(card)
		--Change name of cards with Jolly edition
		local gcui = generate_card_ui
		function generate_card_ui(
			_c,
			full_UI_table,
			specific_vars,
			card_type,
			badges,
			hide_desc,
			main_start,
			main_end,
			card
		)
			local full_UI_table =
				gcui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
			if
				card
				and Cryptid.safe_get(card, "edition", "crp_mad")
				and ((not card.ability) or card.ability.set ~= "Edition")
				and type(Cryptid.safe_get(full_UI_table, "name")) == "table"
				and Cryptid.safe_get(full_UI_table.name, 1, "nodes", 1, "config", "object", "config")
			then
				local conf = full_UI_table.name[1].nodes[1].config.object.config
				if conf.string and #conf.string > 0 then
					local function c_ify_word(text)
						-- Define a pattern for vowels
						local vowels = "AEIOUaeiou"

						-- Use gsub to replace the first consonant of each word with 'M'
						local result = text:gsub("(%a)(%w*)", function(first, rest)
							if vowels:find(first) then
								-- If the first character is a vowel, add an M
								if (not rest[1]) or (rest:lower()[1] == rest[1]) then --this check doesn't work properly
									return "CCC" .. first:lower() .. rest
								else
									return "CCC" .. first:upper() .. rest
								end
							elseif first:lower() == "ccc" then
								-- If the word already starts with 'M', keep it unchanged
								return first .. rest
							else
								-- Replace the first consonant with 'M'
								return "CCC" .. rest
							end
						end)

						return result
					end
					function c_ify(text)
						-- Use gsub to apply the m_ify_word function to each word
						local result = text:gsub("(%S+)", function(word)
							return c_ify_word(word)
						end)

						return result
					end
					conf.string[1] = c_ify(conf.string[1])
					full_UI_table.name[1].nodes[1].config.object:remove()
					full_UI_table.name[1].nodes[1].config.object = DynaText(conf)
				end
			end
			return full_UI_table
		end
	end,
    crp_credits = {
        idea = { "superb_thing" },
		code = { "Rainstar" },
	},
}

SMODS.Edition {
	key = "insane",
	weight = 0,
	shader = false,
	sound = {
        sound = "cry_e_jolly",
        per = 1,
        vol = 0.5,
    },
	pos = { x = 4, y = 0},
	in_shop = false,
	extra_cost = 0,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { mult = 90, trigger = nil },
	loc_vars = function(self, info_queue)
		return { vars = { self.config.mult } }
	end,
	calculate = function(self, card, context)
		if
			(
				context.edition -- for when on jonklers
				and context.cardarea == G.jokers -- checks if should trigger
				and card.config.trigger -- fixes double trigger
			) or (
				context.main_scoring -- for when on playing cards
				and context.cardarea == G.play
			)
		then
			return { mult = self.config.mult } -- updated value
		end
		if context.joker_main then
			card.config.trigger = true -- context.edition triggers twice, this makes it only trigger once (only for jonklers)
		end

		if context.after then
			card.config.trigger = nil
		end
	end,
	-- gee i once again, for the fourth time, still wonder where i stole this from
	on_apply = function(card)
		--Change name of cards with Jolly edition
		local gcui = generate_card_ui
		function generate_card_ui(
			_c,
			full_UI_table,
			specific_vars,
			card_type,
			badges,
			hide_desc,
			main_start,
			main_end,
			card
		)
			local full_UI_table =
				gcui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
			if
				card
				and Cryptid.safe_get(card, "edition", "crp_mad")
				and ((not card.ability) or card.ability.set ~= "Edition")
				and type(Cryptid.safe_get(full_UI_table, "name")) == "table"
				and Cryptid.safe_get(full_UI_table.name, 1, "nodes", 1, "config", "object", "config")
			then
				local conf = full_UI_table.name[1].nodes[1].config.object.config
				if conf.string and #conf.string > 0 then
					local function c_ify_word(text)
						-- Define a pattern for vowels
						local vowels = "AEIOUaeiou"

						-- Use gsub to replace the first consonant of each word with 'M'
						local result = text:gsub("(%a)(%w*)", function(first, rest)
							if vowels:find(first) then
								-- If the first character is a vowel, add an M
								if (not rest[1]) or (rest:lower()[1] == rest[1]) then --this check doesn't work properly
									return "CCCCCCCCC" .. first:lower() .. rest
								else
									return "CCCCCCCCC" .. first:upper() .. rest
								end
							elseif first:lower() == "c" then
								-- If the word already starts with 'M', keep it unchanged
								return first .. rest
							else
								-- Replace the first consonant with 'M'
								return "CCCCCCCCC" .. rest
							end
						end)

						return result
					end
					function c_ify(text)
						-- Use gsub to apply the m_ify_word function to each word
						local result = text:gsub("(%S+)", function(word)
							return c_ify_word(word)
						end)

						return result
					end
					conf.string[1] = c_ify(conf.string[1])
					full_UI_table.name[1].nodes[1].config.object:remove()
					full_UI_table.name[1].nodes[1].config.object = DynaText(conf)
				end
			end
			return full_UI_table
		end
	end,
    crp_credits = {
        idea = { "superb_thing" },
		code = { "Rainstar" },
	},
}

SMODS.Edition {
	key = "overloaded",
	weight = 0.03,
	shader = "overloaded",
	sound = {
        sound = "crp_e_overloaded",
        per = 1,
        vol = 0.5,
    },
	in_shop = true,
	extra_cost = 0,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { eeechips = 1.03, eee_mult = 1.03, trigger = nil },
	loc_vars = function(self, info_queue)
		return { vars = { lenient_bignum(self.config.eeechips), lenient_bignum(self.config.eee_mult) } }
	end,
	calculate = function(self, card, context)
		if
			(
				context.edition -- for when on jokers
				and context.cardarea == G.jokers -- checks if should trigger
				and card.config.trigger -- fixes double trigger
			)
			or
			(
				context.main_scoring -- for when on playing cards
				and context.cardarea == G.play
			)
		then
			return {
				eeechips = lenient_bignum(self.config.eeechips),
				extra = {
					eee_mult = lenient_bignum(self.config.eee_mult)
				}
			}
		end
		if context.joker_main then
			card.config.trigger = true -- context.edition triggers twice, this makes it only trigger once (only for jokers)
		end
		if context.after then
			card.config.trigger = nil
		end
	end,
    crp_credits = {
        idea = { "Glitchkat10" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" },
	},
}

SMODS.Edition {
	disable_base_shader = true,
	disable_shadow = true,
    key = "four-dimensional",
    weight = 0.2,
    shader = "fourdimensional",
    in_shop = true,
    extra_cost = 5,
    sound = {
        sound = "crp_e_four-dimensional",
        per = 1,
        vol = 0.5,
    },
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    config = { extra = { retrigger_chance = 4, retriggers = 24 } },
    loc_vars = function(self, info_queue, center)
        local chance = center and center.edition and center.edition.retrigger_chance or lenient_bignum(self.config.extra.retrigger_chance)
        local retriggers = center and center.edition and center.edition.retriggers or lenient_bignum(self.config.extra.retriggers)
        return { vars = { G.GAME.probabilities.normal or 1, chance, retriggers } }
    end,
    calculate = function(self, card, context)
        if
            context.other_card == card
            and (
                (context.repetition and context.cardarea == G.play)
                or (context.retrigger_joker_check and not context.retrigger_joker)
            )
        then
            local should_retrigger = pseudorandom("crp_four-dimensional") <= G.GAME.probabilities.normal / lenient_bignum(self.config.extra.retrigger_chance)
            return {
                message = localize("k_again_ex"),
                repetitions = should_retrigger and lenient_bignum(self.config.extra.retriggers) or 0,
            }
        end
    end,
    crp_credits = {
        idea = { "Glitchkat10" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" },
	},
}

--[[ SMODS.Shader {
	key = "psychic",
	path = "psychic.fs",
}

SMODS.Edition {
    key = "psychic",
    weight = 0.2,
    shader = "psychic",
    in_shop = true,
    extra_cost = 5,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    config = { extra = { arrows = 1, mantissa = 7, increase = 1, amount = 7 }, immutable = { max = 10000 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { "{", lenient_bignum(self.config.extra.arrows), "}", lenient_bignum(self.config.extra.mantissa), lenient_bignum(self.config.extra.increase), lenient_bignum(self.config.extra.amount) } }
    end,
    calculate = function(self, card, context)
		if
			(
				context.edition -- for when on jokers
				and context.cardarea == G.jokers -- checks if should trigger
				and card.config.trigger -- fixes double trigger
			) or (
				context.main_scoring -- for when on playing cards
				and context.cardarea == G.play
			)
		then
			return {
				hypermult_mod = {
					math.round(lenient_bignum(math.min(lenient_bignum(self.config.extra.arrows), lenient_bignum(self.config.immutable.max)))),
					lenient_bignum(self.config.extra.mantissa)
				},
				message = "{" .. lenient_bignum(math.min(lenient_bignum(self.config.extra.arrows), lenient_bignum(card.ability.immutable.max))) .. "}" .. lenient_bignum(self.config.extra.mantissa) .. ' Mult',
				colour = G.C.EDITION,
			}
		end
		if context.joker_main then
			card.config.trigger = true -- context.edition triggers twice, this makes it only trigger once (only for jokers)
		end
		if context.after then
			card.config.trigger = nil
		end
	end,
	crp_credits = {
        idea = { "Glitchkat10" },
		art = { "Glitchkat10" },
		code = { "Glitchkat10" },
	},
} ]]--

SMODS.Edition {
	key = "really_negative",
	weight = 0.3,
	shader = "negative",
	prefix_config = { shader = false },
	in_shop = true,
	extra_cost = 5,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { card_limit = 3 },
	loc_vars = function(self, info_queue, center)
		return { vars = { self.config.card_limit } }
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Edition {
	key = "super_negative",
	weight = 0.15,
	shader = "negative",
	prefix_config = { shader = false },
	in_shop = true,
	extra_cost = 10,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { card_limit = 10 },
	loc_vars = function(self, info_queue, center)
		return { vars = { self.config.card_limit } }
	end,
	crp_credits = {
		idea = { "PurplePickle" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Edition {
	key = "photon_readings_negative",
	weight = 0.075,
	shader = "negative",
	prefix_config = { shader = false },
	in_shop = true,
	extra_cost = 20,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { card_limit = 66 },
	loc_vars = function(self, info_queue, center)
		return { vars = { self.config.card_limit } }
	end,
	crp_credits = {
		idea = { "SageSeraph" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Edition {
	key = "photon_readings_really_negative",
	weight = 0.0375,
	shader = "negative",
	prefix_config = { shader = false },
	in_shop = true,
	extra_cost = 50,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { card_limit = 666666 },
	loc_vars = function(self, info_queue, center)
		return { vars = { self.config.card_limit } }
	end,
	crp_credits = {
		idea = { "SageSeraph" },
		code = { "wilfredlam0418" }
	}
}

SMODS.Edition {
	key = "photon_readings_gone",
	weight = 0.1875,
	shader = "negative",
	prefix_config = { shader = false },
	in_shop = false,
	extra_cost = 100,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	config = { card_limit = 1e100 },
	loc_vars = function(self, info_queue, center)
		return { vars = { self.config.card_limit } }
	end,
	crp_credits = {
		idea = { "Grahkon" },
		code = { "wilfredlam0418" }
	}
}
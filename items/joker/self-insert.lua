SMODS.Atlas {
	key = "joker",
	path = "atlas_joker.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "placeholder",
	path = "atlas_placeholder.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = "glitchkat10",
	name = "Glitchkat10",
	config = { extra = { mult = 1, chips = 1, Xmult = 1, Xchips = 1 } },
	rarity = "crp_self-insert",
	atlas = "crp_joker",
	pos = { x = 5, y = 1 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips), lenient_bignum(card.ability.extra.mult), lenient_bignum(card.ability.extra.Xchips), lenient_bignum(card.ability.extra.Xmult) } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			local quotes = {
				"yea i made the mod",
				"i'm so tuff",
				"hello",
				"i see.",
				"graveyarded!",
				"approved!",
				"alr bro",
				"in the big '27 :wilted_rose:",
				"dysthymia",
				"bulgoe",
				"bulgoe's hiking journey",
				"bulgoe prize",
				"bulgoeship card",
				"https://discord.gg/Jk9Q9usrNy",
				"my name is glitchkat10. i made the cryptposting.",
				"i'm cryptposting it",
				"\"i have no idea why this isn't affecting the speed rn\"",
				"my favorite song is nanachi by mrkolii",
				"can we ban grahkon he's taking up too much space",
				"ultrakill",
				"joe kerr",
				"i also coded for ascensio",
				"i also coded for cryptid",
				"i also made glitch's backlog",
				"i also suggestions for cryptid",
				"i also drew for ascensio",
				"i also made suggestions for ascensio",
				"polterworx (formerly twitter)",
				"tbh i work more on cryptposting than poker",
				"icl ts pmo sm :broken_heart:",
				"i use vs code for coding",
				"i use zen for browsing",
				"i use aseprite for drawing",
				"hey guys, did you know that in terms of male human and female pokémon breeding, vaporeon is the most compatible pokémon for humans? not only are they in the field egg group, which is mostly comprised of mammals, vaporeon are an average of 3\"03' tall and 63.9 pounds, this means they're large enough to be able handle human dicks, and with their impressive base stats for hp and access to acid armor, you can be rough with one. due to their mostly water based biology, there's no doubt in my mind that an aroused vaporeon would be incredibly wet, so wet that you could easily have sex with one for hours without getting sore. they can also learn the moves attract, baby-doll eyes, captivate, charm, and tail whip, along with not having fur to hide nipples, so it'd be incredibly easy for one to get you in the mood. with their abilities water absorb and hydration, they can easily recover from fatigue with enough water. no other pokémon comes close to this level of compatibility. also, fun fact, if you pull out enough, you can make your vaporeon turn white. vaporeon is literally built for human dick. ungodly defense stat+high hp pool+acid armor means it can take cock all day, all shapes and sizes and still come for more.",
				"what the smegma",
				"me (6'1\") when a burglar (balatro reference) tries to steal my feminist literature (6'1\" btw)",
				"metal pipe sound effect",
				"collecting \"code = { \"glitchkat10\" }\" like the cuts on my body",
				"what the freak bro",
				"schedule 1 is peam",
				"this will be PEAM",
				"#f04360",
				"#322136",
				"#4c2f4d",
				"#613e5f",
				"#784d75",
				"#855a82",
				"#bd1d3a",
				"i completely made the overloaded edition",
				"i completely made the four-dimensional edition",
				"attempt to compare number with table",
				"mythic tag when",
				"release when",
				"i'm a guy btw",
				"abysmal",
				"self-insert",
				"exomythic",
				"trash",
				"i'm not saying colon three",
				"2common4me",
				"uncommon 2",
				"unrare",
				"rare 2",
				"meat",
				"m",
				"cipe",
				"awesome",
				"exotic 2",
				"mythic",
				"exomythic",
				"2exomythic4me",
				"22exomythic4mecipe",
				"exomythicepicawesomeuncommon2mexotic22exomythic4mecipe",
				"exomythicepicawesomeuncommon2mexotic2gigammegaalphaomnipotranscendant2exomythic4mecipe",
				"supa rare",
				"all",
				"again!",
				"nope!",
				"this is quote 80",
				"9^2",
				"playerrkillerr",
				"illegal",
				"banned",
				"poker is like 12 ngl",
				"just the two of us",
				"bulgoe",
				"hd bulgoe",
				"bulgoeship card has gained ^^0.1 mult",
				"*you're",
				"*your",
				"if only we could",
				"i don't feel like it today tbh",
				"oops",
				"that moment when you accidentally delete joker.lua",
				"font: arial, size: 10, text color: \"custom color #f04360, close to light red 1,\" highlight color: \" custom color #4c2f4d, close to dark gray 4,\" text: \"font: arial, size: 10, text color: \"custom color #f04360, close to light red 1,\" highlight color: \" custom color #4c2f4d, close to dark gray 4,\" text: [recursive]\"",
				"cryptposting idea document (cid)",
				"https://docs.google.com/document/d/1toiOWh2qfouhZYUSiBEgHxU91lbzgvMfR46bShg67Qs/edit?usp=sharing",
				"a collection of the cryptid community's unfunniest shitposts",
				"https://github.com/kierkat10/Cryptposting",
				"this is the last quote in the list of glitchkat10 quotes"
			}
			local quote = quotes[math.random(#quotes)]
            return {
	            chips = -lenient_bignum(card.ability.extra.chips),
	            extra = {
                    mult = -lenient_bignum(card.ability.extra.mult),
                    extra = {
		                Xchip_mod = 1 / lenient_bignum(card.ability.extra.Xchips),
                        message = "÷" .. lenient_bignum(card.ability.extra.Xchips),
                        colour = G.C.CHIPS,
                        extra = {
		                    Xmult_mod = 1 / lenient_bignum(card.ability.extra.Xmult),
                            message = "÷" .. lenient_bignum(card.ability.extra.Xmult) .. " Mult",
                            colour = G.C.MULT,
                            extra = {
                                message = quote,
                                colour = G.C.RARITY["crp_self-insert"]
                            }
                        }
                    }
	            }
            }
		end
	end,
    in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "George The Rat", "Glitchkat10" },
		code = { "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "rainstar",
	name = "Rainstar",
	config = { extra = { mult = 1, chips = 2 } },
	rarity = "crp_self-insert",
	atlas = "crp_joker",
	pos = { x = 6, y = 4 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.extra.chips), lenient_bignum(card.ability.extra.mult) } }
	end,
	calculate = function(self, card, context)
		local quotes = {
			"hjello there",
			"can you tell that i like flushes",
			"oh yeah i coded a few jonklers for this mod",
			"you should rewire your brain to only play flushes and nothing else like i do",
			"did you know that i exist? shocker, i know",
			"ill be honest i was gonna help you but ive been told by some glitching heart thing that i should do absolutely fuck-all soooo",
			"me when i dont even know how the most basic of functions work",
			"hi sage",
			"imagine having 246 quotes, couldnt be me!",
			"gee it sure would suck if i got debuffed, removed, or banished from existence",
			"you should also play the something mod by me when that comes out (its never coming out)",
			"did you know that im bulgoe approved by the one and only bulgoe? dont believe me? ask him yourself",
			"insert something funny here",
			"{25000}2 Mult... nah i lied",
			"feels weird being condensed into a card ngl",
			"imagine if the hit game JokerPoker - Balala got a cryptid ass mod wouldnt that be funny",
			"so far ive coded like 10 jokers for this mod and only like 7 of them work wonderfully. im so good at coding",
			"you should play slay the spire, its a peak roguelike deckbuilder",
			"polterworx? but i dont even know her works",
			"if you're reading this then congrats this is the 20th quote ive written here",
			"glitchkat10 was here"
		}
		local quote = quotes[math.random(#quotes)]
		if (context.joker_main and not next(context.poker_hands["Flush"])) or context.forcetrigger then
            return {
	            chips = -lenient_bignum(card.ability.extra.chips),
	            extra = {
                    mult = -lenient_bignum(card.ability.extra.mult),
                	extra = {
                	    message = quote,
                	    colour = G.C.RARITY["crp_self-insert"]
                	}
	            }
            }
		elseif context.joker_main then
			return {
				message = quote,
				colour = G.C.RARITY["crp_self-insert"]
			}
		end
	end,
    in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end,
	crp_credits = {
		idea = { "Rainstar" },
		art = { "Siecelesness" },
		code = { "Rainstar", "Glitchkat10" }
	}
}

SMODS.Joker {
	key = "gudusername",
	name = "GudUsername",
	config = { immutable = { Xchips = 0.99, Xmult = 0.99, Echips = 0.99, Emult = 0.99, EEchips = 0.99, EEmult = 0.99, EEEchips = 0.99, EEEmult = 0.99 } },
	rarity = "crp_self-insert",
	atlas = "crp_joker",
	pos = { x = 8, y = 3 },
	cost = 0,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { lenient_bignum(card.ability.immutable.Xchips), lenient_bignum(card.ability.immutable.Xmult), lenient_bignum(card.ability.immutable.Echips), lenient_bignum(card.ability.immutable.Emult), lenient_bignum(card.ability.immutable.EEchips), lenient_bignum(card.ability.immutable.EEmult), lenient_bignum(card.ability.immutable.EEEchips), lenient_bignum(card.ability.immutable.EEEmult), } }
	end,
	calculate = function(self, card, context)
		if (context.joker_main) or context.forcetrigger then
			local quotes = {
				"Pls no sell me",
                "*Pushes you into a road cutely*"
			}
			local quote = quotes[math.random(#quotes)]
			return {
				Xchip_mod = lenient_bignum(card.ability.immutable.Xchips),
				message = "X" .. lenient_bignum(card.ability.immutable.Xchips),
				colour = G.C.CHIPS,
				extra = {
					Xmult_mod = lenient_bignum(card.ability.immutable.Xmult),
					message = "X" .. lenient_bignum(card.ability.immutable.Xmult) .. " Mult",
					colour = G.C.MULT,
					extra = {
						Echips_mod = lenient_bignum(card.ability.immutable.Echips),
						message = "^" .. lenient_bignum(card.ability.immutable.Echips),
						colour = G.C.DARK_EDITION,
						extra = {
							Emult_mod = lenient_bignum(card.ability.immutable.Emult),
							message = "^" .. lenient_bignum(card.ability.immutable.Emult) .. " Mult",
							colour = G.C.DARK_EDITION,
							extra = {
								EEchips_mod = lenient_bignum(card.ability.immutable.EEchips),
								message = "^^" .. lenient_bignum(card.ability.immutable.EEchips),
								colour = G.C.DARK_EDITION,
								extra = {
									EEmult_mod = lenient_bignum(card.ability.immutable.EEmult),
									message = "^^" .. lenient_bignum(card.ability.immutable.EEmult) .. " Mult",
									colour = G.C.DARK_EDITION,
									extra = {
										EEEchips_mod = lenient_bignum(card.ability.immutable.EEEchips),
										message = "^^^" .. lenient_bignum(card.ability.immutable.EEEchips),
										colour = G.C.EDITION,
										extra = {
											EEEmult_mod = lenient_bignum(card.ability.immutable.EEEmult),
											message = "^^^" .. lenient_bignum(card.ability.immutable.EEEmult) .. " Mult",
											colour = G.C.EDITION,
											extra = {
												message = quote,
												colour = G.C.RARITY["crp_self-insert"]
											}
										}
									}
								}
							}
						}
					}
				}
			}
		end
	end,
    in_pool = function(self, args)
		return true, { allow_duplicates = true }
	end,
	crp_credits = {
		idea = { "Glitchkat10" },
		art = { "GudUsername" },
		code = { "Glitchkat10" }
	}
}
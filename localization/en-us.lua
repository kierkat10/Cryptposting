return {
	descriptions = {
		Blind = {
			bl_crp_the = {
				name = "The",
				text = {
					"",
				},
			},
			bl_crp_dice = {
				name = "The Dice",
				text = {
					"Randomized blind size (1-6)",
				},
			},
			bl_crp_chance = {
				name = "The Chance",
				text = {
					"Play only 1 hand, no discards",
				},
			},
			bl_crp_skill = {
				name = "The Skill",
				text = {
					"All listed probablities have a",
					"0% chance of occuring",
				},
			},
			bl_crp_evil_plant = {
				name = "The EVIL Plant",
				text = {
					"Debuffs everything but",
					"face cards",
				},
			},
			["bl_crp_small...?"] = {
				name = "Small Blind...?",
				text = {
					"",
				},
			},
			["bl_crp_big...?"] = {
				name = "Big Blind...?",
				text = {
					"",
				},
			},
			bl_crp_joker = {
				name = "The Joker",
				text = {
					"+4 blind requirement"
				}
			},
			bl_crp_gloom = {
				name = "The Gloom",
				text = {
					"All Jolly or M Jokers are debuffed"
				}
			},
			bl_crp_monochrome_m = {
				name = "Monochrome M",
				text = {
					"All non-Jolly and non-M Jokers are debuffed",
					"Must play only Pairs"
				}
			},
			bl_crp_eternal_eclipse = {
				name = "Eternal Eclipse",
				text = {
					"+X0.1 blind requirement for each",
					"Planet card used this run"
				}
			},
			bl_crp_roadblock = {
				name = "The Roadblock (L+)",
				text = {
					"Comically large blind requirement"
				},
			},
			bl_crp_epioxus = {
				name = "Epioxus (EM+)",
				text = {
					"X10 Ante when defeated"
				},
			},
			bl_crp_calamitus = {
				name = "Calamitus (EM+)",
				text = {
					"All Diamond, Heart, Spade and Club",
					"cards are debuffed"
				},
			},
			bl_crp_pokios = {
				name = "Pokios (EM+)",
				text = {
					"^2 Blind size",
					"every frame"
				},
			},
			bl_crp_quettus = {
				name = "Quettus (S, EM+)",
				text = {
					"^10 Blind size",
					"Destroys all Legendary+",
					"jokers upon entering blind"
				},
			}
		},
		Joker = {
			j_crp_bulgoe_bot = {
				name = "{C:edition}Bulgoe{} Bot",
				text = {
					"{C:white,X:chips}÷#1#{} Chips",
					"{C:white,X:mult}÷#2#{} Mult",
					"{C:green}#3# in #4#{} chance to destroy all other",
					"{C:attention}Jokers{} when {C:attention}Blind{} selected",
					"{C:red}Fixed{} {C:green}1 in 27{} chance to destroy",
					"self when {C:attention}Blind{} selected"
				},
			},
			j_crp_evil_jolly_joker = {
				name = "{C:red}EVIL{} Jolly Joker",
				text = {
					"{C:white,X:mult}÷#1#{} Mult if played hand is",
					"{C:red}not{} a {C:attention}Pair{}",
				},
			},
			j_crp_evil_joker = {
				name = "{C:red}EVIL{}Joker",
				text = {
					"{C:white,X:mult}÷#1#{} Mult",
				},
			},
			j_crp_evil_bulgoe = {
				name = "{C:red}EVIL{} {C:edition}Bulgoe{}",
				text = {
					"{C:white,X:chips}÷#1#{} Chip#<s>1#",
				},
			},
			j_crp_jonkler = {
				name = "Jonkler",
				text = {
					"{C:dark_edition,X:edition}#1#Twenty-five thousand #2#one{} Mult",
				},
			},
			j_crp_semicolon = {
				name = "Semicolon",
				text = {
					"Asks {C:attention}really{} nicely for the",
					"{C:attention}Joker{} to the right to trigger",
				},
			},
			j_crp_googologist = {
				name = "Googologist",
				text = {
					"{C:white,X:dark_edition}#1#Mult, 1(1)1.7e308#2#",
				},
			},
			j_crp_none = {
				name = "None Joker",
				text = {
					"",
				},
			},
			j_crp_three = {
				name = "3.",
				text = {
					"{C:attention}+#2#{} 3s",
					"{C:inactive}(Currently {C:attention}#1#{C:inactive} 3s)",
				},
			},
			["j_crp_:3"] = {
				name = ":3",
				text = {
					":3",
				},
			},
			j_crp_bulgoe = {
				name = "{C:edition}Bulgoe",
				text = {
					"{C:chips}+#1#{} Chips",
				},
			},
			j_crp_pillaring = {
				name = "Pillaring Joker",
				text = {
					"Cards already played this",
					"{C:attention}Ante{} give {C:mult}+#1#{} Mult when scored",
				},
			},
			j_crp_participation_trophy = {
				name = "Participation Trophy",
				text = {
					"{C:mult}+#1#{} Mult for every {C:red,E:2}loss{} on this profile",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
				},
			},
			j_crp_apple = {
				name = "Apple",
				text = {
					"{C:mult}+#1#{} Mult",
					"Expires in {C:attention}#2#{} rounds",
				},
			},
			j_crp_purist_jolly = {
				name = "Purist Jolly Joker",
				text = {
					"{C:mult}+#1#{} Mult if",
					"played hand is",
					"a {C:attention}Pair",
				},
			},
			j_crp_bulgoe_prize = {
				name = "{C:edition}Bulgoe{} Prize",
				text = {
					"Whenever any {C:attention}Booster Pack{} is",
					"skipped create {C:attention}#1#{} {C:edition,X:grey}Bulgoe#<s>1#{}",
					"{C:inactive}(Does not require room)",
				},
			},
			j_crp_bullshit = {
				name = "Bullshit",
				text = {
					"Sell this {C:attention}Joker{} to",
					"create {C:attention}#1#{} of either a {C:attention}Bull{}",
					"or a {C:crp_trash}Trash{} {C:attention}Joker{}",
				}
			},
			j_crp_skibidi_toilet = {
				name = "Skibidi Toilet",
				text = {
					"Gives the current base",
					"{C:chips}Chips{} and {C:mult}Mult{} of {C:attention}Flush{}"
				}
			},
			j_crp_bulgoelatro = {
				name = "{C:edition}Bulgoe{}latro",
				text = {
					"{C:mult}+#1#{} Mult for every owned",
					"{C:edition,X:grey}Bulgoe{}-themed {C:attention}Joker",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
				}
			},
			j_crp_sprinter = {
				name = "Sprinter",
				text = {
					"Gains {C:chips}+#2#{} Chip#<s>2#",
					"if played hand",
					"contains a {C:attention}Straight Flush",
					"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chip#<s>1#)",
				},
			},
			j_crp_pennant = {
				name = "Pennant",
				text = {
					"{C:mult}+4{} Mult for every remaining {C:attention}hand"
				}
			},
			j_crp_one_mans_trash = {
				name = "One Man's Trash",
				text = {
					"{C:crp_trash}Trash{} {C:attention}Jokers{} give",
					"{C:mult}+#1#{} Mult"
				},
			},
			--[[
			j_crp_dead_joker = {
				name = "Dead Joker",
				text = {
					"{C:mult}+1{} Mult for every {C:attention}Graveyarded{}",
					"submission in the {C:attention}CSL{}",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
				},
			},
			]]--
			j_crp_vermillion = {
				name = "Vermillion Joker",
				text = {
					"{C:white,X:mult}X#1#{} Mult",
					"When bought, replace a random",
					"Joker with the default {C:attention}Joker{}",
				},
			},
			j_crp_money_card = {
				name = "Money Card",
				text = {
					"{C:white,X:money}X$#1#{} at end of round",
				},
			},
			j_crp_water_bottle = {
				name = "Water Bottle",
				text = {
					"Creates {C:attention}#1# Splash#<es>1#{}",
					"when sold",
					"{C:inactive}(Does not require room){}",
				},
			},
			j_crp_gamblecore = {
				name = "Gamblecore",
				text = {
					"{C:red}Fixed {}{C:green}#1# in #2#{} chance",
					"for {C:red}+nane0{} Mult",
				},
			},
			j_crp_centipede = {
				name = "Centipede",
				text = {
					"{C:chips}+#1#{} Chips if played",
					"hand has only {C:attention}#2#{} card#<s>2#",
				},
			},
			j_crp_tag_hoarder = {
				name = "Tag Hoarder",
				text = {
					"Gives {C:chips}+Chips{} and {C:mult}+Mult{}",
					"equal to the number",
					"of owned {C:attention}tags{}"
				},
			},
			j_crp_loss = {
				name = "Loss",
				text = {
					"{C:money}#1# {C:mult}#2#",
					"{C:attention}#3# {C:chips}#4#"
				}
			},
			j_crp_snake_eyes = {
				name = "Snake Eyes",
				text = {
					"Halves all {C:attention}listed {C:green}probabilities",
					"{C:inactive}(ex: {C:green}2 in 3 {C:inactive}to {C:green}1 in 3{C:inactive})"
				}
			},
			j_crp_all_trades = {
				name = "Joker of all Trades",
				text = {
					"{C:chips}+#1#{} Chip#<s>1#, {C:mult}+#2#{} Mult",
					"Earn {C:money}$#3#{} at end of round",
				},
			},
			j_crp_one_bulgoe_bill = {
				name = "One {C:edition}Bulgoe{} Bill",
				text = {
					"Earn {C:money}+$#1#{} at end of round",
					"Earn {C:money}+$#2#{} instead if you have",
					"another {C:edition,X:gray}Bulgoe{}-themed {C:attention}Joker",
				},
			},
			j_crp_scones_bones = {
				name = "Scones, Bones, Skibidi Stones",
				text = {
					"{C:white,X:chips}X#3#{} Chip#<s>3#, {C:white,X:chips}-X#4#{} Chip#<s>4# when you click",
					"Prevents death once if you score at least",
					"{C:attention}#2#%{} of the required score",
					"Creates {C:attention}#5# Stone{} card#<s>5# if played hand contains a {C:attention}Flush",
					"{C:inactive}(Death prevention active: #1#)",
				},
			},
			j_crp_millipede = {
				name = "Millipede",
				text = {
					"{C:chips}+#1#{} Chip#<s>1# if played",
					"hand has only {C:attention}#2#{} card#<s>2#",
				},
			},
			j_crp_pi_joker = {
				name = "Pi Joker",
				text = {
					"{C:white,X:chips}Xpi{} Chips",
					"{C:white,X:mult}Xpi{} Mult",
				},
			},
			j_crp_12345 = {
				name = "12345",
				text = {
					"{C:dark_edition}+#1#{} {C:attention}Joker{} slot#<s>1#",
					"{C:attention}+#2# consumable{} slot#<s>2#",
					"Earn {C:money}$#3#{} at end of round",
					"{C:mult}+4{} Mult",
					"{C:chips}+5{} Chip#<s>5#",
				}
			},
			j_crp_playerrkillerr = {
				name = "playerrKillerr",
				text = {
					"Lowers the framerate to {C:attention}1{} FPS, randomizes resolution, disables fullscreen, and causes an instant {C:red,E:2}loss{} if game speed is above {C:attention}X0.5{}.",
					"Changes game language every second, all rerolls are free, and redeems {C:attention}50000 unskippable {}{C:tarot}Arcana Packs{} after each {C:attention}Blind{} is revealed.",
					"Generates {C:attention}50000000 Googol Play Cards{} at the start of each round. All {C:attention}Jokers{} except those created by this {C:attention}Joker{} become {C:attention}Authentic{} and {C:attention}Restricted.",
					"Grants {C:white,X:chips}X10{} Chips, {C:white,X:chips}X10{} Chips, and randomizes screen rotation whenever any card is scored.",
					"Does NOT give {C:white,X:mult}X10{} Mult when the screen is clicked, even if {C:attention}The Man{} tells you otherwise. Do not follow {C:attention}The Man's{} orders.",
					"Forces CRT effect intensity to {C:attention}200{}. Game speed is reduced by {C:green}1%{} per click. Rerolling causes exponential duplication of this Joker's values.",
					"{C:white,X:chips}X10{} Chips. {C:white,X:chips}X10{} more Chips",
					"If the player forgets about the {C:white,X:chips}XChips{} on this Joker, {C:white,X:chips}X10{} Chips. If the player does not forget about the amount of {C:white,X:chips}XChips{} on this Joker, {C:white,X:chips}X10{} Chips",
					"Grants {C:white,X:chips}X10{} Chips. Also provides {C:dark_edition,X:edition}#1#69#2#{}2 Chips and {C:dark_edition,X:edition}#1#69#2#{}2 Mult.",
					"Clicks have a {C:green}32%{} chance to fail. After entering a shop, rerolls will occur non-stop, permanently.",
					"{C:planet}Celestial Packs{} have a {C:green}98.27%{} chance to have {C:attention}300000000{} {C:spectral}Black Holes{} in them. {C:spectral}Spectral Packs{} have a {C:green}27.98%{} chance to overheat your device when opened.",
					"Lastly, divides this description by {C:attention,s:7.2}0{}, then adds the total number of {C:attention}approved suggestions{} in the {C:attention}CSL{} to {C:mult}Mult{}."
				}
			},
			j_crp_slot_guy = {
				name = "Joker Slot Guy",
				text = {
					"{C:mult}+#1#{} Mult for every full {C:attention}Joker{} slot",
					"{C:white,X:mult}X#2#{} Mult for every empty {C:attention}Joker{} slot",
					"{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult and {C:white,X:mult}X#4#{C:inactive} Mult)"
				}
			},
			j_crp_two_for_some = {
				name = "Two for Some",
				text = {
					"{C:attention}+#1#{} hand size",
					"{C:attention}+#2# consumable{} slot#<s>2#",
					"{C:attention}+#3# Booster Pack{} slot#<s>3# in the {C:attention}shop{}",
				}
			},
			j_crp_dumpster_diver = {
				name = "Dumpster Diver",
				text = {
					"Create {C:attention}#1#{} {C:dark_edition}Negative{} {C:crp_trash}Trash{} {C:attention}Joker#<s>1#{}",
					"at end of round,",
					"{C:green}#2# in #3#{} chance to instead create",
					"{C:attention}#4#{} {C:dark_edition}Negative{} {C:rare}Rare{} {C:attention}Joker#<s>4#{}",
				},
			},
			j_crp_my_first_joker = {
				name = "Hdbceifvf sj kjkhiooh jhiiohiouytc",
				text = {
					"{C:mult}+#1#{} Mult",
					"{C:chips}+#2# chips{} per {C:attention}VVoucher redeemed this run",
					"{C:inactive}(currentlY {C:chips}+#3#{} Chips)",
					"{C:attention}Earn {C:money}#4#-#5#${} at the end of the {C:attention}round",
					"When {C:attention}sold, create A {C:attention}Jolly joker{} and a gross Michael",
					"{C:inactive}my firts jokre",
				},
			},
			["j_crp_low-fat_milk"] = {
				name = "Low-Fat Milk",
				text = {
					"{C:mult}+#1#{} Mult",
					"{C:red}Halves{} at end of round",
					"Destroyed at under {C:mult}8{} Mult",
				},
			},
			j_crp_normalgoe = {
				name = "{C:dark_edition}Normalgoe",
				text = {
					"{C:white,X:mult}X#1#{} Mult"
				},
			},
			["j_crp_low-fqt_milk"] = {
				name = "Low-Fqt Milk",
				text = {
					"{C:chips}+#1#{} Chips",
					"Value multiplied by {C:attention}0.8{} at end of round",
					"Destroyed at under {C:chips}512{} Chips",
					"{C:inactive}\"Fqt in MY milk?!\"{}",
				},
			},
			j_crp_joker_2 = {
				name = "Joker 2",
				text = {
					"{C:chips}+#1#{} Chip#<s>1#",
				},
			},
			j_crp_joker_3 = {
				name = "Joker 3",
				text = {
					"{C:white,X:mult}X#1#{} Mult",
				},
			},
			j_crp_joker_4 = {
				name = "Joker 4",
				text = {
					"{C:white,X:dark_edition}^#1#{} Mult",
				},
			},
			j_crp_joker_5 = {
				name = "Joker 5",
				text = {
					"{C:edition,X:dark_edition}^^#1#{} Mult",
				},
			},
			j_crp_joker_6 = {
				name = "Joker 6",
				text = {
					"{C:money}+$#1#{}",
				},
			},
			j_crp_joker_7 = {
				name = "Joker 7",
				text = {
					"{C:attention}+#1#{} {C:tarot}Tarot{} card#<s>1#",
					"{C:inactive}(Does not require room)",
				},
			},
			j_crp_joker_8 = {
				name = "Joker 8",
				text = {
					"{C:white,X:chips}X#1#{} Chip#<s>1#",
				},
			},
			j_crp_joker_9 = {
				name = "Joker 9",
				text = {
					"{C:planet}+#1#{} Level#<s>1#",
				},
			},
			["j_crp_joker?"] = {
				name = "Joker?",
				text = {
					"{C:mult}+#1#{} Mult...{C:attention}?",
				},
			},
			j_crp_joker_0 = {
				name = "Joker 0",
				text = {
					"{C:attention}+#1# Joker#<s>1#",
					"{C:inactive}(Does not require room)",
				},
			},
			j_crp_progressive = {
				name = "Progressive Joker",
				text = {
					"{C:mult}+[round]{} Mult",
					"{C:white,X:mult}X[ante]{} Mult",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult and {C:white,X:mult}X#2#{C:inactive} Mult){}",
				},
			},
			j_crp_bulgoes_hiking_journey = {
				name = "{C:edition}Bulgoe{}'s Hiking Journey",
				text = {
					"Each {C:attention}card{} played",
					"permanently gains {C:white,X:chips}X#1#{} Chip#<s>1#",
					"when scored"
				},
			},
			j_crp_10000_coins = {
				name = "10,000 Coins Falling on You",
				text = {
					"When this {C:attention}Joker{]} is sold, either",
					"win {C:money}$#1#{} or destroy every",
					"owned {C:attention}Joker{}, bypassing {C:red}all effects{}"
				},
			},
			["j_crp_sigma-man"] = {
				name = "Sigma-Man",
				text = {
					"are you sure",
				},
			},
			j_crp_amazon_gift_card = {
				name = "Amazon Gift Card",
				text = {
					"{C:green}#1# in #2#{} chance to",
					"{C:red}not{} give {C:white,X:dark_edition}^#3#{} Mult"
				},
			},
			j_crp_sine_wave = {
				name = "Sine Wave",
				text = {
					"{C:white,X:mult}X(Sum[sin(i)+1,#2#i,1,r#3#]){} Mult,", -- wolframalpha syntax
					"where {C:attention}r{} = current round",
					"{C:inactive}(Measured in radians)",
					"{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)"
				}
			},
			j_crp_another_mans_treasure = {
				name = "Another Man's Treasure",
				text = {
					"{C:legendary}Legendary{} Jokers give {C:white,X:mult}X7{} Mult"
				}
			},
			--[[
			j_crp_quantum = {
				name = "Quantum Joker",
				text = {
					"{C:attention}Enhanced Cards{} have the positive ",
					"effects of all {C:attention}Vanilla{}, {C:attention}Cryptid{},",
					"and {C:attention}Cryptposting{} enhancements"
				},
			},
			]]--
			j_crp_270_bulgoescope = {
				name = "270° {C:edition}Bulgoe{}scope",
				text = {
					"{C:red}Fixed{} {C:green}1 in 27{} chance for scored",
					"{C:attention}2s{} and {C:attention}7s{} to give {C:chips}+#1#{} Chips",
				},
			},
			j_crp_chibidoki = {
				name = "Chibidoki",
				text = {
					"{C:crp_unrare}Unrare{} and higher rarity {C:attention}Jokers{}",
					"give {C:white,B:1}X#1#{} Chips and Mult", -- plasma deck colors
					"{C:inactive,s:0.8}This Joker is currently slightly unfinished{}"
				}
			},
			j_crp_normalis = {
				name = "Normalis",
				text = {
					"{C:white,X:dark_edition}^#1#{} Chip#<s>1# and Mult",
					"{C:inactive}hd bulgoe{}",
				},
			},
			j_crp_tetration_timmy = {
				name = "tetration timmy",
				text = {
					"{C:edition,X:dark_edition}^^#1#{} Mult",
				},
			},
			j_crp_perdurantes = {
				name = "Perdurantes",
				text = {
					"Gains {C:white,X:dark_edition}^#2#{} Mult for every",
					"{C:attention}#3#{} triggers of this {C:attention}Joker",
					"{C:inactive}(Currently {C:attention}#4#{C:inactive} triggers and {C:white,X:dark_edition}^#1#{C:inactive} Mult){}"
				},
			},
			j_crp_jolly_of_joker = {
				name = "The Jolly of Joker",
				text = {
					"{C:white,X:dark_edition}^#1#{} Mult if played",
					"hand is a {C:attention}Pair{}",
				},
			},
			j_crp_victoriam = {
				name = "Victoriam",
				text = {
					"{C:white,X:dark_edition}^0.1{} Mult for every {C:edition,X:grey}win{} on this profile",
					"{C:inactive,s:0.8}(Excludes seeded runs and Challenge runs)",
					"{C:inactive}(Currently {C:white,X:dark_edition}^#1#{C:inactive} Mult)",
				},
			},
			j_crp_splittum = {
				name = "Splittum",
				text = {
					"When a {C:attention}Joker{} is sold, create {C:attention}#1# {C:dark_edition}Negative{}",
					"{C:attention}Jokers{} of one rarity below the sold {C:attention}Joker{}",
					"{C:inactive}(Some rarities do not apply)",
					"{C:inactive}\"generic video game slime enemy\""
				},
			},
			j_crp_duplex = {
				name = "Duplex",
				text = {
					"This {C:attention}Joker{} gains {C:white,X:mult}X#2#{} Mult",
					"when a {C:attention}Joker{} or",
					"{C:attention}playing card{} is triggered,",
					"retrigger all {C:attention}Jokers{} and {C:attention}playing{}",
					"{C:attention}cards #3#{} additional time#<s>3#",
					"{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult){}",
				},
			},
			j_crp_potentia = {
				name = "Potentia",
				text = {
					"This {C:attention}Joker{} gains {C:white,X:dark_edition}^#2#{} Mult",
					"when {C:white,X:dark_edition}^Mult{} is triggered",
					"{C:inactive}(Currently {C:white,X:dark_edition}^#1#{C:inactive} Mult){}"
				},
			},
			j_crp_repetitio = {
				name = "Repetitio",
				text = {
					"Retrigger all cards played",
					"{C:attention}#2#{} time#<s>2#,",
					"each played card gives",
					"{C:white,X:mult}X#1#{} Mult when scored",
					"{C:inactive}(Max {}{C:attention}#3#{}{C:inactive} retrigger#<s>3#)",
				},
			},
			j_crp_resurgo = {
				name = "Resurgo",
				text = {
					"{C:white,X:dark_edition}^[ante]{} Mult",
					"{C:inactive}(Currently{} {C:white,X:dark_edition}^#1#{} {C:inactive}Mult){}",
				}
			},
			j_crp_peripheria_ad_diametrum = {
				name = "Peripheria ad Diametrum",
				text = {
					"{C:white,X:dark_edition}^#1#{} Chips on first hand of round",
					"At end of round, switches to the next {C:attention}digit{} of {C:attention}pi",
					"{C:inactive}(#2#, #3#, #4#, #5#, #6#...)"
				}
			},
			j_crp_weather_machine = {
				name = "Weather Machine",
				text = {
					"Prevents death once",
					"This {C:attention}Joker{} gains {C:mult}+#1#{} Mult",
					"when death prevented",
					"{C:inactive}(Death prevention active: #2#)",
					"{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)"
				},
			},
			j_crp_room_for_all = {
				name = "Room For All",
				text = {
					"{C:attention}+#1#{} hand size, {C:attention}Joker{} slot#<s>1#,",
					"and {C:attention}consumable{} slot#<s>1#"
				},
			},
			j_crp_pentation_peter = {
				name = "pentation peter",
				text = {
					"{C:dark_edition,X:edition}^^^#1#{} Mult",
				},
			},
			j_crp_tetrationa = {
				name = "Tetrationa",
				text = {
					"This {C:attention}Joker{} gains {C:edition,X:dark_edition}^^#2#{} Mult",
					"when {C:white,X:dark_edition}^Mult{} is triggered",
					"{C:inactive}(Currently {C:edition,X:dark_edition}^^#1#{C:inactive} Mult){}"
				},
			},
			j_crp_bulgoeship_card = {
				name = "{C:edition}Bulgoe{}ship Card",
				text = {
					"{C:edition,X:dark_edition}^^#1#{} Mult for each member",
					"in the {C:attention}Cryptposting Discord{}",
					"{C:inactive}(Currently {C:edition,X:dark_edition}^^#2#{C:inactive} Mult)",
					"{C:blue,s:0.7}https://discord.gg/Jk9Q9usrNy{}",
				},
			},
			j_crp_underflow = {
				name = "Underflow",
				text = {
					"{C:white,X:mult}X#1#{} Mult",
					"Decreases by {C:white,X:mult}X#2#{} Mult",
					"at end of round",
				},
			},
			j_crp_hexation_hank = {
				name = "hexation hank",
				text = {
					"{C:dark_edition,X:edition}^^^^#1#{} Mult",
				},
			},
			j_crp_morble = {
				name = "Morble",
				text = {
					"{C:attention}Jokers{} give {C:white,X:money}^$#1#{}",
					"when triggered"
				}
			},
			j_crp_statically_charged = {
				name = "Statically Charged",
				text = {
					"All cards are",
					"{C:dark_edition}Overloaded{}",
					"{C:dark_edition}Overloaded{} cards do not",
					"cost extra",
				},
			},
			j_crp_fiorello_giraud = {
				name = "Fiorello Giraud",
				text = {
					"Gains {C:dark_edition,X:edition}^^^#2#{} Mult per destroyed face card",
					"{C:inactive}(Currently {C:dark_edition,X:edition}^^^#1#{C:inactive} Mult)",
				},
			},
			j_crp_fevrial = {
				name = "Fevrial",
				text = {
					"Played and held in hand",
					"{C:attention}Kings{} and {C:attention}Queens{} give {C:dark_edition,X:edition}^^^#1#{} Mult",
				},
			},
			j_crp_richard_tarlton = {
				name = "Richard Tarlton",
				text = {
					"Gains {C:edition,X:dark_edition}^^#2#{} Mult per discarded card",
					"{C:inactive}(Currently {C:edition,X:dark_edition}^^#1#{C:inactive} Mult)",
				},
			},
			j_crp_jean_antoine = {
				name = "Jean-Antoine d'Anglerais",
				text = {
					"Disables {C:white,X:dark_edition}all{} {C:attention}Blinds {C:attention}#1#{} times",
					"{C:inactive}14 fucking Chicots{}",
				},
			},
			j_crp_infinitum = {
				name = "Infinitum",
				text = {
					"Scoring cards give {C:dark_edition,X:edition}#2#X#3##1#{} Chip#<s>1# & Mult,",
					"where {C:dark_edition,X:edition}X{} is the position in their {C:attention}card area{}"
				},
			},
			j_crp_exodiac = {
				name = "Exodiac",
				text = {
					"{C:cry_exotic}Exotic{} Jokers each give",
					"{C:dark_edition,X:edition}#1##2##3##4#{} Mult when triggered,",
					"create a random {C:dark_edition}Negative{} {C:cry_exotic}Exotic{}",
					"{C:attention}Joker{} at the end of shop",
				},
			},
			j_crp_cryptposted = {
				name = "Cryptposted Joker",
				text = {
					"{C:dark_edition,X:edition}#1#X#2##3#{} Mult, where {C:dark_edition,X:edition}X{}",
					"is the number of",
					"{C:attention}Cryptposting Jokers{} owned",
				},
			},
			j_crp_eternity = {
				name = "Eternity",
				text = {
					"{C:white,X:dark_edition}^#1#{} Chips & Mult",
					"Every frame, a {C:attention}little bird{} comes to sharpen its beak,",
					"taking {C:white,X:dark_edition}^#2#{}, but gaining {C:white,X:attention}^#3#{} to use when shop exited",
					"When {C:white,X:dark_edition}^0{} reached, resets back to {C:white,X:dark_edition}^#5#",
					"{C:red}and a single day of {V:1}eternity {C:red}passes...",
					"{C:inactive}(Currently giving {C:white,X:attention}^#6#{C:inactive} at end of shop)"
				},
			},
			j_crp_quetta_m = {
				name = "Quetta M",
				text = {
					"{C:dark_edition,X:edition}#4##1##5##2#{} Mult, {C:red}fixed{} {C:green}13%{} chance",
					"for operator to increase by {C:dark_edition,X:edition}#3#{}",
					"when a {C:attention}Pair{} is played",
					"{C:inactive}\"#4#-1#5#\" = \"+\"",
					"{C:inactive}\"#4#0#5#\" = \"X\"",
				},
			},
			j_crp_playerrwon = {
				name = "playerrWon",
				text = {
					"{C:dark_edition,X:edition}#4#N#5##2#{} Mult",
					"{C:attention}N{} increases by {C:attention}#3#{} at",
					"end of round",
					"{C:inactive}(Currently {C:attention}#1#{C:inactive})",
				},
			},
			j_crp_septingentiquinvigintation_stevie = {
				name = "septingentiquinvigintation stevie",
				text = {
					"{C:dark_edition,X:edition}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^",
					"{C:dark_edition,X:edition}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^",
					"{C:dark_edition,X:edition}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^",
					"{C:dark_edition,X:edition}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^",
					"{C:dark_edition,X:edition}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^",
					"{C:dark_edition,X:edition}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^",
					"{C:dark_edition,X:edition}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#1#{} Mult",
				},
			},
			j_crp_all = {
				name = "All",
				text = {
					"Creates {C:attention}#1# Joker#<s>1#{}, {C:attention}#2# consumable#<s>2#{}, {C:attention}#3# tag#<s>3#{}, and {C:attention}#4# voucher#<s>4#",
					"based on their {C:attention}order{} in the {C:attention}collection backwards{} when hand played",
					"Gains {C:dark_edition}+#6#{} Joker slot#<s>6# for every {C:attention}Joker{} created",
					"and {C:attention}+#7#{} consumable slot#<s>7# for every {C:attention}consumable{} created",
					"Increases amount of items created by {C:attention}#5#{} when triggered",
					"{C:inactive}(Currently {C:dark_edition}+#8#{C:inactive} Joker slot#<s>8# and {C:attention}+#9#{C:inactive} consumable slot#<s>9#)",
				},
			},
		},
		Spectral =  {
			c_crp_prayer = {
				name = "Prayer",
				text = {
					"Create a {C:crp_mythic,E:1}Mythic{} {C:attention}Joker{},",
					"{C:red}destroy{} all other {C:attention}Jokers{},",
					"including {V:1}Eternals"
				}
			},
			c_crp_gate_of_prayers = {
				name = "Gate of Prayers",
				text = {
					"Create an {C:crp_exomythic,E:1}ExoMythic{} {C:attention}Joker{},",
					"{C:red}destroy{} all other {C:attention}Jokers{},",
					"bypassing {C:red}all effects"
				}
			},
			c_crp_stairway_to_heaven = {
				name = "Stairway to Heaven",
				text = {
					"Create a {C:crp_2exomythic4me,E:1}2ExoMythic4me{} {C:attention}Joker{},",
					"{C:red}destroy{} all other {C:attention}items{},",
					"bypassing {C:red}all effects"
				}
			},
			c_crp_path_of_solstice = {
				name = "Path of Solstice",
				text = {
					"Create a {C:crp_22exomythic4mecipe,E:1}22ExoMythic4meCipe{} {C:attention}Joker{},",
					"{C:red}destroy{} all other {C:attention}items{}, bypassing {C:red}all effects",
					"Reset deck to a standard {C:attention}52{} card deck"
				}
			},
			c_crp_reckoning = {
				name = "Reckoning",
				text = {
					"Create a {C:crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe,E:1}ExoMythicEpicAwesomeUncommon2MExotic22ExoMythic4meCipe{} {C:attention}Joker{},",
					"{C:red}Fixed {C:green}27%{} chance to instantly {C:red,E:2}lose{} the game instead"
				}
			},
			c_crp_happiness = {
				name = "Happiness",
				text = {
					"Apply {C:dark_edition,T:e_polychrome}Polychrome",
					"to all {C:attention}cards in hand"
				}
			},
			c_crp_sadness = {
				name = "Sadness",
				text = {
					"Apply {C:dark_edition,T:e_foil}Foil",
					"to all {C:attention}cards in hand"
				}
			},
			c_crp_neutrality = {
				name = "Neutrality",
				text = {
					"Apply {C:dark_edition,T:e_holo}Holographic",
					"to all {C:attention}cards in hand"
				}
			},
			c_crp_gambway = {
				name = "Gambway",
				text = {
					"Uses the effect of {C:attention}The Soul{}, {C:attention}Gateway{}, {C:attention}Prayer{},",
					"{C:attention}Stairway to Heaven{}, {C:attention}Path of Solstice{}, or {C:attention}Reckoning",
					"{C:inactive}\"Let's go gambling!\""
				}
			},
			c_crp_all_or_nothing = {
				name = "All or Nothing",
				text = {
					"{C:red}Fixed{} {C:green}50%{} chance to create {C:white,X:crp_all,E:1}All",
					"Otherwise:",
					"{C:red}Destroy{} all {C:attention}items{}, bypassing {C:red}all effects",
					"Reset deck to a standard {C:attention}52{} card deck",
					"Decrease {C:blue}hands{} and {C:red}discards{} by {C:attention}27"
				}
			},
		},
		Code = {
			c_crp_decrement = {
				name = "://DECREMENT",
				text = {
					"{C:attention}-#1#{} Ante if {C:attention}Ante{} is",
					"a multiple of hand size"
				}
			},
			c_crp_ip_192 = {
				name = "://IP_192.168.1.1",
				text = {
					"Fill all open {C:attention}Joker{} slots with {C:edition,X:gray}Bulgoe",
					"{C:inactive}(Max of 100)",
					"{C:red}Fixed {C:green}1 in #1#{} chance for each individual",
					"{C:edition,X:gray}Bulgoe{} to be replaced with {C:attention}Normalis"
				}
			},
		},
		Back = {
			b_crp_cyan = {
				name = "Cyan Deck",
				text = {
					"{C:attention}+#1#{} hand size",
					"{C:red}-#2#{} discard#<s>2#"
				}
			},
			b_crp_brown = {
				name = "Brown Deck",
				text = {
					"{C:blue}-#1#{} hand",
					"{C:attention}+#2#{} card selection limit"
				}
			},
			b_crp_gray = {
				name = "Gray Deck",
				text = {
					"Start with {C:money}$0",
					"Start with {C:attention,T:v_seed_money}Money Tree"
				}
			},
			b_crp_white = {
				name = "White Deck",
				text = {
					"{C:red}-#1#{} {C:attention}Joker{} slot",
					"{C:blue}+#2#{} hand"
				}
			},
			b_crp_kiddie = {
				name = "Kiddie Deck",
				text = {
					"{C:blue}-#1#{} hands, {C:red}-#2#{} discard",
					"{C:red}-#3#{} {C:attention}Joker{} slots, {C:red}-#4#{} {C:attention}consumable{} slot",
					"{C:red}-#5#{} hand size",
					"{C:attention}#6#% Blind{} size"
				}
			},
			b_crp_creativemode = {
				name = "Creative Mode Deck",
				text = {
					"Start with",
					"{C:attention}1 {C:spectral,T:c_cry_pointer}Pointer"
				}
			},
			b_crp_adult = {
				name = "Adult Deck",
				text = {
					"{C:blue}+#1#{} hand#<s>1#, {C:red}+#2#{} discard#<s>2#",
					"{C:attention}+#3# Joker{} slot#<s>3#, {C:attention}+#4# consumable{} slot#<s>4#",
					"{C:attention}+#5#{} hand size",
					"{C:attention}#6#% Blind{} size"
				}
			}
		},
		Tarot = {
			c_crp_prospect = {
				name = "Wheel of Prospect",
				text = {
					"{C:green}#1# in #2# chance{} to create a",
					"random {C:dark_edition}Negative{} {C:red}Rare{} or {C:cry_epic}Epic{} {C:attention}Joker",
					"{C:inactive}(Does not require room)"
				}
			}
		},
		Tag = {
			tag_crp_common_tag = {
				name = "Common Tag",
				text = {
					"Shop has a free",
					"{C:common}Common{} {C:attention}Joker",
				},
			},
			tag_crp_legendary_tag = {
				name = "Legendary Tag",
				text = {
					"Shop has a full-price",
					"{C:legendary}Legendary{} {C:attention}Joker",
				},
			},
			tag_crp_exotic_tag = {
				name = "Exotic Tag",
				text = {
					"Shop has an {C:cry_exotic}Exotic",
					"{C:attention}Joker{} at double the price",
				},
			},
			tag_crp_uncommon_2_tag = {
				name = "Uncommon 2 Tag",
				text = {
					"Shop has a free",
					"{C:uncommon}Uncommon 2{} {C:attention}Joker",
				},
			},
			tag_crp_rare_2_tag = {
				name = "Rare 2 Tag",
				text = {
					"Shop has a free",
					"{C:rare}Rare 2{} {C:attention}Joker",
				},
			},
			tag_crp_m_tag = {
				name = "M Tag",
				text = {
					"Shop has a free",
					"{C:cry_exotic}M{} {C:attention}Joker",
				},
			},
			tag_crp_awesome_tag = {
				name = "Awesome Tag",
				text = {
					"Shop has a half-price",
					"{C:crp_awesome}Awesome{} {C:attention}Joker",
				},
			},
			tag_crp_mythic_tag = {
				name = "Mythic Tag",
				text = {
					"Shop has a {C:crp_mythic}Mythic",
					"{C:attention}Joker{} at quadruple the price",
				},
			},
			["tag_crp_better_better_top-up_tag"] = {
				name = "Better Better Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:red}Rare{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_better_better_better_top-up_tag"] = {
				name = "Better Better Better Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:cry_epic}Epic{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_better_better_better_better_top-up_tag"] = {
				name = "Better Better Better Better Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:purple}Legendary{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_better_better_better_better_better_top-up_tag"] = {
				name = "Better Better Better Better Better Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:cry_exotic}Exotic{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_better_better_better_better_better_better_top-up_tag"] = {
				name = "Better Better Better Better Better Better Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:crp_mythic}Mythic{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_better_better_better_better_better_better_better_top-up_tag"] = {
				name = "Better Better Better Better Better Better Better Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:crp_exomythic}ExoMythic{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_better_better_better_better_better_better_better_better_top-up_tag"] = {
				name = "Better Better Better Better Better Better Better Better Better Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:crp_2exomythic4me}2ExoMythic4me{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_better_better_better_better_better_better_better_better_better_top-up_tag"] = {
				name = "Better Better Better Better Better Better Better Better Better Better Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:crp_22exomythic4mecipe}22ExoMythic4meCipe{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_best_top-up_tag"] = {
				name = "Best Top-up Tag",
				text = {
				}
			},
			["tag_crp_:3_top-up_tag"] = {
				name = ":3 Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:HEX(ff00ff)}:3{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_candy_top-up_tag"] = {
				name = "Candy Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:cry_candy}Candy{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_top-down_tag"] = {
				name = "Top-down Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:cry_cursed}Cursed{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			["tag_crp_trash_top-up_tag"] = {
				name = "Trash Top-up Tag",
				text = {
					"Create up to {C:attention}#1#",
					"{C:crp_trash}Trash{} {C:attention}Jokers",
					"{C:inactive}(Must have room){}"
				}
			},
			tag_crp_overloaded_tag = {
				name = "Overloaded Tag",
				text = {
					"Next base edition shop",
					"{C:attention}Joker{} is free and",
					"becomes {C:dark_edition}Overloaded",
				}
			},
			["tag_crp_four-dimensional_tag"] = {
				name = "Four-Dimensional Tag",
				text = {
					"Next base edition shop",
					"{C:attention}Joker{} is free and",
					"becomes {C:dark_edition}Four-Dimensional",
				}
			},
			["tag_crp_top-up_everything"] = {
				name = "Top-up Everything",
				text = {
					"Create {C:white,X:crp_all}All",
					"{C:inactive}(Must have room)"
				}
			},
		},
		Edition = {
			e_crp_overloaded = {
				name = "Overloaded",
				text = {
					"{C:dark_edition,X:edition}^^^#1#{} Chips",
					"{C:dark_edition,X:edition}^^^#2#{} Mult",
				},
			},
			["e_crp_four-dimensional"] = {
				name = "Four-Dimensional",
				text = {
					"{C:green}#1# in #2#{} chance to",
					"retrigger {C:attention}#3#{} times",
				},
			},
			e_crp_zany = {
				name = "Zany",
				text = {
					"{C:mult}+#1#{} Mult",
					"This card is feeling",
					"rather {C:attention}zany{}",
				},
			},
			e_crp_mad = {
				name = "Mad",
				text = {
					"{C:mult}+#1#{} Mult",
					"This card is feeling",
					"rather {C:attention}mad{}",
				},
			},
			e_crp_crazy = {
				name = "Crazy",
				text = {
					"{C:mult}+#1#{} Mult",
					"Counts as {C:attention}3 Mad Jokers{}"
				},
			},
			e_crp_insane = {
				name = "Insane",
				text = {
					"{C:mult}+#1#{} Mult",
					"Counts as {C:attention}3 Crazy Jokers{}",
					"{C:inactive}(AKA {C:attention}9 Mad Jokers{C:inactive})"
				},
			},
			--[[ e_crp_psychic = {
				name = "Psychic",
				text = {
					"{C:edition,X:dark_edition}#1##2##3##4#{} Chips",
					"Operator increases by {C:attention}#5#{} for every",
					"{C:attention}#6# 7{}s played or discarded",
				},
			}, ]]--
			e_crp_really_negative = {
				name = "Really Negative",
				text = {
					"{C:dark_edition}+#1#{} {C:attention}Joker{} slots",
				},
			},
			e_crp_super_negative = {
				name = "Super Negative",
				text = {
					"{C:dark_edition}+#1#{} {C:attention}Joker{} slots",
				},
			},
			e_crp_photon_readings_negative = {
				name = "Photon Readings Negative",
				text = {
					"{C:dark_edition}+#1#{} {C:attention}Joker{} slots",
				},
			},
			e_crp_photon_readings_really_negative = {
				name = "Photon Readings are REALLY FUCKING NEGATIVE",
				text = {
					"{C:dark_edition}+#1#{} {C:attention}Joker{} slots",
				},
			},
			e_crp_photon_readings_gone = {
				name = "Photon Readings are Gone.",
				text = {
					"{C:dark_edition}+#1#{} {C:attention}Joker{} slots",
				},
			},
		},
		Voucher = {
			v_crp_patience = {
				name = "Patience",
				text = {
					"Wait for it..."
				},
			},
			v_crp_patience_2 = {
				name = "More Patience",
				text = {
					"Wait for it..."
				},
			},
			v_crp_patience_3 = {
				name = "Even More Patience",
				text = {
					"Wait for it... a bit more..."
				},
			},
			v_crp_patience_4 = {
				name = "Even More Patience Again",
				text = {
					"Just a bit... longer..."
				},
			},
			v_crp_patience_5 = {
				name = "So Much Patience",
				text = {
					"You're almost there..."
				},
			},
			v_crp_payoff = {
				name = "Payoff",
				text = {
					"{C:chips}+4{} Chips! You did it!"
				},
			},
			v_crp_just_kidding = {
				name = "Just Kidding, This Is The Real Payoff",
				text = {
					"Creates {C:attention}#1#{} {C:dark_edition}Negative{} {C:white,X:crp_all,E:1}All{}",
					"{C:inactive}\"Took ya long enough.\""
				},
			},
		},
		Stake = {
			stake_crp_violet = {
				name = "Violet Stake",
				colour = "Violet",
				text = {
					"{C:attention}X2{} Blind size"
				}
			},
			stake_crp_square = {
				name = "Square Stake",
				colour = "Square",
				text = {
					"{C:attention}-1{} card selection limit"
				}
			},
			stake_crp_stencil = {
				name = "Stencil Stake",
				colour = "Stencil",
				text = {
					"{C:attention}-1{} Joker slot"
				}
			}
		},
		Other = {
			p_crp_very_rare_pack = {
				name = "Very Rare Pack",
				text = {
					"Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
					"{C:dark_edition}very rare{} {C:attention}consumables{}",
				},
			},
			p_crp_very_balanced_pack = {
				name = "Very Balanced Pack",
				text = {
					"Choose {C:attention}#1#{} of up to {C:attention}#2#{}",
					"{C:crp_exomythic}ExoMythic{} {C:attention}Jokers{}",
				},
			},
		}
	},
	misc = {
		dictionary = {
			k_crp_abysmal = "Abysmal",
			k_crp_trash = "Trash",
			["k_crp_:3"] = ":3",
			k_crp_common_2 = "Common 2",
			k_crp_2common4me = "2Common4me",
			k_crp_uncommon_2 = "Uncommon 2",
			k_crp_unrare = "Unrare",
			k_crp_rare_2 = "Rare 2",
			k_crp_refined = "Refined",
			k_crp_meat = "Meat",
			k_crp_joker = "Joker",
			k_crp_m = "M",
			k_crp_cipe = "cipE",
			k_crp_incredible = "Incredible",
			k_crp_extraordinary = "Extraordinary",
			k_crp_awesome = "Awesome",
			k_crp_exotic_2 = "Exotic 2",
			k_crp_mythic = "Mythic",
			k_crp_exomythic = "ExoMythic",
			k_crp_2exomythic4me = "2ExoMythic4me",
			k_crp_22exomythic4mecipe = "22ExoMythic4meCipe",
			k_crp_exomythicepicawesomeuncommon2mexotic22exomythic4mecipe = "ExoMythicEpicAwesomeUncommon2MExotic22ExoMythic4meCipe",
			k_crp_hyperexomythicepicawesomeuncommon2mexotic2gigaomegaalphaomnipotranscendant2exomythic4mecipe = "HyperExoMythicEpicAwesomeUncommon2MExotic2GigaOmegaAlphaOmnipotranscendant2ExoMythic4meCipe",
			k_crp_supa_rare = "supa rare",
			k_crp_all = "All",
			bl_crp_debuff_monochrome_m = "Must play Pairs"
		},
		labels = {
			crp_overloaded = "Overloaded",
			["crp_four-dimensional"] = "Four-Dimensional",
			crp_zany = "Zany",
			crp_mad = "Mad",
			crp_crazy = "Crazy",
			crp_insane = "Insane",
			crp_really_negative = "Really Negative",
			crp_super_negative = "Super Negative",
			crp_photon_readings_negative = "Photon Readings Negative",
			crp_photon_readings_really_negative = "Photon Readings are REALLY FUCKING NEGATIVE",
			crp_photon_readings_gone = "Photon Readings are Gone.",
			--[[ crp_psychic = "Psychic", ]]--
		},
		v_dictionary = {
			everything = "Everything: #1#",
			colon_3 = ":3",
			placeholder = "Placeholder Art: #1#",
			alt = "~ #1#",
		}
	}
}


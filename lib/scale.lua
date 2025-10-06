-- tetrationa and potentia's scaling effects
local scie = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
local ret = scie(effect, scored_card, key, amount, from_edition)
	if
		(
			key == "e_mult"
			or key == "emult"
			or key == "Emult"
			or key == "e_mult_mod"
			or key == "emult_mod"
			or key == "Emult_mod"
		)
		and amount ~= 1 then
		for k, v in pairs(SMODS.find_card("j_crp_tetrationa")) do
			local old = v.ability.extra.eemult
			SMODS.scale_card(v, {
				ref_table = v.ability.extra,
				ref_value = "eemult",
				scalar_value = "eemult_mod",
				message_colour = G.C.DARK_EDITION,
			})
		end
		for k, v in pairs(SMODS.find_card("j_crp_potentia")) do
			local old = v.ability.extra.Emult
			SMODS.scale_card(v, {
				ref_table = v.ability.extra,
				ref_value = "emult",
				scalar_value = "emult_mod",
				message_colour = G.C.DARK_EDITION,
			})
		end
	end
	return ret
end
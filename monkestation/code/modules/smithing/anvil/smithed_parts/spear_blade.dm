/obj/item/smithed_part/weapon_part/spear_blade
	icon_state = "spearhead"
	base_name = "spear blade"
	weapon_name = "spear"

	weapon_inhand_icon_state = "spear"
	hilt_icon = 'monkestation/code/modules/smithing/icons/forge_items.dmi'
	hilt_icon_state = "spear-hilt"

/obj/item/smithed_part/weapon_part/spear_blade/finish_weapon()
	. = ..()
	sharpness = SHARP_EDGED
	embedding = list("impact_pain_mult" = 2, "remove_pain_mult" = 4, "embed_chance" = 65, "fall_chance" = 10, "ignore_throwspeed_threshold" = TRUE)
	armour_penetration = 30 * (smithed_quality / 100)
	reach = 2
	AddComponent(/datum/component/multi_hit, icon_state = "stab", height = 2)

	slot_flags = ITEM_SLOT_BACK

	stamina_cost = round(25 * (100 / smithed_quality))

	force = round(((material_stats.density + material_stats.hardness) / 4.5) * (smithed_quality * 0.01))
	throwforce = force * 1.25
	w_class = WEIGHT_CLASS_BULKY

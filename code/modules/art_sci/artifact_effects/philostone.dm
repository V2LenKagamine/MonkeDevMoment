/datum/artifact_effect/philostone
	examine_hint = "Radiates a midas like aura"
	examine_discovered = "Turns nearby Iron into Gold!"
	weight = ARTIFACT_VERYRARE
	research_value = TECHWEB_TIER_7_POINTS //GOOOOOOOOOLD
	type_name = "Midas Stone Effect"

/datum/artifact_effect/philostone/effect_process()
	var/list/custom_transform = list(GET_MATERIAL_REF(/datum/material/gold) = SHEET_MATERIAL_AMOUNT)
	var/owner_turf = get_turf(our_artifact.holder)
	if(owner_turf)
		for(var/turf/thing in range(1,owner_turf))
			if(istype(thing,/turf/open/floor/material) || istype(thing, /turf/closed/wall/material))
				if(thing.has_material_type(GET_MATERIAL_REF(/datum/material/iron)))
					thing.set_custom_materials(custom_transform)
		for(var/obj/thingy in range(1,owner_turf))
			if(thingy.has_material_type(GET_MATERIAL_REF(/datum/material/iron)))
				thingy.set_custom_materials(custom_transform)
				thingy.update_icon()
				thingy.update_name()
				thingy.update_desc()


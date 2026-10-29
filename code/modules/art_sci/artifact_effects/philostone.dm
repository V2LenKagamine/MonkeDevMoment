#define PERMITTED_MATERIAL_REPLACE_TYPES list(\
	/obj/structure/chair, \
	/obj/structure/table, \
	/obj/structure/toilet, \
	/obj/structure/sink,)

/datum/artifact_effect/philostone
	examine_discovered = "Turns nearby iron structures into gold!"
	weight = ARTIFACT_VERYRARE
	research_value = TECHWEB_TIER_7_POINTS //GOOOOOOOOOLD
	discovered_credits = CARGO_CRATE_VALUE*50//It literally prints money
	type_name = "Midas Stone Effect"

/datum/artifact_effect/philostone/effect_process()
	var/list/custom_transform = list(GET_MATERIAL_REF(/datum/material/gold) = SHEET_MATERIAL_AMOUNT)
	var/owner_turf = get_turf(our_artifact.holder)
	if(owner_turf)
		for(var/turf/thing in range(1,owner_turf))
			if(istype(thing,/turf/open/floor/material) || istype(thing, /turf/closed/wall/material))
				if(thing.has_material_type(GET_MATERIAL_REF(/datum/material/iron)))
					thing.set_custom_materials(custom_transform)
		for(var/obj/thingy in range(1,owner_turf)) //this is supposed to do /any/ iron but I can't get it to work right so
			if(!can_replace_material(thingy))
				continue
			if(thingy.has_material_type(GET_MATERIAL_REF(/datum/material/iron)))
				thingy.set_custom_materials(custom_transform)
				thingy.update_overlays()
				thingy.update_appearance()

///What can this artifact replace with G O L D
/datum/artifact_effect/philostone/proc/can_replace_material(obj/object)
	for (var/type in PERMITTED_MATERIAL_REPLACE_TYPES)
		if (istype(object, type))
			return TRUE
	return FALSE

#undef PERMITTED_MATERIAL_REPLACE_TYPES

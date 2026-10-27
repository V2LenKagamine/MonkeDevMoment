/datum/artifact_effect/wizardly
	examine_hint = "Radiates a magical aura."
	examine_discovered = "Bestows Magic."
	weight = ARTIFACT_UNCOMMON //Suprisingly still rare, as requires a touch-wizard artifact.
	research_value = TECHWEB_TIER_6_POINTS //Its fucking MAGIC
	type_name = "Wizardly Tome"
	super_secret = TRUE
	valid_activators = list(/datum/artifact_activator/touch/carbon)
	valid_origins = list(/datum/artifact_origin/wizard)
	var/valid_grants = list(/datum/action/cooldown/spell/basic_heal,
	/datum/action/cooldown/spell/pointed/projectile/fireball,
	/datum/action/cooldown/spell/summonitem,
	/datum/action/cooldown/spell/conjure_item/spellpacket,
	/datum/action/cooldown/spell/forcewall,
	/datum/action/cooldown/spell/conjure/bee)

/datum/artifact_effect/wizardly/effect_touched(mob/living/user)
	var/spell = pick(valid_grants)
	var/datum/action/cooldown/spell/boi = new spell(user)
	if(boi)
		if(boi.spell_requirements & SPELL_REQUIRES_WIZARD_GARB)
			boi.spell_requirements &= ~SPELL_REQUIRES_WIZARD_GARB
		boi.Grant(user)
	to_chat(user,span_boldnotice("You can't find where [src.our_artifact.holder] went."))
	qdel(src.our_artifact.holder)

//Reagents produced by metabolising/reacting fermichems inoptimally these specifically are for toxins
//Inverse = Splitting
//Invert = Whole conversion
//Failed = End reaction below purity_min

////////////////////TOXINS///////////////////////////

//Lipolicide - Impure Version
/datum/reagent/impurity/ipecacide
	name = "Ipecacide"
	description = "An extremely gross substance that induces vomiting. It is produced when Lipolicide reactions are impure."
	ph = 7
	liver_damage = 0

/datum/reagent/impurity/ipecacide/on_mob_add(mob/living/carbon/owner)
	if(owner.disgust >= DISGUST_LEVEL_GROSS)
		return ..()
	owner.adjust_disgust(50)
	..()


//Formaldehyde - Impure Version
/datum/reagent/impurity/methanol
	name = "Methanol"
	description = "A light, colourless liquid with a distinct smell. Ingestion can lead to blindness. It is a byproduct of organisms processing impure Formaldehyde."
	reagent_state = LIQUID
	color = "#aae7e4"
	ph = 7
	liver_damage = 0

/datum/reagent/impurity/methanol/on_mob_life(mob/living/carbon/owner, delta_time)
	var/obj/item/organ/eyes/eyes = owner.getorganslot(ORGAN_SLOT_EYES)
	if(!eyes)
		return ..()
	eyes.applyOrganDamage(0.5 * REM * delta_time)
	..()


//Chloral Hydrate - Impure Version
/datum/reagent/impurity/chloralax
	name = "Chloralax"
	description = "An oily, colorless and slightly toxic liquid. It is produced when impure choral hydrate is broken down inside an organism."
	reagent_state = LIQUID
	color = "#387774"
	ph = 7
	liver_damage = 0

/datum/reagent/impurity/chloralax/on_mob_life(mob/living/carbon/owner, delta_time)
	owner.adjustToxLoss(1 * REM * delta_time, 0)
	..()


//Mindbreaker Toxin - Impure Version
/datum/reagent/impurity/rosenol
	name = "Rosenol"
	description = "A strange, blue liquid that is produced during impure mindbreaker toxin reactions. Historically it has been abused to write poetry."
	reagent_state = LIQUID
	color = "#0963ad"
	ph = 7
	liver_damage = 0
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/impurity/rosenol/on_mob_life(mob/living/carbon/owner, delta_time)
	var/obj/item/organ/tongue/tongue = owner.getorganslot(ORGAN_SLOT_TONGUE)
	if(!tongue)
		return ..()
	if(DT_PROB(4.0, delta_time))
		owner.manual_emote("clicks with [owner.p_their()] tongue.")
		owner.say("Noice.", forced = /datum/reagent/impurity/rosenol)
	if(DT_PROB(2.0, delta_time))
		owner.say(pick("Ah! C'était une erreur!", "Horrible.", "Attention tout le monde, la pomme de terre est vraiment chaude.", "Quand j'avais six ans, j'ai mangé un sac de prunes.", "Et s'il y a une chose que je ne supporte pas, ce sont les tomates.", "Et s'il y a une chose que j'aime, ce sont les tomates.", "Nous avions un capitaine qui était si strict, nous n'avions pas le droit de respirer dans la station.", "Les faibles finissaient par mourir soudainement, vous les entendiez tomber sans un bruit."), forced = /datum/reagent/impurity/rosenol)
	..()

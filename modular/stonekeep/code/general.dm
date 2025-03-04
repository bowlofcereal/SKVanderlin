/* * * * * * * * * * * **
 *						*
 *		 General		*
 *						*
 *						*
 * * * * * * * * * * * **/

// =================================================================================
//////////////////////////////////////////////
//											//
//					BATHTUB					//
//											//
//////////////////////////////////////////////
/obj/structure/table/wood/bathtub
	name = "bathtub"
	desc = "A relaxing bath in hot water, or a endurance test in freezing water, depending on how lazy you are when warming water."
	icon = 'modular/stonekeep/icons/pews.dmi'
	icon_state = "bathtub"
	resistance_flags = FLAMMABLE
	climb_offset = 0
	climb_time = 30
	climb_sound = 'sound/foley/waterwash (1).ogg'

/obj/structure/table/wood/bathtub/Initialize()
	. = ..()
	add_overlay(mutable_appearance(icon, "bathtub_bathing", ABOVE_MOB_LAYER, GAME_PLANE_UPPER))



// -------------- SOAP -----------------
/obj/item/soap
	name = "soap"
	desc = ""
	gender = PLURAL
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "soap"
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
	throwforce = 0
	throw_speed = 1
	throw_range = 7
	grind_results = list(/datum/reagent/lye = 10)
	cleanspeed = 35 //slower than mop
	uses = 10
	grid_width = 32
	grid_height = 32

/obj/item/soap/attack(mob/living/carbon/human/target, mob/living/carbon/user)
	user.changeNext_move(CLICK_CD_MELEE)
	var/turf/bathspot = get_turf(target)				// Checks for being in a bath and being undressed
	if(!istype(bathspot, /turf/open/water/bath))
		if((!locate(/obj/structure/table/wood/bathtub) in target.loc))
			to_chat(user, span_warning("They must be in the bath water!"))
			return
	if(!ishuman(target))
		to_chat(user, span_warning("They don't want to be soaped..."))
		return

	if(istype(target.wear_armor, /obj/item/clothing))
		to_chat(user, span_warning("Can't get a proper bath with armor on."))
		return

	if(istype(target.wear_shirt, /obj/item/clothing))
		to_chat(user, span_warning("Can't get a proper bath with clothing on."))
		return

	if(istype(target.cloak, /obj/item/clothing))
		to_chat(user, span_warning("Can't get a proper bath with clothing on."))
		return

	if(istype(target.wear_pants, /obj/item/clothing))
		to_chat(user, span_warning("Can't get a proper bath with pants on."))
		return

	if(istype(target.shoes, /obj/item/clothing))
		to_chat(user, span_warning("Can't get a proper bath with shoes on."))
		return

	user.visible_message("<span class='info'>[user] begins scrubbing [target] with the [src].</span>")	// Applies the special bonus only if Nitemaiden using the soap
	playsound(src.loc, pick('sound/items/soaping.ogg'), 100)
	if(do_after(user, 5 SECONDS, target = target))
		if((user.job == "Nitemaiden"))
			user.visible_message(span_info("[user] expertly scrubs and soothes [target] with the [src]."))
			to_chat(target, span_warning("I feel so relaxed and clean!"))
			target.apply_status_effect(/datum/status_effect/buff/clean_plus)
			target.tiredness = 0
			target.remove_status_effect(/datum/status_effect/debuff/sleepytime)
		else
			user.visible_message(span_info("[user] tries their best to scrub [target] with the [src]."))
			to_chat(target, span_warning("Its worth a little soap in my eyes to get clean."))
		wash_atom(target, CLEAN_STRONG)
		uses -= 1
		if(uses == 0)
			qdel(src)


// =================================================================================
/*------\
| Crops |
\------*/

/datum/plant_def
	icon = 'modular/stonekeep/icons/crops.dmi'

// =================================================================================
/*-------\
| Papers |
\-------*/

/obj/item/paper/note_about_dwarfs
	name = "report to Guild on steel deliveries"
	info = "Last yils deliverie of steele from the dwarf outposte in the northeast: 83 ingots of finest steel. None hath been delivered this yil, this will not do. For the good of the Makers Guild, this must be investigated."

/obj/item/paper/reminder_about_dwarfs
	name = "note about steel deliveries"
	info = "Makers! The northern dwarves delivery of steele is much delayed this yil. Make do or go get it from them, the Guild cannot do more to solve this."

/obj/item/paper/feldsher_certificate
	icon = 'modular/stonekeep/icons/misc.dmi'
	icon_state = "certificate"
	name = "feldsher health certificate"
	info = "The wearer hath passed the feldshers monthly inspection as mandated by the pestilence laws, and is not a bearer of maladies to infect our towne.   \
	Thus they are allowede legally to ply the nitemaidens trade. I so swear on this date. (signed by the town feldsher, the date is a few weeks ago)"

/obj/item/paper/feldsher_certificate/update_icon_state()
	icon_state = "certificate"

/obj/item/paper/feldsher_certificate/expired
	info = "The wearer hath passed the feldshers monthly inspection as mandated by the pestilence laws, and is not a bearer of maladies to infect our towne.   \
	Thus they are allowede legally to ply the nitemaidens trade. I so swear on this date.  (signed by the town feldsher, the date is half a year ago)"
/obj/item/paper/feldsher_certificate/fake
	info = "The wearer hath passed the feldshers monthly inspection as mandated by the pestilence laws, and is not a bearer of maladies to infect our towne.   \
	Thus they are allowede legally to ply the nitemaidens trade. I so swear on this date.  (signature is undreadable, the date is a few weeks ago)"
/obj/item/paper/feldsher_certificate/Initialize()
	..()
	icon = 'modular/stonekeep/icons/misc.dmi'
	icon_state = "certificate"
/obj/item/paper/feldsher_certificate/maybe/New()
	. = ..()
	if(prob(50))
		info = "The wearer hath passed the feldshers monthly inspection as mandated by the pestilence laws, and is not a bearer of maladies to infect our towne.   \
	Thus they are allowede legally to ply the nitemaidens trade. I so swear on this date. (signed by the town feldsher, the date is a few weeks ago)"
	else
		info = "The wearer hath passed the feldshers monthly inspection as mandated by the pestilence laws, and is not a bearer of maladies to infect our towne.   \
	Thus they are allowede legally to ply the nitemaidens trade. I so swear on this date.  (signed by the town feldsher, the date is half a year ago)"


// =================================================================================
/*------\
| Items |
\------*/

/obj/item/clothing/head/peaceflower
	icon = 'modular/stonekeep/icons/misc.dmi'

/obj/item/reagent_containers/glass/bucket/pot/copper
	icon = 'modular/stonekeep/icons/cooking.dmi'

/obj/item/reagent_containers/glass/bucket/pot/stone
	icon = 'modular/stonekeep/icons/cooking.dmi'
	icon_state = "pote_stone"
	drop_sound = 'modular/stonekeep/sound/stone_scrape.ogg'


/obj/item/grown/log/tree
	lefthand_file = 'modular/stonekeep/icons/onmob/lefthand.dmi'
	righthand_file = 'modular/stonekeep/icons/onmob/righthand.dmi'
	experimental_inhand = FALSE
/obj/item/grown/log/tree/small
	icon_state = "logsmall"
/obj/item/grown/log/tree/stake
/obj/item/grown/log/tree/stick
	item_state = "stick"
/obj/item/natural/wood/plank
	lefthand_file = 'modular/stonekeep/icons/onmob/lefthand.dmi'
	righthand_file = 'modular/stonekeep/icons/onmob/righthand.dmi'
	experimental_inhand = FALSE
/obj/item/natural/bundle/plank
	lefthand_file = 'modular/stonekeep/icons/onmob/lefthand.dmi'
	righthand_file = 'modular/stonekeep/icons/onmob/righthand.dmi'
	experimental_inhand = FALSE

/obj/item/grown/log/tree/small/essence	// disabled in this shitty way, its a literal powerup icon coin for mario to bop head on, very gamey ROGTODO
	name = ""
	desc = ""
	icon_state = ""



// =============================================================================
// ========================		WEATHER EDITS		============================

// braziers, magic fire, lamps etc are rain resistant, standing fires and torch holders are not
/obj/machinery/light/rogue/torchholder/Initialize()
	. = ..()
	GLOB.weather_act_upon_list += src

/obj/machinery/light/rogue/torchholder/Destroy()
	GLOB.weather_act_upon_list -= src
	. = ..()


/obj/machinery/light/rogue/firebowl/standing/Initialize()
	. = ..()
	GLOB.weather_act_upon_list += src
/obj/machinery/light/rogue/firebowl/standing/Destroy()
	GLOB.weather_act_upon_list -= src
	. = ..()

/obj/machinery/light/rogue/firebowl/standing/blue/Initialize()
	. = ..()
	GLOB.weather_act_upon_list -= src
/obj/machinery/light/rogue/firebowl/standing/lamp/Initialize()
	. = ..()
	GLOB.weather_act_upon_list -= src

/obj/item/flashlight/flare/torch/Initialize()
	. = ..()
	GLOB.weather_act_upon_list += src

/obj/item/flashlight/flare/torch/Destroy()
	GLOB.weather_act_upon_list -= src
	. = ..()

/obj/item/flashlight/flare/torch/weather_act_on(weather_trait, severity)
	if(weather_trait != PARTICLEWEATHER_RAIN)
		return
	extinguish()

/obj/machinery/light/rogue/firebowl/standing/weather_act_on(weather_trait, severity)
	if(weather_trait != PARTICLEWEATHER_RAIN)
		return
	extinguish()

/datum/particle_weather/rain_gentle/weather_act(mob/living/L)
	L.adjust_bodytemperature(-rand(1,3))
	L.SoakMob(FULL_BODY)
	if(L.fire_stacks > 0)
		if(prob(1))
			L.adjust_fire_stacks(-1)

/datum/particle_weather/rain_storm/weather_act(mob/living/L)
	L.adjust_bodytemperature(-rand(3,5))
	L.SoakMob(FULL_BODY)
	if(L.fire_stacks > 0)
		if(prob(1))
			L.adjust_fire_stacks(-1)



// =============================================================================
// ========================		BLOOD PREMAPPED		============================
/*	..................   For premapped blood skipping timers, diseases etc   ................... */
/obj/effect/decal/cleanable/blood_neu
	name = "blood"
	desc = ""
	icon = 'icons/effects/blood.dmi'
	icon_state = "floor1"
	alpha = 200
	nomouseover = TRUE
	nomouseover = TRUE
	var/wash_precent = 0
	COOLDOWN_DECLARE(wash_cooldown)

/obj/effect/decal/cleanable/blood_neu/weather_act_on(weather_trait, severity)
	if(weather_trait != PARTICLEWEATHER_RAIN || !COOLDOWN_FINISHED(src, wash_cooldown))
		return
	wash_precent += min(10, severity / 4)
	alpha = 255 *((100 - wash_precent) * 0.01)
	if(wash_precent >= 100)
		qdel(src)
	COOLDOWN_START(src, wash_cooldown, 15 SECONDS)

/obj/effect/decal/cleanable/blood_neu/Initialize(mapload)
	. = ..()
	pixel_x = rand(-5,5)
	pixel_y = rand(5,5)
	GLOB.weather_act_upon_list += src

/obj/effect/decal/cleanable/blood_neu/Destroy()
	GLOB.weather_act_upon_list -= src
	return ..()

/obj/effect/decal/cleanable/blood_neu/random/Initialize(mapload)
	. = ..()
	icon_state = pick("floor1", "floor2", "floor3", "floor4", "floor5", "floor6", "splatter1", "splatter2", "splatter3", "splatter4", "splatter5", "splatter6", "gibl1", "gibl2", "gibl3", "gibl4", "gibl5")

/obj/effect/decal/cleanable/blood_neu/tracks
	icon_state = "tracks"


/*	..................   Misc   ................... */
/obj/item/roguestatue/gnome	// for the wizards tower
	name = "petrified gnome"
	desc = "A literal gnome, turned to stone by powerful magicks. Rather unsettling, or a fascinating experiment, depending on your point of view."
	icon = 'modular/stonekeep/icons/misc.dmi'
	icon_state = "petrignome"
	smeltresult = null

/obj/structure/fluff/shipssprote
	name = ""
	desc = ""
	icon = 'modular/stonekeep/icons/misc.dmi'
	icon_state = "sprote"
	mouse_opacity = 0
	color = "#5a4621"
	pixel_y = -16


/obj/effect/decal/miasma
	name = ""
	desc = ""
	icon = 'icons/roguetown/mob/rotten.dmi'
	icon_state = "deadite"
	mouse_opacity = 0

/obj/effect/decal/remains/human/old
	name = "remains"
	color = "#d6b3a5"

/obj/effect/decal/remains/human/old/small
	icon_state = "remainslarva"


/obj/structure/fluff/walldeco/rags
	icon = 'modular/stonekeep/icons/misc.dmi'
	icon_state = "wallrags1"
/obj/structure/fluff/walldeco/rags/alt
	icon_state = "wallrags2"
/obj/structure/fluff/walldeco/rags/skull
	icon_state = "wallskull"




// =============================================================================
// ==============================	FLORA	====================================

/*	..................   Pigflowers   ................... */
/obj/structure/flora/rogueflower // ausbushes recolored
	name = "flowers"
	icon = 'modular/stonekeep/icons/pigflora.dmi'
	icon_state = "reedbush_1"
/obj/structure/flora/rogueflower/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/obj/structure/flora/rogueflower/random
	icon_state = "ppflowers"
/obj/structure/flora/rogueflower/random/Initialize()
	icon_state = pick("reedbush", "lavendergrass", "ywflowers", "brflower", "ppflowers")
	. = ..()

/obj/structure/flora/rogueflower/fallenleaves
	icon_state = "leaves"
	alpha = 200
/obj/structure/flora/rogueflower/fallenleaves/Crossed(mob/living/L)
	. = ..()
	playsound(L.loc, "plantcross", 50, FALSE, -1)

/obj/structure/flora/rogueflower/reedbush
	icon_state = "reedbush"

/obj/structure/flora/rogueflower/lavendergrass
	icon_state = "lavendergrass"

/obj/structure/flora/rogueflower/ywflowers
	icon_state = "ywflowers"

/obj/structure/flora/rogueflower/brflowers
	icon_state = "brflowers"

/obj/structure/flora/rogueflower/ppflowers
	icon_state = "ppflowers"

/obj/structure/flora/roguegrass/stalky
	name = ""
	desc = ""

	icon_state = "stalkygrass"
	opacity = FALSE

/obj/structure/flora/roguegrass/stalky/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()


/obj/structure/flora/roguegrass/herb
	icon = 'modular/stonekeep/icons/pigflora.dmi'
	alpha = 230

/*	..................   Bear pelt better   ................... */
/obj/structure/bearpelt
	icon = 'modular/stonekeep/icons/bear.dmi'
	alpha = 240
	color = "#cdcbba"

// makes barrels climbable, its really weird they arent.
/obj/structure/fermenting_barrel
	climbable = TRUE
	climb_offset = 16


/datum/supply_pack/rogue/narcotics/soap	// correct soap now
	name = "Herbal Soap"
	cost = 20
	contains = /obj/item/soap


// =============================================================================
// ========================		MORNING STUBBLE		============================

/datum/sprite_accessory/facial_hair/stubble
	name = "Stubble"
	icon = 'modular/stonekeep/icons/facial.dmi'
	icon_state = "facial_stubble"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling", "halforc")

/mob/living/carbon/human/proc/try_grow_beard()

	if(!(dna?.species))
		return

	// Certain races dont grow beards
	if(!(dna.species in RACES_WITH_BEARD_GROWTH))
		return

	if(!(STUBBLE in dna.species.species_traits))
		return

	if(mob_biotypes & MOB_UNDEAD)
		return

	// Change this if you want female dwarves with beard growth
	if(gender != MALE)
		return

	var/datum/bodypart_feature/hair/facial/beard = get_bodypart_feature_of_slot(BODYPART_FEATURE_FACIAL_HAIR)
	if(!beard)
		return

	if(beard.accessory_type == /datum/sprite_accessory/facial_hair/shaved)
		beard.accessory_type = /datum/sprite_accessory/facial_hair/stubble
		to_chat(src, span_warning("My face itches."))
		update_hair()


// =============================================================================
// ================		DARK ELF DARKLING SYSTEM		========================

/datum/status_effect/debuff/darkling_glare
	id = "darkling_glare"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/darkling_glare
	effectedstats = list("perception" = -1)
	duration = 10 SECONDS

/atom/movable/screen/alert/status_effect/debuff/darkling_glare
	name = "Eye Strain"
	desc = "My eyes are starting to water, the light burns."
	icon_state = "stressb"

/datum/status_effect/debuff/darkling_migraine
	id = "darkling_migraine"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/darkling_migraine
	effectedstats = list("endurance" = -1, "intelligence" = -1) //Will basically always be stacked with the eye strain penalty
	duration = 20 SECONDS

/atom/movable/screen/alert/status_effect/debuff/darkling_migraine
	name = "Migraine"
	icon_state = "muscles"
	desc = "My head is pounding, I need to get away from the light and rest a while!"


/datum/stressevent/darkling_toobright
	stressadd = 1
	desc = span_red("It's too bright, the light hurts my eyes.")
	timer = 30 SECONDS
/datum/stressevent/darkling_migraine
	stressadd = 3
	desc = "My head is pounding, I can barely think. I need to get away from the light and rest a while!"
	timer = 1 MINUTES


/datum/species/elf/dark/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.AddComponent(/datum/component/darkling)

/datum/status_effect/buff/darkling_darkly
	id = "Darkling"
	alert_type =  /atom/movable/screen/alert/status_effect/buff/darkling_darkly
	effectedstats = list("perception" = 1)
	duration = 5 SECONDS

/atom/movable/screen/alert/status_effect/buff/darkling_darkly
	name = "Darkling"
	desc = "You are at home in the dark. Unbothered. In your lane. Moisturized."
	icon_state = "stressg"


/datum/status_effect/debuff/badvision
	effectedstats = list("perception" = -6, "speed" = -2,"fortune" = -5)
	duration = 100



/obj/item/reagent_containers/food/snacks/fat
	fried_type = /obj/item/reagent_containers/food/snacks/tallow
	cooktime = 15 SECONDS


// -------------- TALLOW (fried fat for crafting) -----------------
/obj/item/reagent_containers/food/snacks/tallow
	name = "tallow"
	desc = "Fatty tissue is harvested from slain creachurs and rendered of its membraneous sinew to produce a hard shelf-stable \
	grease. Useful for making processed leather clothing, but little else. Can be sliced into smaller pieces before use to be less wasteful. Inedible"
	icon = 'modular/stonekeep/icons/misc.dmi'
	icon_state = "tallow"
	tastes = list("grease" = 1, "oil" = 1, "regret" =1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	bitesize = 2
	slice_path = /obj/item/reagent_containers/food/snacks/tallow/piece
	slices_num = 2
	slice_batch = FALSE
	slice_sound = TRUE
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/tallow/update_icon()
	if(slices_num)
		icon_state = "tallow"
	else
		icon_state = "tallowslice"

/obj/item/reagent_containers/food/snacks/tallow/On_Consume(mob/living/eater)
	..()
	changefood(slice_path, eater)

/obj/item/reagent_containers/food/snacks/tallow/piece
	name = "piece of tallow"
	desc = "Inedible. Ready for use in crafting."
	icon = 'modular/stonekeep/icons/misc.dmi'
	icon_state = "tallowslice"
	bitesize = 1
	slices_num = FALSE
	slice_path = FALSE
	eat_effect = /datum/status_effect/debuff/uncookedfood
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)

// =================================================================
// ================		TEMPLE FLUFF		========================

/*	..................   Astrata Shrine   ................... */
/obj/structure/fluff/psycross/crafted/shrine/astrata
	name = "The Sun Queen"
	desc = ""
	icon = 'modular/stonekeep/icons/64x64.dmi'
	icon_state = "astrata"
	pixel_x = -19

/*	..................   Necra Shrine   ................... */
/obj/structure/fluff/psycross/crafted/shrine/necra
	name = "The Undermaiden"
	desc = ""
	icon = 'modular/stonekeep/icons/64x64.dmi'
	icon_state = "necra"
	pixel_x = -16

/*	..................   Dendor Shrine   ................... */
/obj/structure/fluff/psycross/crafted/shrine/dendor
	name = "The Tree Father"
	desc = ""
	icon = 'modular/stonekeep/icons/64x64.dmi'
	icon_state = "mystical"
	pixel_x = -10

/*	..................   Abyssor Shrine   ................... */
/obj/structure/fluff/psycross/crafted/shrine/abyssor
	name = "The World Whale"
	desc = ""
	icon = 'modular/stonekeep/icons/96x96.dmi'
	icon_state = "abyssor"
	bound_width = 64
	pixel_x = -25

/*	..................   Abandoned Malum Shrine (Dromkis revenge)   ................... */	// Not meant to be craftable, its abandoned and got a reward for relight it, special for malumites
/obj/structure/fluff/psycross/crafted/shrine/malum
	name = "abandoned statue of Malum"
	desc = "The fire has gone out, the statue cold. The bowl on top is made to hold coal."
	icon = 'modular/stonekeep/icons/64x64.dmi'
	icon_state = "malum"
	bound_width = 64
	var/datum/looping_sound/fireloop/soundloop
	var/refueled
	var/on

/obj/structure/fluff/psycross/crafted/shrine/malum/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/rogueore/coal))
		if(refueled)
			return
		else
			icon_state = "malum_fueled"
			refueled = TRUE
			playsound(src.loc, 'modular/stonekeep/sound/stone_scrape.ogg', 100)
			qdel(A)
/obj/structure/fluff/psycross/crafted/shrine/malum/spark_act()
	fire_act()
/obj/structure/fluff/psycross/crafted/shrine/malum/fire_act(added, maxstacks)
	if(!on)
		playsound(src.loc, 'sound/items/firelight.ogg', 100)
		soundloop = new /datum/looping_sound/fireloop(src,FALSE)
		soundloop.start()
		on = TRUE
		name = "statue of Malum"
		icon_state = "malum_fire"
		set_light(5, 4, 30, l_color = LIGHT_COLOR_YELLOW)
		update_icon()
		soundloop.start()
		malums_blessings()
		return TRUE
/obj/structure/fluff/psycross/crafted/shrine/malum/Destroy()
	QDEL_NULL(soundloop)
	. = ..()

/obj/structure/fluff/psycross/crafted/shrine/malum/proc/malums_blessings(mob/living/carbon/human)
	for(var/mob/living/carbon/H in hearers(7, loc))
		switch(H.patron?.type)
			if(/datum/patron/divine/malum)
				H.adjust_triumphs(1)
				H.apply_status_effect(/datum/status_effect/buff/craft_buff)
				playsound(H, 'modular/stonekeep/sound/triumph_w.ogg', 100, FALSE, -5)
			else
				H.apply_status_effect(/datum/status_effect/buff/craft_buff)


/obj/structure/chair/pew
	icon = 'modular/stonekeep/icons/pews.dmi'

/obj/structure/chair/pew/left/proc/GetLeftPewArmrest()
	return mutable_appearance('modular/stonekeep/icons/pews.dmi', "pewend_left_armrest")

/obj/structure/chair/pew/right/proc/GetRightPewArmrest()
	return mutable_appearance('modular/stonekeep/icons/pews.dmi', "pewend_right_armrest")

/obj/item/reagent_containers/food/snacks
	var/hard_distill

/obj/item/reagent_containers/food/snacks/produce/onion
	can_distill = FALSE
	hard_distill = TRUE

/obj/item/reagent_containers/food/snacks/produce/potato
	can_distill = FALSE
	hard_distill = TRUE

/obj/structure/fermenting_barrel/distillery
	name = "distillery"
	desc = "Copper vat that turns certain produce into hard liquor."
	icon = 'modular/stonekeep/icons/distillery.dmi'
	icon_state = "distillery"
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	var/datum/looping_sound/distillery/soundloop

/datum/looping_sound/distillery
	mid_sounds = list('modular/stonekeep/sound/distillery.ogg'=1)
	mid_length = 7 SECONDS
	volume = 70

/obj/structure/fermenting_barrel/distillery/Initialize()
	. = ..()
	soundloop = new(src, FALSE)
	soundloop.start()

/obj/structure/fermenting_barrel/distillery/Destroy()
	explosion(src.loc,-1,-1,2, flame_range = 4)	// small explosion, plus a very large fireball.
	return ..()
/obj/structure/fermenting_barrel/distillery/try_ferment(obj/item/reagent_containers/food/snacks/fruit, mob/user, batch_process)
	if(!fruit.hard_distill)
		if(!batch_process)
			to_chat(user, span_warning("Not suitable for distillation."))
		return FALSE
	else if(!user.transferItemToLoc(fruit,src))
		if(!batch_process)
			to_chat(user, span_warning("[fruit] is stuck to my hand!"))
		return FALSE
	if(!batch_process)
		to_chat(user, span_info("I place [fruit] into [src]."))
	addtimer(CALLBACK(src, PROC_REF(makeWine), fruit), rand(1 MINUTES, 3 MINUTES))
	return TRUE


//................	Debris decals (result from crafting or destroying items thats just visual)	............... //
/obj/effect/decal/cleanable/debris
	name = ""
	desc = ""
	icon = 'modular/stonekeep/icons/crafting.dmi'
	icon_state = "tiny"
	beauty = -20
/obj/effect/decal/cleanable/debris/Initialize()
	. = ..()
	setDir(pick(GLOB.cardinals))

/obj/effect/decal/cleanable/debris/ex_act()
	qdel(src)


/obj/effect/decal/cleanable/debris/glassy
	name = "glass shards"
	icon_state = "tiny"
	beauty = -100
/obj/effect/decal/cleanable/debris/glassy/Crossed(mob/living/L)
	. = ..()
	playsound(loc,'sound/foley/glass_step.ogg', 50, FALSE)

/obj/effect/decal/cleanable/debris/stony
	name = "stone chippings"
	icon_state = "pebbly"

/obj/effect/decal/cleanable/debris/woody	// sawdust gets cleared by weather
	name = "sawdust"
	icon_state = "woody"
/obj/effect/decal/cleanable/debris/woody/Initialize()
	START_PROCESSING(SSprocessing, src)
	GLOB.weather_act_upon_list += src
	. = ..()
/obj/effect/decal/cleanable/debris/woody/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	GLOB.weather_act_upon_list -= src
	. = ..()
/obj/effect/decal/cleanable/debris/woody/weather_act_on(weather_trait, severity)
	qdel(src)

/obj/effect/decal/cleanable/debris/clay
	name = "clay shards"
	icon_state = "clay"



/obj/item/kitchen/platter/clay/throw_impact(atom/hit_atom, datum/thrownthing/thrownthing)
	new /obj/effect/decal/cleanable/debris/clay(get_turf(src))
	playsound(get_turf(src), 'sound/foley/break_clay.ogg', 90, TRUE)
	..()
	qdel(src)

/obj/item/reagent_containers/glass/bowl/clay/throw_impact(atom/hit_atom, datum/thrownthing/thrownthing)
	new /obj/effect/decal/cleanable/debris/clay(get_turf(src))
	playsound(get_turf(src), 'sound/foley/break_clay.ogg', 90, TRUE)
	..()
	qdel(src)



/obj/item/paper/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.3,"sx" = 0,"sy" = -1,"nx" = 6,"ny" = -1,"wx" = 1,"wy" = 0,"ex" = 7,"ey" = -1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 2,"sflip" = 0,"wflip" = 0,"eflip" = 8)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/reagent_containers/glass/cup/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	user.changeNext_move(CLICK_CD_MELEE)
	if(!reagents.total_volume)
		if(istype(I,/obj/item/natural/cloth))
			if(do_after(user, 3 SECONDS, src))
				user.visible_message("<span class='notice'>[user] cleans [src] with a rag.</span>")

/obj/item/perfume
	dropshrink = 0.5

/obj/item/sleepingbag
	dropshrink = 0.7
	icon = 'modular/stonekeep/icons/structure.dmi'

/obj/structure/bed/rogue/sleepingbag
	icon = 'modular/stonekeep/icons/structure.dmi'


/*	could not get this to work. Randomiszes where travel tiles appear, from BS/RW branch, see their map for examples.
GLOBAL_LIST_EMPTY(travel_tile_locations)

/obj/effect/landmark/travel_tile_location
	name = "travel tile location"

/obj/effect/landmark/travel_tile_location/Initialize()
	. = ..()
	GLOB.travel_tile_locations += src

/obj/effect/landmark/travel_tile_location/Destroy()
	GLOB.travel_tile_locations -= src
	. = ..()

GLOBAL_LIST_EMPTY(travel_spawn_points)

/obj/effect/landmark/travel_spawn_point
	name = "travel spawn point"
	icon_state = "generic_event"
	var/taken = FALSE

/obj/effect/landmark/travel_spawn_point/Initialize()
	. = ..()
	GLOB.travel_spawn_points += src

/obj/effect/landmark/travel_spawn_point/Destroy()
	GLOB.travel_spawn_points -= src
	. = ..()

/proc/get_free_travel_spawn_point()
	var/list/shuffled = shuffle(GLOB.travel_spawn_points)
	for(var/obj/effect/landmark/travel_spawn_point/point as anything in shuffled)
		if(point.taken)
			continue
		point.taken = TRUE
		return point.loc
	return null

/proc/create_travel_tiles(atom/location, travel_id, travel_goes_to_id, required_trait, tile_path)
	for(var/obj/effect/landmark/travel_tile_location/landmark as anything in GLOB.travel_tile_locations)
		if(get_dist(location, landmark) > 5)
			continue
		// Create travel tile here
		var/obj/structure/fluff/traveltile/tile = new tile_path(landmark.loc)
		tile.aportalid = travel_id
		tile.aportalgoesto = travel_goes_to_id
		tile.required_trait = required_trait
		tile.hide_if_needed()

/datum/controller/subsystem/mapping/proc/spawn_random_travel_tiles()
	spawn_random_travel_transition("vampexit", "vampin", TRAIT_VAMPMANSION, /obj/structure/fluff/traveltile/vampire)
	spawn_random_travel_transition("banditexit", "banditin", TRAIT_BANDITCAMP, /obj/structure/fluff/traveltile/bandit)
//Uncomment to have random transitions, instead of in the sewers exclusively. Duh.
//	spawn_random_travel_transition("goblinexit", "goblinin", TRAIT_GOBLINCAMP, /obj/structure/fluff/traveltile/goblin)

/datum/controller/subsystem/mapping/proc/spawn_random_travel_transition(travel_id, travel_goes_to_id, required_trait, path)
	var/atom/location = get_free_travel_spawn_point()
	if(!location)
		log_world("Unable to find spot for random travel transition: [travel_id] [travel_goes_to_id]")
		return
	create_travel_tiles(location, travel_id, travel_goes_to_id, required_trait, path)
*/


/obj/effect/landmark/start/gravekeeper
	name = "Gravekeeper"
	icon_state = "arrow"

/obj/structure/handcart/corpse
	name = "corpse cart"
	color = "#b4b4b6"


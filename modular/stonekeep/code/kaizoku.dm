#define TRAIT_KAIZOKU					"Foglander Cultured"

#define HEAD_EXCEPT_EYES	(HEAD | NOSE | EARS | HAIR)
//Kaizoku Assets.

#define CLOTHING_RONIN	 		"#861e1e"
#define CLOTHING_EIDOLON		"#613a3f"
#define CLOTHING_TOWERYAKKO		"#804d97"
#define CLOTHING_KABUKIMONO		"#9b874f"

#define CLOTHING_THUNDER		"#be8b48"
#define CLOTHING_STORM			"#1a2677"
#define CLOTHING_OCEAN			"#56928a"
#define CLOTHING_ISLAND			"#bd3541"

//Kaizoku Assets.

#define MANCATCHER				/datum/intent/polearm/thrust/mancatcher

//DEFAULT ABYSSARIAD SKIN TONES
#define SKIN_COLOR_OATHBOUND_MUQIAN "ffe0d1"
#define SKIN_COLOR_OATHBOUND_KAIZOKU "fcccb3"
#define SKIN_COLOR_OATHBOUND_SHUHEN "edc6b3"
#define SKIN_COLOR_OATHBOUND_LINYOU "e2b9a3"
#define SKIN_COLOR_OATHBOUND_DUSTWALKER "d9a284"
#define SKIN_COLOR_WARPCASTER_MUQIAN "c9a893"
#define SKIN_COLOR_WARPCASTER_KAIZOKU "ba9882"
#define SKIN_COLOR_WARPCASTER_SHUHEN "99745d"
#define SKIN_COLOR_WARPCASTER_LINYOU "745441"
#define SKIN_COLOR_WARPCASTER_DUSTWALKER "302017"


//kaizoku asset

/datum/devotion/cleric_holder/proc/grant_spells_sohei(mob/living/carbon/human/H)
	if(!H || !H.mind)
		return

	var/datum/patron/A = H.patron
	var/list/spelllist = list(/obj/effect/proc_holder/spell/invoked/icebind, A.t0)
	for(var/spell_type in spelllist)
		if(!spell_type || H.mind.has_spell(spell_type))
			continue
		H.mind.AddSpell(new spell_type)
	level = CLERIC_T0
	max_devotion = 150

/datum/crafting_recipe
	//crafting diff, every diff removes 25% chance to craft
	var/req_imperial = FALSE
	var/req_islander = FALSE


// =================================================================
// ========================		STATUS EFFECT	====================

//frozentomb

/datum/status_effect/abyssaltomb //Abyssor-followers should instantly break away from this coffin.
	id = "abyssor_frozen"
	status_type = STATUS_EFFECT_UNIQUE
	duration = -1
	examine_text = "You've been frozen within an abyssal tomb."
	alert_type = /atom/movable/screen/alert/status_effect/frozen
	var/obj/structure/abyssaltomb/tomb
	var/attempts = 0 // special feature that increases difficulty with each failed struggle attempt against the ice coffin. Or that's what I intended for it to be.

/atom/movable/screen/alert/status_effect/frozen
	name = "Abyssal Submission"
	desc = "Imprisoned by frozen tides, beneath the deep blue."
	icon_state = "intomb"
	icon = 'modular/stonekeep/kaizoku/icons/misc/screen_alert.dmi'

//Normal Freeze

/atom/movable/screen/alert/status_effect/debuff/freezing //the abyss is cold.
	name = "Abyssal Frostnip"
	desc = "<span class='boldwarning'>Frost-bitten and touched by the ancient god, seeping through time and existence. The god feels, spreads and carves your skin.</span>\n" //that's abyssor.
	icon_state = "freezing"
	icon = 'modular/stonekeep/kaizoku/icons/misc/screen_alert.dmi'

/atom/movable/screen/alert/status_effect/debuff/freezing/severe //the abyss is VERY cold.
	name = "Abyssal Frostbite"
	desc = "<span class='boldwarning'>It carries his touch, the cold for those who trespassed his domain. Ice crystals carves patterns upon where he gazes, the stare is on you.</span>\n" //that's abyssor.
	icon_state = "freezing_severe"
	icon = 'modular/stonekeep/kaizoku/icons/misc/screen_alert.dmi'

/datum/status_effect/debuff/freezing
	id = "freezing"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/freezing
	duration = 30 SECONDS
	effectedstats = list("speed" = -3, "endurance" = -2)

/datum/status_effect/debuff/freezing/tick()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.adjustOxyLoss(-6, 0) //it will actually allow you to breath underwater.
		if(prob(50))
			C.adjustFireLoss(2)
			C.Jitter(3)

/datum/status_effect/debuff/freezing/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		to_chat(C, "<span class='info'>The frigid spike manifests supernatural cold within me.</span>")

/datum/status_effect/debuff/freezing/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_status_effect(/datum/status_effect/debuff/freezing)
		to_chat(C, "<span class='info'>I feel the suffocating cold vanishing, as body warmth returns to me.</span>")
// severe freezing

/datum/status_effect/debuff/freezing
	id = "freezing"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/freezing/severe
	duration = 30 SECONDS
	effectedstats = list("speed" = -5, "endurance" = -4, "strength" = -2)

/datum/status_effect/debuff/freezing/severe/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		if(C.has_status_effect(/datum/status_effect/debuff/freezing))
			C.remove_status_effect(/datum/status_effect/debuff/freezing)
			to_chat(C, "<span class='info'>The biting cold intensified. Cold, abyssal tendrils roams and invades the surface of my skin.</span>")
		else
			to_chat(C, "<span class='info'>Torturous, carving frost upon my core! It reaches down into my spine in soul-rending agony!</span>")
		return ..()

/datum/status_effect/debuff/freezing/severe/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.apply_status_effect(/datum/status_effect/debuff/freezing)// Allows transition from severe freezing to normal freezing. Your body is warming up.
		to_chat(C, "<span class='info'>The excruciating icy tendrils retreats, leaving behind a bone-chilling cold weighting upon my muscles.</span>")

/datum/status_effect/debuff/freezing/severe/tick()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.adjustOxyLoss(-6, 0) // Same underwater breathing
		if(prob(50))
			C.adjustFireLoss(4)
			C.Jitter(3)



/area/rogue/under/town/kaizoku
	name = "kaizoku isle"
	icon_state = "town"
	droning_sound = 'sound/ambience/kaizoku/Abyssanctum.ogg'
	droning_sound_dusk = 'sound/ambience/kaizoku/kaizoku.ogg'
	droning_sound_night = 'sound/ambience/kaizoku/Abyssariad.ogg'


// =================================================================
// =====================	STRUCTURE	============================

/obj/structure/frontierjustice
	name = "frontier justice"
	desc = "The manifestation extrajudicidal punishment by vigilantism, or performed by evil doers to instill fear. One may never know."
	icon = 'icons/roguetown/kaizoku/mapset/frontierjustice.dmi'
	icon_state = "edgy1"
	anchored = TRUE
	density = FALSE
	opacity = 0
	blade_dulling = DULLING_CUT
	max_integrity = 50
	layer = ABOVE_OBJ_LAYER
	destroy_sound = 'sound/foley/bodyfall (1).ogg'

/obj/structure/frontierjustice/Initialize()
	. = ..()
	icon_state = "edgy[rand(1,5)]"

/obj/structure/frontierjustice/examine_status(mob/user)
	if(max_integrity)
		var/healthpercent = (obj_integrity/max_integrity) * 100
		switch(healthpercent)
			if(50 to 99)
				return  "The flesh is still in place."
			if(25 to 50)
				return  "Damage has set its toll."
			if(1 to 25)
				return  "<span class='warning'>The corpse is almost butchered.</span>"

/obj/structure/frontierjustice/Destroy()
	var/turf/T = loc
	if(isturf(T)) // Ensure `T` is a valid turf
		var/obj/item/reagent_containers/food/snacks/rogue/meat/steak/meat_piece = new(T)
		if(meat_piece)
			meat_piece.name = "humen meat" //funny
	. = ..()

/obj/structure/frontierjustice/dead
	name = "fated as you"
	desc = "Killed off and left to rot."
	icon_state = "dead1"
	destroy_sound = 'sound/combat/dismemberment/dismem (1).ogg'

/obj/structure/frontierjustice/dead/Initialize()
	. = ..()
	icon_state = "dead1" //had to put that otherwise OG frontier justice would kill it off

/obj/structure/frontierjustice/canibalism
	name = "the meal"
	desc = "Poor victim of the greenskins or wood elven."
	icon_state = "cannibalism1"
	destroy_sound = 'sound/combat/dismemberment/dismem (1).ogg'

/obj/structure/frontierjustice/canibalism/Initialize()
	. = ..()
	icon_state = "cannibalism[rand(1,2)]"

/obj/structure/frontierjustice/canibalism/Destroy()
	var/turf/T = loc
	if(isturf(T)) // Ensure `T` is a valid turf
		var/obj/item/reagent_containers/food/snacks/rogue/meat/steak/fried/meat_piece = new(T)
		if(meat_piece)
			meat_piece.name = "cooked humen meat" //funny
			meat_piece.desc = "A slab of manflesh, slow-cooked over glowing coals."
	. = ..()

/obj/structure/frontierjustice/crossed
	name = "believer"
	desc = "If one forgot the meaning of some religious symbols, surely this will remind them."
	icon_state = "crossed1"
	destroy_sound = 'sound/foley/breaksound.ogg'

/obj/structure/frontierjustice/crossed/Initialize()
	. = ..()
	icon_state = "crossed[rand(1,3)]"

/obj/structure/frontierjustice/caged
	name = "cage"
	desc = "Better check if someone is already inside, awaiting for salvation that never came."
	icon_state = "cage1"
	destroy_sound = 'sound/combat/hits/blunt/metalblunt (2).ogg'

/obj/structure/frontierjustice/caged/Initialize()
	. = ..()
	icon_state = "cage[rand(1,3)]"

/obj/structure/frontierjustice/caged/Destroy()
	. = ..()


// =================================================================
// ========================		TURF	============================

/turf/closed/wall/mineral/rogue/stone/abyssal
	name = "abyssal ishigaki wall"
	desc = "Made from large, interlocking uncut stones without the use of mortar, so a castle is built above it. However, many make simple walls out of it."
	icon = 'icons/roguetown/kaizoku/wallset/abyssalstone.dmi'
	icon_state = "abyssabyssal"
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/stone/abyssal)
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	climbdiff = 1
	damage_deflection = 10

/turf/closed/wall/mineral/rogue/stone/abyssal/window
	name = "abyssal ishigaki window"
	desc = "An simple hole within a Ishigaki wall."
	opacity = FALSE
	max_integrity = 800

/turf/closed/wall/mineral/rogue/stone/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/stone/abyssal/window/Initialize()
	. = ..()
	icon_state = "abyssal"
	var/mutable_appearance/M = mutable_appearance(icon, "abyssalhole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/rogue/wood/abyssal
	name = "wagoya wall"
	desc = "wooden wall of abyssal architecture that uses wooden joinery that fits together seamlessly to avoid use of nails or screws, increasing protection against earthshakes."
	icon = 'icons/roguetown/kaizoku/wallset/eastern_wood.dmi'
	icon_state = "wood"
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/wood, /obj/structure/roguewindow, /obj/structure/roguetent, /turf/closed/wall/mineral/rogue/wooddark)
//	sheet_type = /obj/item/grown/log/tree/lumber
	above_floor = /turf/open/floor/rogue/woodturned
	baseturfs = list(/turf/open/floor/rogue/woodturned)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/wood/abyssal/window
	name = "wagoya no sama"
	desc = "A murderhole on a wooden wall that lacks nails and screws."
	opacity = FALSE
	max_integrity = 550

/turf/closed/wall/mineral/rogue/wood/abyssal/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/wood/abyssal/window/Initialize()
	. = ..()
	var/mutable_appearance/M = mutable_appearance(icon, "woodhole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)


// =================================================================
// ========================		TURF	============================

/*	..................   Kaizoku Sand   ................... */
/turf/open/floor/rogue/sand
	icon = 'modular/stonekeep/kaizoku/icons/tileset/tileset.dmi'
	icon_state = "sand1"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/dirtland.wav'
	neighborlay = "sandedges"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
		/turf/closed/mineral/rogue,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/grass/red,
		/turf/open/floor/rogue/grass/yel,
		/turf/open/floor/rogue/grass/cold,
		/turf/open/floor/rogue/snow,
		/turf/open/floor/rogue/snow/patchy,
		/turf/open/floor/rogue/snow/rough
	)

/turf/open/floor/rogue/sand/cardinal_smooth(adjacencies)
	// Apply custom smoothing for sand turfs
	roguesmooth(adjacencies)

/turf/open/floor/rogue/sand/Initialize()
	. = ..()
	icon_state = "sand[rand(1,4)]"

/obj/effect/decal/turfedge_neu/sand
	icon_state = "sandedge"
	icon = 'modular/stonekeep/kaizoku/icons/tileset/tileset.dmi'



// =================================================================
// ========================	STORAGE	================================

/obj/item/storage/belt/rogue/kaizoku/leather/daisho
	name = "daisho belt"
	desc = "A oil-boiled reinforced silk or leather belt used by Abyssariads for practicing Daisho."
	icon_state = "daisho"
	sellprice = 5
	icon = 'modular/stonekeep/kaizoku/icons/clothingicon/belts.dmi'
	mob_overlay_icon ='modular/stonekeep/kaizoku/icons/clothing/belts.dmi'

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/ninja/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/fogdart(src)
	new /obj/item/reagent_containers/food/snacks/fogdart(src)
	new /obj/item/rogueweapon/tetsubishi(src)

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/thunder
	name = "thunder daisho belt"
	color = CLOTHING_THUNDER

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/storm
	name = "storm daisho belt"
	color = CLOTHING_STORM

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/ocean
	name = "ocean daisho belt"
	color = CLOTHING_OCEAN

/obj/item/storage/belt/rogue/kaizoku/leather/daisho/island
	name = "island daisho belt"
	color = CLOTHING_ISLAND

/obj/item/storage/backpack/rogue/satchel/ninja/PopulateContents()
	new /obj/item/grenade/smoke_bomb(src)
	new /obj/item/grenade/smoke_bomb/poison(src)
	new /obj/item/throwing_star/ninja(src)



// =============================================================================
// ========================	SPRITE ACCESSORIES	================================

/datum/sprite_accessory/underwear/male_fundoshi
	name = "Mendoshi"
	icon_state = "male_fundoshi"
	gender = MALE
	specuse = list("abyssariad")
	roundstart = TRUE
	use_static = TRUE
	icon = 'icons/roguetown/kaizoku/clothing/underwear.dmi'

/datum/sprite_accessory/underwear/male_fundoshi/female
	name = "Femdoshi"
	icon_state = "female_fundoshi"
	gender = FEMALE
	specuse = list("abyssariad")
	roundstart = TRUE
	use_static = TRUE


//Female Kaizoku hair below.

/datum/sprite_accessory/hair/kaizoku/empress
	name = "Abyssal Empress"
	icon_state = "empress"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/onnamusha
	name = "Onnamusha"
	icon_state = "warlady"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/waterfield
	name = "Waterbearer"
	icon_state = "waterfield"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/homewaifu
	name = "Homewife"
	icon_state = "homewaifu"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/casual
	name = "Natural River"
	icon_state = "casual"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/martyr
	name = "Inhonor of the Fallen"
	icon_state = "martyr"
	gender = FEMALE
	specuse = list("abyssariad")

//Male Kaizoku hair below.

/datum/sprite_accessory/hair/kaizoku
	name = "Zamurai Manbun"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "samurai"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/ronin
	name = "Vagabond"
	icon_state = "ronin"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/freespirit
	name = "Free Spirit"
	icon_state = "freespirit"
	gender = NEUTER
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/novice
	name = "New Rice"
	icon_state = "novice"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/yakuza
	name = "Irezumi Gangster"
	icon_state = "yakuza"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/steppeman
	name = "Aridlands raider"
	icon_state = "steppeman"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/bishonen
	name = "Husband"
	icon_state = "bishonen"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/emperor
	name = "Imperial Court"
	icon_state = "emperor"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/protagonist
	name = "Historical Protagonist"
	icon_state = "hprotagonist"
	gender = NEUTER
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/protagonistalt
	name = "Longer Protagonist"
	icon_state = "alsoprotagonist"
	gender = NEUTER
	specuse = list("abyssariad")


/datum/sprite_accessory/detail
	name = ""
	icon_state = null
	gender = NEUTER
	icon = 'icons/roguetown/mob/detail.dmi'
	use_static = TRUE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "abyssariad")

/datum/sprite_accessory/detail/irezumi
	name = "Blademaster Irezumi"
	icon_state = "blademaster"
	specuse = list("human", "abyssariad") //Humens are getting irezumis due to heartfelt.

/datum/sprite_accessory/detail/irezumi/champion
	name = "Champion Irezumi"
	icon_state = "champion"

/datum/sprite_accessory/detail/irezumi/monk
	name = "Monk Irezumi"
	icon_state = "monk"

/datum/sprite_accessory/detail/irezumi/seduction
	name = "Eyes Irezumi"
	icon_state = "seduction"

/datum/sprite_accessory/detail/irezumi/seductionalt
	name = "Side-eyes Irezumi"
	icon_state = "seductionalt"

/datum/sprite_accessory/detail/irezumi/warrior
	name = "Abyss Warrior Irezumi"
	icon_state = "warrior"

//kaizoku bodyparts

/datum/sprite_accessory/tails/human/onetail
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Onetail"
	icon_state = "onetail"
	specuse = list("changeling")
	gender = NEUTER
	color_src = HAIR
	offsetti = TRUE

/datum/sprite_accessory/ears/upright
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Upright"
	icon_state = "upright"
	specuse = list("changeling")
	color_src = HAIR
	offsetti = TRUE
/*
/datum/sprite_accessory/ears/lying
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Lying"
	icon_state = "lying"
	specuse = list("changeling")
	color_src = HAIR
	offsetti = TRUE
/datum/sprite_accessory/ears/twotails
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "twotails"
	icon_state = "twotails"
	specuse = list("changeling")
	color_src = HAIR
	offsetti = TRUE
/datum/sprite_accessory/ears/threetails
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "threetails"
	icon_state = "threetails"
	specuse = list("changeling")
	color_src = HAIR
	offsetti = TRUE
*/


/datum/sprite_accessory/tails/human/tenguv //Wings DO NOT WORK, so I set it as tails. If you want to fix that, go ahead.
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "TenguV"
	icon_state = "tenguv"
	specuse = list("tengu")
	gender = NEUTER
	color_src = HAIR
	offsetti = TRUE

/datum/sprite_accessory/ears/tengus
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "TenguS"
	icon_state = "tengus"
	specuse = list("tengu")
	color_src = HAIR
	offsetti = TRUE

/datum/sprite_accessory/ears/oni
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "ogrun"
	icon_state = "oni"
	specuse = list("ogrun")
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/tails/human/oni //Yes. It's a fucking tail now, I'm bullshitting my way out of this tiefling problem until we got horns fixed.
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Onihorn"
	icon_state = "onihorn"
	specuse = list("ogrun")
	color_src = 0
	offsetti = TRUE
	gender = NEUTER

/datum/sprite_accessory/tails/human/kappav
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Kappav"
	icon_state = "kappav"
	specuse = list("undine")
	gender = NEUTER
	color_src = HAIR
	offsetti = TRUE

/datum/sprite_accessory/ears/kappae
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Kappae"
	icon_state = "kappae"
	specuse = list("undine")
	color_src = SKINCOLOR
	offsetti = TRUE



// =================================================================
// ========================		CRAFTING	========================


//Kaizoku Smithing content. I humbly ask for help; A way in which only people with the trait "Kaizoku", being the ones able to make Kaizoku weapons and armor. In another hand,
//they cannot make most (exceptions; the objects that have no abyssariad alternative) armors and weapons.

//'armor'
/datum/anvil_recipe/armor/nanbando
	name = "Barbarian half-plate (3)"
	recipe_name = "a Nanban-Dou-Sode"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/nanbando
	craftdiff = 3

/datum/anvil_recipe/armor/nanbandocuirass
	name = "Barbarian Cuirass"
	recipe_name = "a Nanban-Dou"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass/nanbando
	craftdiff = 2

/datum/anvil_recipe/armor/nanbandofull
	name = "Barbarian Fullplate (4)"
	recipe_name = "a Nanban-Do-Gusoku"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full/nanbando
	craftdiff = 4

/datum/anvil_recipe/armor/steeltatami
	name = "Steel foldeable armor"
	recipe_name = "a Lamellae Tatami-Do"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
	craftdiff = 2

// huh. We can make these uniquely then. Since we can't make the iron chainmail for the european counterparts?... why?
/datum/anvil_recipe/armor/irontatami
	name = "Iron foldeable armor"
	recipe_name = "a Tatami Karuta-Gane"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
	craftdiff = 2
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/kusari
	name = "Chainmail Robe (2)"
	recipe_name = "a Kusari-Katabira"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
	craftdiff = 3

/datum/anvil_recipe/armor/imirror
	name = "Iron disk chestplate (3)"
	recipe_name = "a Iron Mirror Armor"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
	craftdiff = 1

/datum/anvil_recipe/armor/mirror
	name = "Steel disk chestplate (3)"
	recipe_name = "a Steel Mirror Armor"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/mirror
	craftdiff = 3

/datum/anvil_recipe/armor/oyoroi
	name = "Compact great armor (3) (c)"
	recipe_name = "a Incomplete O-Yoroi"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi
	craftdiff = 3

/datum/anvil_recipe/armor/oyoroigusoku //costier version. Only really viable if you got what to waste.
	name = "Full great armor (4) (2c)"
	recipe_name = "a O-Yoroi Gusoku"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku
	craftdiff = 3

/datum/anvil_recipe/armor/sanmaido
	name = "Three-plate cuirass"
	recipe_name = "a Sanmai-Do"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass/sanmaido
	craftdiff = 2

/datum/anvil_recipe/armor/kikko
	name = "Turtleshell leather armor (2h)"
	recipe_name = "a Kikko Leather Do"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded/kikko
	craftdiff = 1
//cheaper on iron, but has many sticks. Proper for this armor's context.
/datum/anvil_recipe/armor/rattanarmor
	name = "Iron-woven Rattan armor (2) (4s)"
	recipe_name = "a Rattan Armor"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/rattan
	craftdiff = 1

/datum/anvil_recipe/armor/kikkoarmor //cheaper brigadine with hide.
	name = "Turtleshell Full Armor (2) (2h)"
	recipe_name = "a Kikko Gusoku"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/abyssariad
	craftdiff = 3

//'feet'
/datum/anvil_recipe/armor/kusaritabi
	name = "Chainmail footwear x2"
	recipe_name = "a pair of Kusari-Tabi"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/suneate
	name = "Plated shin-guards"
	recipe_name = "some Suneate Footwear"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/suneate
	craftdiff = 3

//'gloves'
/datum/anvil_recipe/armor/kikkotekko
	name = "Turtleshell gauntlets x2"
	recipe_name = "a pair of Steel Kikko Tekko"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/chain/kikko
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/ikikkotekko
	name = "Turtleshell gauntlets x2"
	recipe_name = "a pair of Iron Kikko Tekko"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/gloves/roguetown/chain/iron/kikko
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/lamellaetekko
	name = "Lamellae gauntlets"
	recipe_name = "some Lamellae Tekko"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/plate/lamellaetekko
	craftdiff = 3

//'hats'
/datum/anvil_recipe/armor/hachigane
	name = "Hachigane x2"
	recipe_name = "a pair of Hachinage"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/rattanhelmet
	name = "Iron Woven Rattan Helmet x2 (3s)"
	recipe_name = "a pair of Rattan Helmets"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap/rattan
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	createmultiple = TRUE
	createditem_num = 1

/obj/item/clothing/head/roguetown/helmet/visored/abyssalchampion
/datum/anvil_recipe/armor/abyssalchampion
	name = "Newfangled Myrmidon Helmet (3)"
	recipe_name = "a Abyssal Champion Helmet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/abyssalchampion)
	craftdiff = 4

/datum/anvil_recipe/armor/helmetbuc
	name = "Sohei Heavy Headwear"
	recipe_name = "a Armored sohei cowl"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/bucket/soheidemon)
	craftdiff = 2

/datum/anvil_recipe/armor/zunari
	name = "Zamurai's helmet (2)"
	recipe_name = "a Zunari's Helmet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/zunari)
	craftdiff = 3

/datum/anvil_recipe/armor/zijinguan
	name = "Plumed Footsoldier helmet x2"
	recipe_name = "a pair of Zijinguan helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/zijinguan
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/jingasa
	name = "Conical Ashigaru helmet x2"
	recipe_name = "a pair of Jingasas"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/jingasa
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/toseikabuto
	name = "Tosei-kabuto"
	recipe_name = "a Tosei Kabuto"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/sallet/tosei_kabuto
	craftdiff = 2

/datum/anvil_recipe/armor/toseikabutov
	name = "Visored tosei-kabuto (2)"
	recipe_name = "a Visored Tosei Kabuto"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto)
	craftdiff = 3

//'mask'
/datum/anvil_recipe/armor/imenpo
	name = "Iron faceguard"
	recipe_name = "a Iron Menpo"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/kaizoku/menpo
	craftdiff = 0

/datum/anvil_recipe/armor/himenpo
	name = "Iron half-faceguard x2"
	recipe_name = "a pair of Compact Menpo"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/kaizoku/menpo/half
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/smenpo
	name = "Steel faceguard"
	recipe_name = "a Steel Menpo"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/steel/half)
	craftdiff = 2

/datum/anvil_recipe/armor/hsmenpo
	name = "Steel half-faceguard x2"
	recipe_name = "a Face Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/steel)
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/itribalfish
	name = "Iron fishpeople mask x2"
	recipe_name = "a pair of iron Merkkin masks"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/kaizoku/menpo/facemask
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/stribalfish
	name = "Steel fishpeople mask"
	recipe_name = "a Steel Merkkin Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/steel)
	craftdiff = 2

/datum/anvil_recipe/armor/ctengu
	name = "Birdpeople champion mask"
	recipe_name = "a Skylancer Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/tengu)
	craftdiff = 2

/datum/anvil_recipe/armor/ckitsune
	name = "Foxpeople champion mask"
	recipe_name = "a Changeling Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/kitsune)
	craftdiff = 2

/datum/anvil_recipe/armor/coni
	name = "Ogrepeople champion mask"
	recipe_name = "a ogrun Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/facemask/steel)
	craftdiff = 2

//'neck'
/datum/anvil_recipe/armor/shood
	name = "Karuta hood x2"
	recipe_name = "a pair of Karuta Zukin"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/ihood
	name = "Chainmail hood x2"
	recipe_name = "a pair of Kusari Zukin"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

//'pants'
/datum/anvil_recipe/armor/ihaidate
	name = "Foldable Thighguards x2"
	recipe_name = "a pair of Haidate Tatami"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/under/roguetown/chainlegs/iron/haidate_tatami
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/shaidate
	name = "Plate Thighguards x2"
	recipe_name = "a pair of Chain Chausses"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs/sendan
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/superhaidate
	name = "Plated Trousers x2"
	recipe_name = "a couple of Yoroi-Hakama"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/platelegs/yoroihakama
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

//'wrists'
/datum/anvil_recipe/armor/kote //Protects more limbs, so it is costier.
	name = "Armored Sleeve"
	recipe_name = "a couple of Kote"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers/kote
	craftdiff = 4

/datum/anvil_recipe/armor/weeper
	name = "Weeper Bracers x2"
	recipe_name = "a couple of Weeping Bracers"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers/mountainstar
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3



//Kaizoku Smithing content. I humbly ask for help; A way in which only people with the trait "Kaizoku", being the ones able to make Kaizoku weapons and armor. In another hand,
//they cannot make most (exceptions; the objects that have no abyssariad alternative) armors and weapons.

/datum/anvil_recipe/weapons/sword_steel
	name = "Uchigatana zatana"
	recipe_name = "a Uchigatana"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/uchigatana
	craftdiff = 2

/datum/anvil_recipe/weapons/odachi
	name = "Odachi zatana (3)"
	recipe_name = "a Odachi"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/greatsword/odachi
	craftdiff = 4

/datum/anvil_recipe/weapons/tachi
	name = "Tachi zatana (2)"
	recipe_name = "a Tachi"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/tachi
	craftdiff = 3

/datum/anvil_recipe/weapons/jiansword
	name = "Jian sword"
	recipe_name = "a Jian sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/jian

/datum/anvil_recipe/weapons/daosword
	name = "Dao sword"
	recipe_name = "a Dao Sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/scimitar/messer/dao

/datum/anvil_recipe/weapons/yuntoudao
	name = "Yuntoudao"
	recipe_name = "a willow-shaped sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/scimitar/falchion/yuntoudao
	craftdiff = 2

/datum/anvil_recipe/weapons/shortjian
	name = "Short Jian"
	recipe_name = "a Short Jian"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short/jian
	craftdiff = 1

/datum/anvil_recipe/weapons/wakizashi
	name = "Wakisashi Zatana"
	recipe_name = "a Wakizashi"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short/wakizashi
	craftdiff = 1

/datum/anvil_recipe/weapons/piandao
	name = "Piandao"
	recipe_name = "a Piandao"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre/piandao
	craftdiff = 2

/datum/anvil_recipe/weapons/decpiandao
	name = "Decorated piandao (+g)"
	recipe_name = "a Decorated Piandao"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/sabre/piandao/dec
	craftdiff = 3

/datum/anvil_recipe/weapons/kanabo
	name = "Iron Kanabo Warclub (+w)"
	recipe_name = "a Iron kanabo"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/kanabo
	craftdiff = 2

/datum/anvil_recipe/weapons/tetsubo
	name = "Steel Tetsubo Warclub (+w)"
	recipe_name = "a Steel Tetsubo"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/steel/tetsubo
	craftdiff = 3

/datum/anvil_recipe/weapons/iararebo
	name = "Iron ararebo club (+s)"
	recipe_name = "a Iron Ararebo Club"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/ararebo

/datum/anvil_recipe/weapons/sararebo
	name = "Steel Ararebo club (2)"
	recipe_name = "a Steel Ararebo "
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/steel/ararebo
	craftdiff = 2

/datum/anvil_recipe/weapons/kusarifundo
	name = "Kusarifundo (+c) (+s)"
	recipe_name = "a Kusarifundo"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/flail/sflail/kusarifundo
	craftdiff = 2

/datum/anvil_recipe/weapons/kunai
	name = "Kunai"
	recipe_name = "a Kunai"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife/kunai
	craftdiff = 1

/datum/anvil_recipe/weapons/tanto
	name = "Tanto smallsword x2"
	recipe_name = "a couple Tantos"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/steel/tanto
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/weapons/kaiken
	name = "Kaiken knife x2"
	recipe_name = "a couple Daggers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/knife/kaiken
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

/datum/anvil_recipe/weapons/sai //not made of iron. Still Less damage tho.
	name = "Sai x2"
	recipe_name = "a couple of Sai"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/knife/hunting/sai
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

/datum/anvil_recipe/weapons/yari
	name = "yari x2 (+w)"
	recipe_name = "a couple Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear/yari
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/katakama
	name = "Katakama Yari x2 (+w) (+i)"
	recipe_name = "a couple Spears"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small, /obj/item/ingot/iron)
	created_item = /obj/item/rogueweapon/polearm/spear/yari/katakama

/datum/anvil_recipe/weapons/jumonji
	name = "Jumonji Yari (+w)"
	recipe_name = "a Jumonji Yari"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/spear/billhook/jumonji
	craftdiff = 3

/datum/anvil_recipe/weapons/naginata
	name = "Traditional Naginata (2) (+w)"
	recipe_name = "a Naginata"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche/naginata
	craftdiff = 2

/datum/anvil_recipe/weapons/tsukushi
	name = "Tsukushi Naginata x2 (2) (+w)"
	recipe_name = "a couple of Massproduced Naginata"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/halberd/bardiche/naginata/tsukushi
	craftdiff = 1
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/weapons/bisento
	name = "Bisento (3) (+w)"
	recipe_name = "a Bisento"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small,/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/polearm/halberd/bisento
	craftdiff = 5

/datum/anvil_recipe/weapons/onobattle
	name = "Ono Battle Axe (2)"
	recipe_name = "a Ono Battle Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/battle/ono
	craftdiff = 3

/datum/anvil_recipe/weapons/changfu
	name = "changfu woodcutter (+s)"
	recipe_name = "an Chang-fu"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/woodcut/changfu

//Unique few
/datum/anvil_recipe/weapons/jitte
	name = "Jitte Cudgel"
	recipe_name = "an Jitte"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/mace/cudgel/jitte

/datum/anvil_recipe/weapons/otsuchi
	name = "Otsuchi warhammer (+l)"
	recipe_name = "a Otsuchi Warhammer"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/otsuchi

/datum/anvil_recipe/weapons/kusarigama
	name = "Kusarigama (+c) (+s)"
	recipe_name = "a Kusarigama"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/flail/kusarigama

/datum/anvil_recipe/weapons/mancatcher
	name = "Mancatchers x2 (+w)"
	recipe_name = "a couple Mancatchers"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/polearm/mancatcher
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/onothrow
	name = "Ono throwing axe (2)"
	recipe_name = "a Ono Throwing Axe"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/thrown/ono
	craftdiff = 3

/datum/anvil_recipe/weapons/tetsubishi
	name = "tetsubishi caltrop (2)"
	recipe_name = "a Tetsubishi"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/tetsubishi
	craftdiff = 2

/datum/anvil_recipe/weapons/kama
	name = "Kama sickle (2)"
	recipe_name = "a Warsickle"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sickle/kama
	craftdiff = 2






/obj/effect/proc_holder/spell/invoked/lesser_heal/abyssal //for now just an abyssal version of the same spell, just with a different sprite. Placeholder.
	name = "Lesser Miracle"
	overlay_state = "purification"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "spell0"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'

/obj/effect/proc_holder/spell/invoked/icebind
	name = "Barotrauma Bind" //People faithful to Abyssor will instantly be released from this spell.
	overlay_state = "waternet"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	chargedrain = 5
	releasedrain = 30
	charge_max = 50 SECONDS
	range = 8
	warnie = "aimwarn"
	movement_interrupt = FALSE
	sound = 'sound/magic/magic_nulled.ogg'
	action_icon_state = "spell0"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 60 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/abyssanctum)
	devotion_cost = 45

/turf/open/proc/apply_ice_turf()
	var/prev_icon_state = icon_state //that code saves the original attributes of the turf to avoid a black void.
	icon_state = "ice"
	density = FALSE
	MakeSlippery(TURF_WET_PERMAFROST, min_wet_time = 100, wet_time_to_add = 5)
	spawn(100)
		if(icon_state == "ice")
			icon_state = prev_icon_state
			density = initial(density)

/obj/effect/proc_holder/spell/invoked/icebind/cast(list/targets, mob/living/user)
	if(!targets.len || !targets[1])
		to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
		return FALSE
	var/target = targets[1]

	if(isliving(target))
		var/mob/living/target_mob = target
		if(!target_mob.has_status_effect(/datum/status_effect/abyssaltomb))
			target_mob.apply_status_effect(/datum/status_effect/abyssaltomb)
			target_mob.visible_message("<span class='warning'>[target_mob] is sealed within a crystalline abyssal tomb!</span>")
		else
			to_chat(user, span_warning("<span class='userdanger'>Your target is already immobilized within a frigid tomb from the ocean!</span>"))
		return TRUE

	if(isturf(target))
		var/turf/open/T = target
		if(!isclosedturf(T))
			T.apply_ice_turf()
			to_chat(user, "<span class='warning'>Without a target, the ground becomes victim of the abyssal oppression.</span>")
			return TRUE
		else
			to_chat(user, "<span class='warning'>There is no space for a proper icespyre or cold to be settled.</span>")
			return FALSE

	to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
	return FALSE

/datum/status_effect/abyssaltomb/on_apply()
	tomb = new /obj/structure/abyssaltomb(get_turf(owner)) // Create the ice tomb, THEN move the victim inside
	tomb.encased_mob = owner
	if(istype(owner, /mob/living/carbon/human))
		tomb.buckle_mob(owner, TRUE, check_loc = FALSE)
		if(owner.patron && owner.patron.type == /datum/patron/divine/abyssor)
			to_chat(src, "<span class='debug'>Abyssor follower = no processing..</span>")
			tomb.processing = FALSE
		else
			to_chat(src, "<span class='debug'>Unbased person that don't follow abyssor, start to purify their ass.</span>")
			START_PROCESSING(SSobj, tomb) // Processing for non-Abyssor followers
	owner.forceMove(tomb) // Move the owner inside the tomb
	tomb.max_integrity = 300
	tomb.density = TRUE
	owner.visible_message("<span class='warning'>[owner] is encased in a crystalline tomb of ice.</span>")
	return ..()

/datum/status_effect/abyssaltomb/on_remove()
	if(tomb)
		tomb.unbuckle_all_mobs() //Avoid Qdelling the mob
		qdel(tomb)
	tomb = null
	return ..()

/obj/structure/abyssaltomb
	name = "abyssal tomb"
	desc = "A solid block of ice encasing a victim inside a pocket dimension deep on the ocean. One requires to break the coffin to be released from such depths."
	icon = 'modular/stonekeep/kaizoku/icons/misc/freezesprite.dmi'
	icon_state = "icespyre"
	density = TRUE
	max_integrity = 150
	buckle_lying = 0
	buckle_prevents_pull = 1
	layer = FLY_LAYER
	var/processing = TRUE
	var/last_attack
	var/mob/living/carbon/human/encased_mob

/obj/structure/abyssaltomb/Destroy()
	for(var/atom/movable/M in contents)
		M.forceMove(loc)
	if(encased_mob) // Use the linked mob reference
		encased_mob.remove_status_effect(/datum/status_effect/abyssaltomb)
	playsound(src, 'sound/combat/hits/onglass/glassbreak (2).ogg', 50, TRUE)
	return ..()

/obj/structure/abyssaltomb/process()
	to_chat(src, "<span class='debug'>Abyssal Tomb is processing properly.</span>")
	if(!has_buckled_mobs()) // If there are no mobs buckled, delete the tomb
		to_chat(src, "<span class='debug'>No buckled mobs found, deleting tomb.</span>")
		qdel(src)
		return
	for(var/mob/living/L in buckled_mobs)
		if(!iscarbon(L) || L.buckled != src)
			to_chat(src, "<span class='debug'>Invalid buckled mob detected, skipping.</span>")
			continue
		if(!last_attack) // Time tracking for damaging the buckled person
			last_attack = world.time
		var/barotrauma = 50 // 5 seconds for each
		if(world.time >= last_attack + barotrauma) // Pressure damage after enough time has passed
			last_attack = world.time
			src.visible_message("<span class='danger'>[src]'s crushing pressure squeezes [L] mercilessly!</span>")
			L.flash_fullscreen("whiteflash3")
			L.adjustBruteLoss(rand(10, 30))
			playsound(src, pick('modular/stonekeep/kaizoku/sound/spells/abyssalpressure.ogg','modular/stonekeep/kaizoku/sound/spells/abyssalpressure1.ogg','modular/stonekeep/kaizoku/sound/spells/abyssalpressure2.ogg'), 100, FALSE)
		if(L.stat == DEAD)
			src.visible_message("<span class='danger'>[L]'s squeezed body is now released after death.</span>")
			qdel(src)

/obj/structure/abyssaltomb/user_unbuckle_mob(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(obj_broken)
		..()
		return

	if(isliving(user))
		var/mob/living/L = user
		var/willpower = CLAMP((L.STAINT * 2 - 10), 1, 99)
		var/barotrauma_roll = rand(1, 100)
		to_chat(user, "<span class='debug'>DEBUG: willpower=[willpower], barotrauma_roll=[barotrauma_roll]; To be released, have more Willpower than Barotrauma</span>")

		if(processing == FALSE)
			to_chat(M, "<span class='info'>[M]'s purified body quickly breaks away from the abyssal tomb.</span>")
			M.remove_status_effect(/datum/status_effect/abyssaltomb)
			qdel(src)
			return

		user.changeNext_move(CLICK_CD_RAPID)
		if(user != M)
			if(barotrauma_roll <= willpower) //Freeing someone else.
				to_chat(user, "<span class='info'>Your body warmth releases [M]'s from the pocket dimension.</span>")
				to_chat(M, "<span class='info'>You feel [user]'s warmth as light comes over to your eyes.</span>")
				M.remove_status_effect(/datum/status_effect/abyssaltomb)
				if(processing == TRUE)
					STOP_PROCESSING(SSobj, src)
				qdel(src)
			else
				to_chat(user, "<span class='danger'>You try to free [M], but you hand ricochets.</span>")
				to_chat(M, "<span class='info'>[user] attempts to free you, but your world spins instead.</span>")
				M.Stun(40)
				shake_camera(M, 15, 1)
			return

		if(barotrauma_roll <= willpower) // Freeing themselves
			to_chat(M, "<span class='info'>You push the pressure towards itself, finally released from its grasp.</span>")
			src.visible_message("<span class='info'>[M] manages to break down the abyssal tomb!</span>")
			M.remove_status_effect(/datum/status_effect/abyssaltomb)
			if(processing == TRUE)
				STOP_PROCESSING(SSobj, src)
			qdel(src)
		else
			to_chat(user, "<span class='warning'>You struggle to break free of the tomb, but remain trapped.</span>")
			user.Stun(40)
			shake_camera(user, 15, 1)

///Purification///

/obj/effect/proc_holder/spell/invoked/projectile/purify
	name = "Purifying filter"
	overlay_state = "icespike"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "spell0"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	releasedrain = 50
	chargetime = 30
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	projectile_type = /obj/projectile/magic/purify
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/abyssanctum)
	sound = 'sound/magic/magic_nulled.ogg'
	invocation_type = "none"
	//invocation = "delivers sharp jabs and a sudden clap, unleashing a freezing shockwave that forms and launches a jagged ice spike."

	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	devotion_cost = -45

/obj/projectile/magic/purify
	name = "purification"
	icon_state = "icespikeproj"
	icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	paralyze = 50
	damage = 0
	range = 7
	hitsound = 'sound/blank.ogg'
	nondirectional_sprite = TRUE
	impact_effect_type = /obj/effect/temp_visual/icespikeproj_projectile_impact //See if we can set it to be a projectile if CMODE, and a invocation if !CMODE

/obj/effect/temp_visual/icespikeproj_projectile_impact
	name = "purifying spike"
	icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	icon_state = "icespikeproj_break"
	layer = ABOVE_ALL_MOB_LAYER
	duration = 3

/obj/projectile/magic/purify/on_hit(atom/target, mob/living/user, blocked = FALSE)
	..()
	var/mob/living/carbon/C = target
	if(iscarbon(target))
		if(C.mob_biotypes & MOB_SPIRIT) // Abyssor's purifying filter absolutely destroys demonic essence.
			C.visible_message("<span class='info'>An otherworldly divine freeze encircles [target], filtering out their very existence!</span>", "<span class='notice'>My breath shallows- my ears rings, my senses overwhelmed with the crushing grip! I'M GOING TO IMPLODE FROM INSIDE OUT! PLEASE MERCY!</span>")
			C.adjustFireLoss(rand(50, 100)) //Random damage between 50 and 100. Very brutal, and proper for killing demons. Cold damage will come together with it after.
			C.Knockdown(40) //Purification successful. You will be paralyzed.
			C.Paralyze(1)
			C.apply_status_effect(/datum/status_effect/debuff/freezing/severe)
			C.flash_fullscreen("whiteflash3")
			return
		if((C.faction = "orcs") || (C.dna.species?.id == "tiefling") ||(HAS_TRAIT(C, TRAIT_NASTY_EATER ))) // Had to give them these ones because there's a bunch of different goblin IDs. So Trait will have to stay until I care about giving each a respective var.
			C.visible_message("<span class='danger'>[target]'s body is distorced by the crushing force of the abyssal waters!</span>", "<span class='userdanger'>I feel the suffocating pressure of the deep crushing my lungs!</span>")
			C.adjustFireLoss(rand(30, 50)) // 30 to 50 damage, less than full demons. More damage comes from freezing.
			C.Knockdown(20) //Purification successful. You will be paralyzed.
			C.Paralyze(1) // Creatures with demon essence from Apotheosis war gets the second end of the stick.
			C.apply_status_effect(/datum/status_effect/debuff/freezing/severe)
			C.flash_fullscreen("whiteflash3")
			return
		if(C.dna.species?.id == "abyssariad"||C.dna.species?.id == "aasimar") //Barely does anything to "Pure" creatures. This proves their 'divinity' and purity ingame.
			C.visible_message("<span class='danger'>[target]'s body shivers slightly, yet remains sturdy.</span>", "<span class='userdanger'>A cold travel down my spine, yet I feel little to no pain.</span>")
			C.adjustBruteLoss(rand(5, 15)) // 10 to 15 damage. Don't even bother attacking these. They will not be frozen either.
			return
		else //Does not paralyze.
			C.visible_message("<span class='danger'>[target]'s body is being crushed!</span>", "<span class='userdanger'>I feel a suffocating pressure building on my body!</span>")
			C.adjustFireLoss(rand(20, 35)) //Normal creatures will still suffer the effects of Barotrauma, yet less in terms of damage. Will still freeze.
			C.apply_status_effect(/datum/status_effect/debuff/freezing)
			C.flash_fullscreen("whiteflash3")
			return

////////NOT FINISHED YET//////////

/*
/obj/effect/proc_holder/spell/invoked/elemental //chooses attackable people by clicking on them.
	name = "Ice elemental"
	overlay_state = "waterspirit"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	releasedrain = 30
	chargedrain = 4
	chargetime = 5
	range = 8
	warnie = "aimwarn"
	movement_interrupt = FALSE
	sound = 'modular/stonekeep/kaizoku/sound/spells/martialart_abyssanctum.ogg'
	action_icon_state = "spell0"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	invocation_type = "emote"
	invocation = "punches and spins, unleashing a surge of freezing energy."
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	charge_max = 10 SECONDS



/obj/effect/proc_holder/spell/invoked/icebind/cast(list/targets, mob/living/user)
	if(!targets.len || !targets[1])
		to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
		return FALSE

	var/target = targets[1]

	if(isliving(target))
		var/mob/living/target_mob = target
		if(!target_mob.has_status_effect(/datum/status_effect/frozentomb))
			target_mob.apply_status_effect(/datum/status_effect/frozentomb)


/obj/effect/proc_holder/spell/invoked/icebind/cast(list/targets, mob/living/user, mob/living/carbon/human/H)
	if(!targets.len || !targets[1])
		to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
		return FALSE

	var/mob/living/target = targets[1]
	if(target.stat < DEAD)
		to_chat(user, "<span class='warning'>Nothing happens.</span>")
		return FALSE
	if(target != user)
		target.faction = "enemy" // You're targeted to DIE
		return TRUE

	if(isturf(target))
		var/turf/open/T = target
		if(!isclosedturf(T))
			new /mob/living/simple_animal/retaliate/purifier(target)
			to_chat(user, "<span class='warning'>You create an elemental to do your bidding.</span>")
			return FALSE
		else
			to_chat(user, "<span class='warning'>You cannot mark someone for purification or create an elemental here.</span>")
			return FALSE

/mob/living/simple_animal/retaliate/purifier
	name = "Abyssal Elemental"
	desc = "A creature which the presence damages "
	health = 300
	maxHealth = 300
	icon = 'modular/stonekeep/kaizoku/icons/misc/waterspirit.dmi'
	icon_state = "waterspirit"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	movement_type = GROUND
	speak_emote = list("roars")
	wander = TRUE
	del_on_death = TRUE
	deathmessage = "falls to the ground, decaying into glowing particles."
	deathsound = "bodyfall"
	footstep_type = FOOTSTEP_MOB_HEAVY
	turns_per_move = 3
	STACON = 15
	STASTR = 11
	STASPD = 12
	var/list/currently_affected = list()
	var/ticks_to_next_process = 3

/mob/living/simple_animal/retaliate/purifier/process()
	if(stat)
		return
	var/list/affected = hearers(7, src)
	var/to_fire = 5
	for(var/mob/living/A in affected)
		if(istype(A, /mob/living/carbon/human/species))
			if(A.stat != DEAD)
				A.adjustBruteLoss(rand(2,10))
				if(!--to_fire)
					return
		else if(istype(A, /mob/living/simple_animal/hostile))
			if(A.stat != DEAD)
				A.adjustBruteLoss(rand(2,10))
				if(!--to_fire)
					return

*/
//experimental



/obj/item/rogue/instrument/shamisen //I know shamisen should be used while sitting/on knees. butt you think bards really need to be SITTING during battle?
	name = "shamisen"
	desc = "shamisen, or just 'three-stings' is a abyssariad puckled stringed musical instrument, usually played using a Bachi."
	icon = 'modular/stonekeep/kaizoku/icons/misc/music.dmi'
	icon_state = "shamisen"
	lefthand_file = 'modular/stonekeep/kaizoku/icons/misc/lefthand_music.dmi'
	righthand_file = 'modular/stonekeep/kaizoku/icons/misc/righthand_music.dmi'
	song_list = list(
	"Cursed Apple" = 'modular/stonekeep/kaizoku/sound/instrument/shamisen1.ogg', //Credit; "Bad Apple by しゃみお - Shamisen player Shamio"
	"Fire Dance" = 'modular/stonekeep/kaizoku/sound/instrument/shamisen2.ogg', //Credit; "Fire Dance by しゃみお - Shamisen player Shamio"
	"Lute" = 'modular/stonekeep/kaizoku/sound/instrument/shamisen3.ogg', //Credit; "Lute (shamisen) by Museum of Fine Arts, Boston"
	"Tsugaru Ripple" = 'modular/stonekeep/kaizoku/sound/instrument/shamisen4.ogg', //Credit; "Tsugaru Shamisen (using Ripple) by Shamisen Komatsuya"
	"Tsugaru" = 'modular/stonekeep/kaizoku/sound/instrument/shamisen5.ogg', //Credit; "Tsugaru Shamisen by Roger Walch"
	"Season" = 'modular/stonekeep/kaizoku/sound/instrument/shamisen6.ogg', //Credit; "相棒 Season 遊郭編しゃみお - Shamisen player Shamio"
	"Parade" = 'modular/stonekeep/kaizoku/sound/instrument/shamisen7.ogg', //Credit; "「雨天PARADE」三味線オリジナル曲 - しゃみお - Shamisen player Shamio"
	"Koshiro" = 'modular/stonekeep/kaizoku/sound/instrument/shamisen8.ogg' //Credit; “KOSHIRO” -幸四郎- by SENZO"
	)


/obj/item/neuFarm/seed/rice
	seed_identity = "rice seeds"
	plant_def_type = /datum/plant_def/rice


/obj/item/reagent_containers/food/snacks/produce/rice
	seed = /obj/item/neuFarm/seed/rice
	name = "weeperstears"
	desc = "Weeperstears, or 'Rice', is the abyssariad's staple food. It is believed that the plants came from the tears of Weeping God."
	icon_state = "rice"
	icon = 'modular/stonekeep/kaizoku/icons/items/produce.dmi'
	gender = PLURAL
	filling_color = "#e0baa0"
	bitesize_mod = 2
	foodtype = GRAIN
	tastes = list("slightly nutty" = 1)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/sake
	distill_amt = 24
	grind_results = list(/datum/reagent/floure = 10) //rice flour
	dropshrink = 0.9
	mill_result = /obj/item/reagent_containers/powder/flour
/obj/item/reagent_containers/food/snacks/produce/rice/examine(mob/user)
	var/farminglvl = user.mind?.get_skill_level(/datum/skill/labor/farming)
	. += ..()
	if(farminglvl >= 0)
		. += "I can easily tell that these are weeperstears grains."




/obj/item/reagent_containers/food/snacks/fogdart
	name = "fogdart frog"
	desc = "the Abyssariad tree frog capable of living in a variety of habitats on Fog Islands, but is more well know for their sleep-inducing glands. It has enough for five projectiles."
	icon_state = "fogfrog"
	icon = 'icons/roguetown/kaizoku/mobs/fogfrog.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/fogblight = 25)
	verb_say = "croaks"
	verb_yell = "croaks"
	foodtype = RAW
	obj_flags = CAN_BE_HIT
	var/dead = FALSE
	eat_effect = /datum/status_effect/debuff/uncookedfood
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/friedfrog
	max_integrity = 10
	sellprice = 0
	rotprocess = null

/obj/item/reagent_containers/food/snacks/fogdart/onbite(mob/living/carbon/human/user)
	if(loc == user)
		if(user.mind && user.mind.has_antag_datum(/datum/antagonist/vampirelord))
			if(dead)
				to_chat(user, "<span class='warning'>It's dead.</span>")
				return
			var/datum/antagonist/vampirelord/VD = user.mind.has_antag_datum(/datum/antagonist/vampirelord)
			if(do_after(user, 30, target = src))
				user.visible_message("<span class='warning'>[user] drinks from [src]!</span>",\
				"<span class='warning'>I drink from [src]!</span>")
				playsound(user.loc, 'sound/misc/drink_blood.ogg', 100, FALSE, -4)
				VD.handle_vitae(50)
				dead = TRUE
				playsound(get_turf(user), 'sound/vo/mobs/rat/rat_death.ogg', 100, FALSE, -1)
				icon_state = "srat1"
				rotprocess = SHELFLIFE_SHORT
				var/mob/living/carbon/V = user
				V.add_stress(/datum/stressevent/drankrat)
			return
	return ..()

/obj/item/reagent_containers/food/snacks/rogue/friedfrog
	name = "fried frog"
	desc = "are you sure you are going to eat this?"
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "fogfrog_cooked"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/fogblight = 10) //heat denaturalized the poison, so it is less harmful. Still bad.
	tastes = list("stupid decisions" = 1)
	w_class = WEIGHT_CLASS_TINY
	eat_effect = null
	rotprocess = SHELFLIFE_SHORT
	sellprice = 0

/obj/item/reagent_containers/food/snacks/fogdart/burning(input as num)
	if(!dead)
		if(burning >= burntime)
			dead = TRUE
			playsound(src, 'sound/vo/mobs/rat/rat_death.ogg', 100, FALSE, -1)
			icon_state = "fogfrog_fried"
			rotprocess = SHELFLIFE_SHORT
	. = ..()

/obj/item/reagent_containers/food/snacks/fogdart/Crossed(mob/living/L)
	. = ..()
	if(L)
		if(!dead)
			if(isturf(loc))
				dir = pick(GLOB.cardinals)
				step(src, dir)
//				playsound(src, pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg'), 100, TRUE, -1)

/obj/item/reagent_containers/food/snacks/fogdart/dead
	icon_state = "fogfrog_dead"
	dead = TRUE
	rotprocess = SHELFLIFE_SHORT

/obj/item/reagent_containers/food/snacks/fogdart/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	if(dead)
		icon_state = "fogfrog_dead"
		rotprocess = SHELFLIFE_SHORT

/obj/item/reagent_containers/food/snacks/fogdart/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	user.changeNext_move(CLICK_CD_MELEE)
	if(dead)
		..()
	else
		if(!isturf(loc))
			if(isliving(user))
				var/mob/living/L = user
				if(prob(L.STASPD * 1.5))
					..()
				else
					dir = pick(GLOB.cardinals)
					step(src, dir)
					to_chat(user, "<span class='warning'>I managed to grab it, but it slides away!</span>")
					playsound(src, pick('sound/vo/general/undinecall.ogg','sound/vo/general/undinecall1.ogg','sound/vo/general/undinecall2.ogg'), 100, TRUE, -1)
					return
	..()

/obj/item/reagent_containers/food/snacks/fogdart/process()
	..()
	if(dead)
		return
	if(!isturf(loc)) //no floating out of bags
		return
	if(prob(5))
		playsound(src, pick('sound/vo/general/undinecall3.ogg','sound/vo/general/undinecall4.ogg','sound/vo/general/undinecall5.ogg'), 100, TRUE, -1)
	if(prob(75) && !dead)
		dir = pick(GLOB.cardinals)
		step(src, dir)

/obj/item/reagent_containers/food/snacks/fogdart/obj_destruction(damage_flag)
	//..()
	if(!dead)
		new /obj/item/reagent_containers/food/snacks/fogdart/dead(src)
		playsound(src, 'sound/vo/general/undinecall6.ogg', 100, FALSE, -1)
		qdel(src)
		return 1
	. = ..()

/obj/item/reagent_containers/food/snacks/fogdart/attackby(obj/item/I, mob/user, params)
	if(!dead)
		if(isliving(user))
			var/mob/living/L = user
			if(prob(L.STASPD * 2))
				..()
			else
				if(isturf(loc))
					dir = pick(GLOB.cardinals)
					step(src, dir)
					to_chat(user, "<span class='warning'>The vermin dodges my attack.</span>")
					playsound(src, pick('sound/vo/general/undinecall.ogg','sound/vo/general/undinecall1.ogg','sound/vo/general/undinecall2.ogg'), 100, TRUE, -1)
					return
	..()

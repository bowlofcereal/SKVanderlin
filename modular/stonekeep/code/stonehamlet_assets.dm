/*	*	*	*	*	*
*					*
*	Stone Hamlet	*
*					*
*	*	*	*	*	*/


// ============================		LANDMARKS	================================

/*	..................   Dwarf Outpost   ................... */
/obj/effect/landmark/map_load_mark/dwarf_outpost
	name = "Dwarf Outpost"
	templates = list( "dwarfoutpost_1","dwarfoutpost_2" )

/datum/map_template/dwarf_outpost_i
	name = "Dwarf Outpost Orc"
	id = "dwarfoutpost_1"
	mappath = "_maps/map_files/stonehamlet/templates/dwarfoutpost_1.dmm"

/datum/map_template/dwarf_outpost_ii
	name = "Dwarf Outpost Beastmen"
	id = "dwarfoutpost_2"
	mappath = "_maps/map_files/stonehamlet/templates/dwarfoutpost_2.dmm"


/*	..................   Roadblock   ................... */
/obj/effect/landmark/map_load_mark/hamlet_roadblock
	name = "Roadblock"
	templates = list( "roadblock_1","roadblock_2" )

/datum/map_template/roadblock_i
	name = "Roadblock"
	id = "roadblock_1"
	mappath = "_maps/map_files/stonehamlet/templates/roadblock_1.dmm"
/datum/map_template/roadblock_ii
	name = "No roadblock"
	id = "roadblock_2"
	mappath = "_maps/map_files/stonehamlet/templates/roadblock_2.dmm"

/*	..................   Outlaw camp   ................... */
/obj/effect/landmark/map_load_mark/hamlet_outlaws
	name = "Outlaw camp"
	templates = list( "outlawcamp_1","outlawcamp_2" )

/datum/map_template/outlawcamp_i
	name = "Outlaw camp"
	id = "outlawcamp_1"
	mappath = "_maps/map_files/stonehamlet/templates/outlawcamp_1.dmm"

/datum/map_template/outlawcamp_ii
	name = "Empty outlaw camp"
	id = "outlawcamp_2"
	mappath = "_maps/map_files/stonehamlet/templates/outlawcamp_2.dmm"


/*	..................   Salt Mine   ................... */
/obj/effect/landmark/map_load_mark/salt_mine
	name = "Salt Mine Special"
	templates = list( "saltmine_1","saltmine_2","saltmine_3"  )

/datum/map_template/salt_mine_i
	name = "Salt Mine Corpse"
	id = "saltmine_1"
	mappath = "_maps/map_files/stonehamlet/templates/saltmine_1.dmm"
/datum/map_template/salt_mine_ii
	name = "Salt Mine Gem"
	id = "saltmine_2"
	mappath = "_maps/map_files/stonehamlet/templates/saltmine_2.dmm"
/datum/map_template/salt_mine_iii
	name = "Salt Mine Cult"
	id = "saltmine_2"
	mappath = "_maps/map_files/stonehamlet/templates/saltmine_3.dmm"


// ===================================================================================

/*	..................   Random crap for moats  ................... */
/obj/effect/spawner/roguemap/moat_debris
	icon_state = "clodpile"
	icon = 'icons/roguetown/items/natural.dmi'
	probby = 50
	color = "#ff82ec"
	spawned = list(
		/obj/item/natural/dirtclod = 10,
		/obj/structure/fluff/clodpile = 5,
		/obj/item/reagent_containers/food/snacks/smallrat = 3,
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 2,
		/obj/item/natural/worms/leech = 2,
		/obj/item/reagent_containers/food/snacks/rotten/meat = 1,
		/obj/structure/idle_enemy/bigrat = 1,
		/obj/structure/kneestingers = 1)

// ===================================================================================
/*	..................   Metal bars (weakened or normal?)  ................... */
/obj/effect/spawner/roguemap/metal_bars
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "bars"
	probby = 100
	color = "#ff00d9"
	spawned = list(
		/obj/structure/bars/weakened = 30,
		/obj/structure/bars = 70,
		)

/obj/structure/bars/weakened
	desc = "Iron bars made to keep things in or out. These one looks pretty rusty."
	max_integrity = INTEGRITY_POOR
	color = "#edc9c9"


// ===================================================================================
/*	..................   Dwarf Outpost Spawner  ................... */
/obj/effect/spawner/roguemap/outpost_dwarf_weapon
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "paxe"
	probby = 50
	color = "#ffde3a"
	spawned = list(
		/obj/item/rogueweapon/pick/paxe = 30,
		/obj/item/rogueweapon/axe/steel = 60,
		/obj/item/rogueweapon/pick/steel = 10
		)

/obj/effect/spawner/roguemap/outpost_dwarf_armor
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "ironpot"
	probby = 50
	color = "#ffde3a"
	spawned = list(
		/obj/item/clothing/head/roguetown/helmet/ironpot = 25,
		/obj/item/clothing/head/roguetown/helmet/leather/minershelm = 40,
		/obj/item/clothing/neck/roguetown/chaincoif = 10,
		/obj/item/clothing/suit/roguetown/armor/chainmail = 10,
		/obj/item/clothing/suit/roguetown/armor/gambeson = 5,
		/obj/item/clothing/suit/roguetown/armor/leather/vest/butler = 10
		)

/obj/effect/spawner/roguemap/outpost_personal_item
	icon = 'icons/roguetown/weapons/tools.dmi'
	icon_state = "hammer_s"
	probby = 50
	color = "#ffde3a"
	spawned = list(
		/obj/item/rogueweapon/hammer/steel = 30,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/voddena = 60,
		/obj/item/clothing/head/roguetown/hatfur = 10,
		/obj/item/storage/belt/rogue/leather = 10,
		)

/obj/effect/spawner/roguemap/outpost_dwarf_key
//	icon_state = "brown"
	icon = 'icons/roguetown/items/keys.dmi'
	probby = 50
	color = "#3aff4e"
	spawned = list(
		/obj/item/key/dwarf_outpost = 100
		)

/obj/item/key/dwarf_outpost
	name = "steel key"
	desc = "Dwarven craftsmanship."
	lockid = "outpost"


/*	..................   Dwarf Underdweller Corpse   ................... */
/obj/effect/mob_spawn/human/corpse/damaged/underdweller
	icon = 'icons/effects/blood.dmi'
	icon_state = "remains"
	color = "#aa9b00"
	mob_type = /mob/living/carbon/human/species/dwarf/mountain
	mob_name = "Dwarf Underdweller"
	name = "Dwarf Underdweller"
	hairstyle = "Miner"
	facial_hairstyle = "Pick"
	outfit = /datum/outfit/deadunderdweller

/datum/outfit/deadunderdweller
	armor = /obj/item/clothing/suit/roguetown/armor/cuirass/iron
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes/buckle
	backl = /obj/item/storage/backpack/rogue/backpack
	head = /obj/item/clothing/head/roguetown/helmet/leather/minershelm


// ==============================================================
/*	..................   Various mapping aides   ................... */
/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/broken
	desc = "A long shirt of maille, this one is made for a short man it seems."
/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/broken/Initialize()
	. = ..()
	obj_break()

/obj/item/clothing/suit/roguetown/armor/chainmail/battered
	desc = "A good quality haubergon, but weakened by many blows."
	max_integrity = INTEGRITY_STANDARD
/*
/obj/structure/roguethrone/statues
	icon = 'modular/Mapping/icons/96x96.dmi
*/

/area/rogue/outdoors/rtfield/plague_district
	ambush_mobs = list(/mob/living/carbon/human/species/human/northern/bum/skilled/madman = 50, /mob/living/simple_animal/hostile/rogue/skeleton = 50)
	first_time_text = "PLAGUE DISTRICT"
	color = "#d4da75"
	name = "plague district"
	ambush_types = list(
				/turf/open/floor/rogue/cobblerock)

/area/rogue/outdoors/rtfield/outlaw
	ambush_mobs = list(/mob/living/carbon/human/species/human/northern/bum/skilled/outlaw = 50)
	name = "outlaw hideout"
	color = "#e9baa3"
	first_time_text = null

/area/rogue/outdoors/rtfield/boggish
	ambush_mobs = list(/mob/living/carbon/human/species/goblin/skilled/ambush/sea = 50)
	name = "bog approaches"
	color = "#7db36e"
	first_time_text = null

/area/rogue/outdoors/rtfield/woodish
	ambush_mobs = list(/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 50)
	name = "woods approaches"
	color = "#7db36e"
	first_time_text = null

/area/rogue/outdoors/rtfield/spooky		// haunts ambush and dug down hidden treasure
	ambush_mobs = list(/mob/living/simple_animal/hostile/rogue/haunt = 50)
	name = "spooky place"
	color = "#9294d3"
	first_time_text = null

/area/rogue/outdoors/rtfield/hamlet
	name = "hamlet surroundings"
	ambush_times = list("night","dusk")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 60,
				/mob/living/carbon/human/species/goblin/skilled/ambush = 5,
				/mob/living/simple_animal/pet/cat/rogue/cabbit = 10)
	first_time_text = "STONEHILL VALLEY"


/obj/item/key/spooky_village
	icon_state = "rustkey"
	lockid = "spooky_village"

/obj/effect/spawner/roguemap/beartrap_obvious
	icon_state = "beartrap"
	name = "beartrap"
	probby = 50
	spawned = list(/obj/item/restraints/legcuffs/beartrap/armed)


/*	..................   Random Alcohol   ................... */
/obj/effect/spawner/roguemap/alcohol	// random beer
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "clear_bottle1"
	color = "#06b606"
	probby = 100
	spawned = list(
		/obj/item/reagent_containers/glass/bottle/rogue/beer = 50,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/spottedhen = 15,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/blackgoat = 10,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/ratkept = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/hagwoodbitter = 10,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/aurorian = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/fireleaf = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/butterhairs = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/stonebeardreserve = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/beer/voddena = 5 )

/obj/effect/spawner/roguemap/alcohol/wine
	spawned = list(
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 50,
		/obj/item/reagent_containers/glass/bottle/rogue/wine/sourwine =10,
		/obj/item/reagent_containers/glass/bottle/rogue/redwine = 20,
		/obj/item/reagent_containers/glass/bottle/rogue/whitewine = 20,
		/obj/item/reagent_containers/glass/bottle/rogue/elfred = 5,
		/obj/item/reagent_containers/glass/bottle/rogue/elfblue = 5 )


/*	..................   Random Gem spawner   ................... */
/obj/effect/spawner/roguemap/loot/random_gem
	spawned = list(
	/obj/item/roguegem = 25,
	/obj/item/roguegem/green = 12,
	/obj/item/roguegem/blue = 6,
	/obj/item/roguegem/yellow = 3,
	/obj/item/roguegem/violet = 2,
	/obj/item/roguegem/diamond = 1)


/*	..................   Spooky Village loot   ................... */
/obj/effect/spawner/roguemap/spooky_village_stuff
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "generic_event"
	probby = 50
	spawned = list(
		/obj/item/clothing/head/roguetown/armingcap = 10,
		/obj/item/clothing/head/roguetown/fisherhat = 10,
		/obj/item/clothing/shoes/roguetown/simpleshoes/buckle = 10,
		/obj/item/key/spooky_village  = 30,
		/obj/item/roguecoin/copper/pile = 10,
		)


/*	..................   Toll randomizer (poor mans coin generator, cheaper workload is all)  ................... */
/obj/effect/spawner/roguemap/tollrandom
	icon = 'icons/roguetown/underworld/enigma_husks.dmi'
	icon_state = "soultoken_floor"
	probby = 35
	color = "#ff0000"
	spawned = list(
		/obj/item/underworld/coin = 1,
		)

/*	..................   Random Seeds   ................... */
/obj/effect/spawner/roguemap/seeds	// all random
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "seeds"
	color = "#06b606"
	probby = 100
	spawned = list(
		/obj/item/neuFarm/seed/wheat = 20,
		/obj/item/neuFarm/seed/cabbage = 10,
		/obj/item/neuFarm/seed/oat = 10,
		/obj/item/neuFarm/seed/potato = 10,
		/obj/item/neuFarm/seed/turnip = 10,
		/obj/item/neuFarm/seed/apple = 10,
		/obj/item/neuFarm/seed/onion = 10,
		/obj/item/neuFarm/seed/berryrogue = 15,
		/obj/item/neuFarm/seed/westleach = 10,
		/obj/item/neuFarm/seed/sunflower = 10,
		/obj/item/neuFarm/seed/swampleaf = 5,
		/obj/item/neuFarm/seed/pear = 5,
		/obj/item/neuFarm/seed/poppy = 5,
		/obj/item/neuFarm/seed/poison_berries = 5,
		/obj/item/neuFarm/seed/fyritius = 5 )

/obj/effect/spawner/roguemap/seeds/common
	spawned = list(
		/obj/item/neuFarm/seed/wheat = 25,
		/obj/item/neuFarm/seed/cabbage = 15,
		/obj/item/neuFarm/seed/oat = 10,
		/obj/item/neuFarm/seed/potato = 10,
		/obj/item/neuFarm/seed/turnip = 10,
		/obj/item/neuFarm/seed/apple = 10,
		/obj/item/neuFarm/seed/onion = 10 )

/obj/effect/spawner/roguemap/seeds/uncommon
	spawned = list(
		/obj/item/neuFarm/seed/berryrogue = 40,
		/obj/item/neuFarm/seed/westleach = 25,
		/obj/item/neuFarm/seed/swampleaf = 15,
		/obj/item/neuFarm/seed/pear = 15,
		/obj/item/neuFarm/seed/poison_berries = 5 )

/obj/effect/spawner/roguemap/seeds/flowers
	spawned = list(
		/obj/item/neuFarm/seed/sunflower = 70,
		/obj/item/neuFarm/seed/fyritius = 10,
		/obj/item/neuFarm/seed/poppy = 20 )


/*	..................   Loot spawners   ................... */
/obj/effect/spawner/roguemap/loot
	icon_state = "loot"
	probby = 50

/obj/effect/spawner/roguemap/loot/common
	spawned = list(
		/obj/item/roguecoin/copper = 5,
		/obj/item/roguecoin/copper/pile = 15,
		/obj/item/natural/cloth = 10,
		/obj/item/storage/belt/rogue/pouch = 5,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 5,
		/obj/item/storage/belt/rogue/leather/rope = 10,
		/obj/item/natural/bundle/stick = 10,
		/obj/item/grown/log/tree/small = 15,
		/obj/item/natural/hide = 4,
		/obj/item/clothing/shoes/roguetown/gladiator = 5,
		/obj/item/kitchen/spoon = 1,
		/obj/item/reagent_containers/glass/bowl = 1,

		)


/obj/effect/spawner/roguemap/loot/weapon
	spawned = list(
		/obj/item/roguecoin/copper/pile = 15,
		/obj/item/rogueweapon/knife/hunting = 10,
		/obj/item/rogueweapon/knife/dagger = 8,
		/obj/item/rogueweapon/knife/dagger/steel = 4,
		/obj/item/rogueweapon/knife/dagger/silver = 2,
		/obj/item/rogueweapon/sword/iron = 3,
		/obj/item/rogueweapon/axe/iron = 10,
		/obj/item/rogueweapon/mace = 5,
		/obj/item/ammo_holder/quiver/arrows = 5,
		/obj/item/rogueweapon/sword/short = 5,
		/obj/item/clothing/suit/roguetown/armor/leather = 10,
		/obj/item/clothing/suit/roguetown/armor/gambeson = 15,
		/obj/item/clothing/gloves/roguetown/chain/iron = 3,
		/obj/item/clothing/neck/roguetown/coif = 3,
		/obj/item/clothing/shoes/roguetown/gladiator = 5
		)


/obj/effect/spawner/roguemap/loot/jewelry
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "golden"
	color = "#06b606"
	spawned = list(
		/obj/item/roguestatue/iron = 8,
		/obj/item/roguestatue/steel = 8,
		/obj/item/ingot/gold = 7,
		/obj/item/roguestatue/silver = 8,
		/obj/item/clothing/ring/silver = 7,
		/obj/item/reagent_containers/glass/cup/silver = 7,
		/obj/item/storage/belt/rogue/leather/plaquesilver = 7,
		/obj/item/clothing/ring/gold = 5,
		/obj/item/ingot/gold = 5,
		/obj/item/reagent_containers/glass/cup/golden = 4,
		/obj/item/storage/belt/rogue/leather/plaquegold = 4,
		/obj/item/clothing/mask/rogue/spectacles/golden = 3,
		/obj/item/clothing/head/roguetown/crown/circlet = 3,
		/obj/item/roguestatue/gold/loot=2,
		/obj/item/clothing/head/roguetown/helmet/heavy/decorated/golden = 1,
		/obj/item/clothing/head/roguetown/crown/nyle = 1,
		/obj/item/roguestatue/gold = 1,
		)

// ===================================================================================
/*	..................   Sewer Danger   ................... */
/obj/effect/spawner/roguemap/sewerencounter
	icon_state = "srat"
	icon = 'icons/roguetown/mob/monster/rat.dmi'
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/item/reagent_containers/food/snacks/smallrat = 30,
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 10,
		/obj/item/organ/guts = 5,
		/obj/item/roguecoin/copper = 5,
		/obj/effect/gibspawner/generic = 5,
		/obj/effect/decal/remains/bigrat = 5,
		/obj/structure/idle_enemy/bigrat = 2,
		)

/*	..................   Cheap Room Danger   ................... */
/obj/effect/spawner/roguemap/cheapinnroomencounter
	icon_state = "paperwizard"
	icon = 'icons/mob/simple_human.dmi'
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/item/reagent_containers/food/snacks/smallrat = 15,
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 10,
		/obj/item/roguecoin/copper = 50,
		/mob/living/carbon/human/species/human/northern/bum/skilled/madman  = 10,
		/obj/structure/idle_enemy/bigrat = 10
		)

/*	..................   Skeleton Fighter Danger   ................... */
/obj/effect/spawner/roguemap/ancientskellyguardmaybe
	icon = 'icons/roguetown/mob/skeleton_male.dmi'
	icon_state = "z"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/skeleton_fighter = 100
		)

/*	..................   Beggar Danger   ................... */
/obj/effect/spawner/roguemap/hostile_beggar_danger
	icon_state = "faceless"
	icon = 'icons/mob/simple_human.dmi'
	probby = 50 // temp to find out if decal vomit spawns
	color = "#ff0000"
	spawned = list(
		/obj/effect/decal/cleanable/vomit = 10,
		/obj/item/clothing/mask/cigarette/rollie = 10,
		/obj/item/rogueweapon/knife/stone = 10,
		/obj/structure/idle_enemy/hostile_bum = 25	)

/*	..................   Mines Danger   ................... */
/obj/effect/spawner/roguemap/mine_mole_maybe
	icon = 'icons/roguetown/mob/monster/mole.dmi'
	icon_state = "mole"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/effect/decal/remains/mole = 20,
		/obj/item/natural/rock = 10,
		/obj/item/natural/stone = 10,
		/obj/item/roguegem/yellow = 10,
		/obj/structure/idle_enemy/mole = 50	)

/*	..................   Crypt Danger   ................... */
/obj/effect/spawner/roguemap/crypt_randomdanger
	icon = 'icons/roguetown/mob/skeleton_male.dmi'
	icon_state = "z"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/item/roguecoin/silver = 5,
		/obj/item/natural/worms/grub_silk = 5,
		/obj/item/natural/worms = 20,
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 10,
		/obj/structure/idle_enemy/bigrat = 10,
		/obj/structure/idle_enemy/weak_skelly = 50	)

/*	..................   Rat Danger   ................... */
/obj/effect/spawner/roguemap/rat_danger
	icon = 'icons/roguetown/mob/monster/bigrat.dmi'
	icon_state = "rat"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/effect/decal/remains/bigrat = 20,
		/obj/item/reagent_containers/food/snacks/smallrat = 20,
		/obj/item/natural/worms = 10,
		/obj/item/reagent_containers/food/snacks/smallrat/dead = 10,
		/obj/structure/idle_enemy/bigrat = 40)

/*	..................   Maneater Danger   ................... */
/obj/effect/spawner/roguemap/maneater_danger
	icon = 'icons/roguetown/mob/monster/lamia.dmi'
	icon_state = "headless"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/lamia = 50,
		/obj/structure/idle_enemy/headless = 50)

/*	..................   Zizombie Farmer Danger   ................... */
/obj/effect/spawner/roguemap/zizombie_farmer_maybe
	icon = 'icons/roguetown/mob/monster/zizombie.dmi'
	icon_state = "zizombie_decap"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/zizombie_farmer = 100	)

/*	..................   Hairy Spider Danger   ................... */
/obj/effect/spawner/roguemap/hairy_spider_maybe
	icon = 'icons/roguetown/mob/monster/spider.dmi'
	icon_state = "spider"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/hairy_spider = 100	)



/*	..................   Savage Orc Danger Carbon   ................... */
/obj/effect/spawner/roguemap/orc_warrior_carbon_maybe
	icon = 'icons/roguetown/mob/monster/simple_orcs.dmi'
	icon_state = "orcmarauder_spear"
	probby = 50
	color = "#ff5858"
	spawned = list(
		/obj/structure/idle_enemy/savage_orc = 65,
		/obj/structure/idle_enemy/savage_orc_looter = 35	)

/obj/effect/spawner/roguemap/orc_warlord_carbon
	icon = 'icons/roguetown/mob/monster/simple_orcs.dmi'
	icon_state = "orcmarauder_spear"
	probby = 100
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/savage_orc_chieftain = 100 )


/*	..................   Haunts Danger   ................... */
/obj/effect/spawner/roguemap/haunts_maybe
	icon = 'icons/roguetown/mob/monster/wraith.dmi'
	icon_state = "hauntpile"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/structure/bonepile = 100	)

/*	..................   Outlaw Danger (starving desperate peasants)  ................... */
/obj/effect/spawner/roguemap/outlaw_maybe
	icon_state = "faceless"
	icon = 'icons/mob/simple_human.dmi'
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/outlaw = 100	)

/*	..................   Volf Danger  ................... */
/obj/effect/spawner/roguemap/volf_maybe
	icon = 'icons/roguetown/mob/monster/vol.dmi'
	icon_state = "vv"
	probby = 50
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/volf= 100	)

/*	..................   Cabbit Cottage Danger  ................... */
/obj/effect/spawner/roguemap/cabbit_maybe
	icon = 'icons/roguetown/mob/cabbit.dmi'
	icon_state = "cabbit"
	probby = 100
	color = "#ff0000"
	spawned = list(
		/obj/structure/idle_enemy/cabbit_boss= 50,
		/mob/living/simple_animal/pet/cat/rogue/cabbit = 50	)


// ===================================================================================
/*	..................   Idle Enemy Spawner   ................... */
/obj/structure/idle_enemy
	name = ""
	icon = 'icons/roguetown/mob/skeleton_male.dmi'
	icon_state = ""
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT


// *** CARBONS ***
/*	..................   Skeleton Fighter Spawner   ................... */
/obj/structure/idle_enemy/skeleton_fighter
/obj/structure/idle_enemy/skeleton_fighter/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/skeleton_fighter)
/datum/component/spawner/skeleton_fighter
	mob_types = list(/mob/living/carbon/human/species/skeleton/skilled/fighter)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Orc Carbons Spawner   ................... */
/obj/structure/idle_enemy/savage_orc
/obj/structure/idle_enemy/savage_orc/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/savage_orc)
/datum/component/spawner/savage_orc
	mob_types = list(/mob/living/carbon/human/species/orc/skilled/savage)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/obj/structure/idle_enemy/savage_orc_looter
/obj/structure/idle_enemy/savage_orc_looter/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/savage_orc_looter)
/datum/component/spawner/savage_orc_looter
	mob_types = list(/mob/living/carbon/human/species/orc/skilled/looter)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/obj/structure/idle_enemy/savage_orc_chieftain
/obj/structure/idle_enemy/savage_orc_chieftain/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/savage_orc_chieftain)
/datum/component/spawner/savage_orc_chieftain
	mob_types = list(/mob/living/carbon/human/species/orc/skilled/savage_chieftain)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Hostile Bum Spawner   ................... */
/obj/structure/idle_enemy/hostile_bum
/obj/structure/idle_enemy/hostile_bum/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/hostile_bum)
/datum/component/spawner/hostile_bum
	mob_types = list(/mob/living/carbon/human/species/human/northern/bum/skilled/madman)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Weak Skelly Spawner   ................... */
/obj/structure/idle_enemy/weak_skelly
/obj/structure/idle_enemy/weak_skelly/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/weak_skelly)
/datum/component/spawner/weak_skelly
	mob_types = list(/mob/living/carbon/human/species/skeleton/skilled/unarmed)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Zizombie Farmer Spawner   ................... */
/obj/structure/idle_enemy/zizombie_farmer
/obj/structure/idle_enemy/zizombie_farmer/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/zizombie_farmer)
/datum/component/spawner/zizombie_farmer
	mob_types = list(/mob/living/carbon/human/species/zizombie/npc/peasant)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""


/*	..................   Outlaw Spawner   ................... */
/obj/structure/idle_enemy/outlaw
/obj/structure/idle_enemy/outlaw/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/outlaw)
/datum/component/spawner/outlaw
	mob_types = list(/mob/living/carbon/human/species/human/northern/bum/skilled/outlaw )
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""


// *** SIMPLE ANIMALS ***
/*	..................   Big Rat Spawner   ................... */
/obj/structure/idle_enemy/bigrat
/obj/structure/idle_enemy/bigrat/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/bigrat)
/datum/component/spawner/bigrat
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/bigrat)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Lesser Mole Spawner   ................... */
/obj/structure/idle_enemy/mole
/obj/structure/idle_enemy/mole/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/mole)
/datum/component/spawner/mole
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/mole)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Lamia Spawner   ................... */
/obj/structure/idle_enemy/lamia
/obj/structure/idle_enemy/lamia/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/lamia)
/datum/component/spawner/lamia
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/lamia)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 10
	spawn_text = ""

/*	..................   Headless Spawner   ................... */
/obj/structure/idle_enemy/headless
/obj/structure/idle_enemy/headless/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/headless)
/datum/component/spawner/headless
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/headless)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 10
	spawn_text = ""


/*	..................   Hairy Spider Spawner   ................... */
/obj/structure/idle_enemy/hairy_spider
/obj/structure/idle_enemy/hairy_spider/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/hairy_spider)
/datum/component/spawner/hairy_spider
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/spider/hairy)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Volf Spawner   ................... */
/obj/structure/idle_enemy/volf
/obj/structure/idle_enemy/volf/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/volf)
/datum/component/spawner/volf
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/wolf )
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""

/*	..................   Cabbit Boss Spawner   ................... */
/obj/structure/idle_enemy/cabbit_boss
/obj/structure/idle_enemy/cabbit_boss/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/cabbit_boss)
/datum/component/spawner/cabbit_boss
	mob_types = list(/mob/living/simple_animal/hostile/retaliate/rogue/troll/caerbannog)
	spawn_time = 0
	spawn_delay = 0
	max_mobs = 1
	range = 11
	spawn_text = ""


// ===================================================================================
/*	..................   Metal bars (weakened or normal?)  ................... */
/obj/effect/spawner/roguemap/metal_bars
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "bars"
	probby = 100
	color = "#d5cb89"
	spawned = list(
		/obj/structure/bars/weakened = 30,
		/obj/structure/bars/weakened = 70,
		)

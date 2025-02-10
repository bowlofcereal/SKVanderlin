/* * * * * * * * * * * **
 *						*
 *		 Crafting		*
 *						*
 *						*
 * * * * * * * * * * * **/

// =================================================================================
/*-----------------\
| Crafting Recipes |
\-----------------*/
/datum/crafting_recipe/roguetown/structure/stonetable
	name = "stone table (long mid)"
	result = /obj/structure/table/stone
	reqs = list(/obj/item/natural/stone = 2)
	verbage = "build"
	verbage_tp = "builds"
	craftsound = 'sound/foley/Building-01.ogg'
	time = 4 SECONDS
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 3
/datum/crafting_recipe/roguetown/structure/stonetable/end
	name = "stone table (long end)"
	result = /obj/structure/table/stone_end

/datum/crafting_recipe/roguetown/structure/stonetable/small
	name = "stone table (single)"
	result = /obj/structure/table/stone_small


/*--------------\
| Anvil Recipes |
\--------------*/
/datum/anvil_recipe/weapons/iron/lucerne
	name = "Poleaxe (+Bar, +Small Log)"
	recipe_name = "a Poleaxe"

/datum/anvil_recipe/weapons/iron/spear_iron
	name = "Spear (+Small Log)"
	recipe_name = "a Spear"
	createmultiple = FALSE

/datum/anvil_recipe/weapons/steel/peasant_flail
	name = "Crusher (+Chain, +Small Log)"
	recipe_name = "a two-handed flail"


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

/*	.................   Unique Feldsher recipes   ................... */
/datum/crafting_recipe/nitmaiden_license
	name = "Nitemaiden health license"
	time = 4 SECONDS
	reqs = list(/obj/item/paper = 1,
		/obj/item/natural/feather = 1)
	result = /obj/item/paper/feldsher_certificate
	category = CAT_NONE

// ============		Court/Noble	=============
/datum/job/roguetown/captain
	allowed_races = list(
		"Humen",
		"Elf",
		"Dwarf"
	)

/datum/job/roguetown/lord
	allowed_races = list(
		"Humen",
		"Elf",
		"Dwarf"
	)

/datum/job/roguetown/consort
	allowed_races = list(
		"Humen",
		"Elf"
	)


/datum/job/roguetown/royalguard
	allowed_races = list(
		"Humen",
		"Dwarf",
		"Aasimar"
	)


/datum/job/roguetown/feldsher	// TOWN DOC NOT COURT ONLY. THERES NOT 200 players to support five separate ecologies/economies
	department_flag = SERFS
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)

/datum/outfit/job/roguetown/feldsher/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/forgery_bathmaiden)


/datum/job/roguetown/archivist
	allowed_races = list(
		"Humen",
		"Elf",
		"Dwarf",
		"Aasimar"
	)

/datum/job/roguetown/magician
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Aasimar"
	)


/datum/job/roguetown/steward
	allowed_races = list(
		"Humen",
		"Elf",
		"Dwarf"
	)

/datum/job/roguetown/merchant
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

/datum/job/roguetown/prince
	allowed_races = list(
		"Humen",
		"Half-Elf"
	)
	allowed_ages = list(AGE_ADULT)

/datum/job/roguetown/bapprentice
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf"
	)
	allowed_ages = list(AGE_ADULT)

/datum/job/roguetown/servant
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf"
	)
	allowed_ages = list(AGE_ADULT)

/datum/job/roguetown/squire
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf"
	)
	allowed_ages = list(AGE_ADULT)

/datum/job/roguetown/wapprentice
	allowed_races = list(
		"Humen",
		"Half-Elf"
	)
	allowed_ages = list(AGE_ADULT)

// ============		Towner		=============
/datum/job/roguetown/tailor
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf")

/datum/job/roguetown/innkeep
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf")

/datum/job/roguetown/carpenter
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf")

/datum/job/roguetown/armorsmith
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf")

/datum/job/roguetown/weaponsmith
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf")

/datum/job/roguetown/artificer
	title = "Mason"  // Need new spawner due to title change ROGTODO
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar",
	)




// ============		Peasants	=============
/datum/job/roguetown/cook
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf",
		"Aasimar",
	)

/datum/job/roguetown/farmer
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf",
		"Aasimar",
	)

/datum/job/roguetown/prisoner
	allowed_races = list(
		"Humen",
		"Rakshari",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

/datum/job/roguetown/miner
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)


/datum/job/roguetown/hunter
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

/datum/job/roguetown/grabber
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

/datum/job/roguetown/fisher
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

/datum/job/roguetown/butler
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
	)

/datum/job/roguetown/vagrant
	allowed_races = list(
		"Humen",
		"Dwarf",
		"Half-Elf",
		"Tiefling",
		"Dark Elf",
		"Rakshari"
	)


/datum/job/roguetown/jester
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)



// ============		Temple	=============
/datum/job/roguetown/adept
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Dark Elf",
		"Tiefling",
		"Aasimar"
	)

/datum/job/roguetown/inquisitor
	allowed_races = list(
		"Humen",
		"Dwarf"
	)

/datum/job/roguetown/monk
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)

/datum/job/roguetown/priest
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)

/datum/job/roguetown/templar
	allowed_races = list(
		"Humen",
		"Elf",
		"Dwarf",
		"Aasimar",
		"Half-Elf",
	)
	allowed_patrons = ALL_TEMPLAR_PATRONS

/datum/job/roguetown/undertaker
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

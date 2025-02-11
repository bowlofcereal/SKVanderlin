/datum/job/roguetown/adventurer
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)


// ============	Rare Adventurer Classes modifications for races & pickprob etc	=============
/datum/advclass/combat/hoplite
	tutorial = "You have marched and fought in formations since the ancient war that nearly destroyed Grimoria. There are few in the world who can match your expertise in a shield wall, but all you have ever known is battle and obedience..."

/datum/advclass/combat/swordmaster
	name = "Greatsword-master"
	tutorial = "You spent years serving the eastern Grenzelhoftian lords, and now you spend your days as a travelling duelist. Upon this island, you like to increase the fame of your sword skills, as well as your honor."

/datum/advclass/pilgrim/rare/crusader
	name = "Crusader"
	tutorial = "The Crusader Brotherhood are knights who have pledged \
	their wealth and lands to the Temple, taking up the banner \
	of their knightly order, dedicated to retaking Valoria. \
	Three cults provide knights for the Order: Astrata, Necra and Psydon. \
	You were sent to Enigma by the Order to get any and all assistance from the faithful for the Crusade."
	allowed_sexes = list(MALE)



// ============	Mercenaries	=============
/datum/job/roguetown/mercenary
	department_flag = PEASANTS
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

/datum/advclass/mercenary/zybantine
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Tiefling",
	)




// ============	Wave Classes modifications for races & pickprob etc	=============
/datum/advclass/pilgrim/rare/grenzelhoft	// for grenzwave perhaps?
	category_tags = null
/datum/advclass/pilgrim/rare/preacher	// for grenzwave perhaps?
	category_tags = null

/datum/advclass/pilgrim/rare/zybantine 	// for zybslaver wave perhaps?
	category_tags = null

/datum/advclass/mercenary/steppesman	// becoming wave
	category_tags = null

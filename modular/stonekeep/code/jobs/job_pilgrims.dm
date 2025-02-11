/datum/job/roguetown/pilgrim
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Rakshari"
	)

// ============	Pilgrim Classes modifications for races & pickprob etc	=============
/datum/advclass/pilgrim/noble
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Dark Elf"
	)

/datum/advclass/pilgrim/rare/merchant
	name = "Travelling Peddlar"
	tutorial = "You are a small-time trader, always on the move, earning small profits on common goods. \
	You've picked up many wears on your various adventures, now it's time to peddle them back to these locals."

/datum/advclass/pilgrim/bard
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
	)

/datum/advclass/pilgrim/blacksmith
	tutorial = "Wandering smith, used to living rough and making do."
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Rakshari"
	)

/datum/advclass/pilgrim/briar
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf"
	)
/datum/advclass/pilgrim/physicker
	tutorial =  "Perhaps you failed in studies under a Town Feldsher, perhaps you learned your trade in foreign lands or by secretive, sinister ways. Either way, you journey from place to place offering \
				your services."
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	category_tags = list(CTAG_PILGRIM)

/datum/advclass/pilgrim/cheesemaker
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Aasimar",
		"Half-Orc"
	)
/datum/advclass/carpenter
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Half-Orc"
	)

/datum/advclass/pilgrim/fisher
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
/datum/advclass/pilgrim/hunter
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

/datum/advclass/pilgrimminer
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf"
	)
/datum/advclass/pilgrim/woodcutter
	allowed_races = list("Humen",
	"Elf",
	"Dark Elf",
	"Half-Elf",
	"Tiefling",
	"Dwarf",
	"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/woodcutter
	category_tags = list(CTAG_DISABLED) // I guess its disabled?

/datum/advclass/pilgrim/peasant
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Aasimar"
	)

// ============	Rare Pilgrim Classes modifications for races & pickprob etc	=============
/datum/advclass/pilgrim/rare/mastercarpenter
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	category_tags = list(CTAG_PILGRIM)
	pickprob = 10

/datum/advclass/pilgrim/rare/masterchef
	tutorial = "A master chef is one of the best cooks to ever live. \
	Your natural talent has been tempered by experience, and you have traveled across Grimoria, cooking exotic masterpieces for wealthy merchants and nobility alike."
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	category_tags = list(CTAG_PILGRIM)
	pickprob = 10

/datum/advclass/pilgrim/rare/fishermaster
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	category_tags = list(CTAG_PILGRIM)
	pickprob = 10

/datum/advclass/pilgrim/rare/masterblacksmith
	pickprob = 10

/datum/advclass/pilgrim/rare/minermaster
	category_tags = list(CTAG_PILGRIM)

/datum/advclass/pilgrim/rare/grandmastermason
	category_tags = list(CTAG_PILGRIM)
	pickprob = 10

/datum/advclass/pilgrim/rare/farmermaster
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Aasimar",
	)
	pickprob = 10
	category_tags = list(CTAG_PILGRIM)

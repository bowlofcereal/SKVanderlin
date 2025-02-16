
#define ACCEPTED_RACES list("Humen", "Elf", "Dwarf")
#define SECOND_CLASS_RACES list("Half-Elf", "Aasimar")
#define PERSECUTED_RACES list("Tiefling", "Dark Elf", "Rakshari")

// Use this proc to combine multiple of the above lists, such as combine_race_lists(ACCEPTED_RACES, SECOND_CLASS_RACES)
/proc/combine_race_lists()
    var/list/combined = list()
    for(var/list/L in args)
        combined |= L
    return combined

# AdminToolkit with ExileMod extension

Before you start, please make sure the following files exist in is this package 

+ `@MissionFile\atk\ExileMod.sqf`

## Installation

Please make sure you have followed the exact instruction of the AdminToolkit <a href="../README.md">README.md</a>
It is also necessary to add your player UID in the `config.cpp` located in `@ExileServer\admintoolkit` directory

**MissionFile**

+ Unpack your mission file
+ Copy the folder `@MissionFile\atk` into your MissionFile root directory
+ Customize the `descritption.ext` or `config.cpp` located in your MissionFile as follow:

```
// add this class into the config.cpp of your mission file
class CfgAdminToolkitCustomMod {
    /* Load the any additional sqf file as mod */
    Extensions[] = {
        /* Title, SQF file name (located in atk folder) */
        {"Exile Mod","ExileMod"}
    };
};
```

+ Pack your mission file and upload it to your server

**Server PBO**

This extension is part of the AdminToolkit Core containing the file `ExileMod.sqf` - No more action required

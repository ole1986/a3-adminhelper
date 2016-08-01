# Extending AdminToolkit features

Using the MissionFile you can extend and (partly) overwrite features of the AdminToolkit.<br />
To achieve this a configuration class `CfgAdminToolkitCustomMod` is required in your `description.ext`
 
```
class CfgAdminToolkitCustomMod {
	/* Exclude some main menu items
	 * To only show the menus loaded from an extension, use:
	 * 
	 * ExcludeMenu[] = {"Players", "Vehicles", "Weapons" , "Other"};
	 */
	ExcludeMenu[] = {};
	
	/* Load an additional sqf file as MOD */
	Extensions[] = {
		/**
		 * Usage: "<Your Mod Title>", "<YourModFileWithoutExt>.sqf"
		 */
		/* Example for "ExileMod" using the "atk\ExileMod.sqf" */
		{"Exile Mod","ExileMod"}
	};

	/* 4 Quick buttons allowing to add any action you want - See example below*/
	QuickButtons[] = {
		/* send a chat message to selected player containing 'Test 123' */
		{"Chat", "['message', [AdminToolkit_Player, 'Test 123']] call AdminToolkit_doAction"},
		/* send a message to everyone using the parameter text field */
		{"Msg To All", "['messageall', AdminToolkit_Params] call AdminToolkit_doAction"},
		/* Quickly get a Helicopter */
		{"Heli", "['getvehicle', 'B_Heli_Light_01_armed_F'] call AdminToolkit_doAction"},
		/*4 button*/
		{"Empty", "['Command', 'Variable'] call AdminToolkit_doAction"}
	};
};
```

**Extensions**

This property is used to load additional extensions located in the MissionFile `atk` folder.
From server it will also include the same file in `ext` folder to execute global commands.

**QuickButtons**

Allows you to overwrite the four quick buttons with some custom commands





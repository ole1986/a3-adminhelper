/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
class CfgPatches {
    class AdminToolkit {
        requiredVersion = 0.1;
        requiredAddons[]= {};
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions {
    class AdminToolkit {
        class main {
            file="admintoolkit_server\bootstrap";
            class preInit { 
                preInit = 1;
            };
            class postInit {
                postInit = 1;
            };
        };
    };
};

class CfgSettings
{
    class AdminToolkit {
		/**
		 * Server command password required to execute kick, ban, etc...
		 */
		ServerCommandPassword = "";
        /**
         * list of allowed admins using its player UID (default: me)
         */
        AdminList[] = {"xxxxx"};
        /**
         * list of admins with restricted access only
         */
        ModeratorList[] = {"xxxxx","xxxxx"};
        /**
		 * allowed commands for moderators (default: login, teleport to a player, get a vehicle, get player list, spectate a player)
		 */
        ModeratorCmds[] = {
		//standart commands
			//adminowncommands
			"login",
			"godmodeon",
			"godmodeoff",
			//"getheal",
			//"getkill",
			"getposplayer",
			"tp2pos",
			//playercommands
			"getplayers",
			"kickplayer",
			"banplayer",
			"specplayer",
			"tp2player",
			"tpplayer",
			//Vehicle
			"getvehicle",
			/*"givevehicle",
			"destvehicle",
			"delvehicle",
			//Weapons
			"getweapon",
			"getammo",
			//Items
			"getitem",
			//others
			"spawn",
			//build
			"build",
			"buildremove",
			"buildpersistent",
			"buildinfopersistent",
			"clearpersistent",
			"savepersistent",
			"buildabort",*/
		//exile commands
			//adminowncommands
			"exile_getheal",
			"exile_getkill",
			"exile_getmoney",
			"exile_getscore",
			//Vehicles
			"exile_getvehicle",
			"exile_repvehicle",
			"exile_destvehicle",
			"exile_delvehicle",
			//Players
			"exile_givheal",
			"exile_givkill",
			"exile_givscore",
			"exile_takescore",
			"exile_givmoney",
			"exile_takemoney"
		};		
    };
};
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
        //ModeratorCmds[] = {"login","getplayers","tp2player", "getvehicle", "kickplayer", "specplayer", "specstop"};
		//ModeratorCmds[] = {"login", "getplayers", "tp2player", "tpplayer", "tp2pos", "getvehicle", "givevehicle", "exile_getvehicle", "getweapon", "getammo", "kickplayer", "playersCallback", "specplayer", "specstop", "exile_getmoney","exile_delvehicle", "exile_getscore"};
        ModeratorCmds[] = {
			"login",
			"kickplayer",
			"banplayer", 
			"getplayers", 
			"tp2pos", 
			"tp2player", 
			"tpplayer", 
			"getammo", 
			"getweapon", 
			"getvehicle", 
			//"givevehicle", 
			"godmodeoff", 
			"godmodeon", 
			"specplayer", 
			"specstop", 
			//"build",
			//"buildremove",
			//"buildpersistent",
			//"buildinfopersistent",
			//"clearpersistent",
			//"savepersistent",
			//"buildabort"
			"exile_getvehicle",
			"exile_repvehicle",
			"exile_delvehicle",
			"exile_destvehicle",
			"exile_getmoney",
			"exile_getheal",
			"exile_getscore",
			"exile_kill"
		};
    };
};
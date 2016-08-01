/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private["_safepos","_payload","_adminList", "_moderatorList", "_moderatorCmds","_player","_request", "_params","_result", "_tmp", "_mod"];
_payload = _this;
_adminList = getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "AdminList");
_moderatorList = getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "ModeratorList");
_moderatorCmds = [];
_result = true;
try 
{
    _player = _payload select 0;
    _request = _payload select 1; // what to do
    _params = _payload select 2; // an array of parameters
    
    if !( getPlayerUID _player in (_adminList + _moderatorList) ) then {
		['loginfailed', ''] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
        throw format ["Player %1 with UID %2 does not have access", name _player, getPlayerUID _player];
    };
    
    diag_log format ["[ADMINTOOLKIT] Calling %1 from player %2", _request, name _player];

    // if its a moderator, check if commands is allowed
    if ( getPlayerUID _player in _moderatorList ) then {
		_moderatorCmds = getArray(configFile >> "CfgSettings" >> "AdminToolkit" >> "ModeratorCmds");
        if !( _request in _moderatorCmds ) then {
            throw format [ "Moderator %1 has no access to admin command %2 with params %3 ", name _player, _request, str _params];
        };
    };
        
    switch (_request) do {
		case 'login':
		{
			// send login ok with moderator cmdlets
			['loginok', _moderatorCmds] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		case 'message': {
			_tmp = [_params select 0] call AdminToolkit_network_fetchPlayer;
			['message', [_params select 1, format["<t size='1.5'>Sender: %1</t>", name _player]]] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _tmp];
		};
		case 'messageall': {
			diag_log format ["[ADMINTOOLKIT] messageall params: %1 ", str _params];
			['message', [_params, format["<t size='1.5'>Sender: %1</t>", name _player]]] remoteExecCall ['AdminToolkit_network_receiveResponse', -2];
		};
		// Kick player from server
		// Example: [player, 'kickplayer', <string playername>]
		case "kickplayer":
		{
			_tmp = getText(configFile >> "CfgSettings" >> "AdminToolkit" >> "ServerCommandPassword");
			if(_tmp != "") then {
				_tmp serverCommand format["#exec kick ""%1""", _params];
			};
		};
		// Ban player from server
		// Example: [player, 'banplayer', <string playername>]
		case "banplayer":
		{
			_tmp = getText(configFile >> "CfgSettings" >> "AdminToolkit" >> "ServerCommandPassword");
			if(_tmp != "") then {
				_tmp serverCommand format["#exec ban ""%1""", _params];
			};
		};
		// Receive players from server to avoid additional BE filters (client callback required)
		// Example: [player, 'getplayers']
		case "getplayers":
		{
			_tmp = ['', true] call AdminToolkit_network_fetchPlayer;
			
			[_request, _tmp] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		// Teleport the player defined in parameter 0 to players position defined in parameter 2
		// Example: [player, 'tp2player', <string playername>]
        case "tp2player": 
        {
            _tmp = [_params] call AdminToolkit_network_fetchPlayer;
			if(!isNil "_tmp") then {
				_player setPosATL (getPosATL _tmp);
			};
        };
		// Teleport the selected player defined in parameter 2 to players position who has executed the command
		// Example: [player, 'tpplayer', <string playername>]
        case "tpplayer": 
        {
			_tmp = [_params] call AdminToolkit_network_fetchPlayer;
			if(!isNil "_tmp") then {
				_tmp setPosATL (position _player);
			};
        };
		// Teleport the admin to coordinates ATL using parameter 2
		// Example: [player, 'tp2pos', <array position>]
        case "tp2pos": {
			//search safe Position for Vehicle Teleport
			if (vehicle _player != _player) then 
			{
				_safepos = [_params, 1, 20, 5, 1, 0, 0] call BIS_fnc_findSafePos;
				vehicle _player setPos _safepos;
			} else {
				_player setPos _params;
			};
        };
		// spawn a vehicle with className defined in parameter 2 near the admin
		// Example: [player, 'getvehicle', <string vehicleClass>]
        case "getvehicle": {
            //find save position for the vehicle
			_safepos = [position _player, 1, 20, 5, 1, 0, 0] call BIS_fnc_findSafePos;
             _result = _params createVehicle _safepos;
        };
		// spawn a vehicle at the position of another player
		// Example: [player, 'givevehicle', [<string vehicleClass>, <string playername>]]
        case "givevehicle": {
            _tmp = [_params select 1] call AdminToolkit_network_fetchPlayer;
			if(!isNil "_tmp") then {
				//find save position for the vehicle
				_safepos = [position _tmp, 1, 20, 5, 1, 0, 0] call BIS_fnc_findSafePos;
				(_params select 0) createVehicle position _safepos;
			};
        };
		// get a weapon for admin who called this command
		// Example: [player, 'getweapon', [<string weaponClass>, <string magazineClass>]]
        case "getweapon": {
            // add magazine first to make sure weapon is being loaded
            _tmp = _params select 1;
            if (_tmp != "") then { _player addMagazines  [_tmp, 1]; };
            // add the weapon
            _tmp = _params select 0;
            if (_tmp != "") then { _player addWeaponGlobal _tmp; };
        };
		// get magazines defined in parameter 2
		// Example: [player, 'getammo', [<string magazineClass>]]
		case "getammo": {
			_tmp = _params select 0;
            if (_tmp != "") then { _player addMagazines  [_tmp, 1]; };
		};
		// add an item to admins inventory
		// Example: [player, 'getitem', <string ItemClass>]
		case "getitem": {
			if (_params != "") then { _player addItem _params; };
		};
		// spawn an object at a position defined in parameter 2
		// Example: [player, 'spawn', [<string className>, <array position>]]
		case "spawn": {
			_tmp = _params select 0;
			_mod = _params select 1;
			createVehicle [_tmp, _mod, [], 0, "CAN_COLLIDE"];
		};
        // build a vehicle and callback the object netId to its client for further action
        // Example: [player, 'build', <string className>]
		case "buildpers";
        case "build": {
            _tmp = createVehicle [_params, [0,0,1000], [], 0, "CAN_COLLIDE"];
            _tmp setVariable ["BIS_enableRandomization", false];
	        _tmp enableSimulationGlobal false;
            _tmp allowDamage false;
            _tmp removeAllEventHandlers "HandleDamage";
            [_tmp, owner _player] spawn {
                private['_vehicle', '_owner'];
                _vehicle = _this select 0;
                _owner = _this select 1;
                _vehicle setOwner _owner; 
                diag_log format["[ADMINTOOLKIT] Setting owner %1 on vehicle %2", str _owner, str _vehicle]; 
            };
			
            [_request, netId _tmp] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
        };
		// remoe building which is in player cursor position
		case "buildremove": {
            _tmp = objectFromNetId (_params select 0);
            if !(isNull _tmp) then {
				['BUILDINGS', (_params select 1)] call AdminToolkit_removePersistent;
				deleteVehicle _tmp;
				AdminToolkit_IsPersistentSaved = nil;
			};
        };
		
		case "buildpersistent": {
			['BUILDINGS', _params] call AdminToolkit_savePersistent;
			AdminToolkit_IsPersistentSaved = nil;
		};
		case "buildinfopersistent": {
			[_request, [count AdminToolkit_Buildings, AdminToolkit_IsPersistentSaved]] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		case "clearpersistent": {
			// clear buildings from server profile
			['BUILDINGS', nil] call AdminToolkit_removePersistent;
			[] spawn {
				_tmp = [] call AdminToolkit_saveProfile;
			};
			[_request, nil] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		case "savepersistent": {
			[] spawn {
				_tmp = [] call AdminToolkit_saveProfile;
			};
			AdminToolkit_IsPersistentSaved = true;
			[_request, nil] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
        // abort the build progress by deleting the vehicle just created
        case "buildabort": {
            _tmp = objectFromNetId _params;
            if !(isNull _tmp) then { deleteVehicle _tmp; };
        };
		// initialize the spectator mode (client callback required)
		// Example: [player, 'specplayer', <string playname>]
		case "specplayer": {
			_tmp = [_params] call AdminToolkit_network_fetchPlayer;
			if(!(isNil "_tmp") && (typeName _tmp == "OBJECT")) then {
				[_request, netId _tmp] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
			};
		};
		// Enable the god mode (client callback required)
		// Example: [player, 'godmodeon', null]
		case "godmodeon": {
			["godmode", true] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		// Disable the god mode (client callback required)
		// Example: [player, 'godmodeoff', null]
		case "godmodeoff": {
			["godmode", false] remoteExecCall ['AdminToolkit_network_receiveResponse', owner _player];
		};
		// used for mod extensions
		default {
			// load additional extension entries into the main menu (if available)
			if(isClass(missionConfigFile >> 'CfgAdminToolkitCustomMod')) then {
				if(isArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions')) then {
					_extensions = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions');
					{
						_tmp = _x select 1;
						_mod = compileFinal preprocessFileLineNumbers format["admintoolkit_server\ext\%1.sqf", _tmp];
						[_player, _request, _params] call _mod;
					} forEach _extensions;
				};
			};
		};
    }; 
}
catch
{
    diag_log format["[ADMINTOOLKIT]: EXCEPTION: %1", _exception];
};

_result;

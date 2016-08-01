/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_filter','_display','_menuIndex', '_menuName', '_menuData', '_list'];
disableSerialization;
_display = findDisplay 40000;

// receive the selected index and name from the Main Menu combobox
_menuIndex = lbCurSel RscAdminToolkitMainMenu_IDC;
_menuName = lbText [RscAdminToolkitMainMenu_IDC, _menuIndex];
_menuData = lbData [RscAdminToolkitMainMenu_IDC, _menuIndex];

AdminToolkit_MenuIndex = _menuIndex;

// ### Search filter
_filter = ctrlText RscAdminToolkitSearch_IDC;
if(_filter != "") then {
	// search filter is set, so reset the textbox
	ctrlSetText [RscAdminToolkitSearch_IDC, ""];	
	// and tell user in systemChat its filtered view
	systemChat format["Searching for '%1' in %2", _filter, _menuName];	
};

AdminToolkit_Action = nil;
// clear listbox and selection event
lbClear RscAdminToolkitList_IDC;
// clear the action menu as well
lbClear RscAdminToolkitActionMenu_IDC;

[] call AdminToolkit_onExecute;

_menuName = toLower _menuName;

switch (_menuName) do {
	case "players": {
		// get player list from server while doing a receiveRequest
		[player, 'getplayers'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];

		{
			_x call AdminToolkit_addAction;
		} forEach [
			["Send Message", "message"],
			["TP To Player",'tp2player'],
			["TP to Me", 'tpplayer'],
			["Spec Player", 'specplayer'],
			["Godmode On", 'godmodeon'],
			["Godmode Off", 'godmodeoff'],
			["Kick Player", 'kickplayer'],
			["Ban Player", 'banplayer']
		];
	};
	case "vehicles": {
		{
			_x call AdminToolkit_addAction;
		} forEach [
			["Spawn at Me",'getvehicle'],
			["Spawn at Player", 'givevehicle']
		];

		_list = "((getText(_x >> 'VehicleClass') in ['Car', 'Armored', 'Air']) and (getNumber(_x >> 'scope') == 2))" configClasses (configFile >> "CfgVehicles");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	case "weapons": {
		{
			_x call AdminToolkit_addAction;
		} forEach [
			["Get Weapon", 'getweapon'],
			["Get Ammo", 'getammo']
		];

		_list = "((getNumber(_x >> 'Type') > 0) and (getNumber(_x >> 'Type') <= 4) and (configName _x find '_Base' <= 0) and (configName _x find '_base' <= 0) and (getNumber(_x >> 'scope') == 2))" configClasses (configFile >> "CfgWeapons");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	case "buildings": {
		{
			_x call AdminToolkit_addAction;
		} forEach [
			["Build (temporary)", 'build'],
			["Build (persistent)", 'buildpers'],
			["Remove", "buildremove"],
			["Status", 'buildinfopersistent'],
			["Save Persistent", 'savepersistent'],
			["Clear Persistent", 'clearpersistent']
		];

		_list = "(configName _x isKindOf 'Building') and !(configName _x isKindOf 'ReammoBox') and (getNumber(_x >> 'scope') == 2)" configClasses (configFile>>"CfgVehicles");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	case "other": {
		{
			_x call AdminToolkit_addAction;
		} forEach [
			["Spawn", 'spawn']
		];

		_list ="((configName _x isKindOf 'ReammoBox') and (getNumber(_x >> 'scope') == 2))" configClasses (configFile >> "CfgVehicles");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	case "items": {
		{
			_x call AdminToolkit_addAction;
		} forEach [
			["Get Item", 'getitem']
		];

		_list = "(getNumber(_x >> 'Type') == 256) and (getNumber(_x >> 'scope') == 2)" configClasses (configFile >> "CfgMagazines");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	default {
		systemChat format["Verifing mod command for %1 (%2)", _menuName, _menuData];
		if(!(isNil "_menuData")) then {
			_list = call (missionNamespace getVariable[_menuData, nil]);
			[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
		};
		
	};
};

true;
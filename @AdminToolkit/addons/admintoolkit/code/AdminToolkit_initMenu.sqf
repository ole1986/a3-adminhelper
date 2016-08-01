/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_display', '_extensions', '_IDC', '_i'];
disableSerialization;
_display = findDisplay 40000;

// show the title of its tool
(_display displayCtrl RscAdminToolkitTitle_IDC) ctrlSetStructuredText parseText "<t color='#c72651'>AdminToolkit Main Menu</t>";

_extensions = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'ExcludeMenu');

// load the default menu into main menu combo box
{
	if (_extensions find _x == -1) then {
		[_x] call AdminToolkit_addMenu;
	};
} forEach AdminToolkit_MainMenu;

// load additional extension entries into the main menu (if available)
if(isClass(missionConfigFile >> 'CfgAdminToolkitCustomMod')) then {
	// CfgAdminToolkitCustomMod is supposed to be an array of strings
	if(isArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions')) then {
		_extensions = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions');
		{
			_x call AdminToolkit_addMenu;
		} forEach _extensions;
	};

	// quick access buttons QUICK 1 - 4 ( RscAdminToolkitQuickX_IDC )
	if(isArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'QuickButtons')) then {
		_i = 1;
		_extensions = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'QuickButtons');
		{
			_IDC = missionNamespace getVariable format["RscAdminToolkitQuick%1_IDC", _i];
			ctrlSetText [_IDC, _x select 0];
			buttonSetAction [_IDC, _x select 1];	
			_i = _i + 1;
		} forEach _extensions;
	};
};

if(!isNil "AdminToolkit_MenuIndex") then {
	lbSetCurSel [RscAdminToolkitMainMenu_IDC, AdminToolkit_MenuIndex];
	call AdminToolkit_menuEvents;
} else {
	(_display displayCtrl RscAdminToolkitInfo_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Choose an item from the Main Menu</t>";
};

AdminToolkit_Selection = nil;
AdminToolkit_Player = nil;

// add the event handler for the main menu
(_display displayCtrl RscAdminToolkitMainMenu_IDC) ctrlSetEventHandler ["LBSelChanged","call AdminToolkit_menuEvents"];
(_display displayCtrl RscAdminToolkitActionMenu_IDC) ctrlSetEventHandler ["LBSelChanged","call AdminToolkit_actionChanged"];

// setup the event onLbSelChanged for the centered listbox
(_display displayCtrl RscAdminToolkitList_IDC) ctrlSetEventHandler ['LBSelChanged', "call AdminToolkit_listboxChanged"];

(_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "";
(_display displayCtrl RscAdminToolkitParam_IDC) ctrlSetEventHandler ['KillFocus', "AdminToolkit_Params = ctrlText RscAdminToolkitParam_IDC"];
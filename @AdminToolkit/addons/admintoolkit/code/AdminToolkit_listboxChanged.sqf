/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_menuIndex', '_menuName', '_index', '_text', '_value', '_tmp', '_tmp2'];
_display = findDisplay 40000;

_menuIndex = lbCurSel RscAdminToolkitMainMenu_IDC;
_menuName = lbText [RscAdminToolkitMainMenu_IDC, _menuIndex];
_menuName = toLower _menuName;

// get the current selected index of the "players" listbox
_index = lbCurSel RscAdminToolkitList_IDC;
_text = lbText [RscAdminToolkitList_IDC, _index];
_value = lbData [RscAdminToolkitList_IDC, _index];

AdminToolkit_Selection = _value;

switch (_menuName) do {
    case 'players': {
        // set the selected player globally to use it in other sections
        AdminToolkit_Player = _text;
        (_display displayCtrl RscAdminToolkitInfo_IDC) ctrlSetStructuredText parseText format["Player: <t color='#FF0066'>%1</t> selected", AdminToolkit_Player];
    };
    case 'buildings': {
        // display some more information when building is selected
        _tmp = getText(configFile >> "CfgVehicles" >> _value >> "author");
        _tmp2 = getText(configFile >> "CfgVehicles" >> _value >> "vehicleClass");
        
        (_display displayCtrl RscAdminToolkitActionLabel_IDC) ctrlSetStructuredText parseText format["<t color='#FF0066'>%1</t> (%3)<br /><t size='0.8'>Author: %2</t>", _value, _tmp, _tmp2];
    };
    default {
        (_display displayCtrl RscAdminToolkitActionLabel_IDC) ctrlSetStructuredText parseText "";
    };
};

/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_title', '_ext', '_index', '_code', '_size'];
disableSerialization;

_title = _this select 0;

_index = lbAdd [RscAdminToolkitMainMenu_IDC, _title];
// if extension parameter is set, load the file!
if(count _this > 1) then {
    _size = lbSize RscAdminToolkitMainMenu_IDC;
    _ext = _this select 1;
    // initialize the extension from atk folder
    _code = compileFinal preprocessFileLineNumbers format["atk\%1.sqf", _ext];
    missionNamespace setVariable [format["AdminToolkit_mod%1",str _size], _code];

    lbSetData [RscAdminToolkitMainMenu_IDC, _index, format["AdminToolkit_mod%1",str _size]];
};

_index;
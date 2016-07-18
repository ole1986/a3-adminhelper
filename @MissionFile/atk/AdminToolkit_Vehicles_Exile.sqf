/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

private['_result'];
disableSerialization;
_result = [];

/** 
 * SEARCH
 *
 * 1801 = Search text
 * 1802 = Search button
 *
 * LISTBOX
 *
 * 1500 = Listbox
 *
 * LOWER BUTTONS IDC
 *
 * ----------------------
 * | 1701 | 1702 | 1703 |
 * ----------------------
 * | 1704 | 1705 | 1706 |
 * ----------------------
 * ----------  ----------
 * |  1707  |  |  1708  |
 * ----------  ----------
 *
 */

if (['exile_repvehicle'] call AdminToolkit_hasPermission) then {
    [1701, "Repair", "[player, 'exile_repvehicle', cursorObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_destvehicle'] call AdminToolkit_hasPermission) then {
    [1702, "Destroy", "[player, 'exile_destvehicle', cursorObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_delvehicle'] call AdminToolkit_hasPermission) then {
    [1703, "Remove", "[player, 'exile_delvehicle', cursorObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

//1704/1705/1706 lock/showcode/unlock

if (['exile_getvehicle'] call AdminToolkit_hasPermission) then {
    [1707, "Perm Spawn", "['exile_getvehicle'] call AdminToolkit_buttonAction;"] call AdminToolkit_uiButton;
};

if (['getvehicle'] call AdminToolkit_hasPermission) then {
    [1708, "Temp Spawn", "['getvehicle'] call AdminToolkit_buttonAction;"] call AdminToolkit_uiButton;
};

//need a new playermenu o,o for this stuff (nothing todo with vehicles)

if (['exile_getmoney'] call AdminToolkit_hasPermission) then {
    [1704, "Money 10K", "[player, 'exile_getmoney', 10000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_getheal'] call AdminToolkit_hasPermission) then {
    [1705, "Heal Self", "[player, 'exile_getheal'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_getscore'] call AdminToolkit_hasPermission) then {
    [1706, "Respect 1K", "[player, 'exile_getscore', 1000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

/*no free button ;(
if (['exile_kill'] call AdminToolkit_hasPermission) then {
    [1701, "Kill Player", "[player, 'exile_kill'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};
if (['getposplayer'] call AdminToolkit_hasPermission) then {
    [1702, "Position", "[player, 'getposplayer'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};
*/

_result = "(getText(_x >> 'VehicleClass') in ['ExileCars', 'ExileBikes', 'ExileChoppers','ExileBoats','ExilePlanes']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");

_result;

/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

disableSerialization;

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

if (['exile_getheal'] call AdminToolkit_hasPermission) then {
    [1701, "Heal Self", "[player, 'exile_getheal'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_getkill'] call AdminToolkit_hasPermission) then {
    [1704, "Kill Self", "[player, 'exile_getkill'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['getposplayer'] call AdminToolkit_hasPermission) then {
    [1702, "Position", "[player, 'getposplayer'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['godmodeon'] call AdminToolkit_hasPermission) then {
    [1703, "Godmode on", "[player, 'godmodeon'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};
if (['godmodeoff'] call AdminToolkit_hasPermission) then {
    [1706, "Godmode off", "[player, 'godmodeoff'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_getmoney'] call AdminToolkit_hasPermission) then {
    [1707, "Money 10K", "[player, 'exile_getmoney', 10000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_getscore'] call AdminToolkit_hasPermission) then {
    [1708, "Respect 1K", "[player, 'exile_getscore', 1000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};
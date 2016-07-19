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


if (['exile_giveheal'] call AdminToolkit_hasPermission) then {
    [1705, "Heal Player", "[player, 'exile_giveheal'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};
if (['exile_givekill'] call AdminToolkit_hasPermission) then {
    [1705, "Kill Player", "[player, 'exile_givekill'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};
if (['exile_givescore'] call AdminToolkit_hasPermission) then {
    [1705, "Respect", "[player, 'exile_givescore', 1000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};
if (['exile_takescore'] call AdminToolkit_hasPermission) then {
    [1705, "Kill Player", "[player, 'exile_takescore', 1000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};
if (['exile_givemoney'] call AdminToolkit_hasPermission) then {
    [1705, "Kill Player", "[player, 'exile_givemoney', 1000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};
if (['exile_takemoney'] call AdminToolkit_hasPermission) then {
    [1705, "Kill Player", "[player, 'exile_takemoney', 1000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

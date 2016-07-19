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

if (['exile_delvehicle'] call AdminToolkit_hasPermission) then {
    [1703, "Remove", "[player, 'exile_delvehicle', cursorObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_destvehicle'] call AdminToolkit_hasPermission) then {
    [1702, "Destroy", "[player, 'exile_destvehicle', cursorObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_getvehicle'] call AdminToolkit_hasPermission) then {
    [1707, "Perm Spawn", "['exile_getvehicle'] call AdminToolkit_buttonAction;"] call AdminToolkit_uiButton;
};

if (['getvehicle'] call AdminToolkit_hasPermission) then {
    [1708, "Temp Spawn", "['getvehicle'] call AdminToolkit_buttonAction;"] call AdminToolkit_uiButton;
};
/*
'Exile_Car_BRDM2_HQ',
'Exile_Car_BTR40_MG_Camo',
'Exile_Car_BTR40_Camo',
'Exile_Car_Golf_Black',
'Exile_Car_Hatchback_Black',
'Exile_Car_Hatchback_Sport_Admin',
'Exile_Car_HEMMT',
'Exile_Car_HMMWV_M134_Desert',
'Exile_Car_HMMWV_M2_Desert',
'Exile_Car_HMMWV_UNA_Desert',
'Exile_Car_Hunter',
'Exile_Car_Ifrit',
'Exile_Car_Ikarus_Party',
'Exile_Car_Kart_RedStone',
'Exile_Car_Lada_Hipster',
'Exile_Car_LandRover_Urban',
'Exile_Car_LandRover_Ambulance_Green',
'Exile_Car_MB4WD',
'Exile_Car_MB4WDOpen',
'Exile_Car_Octavius_Black',
'Exile_Car_Offroad_Guerilla06',
'Exile_Car_Offroad_Armed_Guerilla12',
'Exile_Car_Offroad_Repair_Civillian',
'Exile_Car_OldTractor_Red',
'Exile_Car_ProwlerUnarmed',
'Exile_Car_QilinUnarmed',
'Exile_Car_Strider',
'Exile_Car_SUV_Black',
'Exile_Car_SUVXL_Black',
'Exile_Car_SUV_Armed_Black',
'Exile_Car_Tempest',
'Exile_Car_TowTractor_White',
'Exile_Car_Tractor_Red',
'Exile_Car_UAZ_Green',
'Exile_Car_UAZ_Open_Green',
'Exile_Car_Ural_Covered_Military',
'Exile_Car_Ural_Open_Military',
'Exile_Car_V3S_Covered',
'Exile_Car_V3S_Open',
'Exile_Car_Van_Guerilla02',
'Exile_Car_Van_Box_Guerilla04',
'Exile_Car_Van_Fuel_Guerilla03',
'Exile_Car_Volha_Black',
'Exile_Car_Zamak',
'Exile_Car_QuadBike_Csat',
'Exile_Boat_MotorBoat_Police',
'Exile_Boat_RHIB',
'Exile_Boat_RubberDuck_Digital',
'Exile_Boat_SDV_CSAT',
'Exile_Boat_WaterScooter',
'Exile_Chopper_Hellcat_Green',
'Exile_Chopper_Huey_Green',
'Exile_Chopper_Huey_Armed_Green',
'Exile_Chopper_Hummingbird_Green',
'Exile_Chopper_Hummingbird_Civillian_ION',
'Exile_Chopper_Huron_Black',
'Exile_Chopper_Mohawk_FIA',
'Exile_Chopper_Orca_CSAT',
'Exile_Chopper_Taru_CSAT',
'Exile_Chopper_Taru_Covered_CSAT',
'Exile_Chopper_Taru_Transport_CSAT',
'Exile_Plane_AN2_Green',
'Exile_Plane_BlackfishInfantry',
'Exile_Plane_BlackfishVehicle',
'Exile_Plane_Ceasar',
'Exile_Plane_Cessna'
*/
_result = "(getText(_x >> 'VehicleClass') in ['ExileCars', 'ExileBikes', 'ExileChoppers','ExileBoats','ExilePlanes']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");

_result;
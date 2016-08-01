private['_result'];
disableSerialization;

['Repair', 'exile_repvehicle'] call AdminToolkit_addAction;
['Destroy', 'exile_destvehicle'] call AdminToolkit_addAction;
['Remove', 'exile_delvehicle'] call AdminToolkit_addAction;
['Perm Spawn', 'exile_getvehicle'] call AdminToolkit_addAction;
['Temporary Spawn', 'getvehicle'] call AdminToolkit_addAction;

['Get Money', 'exile_getmoney'] call AdminToolkit_addAction;
['Get Respect', 'exile_getscore'] call AdminToolkit_addAction;
['Heal Me', 'exile_getheal'] call AdminToolkit_addAction;

ExileModExec = {
    switch (AdminToolkit_Action) do {
        case "exile_repvehicle": {
            [player, 'exile_repvehicle', cursorObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        };
        case "exile_destvehicle": {
            [player, 'exile_destvehicle', cursorObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        };
        case "exile_delvehicle": {
            [player, 'exile_delvehicle', cursorObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        };
        case "exile_getvehicle": {
            [AdminToolkit_Action] call AdminToolkit_doAction;
        };
        case "getvehicle": {
            [AdminToolkit_Action] call AdminToolkit_doAction;
        };
        case "exile_getmoney": {
            [player, 'exile_getmoney', 10000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        };
        case "exile_getheal": {
            [player, 'exile_getheal'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        };
        case "exile_getscore": {
            [player, 'exile_getscore', 1000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        };
        default {
            systemChat format["Unknown action %1", AdminToolkit_Action];
         };
    };

};

["ExileModExec"] call AdminToolkit_onExecute;

_result = "(getText(_x >> 'VehicleClass') in ['ExileCars', 'ExileBikes', 'ExileChoppers','ExileBoats','ExilePlanes']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");
_result;
/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_action', '_selection', '_tmp', '_tmp2', '_IDC'];

try {
    if(count _this > 0) then {
        _action = _this select 0;
    } else {
        _action = AdminToolkit_Action;    
    };

    if(isNil "_action") throw "NO ACTION SELECTED";
    
    _IDC = RscAdminToolkitList_IDC;
   
    if((count _this) > 1) then {
        _selection = _this select 1;
    } else {
            switch (_action) do
            {
                case 'login':
                {
                    _selection = '';
                };
                case 'message': 
                {
                    if(isNil "AdminToolkit_Player") then { throw "No player selected"; };

                    _selection = [AdminToolkit_Player, AdminToolkit_Params];
                };
                case 'givevehicle':
                {
                    if(isNil "AdminToolkit_Player") then { throw "No player selected"; };
                    
                    _selection = [lbData [_IDC, lbCurSel _IDC], AdminToolkit_Player];
                };
                case 'getweapon': {
                    _tmp = lbData [_IDC, lbCurSel _IDC];
                    _tmp2 = [_tmp] call AdminToolkit_weaponMagazine;
                            
                    // parameter 1: weapon class name or empty when already in inventory
                    // parameter 2: compatible magazine
                    _selection = [_tmp, _tmp2];
                };
                case 'getammo': {
                    _tmp = lbData [_IDC, lbCurSel _IDC];
                    _tmp2 = [_tmp] call AdminToolkit_weaponMagazine;
                    
                    // parameter 1: compatible magazine
                    _selection = [_tmp2];
                };
                case 'spawn': {
                    _tmp = lbData [_IDC, lbCurSel _IDC];
                    _tmp2 = player modelToWorld [0,2, (position player) select 2];
                    
                    systemChat format["spawn: %1 %2", _tmp, str _tmp2];
                    _selection = [_tmp, _tmp2];
                };
                case 'build': {
                    _selection = lbData [_IDC, lbCurSel _IDC];
                };
                case 'buildpers': {
                    AdminToolkitIsBuildingPersistent = true;
                    _selection = lbData [_IDC, lbCurSel _IDC];
                };
                case 'buildremove': {
                    _tmp = cursorObject;
                    if !(isNull _tmp) then {
                        _selection = [netId _tmp, getPosASL _tmp];
                    } else {
                        systemChat "No building found";
                        _selection = nil;
                    };
                };
                default 
                {
                    _selection = lbData [_IDC, lbCurSel _IDC];
                };
            };
    };
    
    if !(isNil "_selection") then {
        [player, _action, _selection] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        systemChat format["Command '%1' executed", _action];
        AdminToolkit_LastAction = [_action, _selection];
    };
} catch {
    systemChat format['EXCEPTION: %1', _exception];
};
/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private["_request", "_params", '_tmp'];
try 
{
	_request = _this select 0; // what to do
    _params = _this select 1; // mixed value
    
	//systemChat format["[ADMINTOOLKIT]: networkResponse: %1", _request];
    
	switch(_request) do {
		case 'loginok': {
			missionNamespace setVariable ['AdminToolkit_permissionSet', _params];
			systemChat "AdminToolkit READY - Press F2 to open";
		};
		case 'loginfailed': {
			systemChat "AdminToolkit LOGIN FAILED - Check your server config.cpp";
		};
		case 'message': {
			_params call AdminToolkit_showMessage;
		};
		case 'getplayers': {
			lbClear RscAdminToolkitList_IDC;
			
			{
				_tmp = lbAdd [RscAdminToolkitList_IDC, _x];
				lbSetData [RscAdminToolkitList_IDC, _tmp, _x];
			} forEach _params;
		};
		case 'specplayer': {
			// get the real player object from its netId
			closeDialog 0;
			_params = objectFromNetId _params;
			[_params] call AdminToolkit_spectatePlayer;
		};
		case 'buildpers';
        case 'build': {
            // the netId of its vehicle created from the server
            [_params] call AdminToolkit_moveStart;
        };
		case 'buildinfopersistent': {
			_tmp = _params select 1;
			if (isNil "_tmp") then {
				hint parseText "<t size='1.25'>AdminToolkit</t><br /><br /><t size='1.25' color='#FF6060'>NOT SAVED YET</t>";
			} else {
				hint parseText format["<t size='1.25'>AdminToolkit</t><br />%1 persistent objects stored in serverProfile", str (_params select 0)];
			};
		};
		case 'clearpersistent': {
			hint parseText format["<t size='1.25'>AdminToolkit</t><br /><br />Persistent objects cleared<br />Buildings will be removed after server restart", str _params];
		};
		case 'savepersistent': {
			hint parseText "<t size='1.25'>AdminToolkit</t><br /><br />Persistent objects saved<br />";
		};
		case 'godmode': {
			if(_params) then { player allowDamage false; } else { player allowDamage true; };
			systemChat format["Godmode %1", str _params];
		};
	};
}
catch
{
    systemChat format["[ATK-RESPONSE]: EXCEPTION: %1", _exception];
};

/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_listboxId','_list', '_filter','_index', '_className', '_displayName', '_picture'];
disableSerialization;
// listbox IDC
_listboxId = _this select 0;
// array of config classes
_list = _this select 1;
// string filter expression
_filter = toLower (_this select 2);
_picture = "";
{
	_index = nil;
	// get the weapon, vehicle, item CLASS name, like "B_Heli_Light_01_F"
	if(typeName _x == "CONFIG") then {
		_className = configName _x;
		// get the display name of the current class
		_displayName = getText(_x >> "displayName");
		_picture = getText(_x >> "Picture");
	} else {
		_className = str _x;
		_displayName = _className;
	};
	
	if(_displayName == "") then {
		_displayName = _className;
	};
	
	if((_filter != "") and (toLower _displayName find _filter >= 0)) then {
		_index = lbAdd [_listboxId, _displayName];
	} else {
		_index = lbAdd [_listboxId, _displayName];
	};

	if(!isNil "_index") then {
		lbSetData [_listboxId, _index, _className];

		if(_picture != "") then {
			lbSetPictureRight [_listboxId, _index, _picture];
		};
	};

	
} forEach _list;

true;
/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_title', '_message', '_interval', '_display', '_control'];
disableSerialization;
_display = findDisplay 46;

_title = _this select 0;
_message = _this select 1;

_interval = 10;
if(count _this > 2) then {
    _interval = _this select 2;
};

_control = (_display displayCtrl RscAdminToolkitMessage_IDC);

_title = format["<t color='#c72651' size='2.5'>%1</t>", _title];
_control ctrlSetStructuredText parseText format["%1<br />%2", _title, _message];

// reset text after X seconds
[_control, _interval] spawn { sleep (_this select 1); (_this select 0) ctrlSetStructuredText parseText ""; };
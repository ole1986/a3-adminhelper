/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_display','_index','_text', '_value'];
_display = findDisplay 40000;

_index = lbCurSel RscAdminToolkitActionMenu_IDC;
_text = lbText [RscAdminToolkitActionMenu_IDC, _index];
_value = lbData [RscAdminToolkitActionMenu_IDC, _index];

AdminToolkit_Action = _value;

switch (_value) do {
    case 'message': {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Enter some message below:</t>";
    };
    default {
        (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "";
    };
};

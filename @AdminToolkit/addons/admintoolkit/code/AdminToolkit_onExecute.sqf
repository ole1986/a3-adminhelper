private['_command', '_index','_codeStr'];
disableSerialization;

if(count _this > 0) then {
    _codeStr = format["AdminToolkit_Params = ctrlText RscAdminToolkitParam_IDC; [] call %2", _command, _this select 0];
} else {
    _codeStr = "AdminToolkit_Params = ctrlText RscAdminToolkitParam_IDC; [] call AdminToolkit_doAction";
};

buttonSetAction [RscAdminToolkitExecute_IDC, _codeStr];
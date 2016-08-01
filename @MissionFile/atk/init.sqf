/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

// wait until main display has been loaded
[] spawn {
    private['_control', '_controlIDC', '_code'];

    _code = compileFinal preprocessFileLineNumbers 'atk\AdminToolkit_showMessage.sqf';
    missionNamespace setVariable ['AdminToolkit_showMessage', _code];

    if(isNil "AdminToolkit_receiveResponse") then {
        _code = compileFinal preprocessFileLineNumbers 'atk\AdminToolkit_receiveResponse.sqf';
        missionNamespace setVariable ['AdminToolkit_receiveResponse', _code];
    };

    disableSerialization;
    waitUntil {!isNull (findDisplay 46)};

        // create a structured text control
    _controlIDC = 1901; 
    _control = (finddisplay 46) ctrlCreate ["RscStructuredText", _controlIDC];
    _control ctrlSetPosition [0,0, 1,1];
    _control ctrlCommit 0;
    missionNamespace setVariable ['RscAdminToolkitMessage_IDC', _controlIDC];
    ["AdminToolkit", "This server is using the AdminToolkit"] call AdminToolkit_showMessage;
};
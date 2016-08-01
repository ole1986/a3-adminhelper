/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_handled'];
_handled = false;

switch (_this select 1) do
{
	// Function Key 2 (F2)
	case 0x3C: 
	{
        _handled = true;
        if (!dialog) then {
            createDialog "AdminToolkitMenu";
            call AdminToolkit_initMenu;
        } else {
            closeDialog 0;
        };
	};
    // funcktion Key 5 (F5)
    case 0x3F:
    {
        _handled = true;
        // used to repeat building the same object
        if((AdminToolkitIsBuilding <= 0) and (count AdminToolkit_LastAction > 1)) then {
            systemChat format["Repeating action '%1' with '%2'", AdminToolkit_LastAction select 0, AdminToolkit_LastAction select 1];
            AdminToolkit_LastAction call AdminToolkit_doAction;
        };
    };
    // Space bar - place object
    case 0x39:
    {
        if(AdminToolkitIsBuilding isEqualTo 1) then {
           [] call AdminToolkit_moveStop;
        };
    };
    // TAB - cancel building
    case 0x0F: {
        [true] call AdminToolkit_moveStop;
    };
    // Key E - rotate
    case 0x12: {
        if(AdminToolkitIsBuilding isEqualTo 1) then {
            if(AdminToolkitBuildingRotation <= -360 ) then { AdminToolkitBuildingRotation = 0; };
            AdminToolkitBuildingRotation = AdminToolkitBuildingRotation - 5;
        };
    };
    // Key Q - rotate
    case 0x10: {
        if(AdminToolkitIsBuilding isEqualTo 1) then {
            if(AdminToolkitBuildingRotation >= 360 ) then { AdminToolkitBuildingRotation = 0; };
            AdminToolkitBuildingRotation = AdminToolkitBuildingRotation + 5;
        };
    };
    // PAGE UP - move up
    case 0xC9: {
        if(AdminToolkitIsBuilding isEqualTo 1) then {
            AdminToolkitBuildingOffset set [2, (AdminToolkitBuildingOffset select 2) + 0.2];
        };
    };
    // LCONTROL - move down
    case 0xD1: {
        if(AdminToolkitIsBuilding isEqualTo 1) then {
            AdminToolkitBuildingOffset set [2, (AdminToolkitBuildingOffset select 2) - 0.2];
        };
    };
    // HOME - move forward
    case 0xC7: {
        if(AdminToolkitIsBuilding isEqualTo 1) then {
            AdminToolkitBuildingOffset set [1, (AdminToolkitBuildingOffset select 1) + 0.2];
        };
    };
    // END - move backward
    case 0xCF: {
        if(AdminToolkitIsBuilding isEqualTo 1) then {
            AdminToolkitBuildingOffset set [1, (AdminToolkitBuildingOffset select 1) - 0.2];
        };
    };
};
_handled;
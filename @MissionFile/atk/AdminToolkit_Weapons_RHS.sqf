/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

private['_result'];
disableSerialization;
_result = [];

// RHS weapons primary and secondary
  
_result = "configName _x find 'rhs_' >= 0 and (getNumber(_x >> 'type') == 1 or getNumber(_x >> 'type') == 4)" configClasses (configFile >> "CfgWeapons");

_result;
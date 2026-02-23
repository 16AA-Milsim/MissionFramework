#include "defines.h"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a character is entered it is validated and changes the
	correct slider it is associated with. I probably over-complicated
	this more then I had to but onChar behaves weird.
	
	PARAMS:
		0: CONTROL
		1: SCALAR (INT)
		2: STRING (Case option)
*/
private["_value","_varData","_maxRange"];
params ["_control","_code","_slider"];

disableSerialization;
if(isNull _control) exitWith {}; //POOOOOP
if (missionNamespace getVariable ["tawvd_addon_disable",false]) exitWith {};
if ([] call TAWVD_fnc_isAceViewDistanceActive) exitWith {};

_maxRange = if(!isNil "tawvd_maxRange") then {tawvd_maxRange} else {20000};
_value = parseNumber (ctrlText _control);
if(_value > _maxRange OR _value < 100) exitwith {};

_varData = switch (_slider) do {
	case "ground": {["tawvd_foot",INFANTRY_SLIDER]};
	case "vehicle": {["tawvd_car",GROUND_SLIDER]};
	case "air": {["tawvd_air",AIR_SLIDER]};
	case "object": {["tawvd_object",OBJECT_SLIDER]};
	case "drone": {["tawvd_drone",DRONE_SLIDER]};
	default {["tawvd_foot",INFANTRY_SLIDER]};
};

SVAR_MNS [SEL(_varData,0),round(_value)];
sliderSetPosition [SEL(_varData,1),round(_value)];
[] call TAWVD_fnc_updateViewDistance;

if(tawvd_syncObject) then {
	sliderSetPosition[OBJECT_SLIDER, tawvd_object];
	ctrlSetText[OBJECT_EDIT,str(tawvd_object)];
};

[] call TAWVD_fnc_persistSettingsSafe;

#include "defines.h"
/*
	Description:
	Applies a save slot's settings to active mission variables.

	Params:
		0: NUMBER|ARRAY - Slot index (0-9) or raw slot data array

	Returns:
		BOOL
*/
params [["_index",-1,[0,[]]]];
private _saveData = [];
if (_index isEqualType []) then {
	_saveData = _index;
} else {
	if (_index < 0 || _index > 9) exitWith {false};
	_saveData = profileNamespace getVariable [format["tawvd_slot_%1",_index],[]];
};

if !(_saveData isEqualType [] && {count _saveData >= 2}) exitWith {false};

private _foot = if ((count _saveData) > 1 && {(SEL(_saveData,1)) isEqualType 0}) then {SEL(_saveData,1)} else {viewDistance};
private _car = if ((count _saveData) > 2 && {(SEL(_saveData,2)) isEqualType 0}) then {SEL(_saveData,2)} else {_foot};
private _air = if ((count _saveData) > 3 && {(SEL(_saveData,3)) isEqualType 0}) then {SEL(_saveData,3)} else {_car};
private _drone = _air;
private _object = _air;
private _syncObject = missionNamespace getVariable ["tawvd_syncObject",true];
private _terrain = missionNamespace getVariable ["tawvd_terrain","norm"];
if !(_terrain isEqualType "") then {_terrain = "norm";};
_terrain = toLower _terrain;
if !(_terrain in ["none","low","norm","high"]) then {_terrain = "norm";};

if ((count _saveData) > 5 && {(SEL(_saveData,4)) isEqualType 0} && {(SEL(_saveData,5)) isEqualType 0}) then {
	_drone = SEL(_saveData,4);
	_object = SEL(_saveData,5);
	if ((count _saveData) > 6 && {(SEL(_saveData,6)) isEqualType true}) then {
		_syncObject = SEL(_saveData,6);
	};
} else {
	if ((count _saveData) > 4 && {(SEL(_saveData,4)) isEqualType 0}) then {
		_object = SEL(_saveData,4);
	};
	if ((count _saveData) > 5 && {(SEL(_saveData,5)) isEqualType true}) then {
		_syncObject = SEL(_saveData,5);
	};
};

if ((count _saveData) > 7 && {(SEL(_saveData,7)) isEqualType ""}) then {
	private _terrainCandidate = toLower (SEL(_saveData,7));
	if (_terrainCandidate in ["none","low","norm","high"]) then {
		_terrain = _terrainCandidate;
	};
};

SVAR_MNS ["tawvd_foot",_foot];
SVAR_MNS ["tawvd_car",_car];
SVAR_MNS ["tawvd_air",_air];
SVAR_MNS ["tawvd_drone",_drone];
SVAR_MNS ["tawvd_object",_object];
SVAR_MNS ["tawvd_syncObject",_syncObject];
SVAR_MNS ["tawvd_terrain",_terrain];

[_terrain,true,false] call TAWVD_fnc_onTerrainChanged;

[] call TAWVD_fnc_updateViewDistance;
[true] call TAWVD_fnc_persistSettingsSafe;
true

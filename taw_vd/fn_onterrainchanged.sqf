#include "defines.h"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates terrain grid mode, UI underline state, and persists the selected
	terrain mode for profiles.

	Params:
		0: STRING - "none" | "low" | "norm" | "high"
		1: BOOL - apply terrain grid change (default: true)
		2: BOOL - persist to profileNamespace (default: true)
*/
params [
	["_type","",[""]],
	["_applyGrid",true,[true]],
	["_persist",true,[true]]
];
if (_type isEqualTo "") exitWith {};

_type = toLower _type;
if !(_type in ["none","low","norm","high"]) then {_type = "norm";};

private _disableNone = missionNamespace getVariable ["tawvd_disablenone",false];
if !(_disableNone isEqualType true) then {_disableNone = false;};

private _resolvedType = _type;
if (_disableNone && {_resolvedType isEqualTo "none"}) then {
	_resolvedType = "norm";
};

if (_applyGrid) then {
	switch (_resolvedType) do {
		case "none": {setTerrainGrid 50;};
		case "low": {setTerrainGrid 30;};
		case "norm": {setTerrainGrid 12.5;};
		case "high": {setTerrainGrid 3.125;};
	};
};

SVAR_MNS ["tawvd_terrain",_resolvedType];

disableSerialization;
private _display = findDisplay MENU_IDD;
if (!isNull _display) then {
	{
		(_display displayCtrl _x) ctrlShow false;
	} forEach [TERRAIN_UL_NONE,TERRAIN_UL_LOW,TERRAIN_UL_NORMAL,TERRAIN_UL_HIGH];

	private _underlineIDC = switch (_resolvedType) do {
		case "none": {TERRAIN_UL_NONE};
		case "low": {TERRAIN_UL_LOW};
		case "high": {TERRAIN_UL_HIGH};
		default {TERRAIN_UL_NORMAL};
	};

	(_display displayCtrl _underlineIDC) ctrlShow true;
	(_display displayCtrl TERRAIN_NONE) ctrlEnable (!_disableNone);

	private _noneText = _display displayCtrl TERRAIN_NONE_TEXT;
	if (!isNull _noneText) then {
		if (_disableNone) then {
			_noneText ctrlSetTextColor [0.35,0.35,0.35,1];
		} else {
			_noneText ctrlSetTextColor [1,1,1,1];
		};
	};
};

if (_persist) then {
	[] call TAWVD_fnc_persistSettingsSafe;
};

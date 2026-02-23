#include "defines.h"
/*
	Author: Bryan "Tonic" Boardwine, patched by Codex

	Description:
	Startup initialization for TAW View Distance.
	Loads profile values, applies default slot/profile, persists values,
	and registers the interaction action.

	Returns:
		NUMBER - addAction id for non-ACE mode, otherwise -1.
*/
params [["_retry",false,[false]]];

private _actionID = -1;
private _terrainFromGrid = {
	params [["_grid",getTerrainGrid,[0]]];
	if (_grid > 40) exitWith {"none"};
	if (_grid > 20) exitWith {"low"};
	if (_grid > 5) exitWith {"norm"};
	"high"
};

private _missionPreset = [];
private _missionPresetValid = false;
private _presetFoot = missionNamespace getVariable ["tawvd_foot",-1];
private _presetCar = missionNamespace getVariable ["tawvd_car",-1];
private _presetAir = missionNamespace getVariable ["tawvd_air",-1];
private _presetDrone = missionNamespace getVariable ["tawvd_drone",-1];
private _presetObject = missionNamespace getVariable ["tawvd_object",-1];
private _presetSync = missionNamespace getVariable ["tawvd_syncObject",true];
private _presetTerrain = missionNamespace getVariable ["tawvd_terrain",""];
if !(_presetTerrain isEqualType "") then {_presetTerrain = "";};
_presetTerrain = toLower _presetTerrain;

if ((_presetFoot isEqualType 0) && {_presetFoot >= 100}) then {
	private _missionCar = if ((_presetCar isEqualType 0) && {_presetCar >= 100}) then {_presetCar} else {_presetFoot};
	private _missionAir = if ((_presetAir isEqualType 0) && {_presetAir >= 100}) then {_presetAir} else {_missionCar};
	private _missionDrone = if ((_presetDrone isEqualType 0) && {_presetDrone >= 100}) then {_presetDrone} else {_missionAir};
	private _missionObject = if ((_presetObject isEqualType 0) && {_presetObject >= 100}) then {_presetObject} else {_missionAir};
	private _missionSync = if (_presetSync isEqualType true) then {_presetSync} else {true};
	private _missionTerrain = if (_presetTerrain in ["none","low","norm","high"]) then {_presetTerrain} else {[getTerrainGrid] call _terrainFromGrid};

	_missionPreset = [
		"Mission Preset",
		round _presetFoot,
		round _missionCar,
		round _missionAir,
		round _missionDrone,
		round _missionObject,
		_missionSync,
		_missionTerrain
	];
	_missionPresetValid = true;
};

if (isNil {profileNamespace getVariable "tawvd_foot"}) then {
	profileNamespace setVariable ["tawvd_foot",viewDistance];
	profileNamespace setVariable ["tawvd_car",viewDistance];
	profileNamespace setVariable ["tawvd_air",viewDistance];
	profileNamespace setVariable ["tawvd_drone",viewDistance];
	profileNamespace setVariable ["tawvd_object",viewDistance];
	profileNamespace setVariable ["tawvd_syncObject",true];
	profileNamespace setVariable ["tawvd_terrain",[getTerrainGrid] call _terrainFromGrid];
	saveProfileNamespace;
};

tawvd_foot = profileNamespace getVariable ["tawvd_foot",viewDistance];
tawvd_car = profileNamespace getVariable ["tawvd_car",viewDistance];
tawvd_air = profileNamespace getVariable ["tawvd_air",viewDistance];
tawvd_drone = profileNamespace getVariable ["tawvd_drone",viewDistance];
tawvd_object = profileNamespace getVariable ["tawvd_object",viewDistance];
tawvd_syncObject = profileNamespace getVariable ["tawvd_syncObject",true];
tawvd_terrain = profileNamespace getVariable ["tawvd_terrain",[getTerrainGrid] call _terrainFromGrid];
if !(tawvd_terrain isEqualType "") then {tawvd_terrain = "norm";};
tawvd_terrain = toLower tawvd_terrain;
if !(tawvd_terrain in ["none","low","norm","high"]) then {
	tawvd_terrain = [getTerrainGrid] call _terrainFromGrid;
};

private _aceActive = [] call TAWVD_fnc_isAceViewDistanceActive;
private _defaultProfile = profileNamespace getVariable ["tawvd_defaultProfile",[]];
private _defaultSlot = profileNamespace getVariable ["tawvd_defaultSlot",-1];
if !(_defaultSlot isEqualType 0) then {
	_defaultSlot = parseNumber str _defaultSlot;
};

private _applied = false;

if (!_aceActive) then {
	if ((_defaultProfile isEqualType []) && {(count _defaultProfile) >= 2} && {!(isNil "TAWVD_fnc_applySlot")}) then {
		_applied = [_defaultProfile] call TAWVD_fnc_applySlot;
	};

	if (!_applied && {_defaultSlot >= 0} && {_defaultSlot <= 9} && {!(isNil "TAWVD_fnc_applySlot")}) then {
		_applied = [_defaultSlot] call TAWVD_fnc_applySlot;
	};

	if (!_applied && _missionPresetValid && {!(isNil "TAWVD_fnc_applySlot")}) then {
		_applied = [_missionPreset] call TAWVD_fnc_applySlot;
	};

	if (!_applied) then {
		if !(isNil "TAWVD_fnc_updateViewDistance") then {
			[] call TAWVD_fnc_updateViewDistance;
		};
		if !(isNil "TAWVD_fnc_persistSettingsSafe") then {
			[true] call TAWVD_fnc_persistSettingsSafe;
		} else {
			saveProfileNamespace;
		};
	};
} else {
	if !(isNil "TAWVD_fnc_updateViewDistance") then {
		[] call TAWVD_fnc_updateViewDistance;
	};
	if !(isNil "TAWVD_fnc_persistSettingsSafe") then {
		[true] call TAWVD_fnc_persistSettingsSafe;
	} else {
		saveProfileNamespace;
	};
};

if !(isNil "TAWVD_fnc_onTerrainChanged") then {
	[tawvd_terrain,true,true] call TAWVD_fnc_onTerrainChanged;
};

if (!_retry) then {
	if(!isNil "ace_interact_menu_fnc_createAction") then {
		private _aceActionID = ["tawvd_menu","View Distance Settings","",{[] call TAWVD_fnc_openMenu},{true}] call ace_interact_menu_fnc_createAction;
		[typeOf player, 1, ["ACE_SelfActions"], _aceActionID] call ace_interact_menu_fnc_addActionToClass;
	} else {
		_actionID = player addAction["<t color='#FF0000'>Settings</t>",TAWVD_fnc_openMenu,[],-99,false,false,"",'' ];
	};
};

if (!_retry) then {
	[] spawn {
		uiSleep 5;
		if (!hasInterface || {missionNamespace getVariable ["tawvd_addon_disable",false]}) exitWith {};

		private _targetVD = missionNamespace getVariable ["tawvd_foot",-1];
		if ((_targetVD isEqualType 0) && {_targetVD > 0} && {abs(viewDistance - _targetVD) > 5}) then {
			[true] call TAWVD_fnc_startupInit;
		};

		uiSleep 10;
		if (!hasInterface || {missionNamespace getVariable ["tawvd_addon_disable",false]}) exitWith {};
		_targetVD = missionNamespace getVariable ["tawvd_foot",-1];
		if ((_targetVD isEqualType 0) && {_targetVD > 0} && {abs(viewDistance - _targetVD) > 5}) then {
			[true] call TAWVD_fnc_startupInit;
		};
	};
};

_actionID

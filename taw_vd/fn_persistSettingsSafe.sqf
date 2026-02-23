/*
	Author: Bryan "Tonic" Boardwine, patched by Codex

	Description:
	Safe persistence wrapper used during startup and UI interactions.
	Uses TAWVD_fnc_persistSettings when available, otherwise falls back
	to direct profileNamespace persistence.

	Params:
		0: BOOL - Force an immediate saveProfileNamespace.
*/
params [["_forceSave",false,[false]]];

if !(isNil "TAWVD_fnc_persistSettings") exitWith {
	[_forceSave] call TAWVD_fnc_persistSettings;
	true
};

if !(isNil "tawvd_foot") then {profileNamespace setVariable ["tawvd_foot",tawvd_foot];};
if !(isNil "tawvd_car") then {profileNamespace setVariable ["tawvd_car",tawvd_car];};
if !(isNil "tawvd_air") then {profileNamespace setVariable ["tawvd_air",tawvd_air];};
if !(isNil "tawvd_drone") then {profileNamespace setVariable ["tawvd_drone",tawvd_drone];};
if !(isNil "tawvd_object") then {profileNamespace setVariable ["tawvd_object",tawvd_object];};
if !(isNil "tawvd_syncObject") then {profileNamespace setVariable ["tawvd_syncObject",tawvd_syncObject];};
if !(isNil "tawvd_terrain") then {profileNamespace setVariable ["tawvd_terrain",tawvd_terrain];};

private _lastSave = missionNamespace getVariable ["tawvd_lastProfileSave",-1];
if(_forceSave || {_lastSave < 0} || {(diag_tickTime - _lastSave) > 1}) then {
	saveProfileNamespace;
	missionNamespace setVariable ["tawvd_lastProfileSave",diag_tickTime];
};

true

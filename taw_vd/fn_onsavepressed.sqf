#include "defines.h"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the view distance dependant on whether the player
	is on foot, a car or an aircraft.
*/
private ["_saveIndex","_saveName","_slotData"];
_saveIndex = lbCurSel SAVES_LIST;
_saveName = ctrlText SLOT_NAME;
if(_saveIndex < 0) exitWith {hint "Select a save slot first.";};
if(_saveName isEqualTo "") then {_saveName = format["Save Slot %1",_saveIndex];};

_slotData = [
	_saveName,
	tawvd_foot,
	tawvd_car,
	tawvd_air,
	tawvd_drone,
	tawvd_object,
	tawvd_syncObject,
	missionNamespace getVariable ["tawvd_terrain","norm"]
];
SVAR_PNS [format["tawvd_slot_%1",_saveIndex],_slotData];

if ((profileNamespace getVariable ["tawvd_defaultSlot",-1]) isEqualTo _saveIndex) then {
	SVAR_PNS ["tawvd_defaultProfile",+_slotData];
};

[true] call TAWVD_fnc_persistSettingsSafe;
[] call TAWVD_fnc_openSaveManager;

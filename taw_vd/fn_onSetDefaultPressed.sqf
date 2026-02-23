#include "defines.h"
/*
	Description:
	Sets the currently selected save slot as default for next mission start.
*/
private _saveIndex = lbCurSel SAVES_LIST;
if (_saveIndex < 0) exitWith {hint "Select a save slot first.";};

private _saveData = profileNamespace getVariable [format["tawvd_slot_%1",_saveIndex],[]];
if (_saveData isEqualTo []) exitWith {hint "Cannot set an empty slot as default.";};
private _saveName = ctrlText SLOT_NAME;
if (_saveName isEqualTo "") then {_saveName = SEL(_saveData,0);};
private _defaultProfile = +_saveData;
_defaultProfile set [0,_saveName];
if ((count _defaultProfile) < 8) then {
	_defaultProfile set [7,missionNamespace getVariable ["tawvd_terrain","norm"]];
};

SVAR_PNS ["tawvd_defaultSlot",_saveIndex];
SVAR_PNS ["tawvd_defaultProfile",_defaultProfile];
[true] call TAWVD_fnc_persistSettingsSafe;
[] call TAWVD_fnc_openSaveManager;
lbSetCurSel [SAVES_LIST,_saveIndex];

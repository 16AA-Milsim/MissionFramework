/*
	Description:
	Returns true when ACE View Distance is active and this script should stand down.

	Override:
		tawvd_allowWithACE = true;
*/
if (missionNamespace getVariable ["tawvd_allowWithACE",false]) exitWith {false};
if !(isClass (configFile >> "CfgPatches" >> "ace_viewdistance")) exitWith {false};
if (isNil "ace_viewdistance_enabled") exitWith {false};

ace_viewdistance_enabled

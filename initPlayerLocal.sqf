params ["_player", "_didJIP"];
player addGoggles "rhs_googles_black"; //add to every player
waitUntil {!isNull player};

if (player getVariable ["16AA_Laserdesignator_Backpack", false]) then {
  player addItemToBackpack "UK3CB_BAF_Soflam_Laserdesignator";
};

if (player getVariable ["16AA_UAV_Backpack", false]) then {
  player addItemToBackpack "B_UavTerminal";
};


if (player getVariable ["16AA_AirCommandChannel", false]) then {
	l6AA_AirCommandChannelID radioChannelAdd [player];
	[{setCurrentChannel (l6AA_AirCommandChannelID + 5);},nil,3] call CBA_fnc_waitAndExecute;
	addMissionEventHandler ["MapSingleClick", {
		params ["_units", "_pos", "_alt", "_shift"];
		setCurrentChannel (l6AA_AirCommandChannelID + 5);
	}];
};

//restore access to AirCommand Channel
_player addMPEventHandler ["MPRespawn", {
	params ["_unit", "_corpse"];
	if (player getVariable ["16AA_AirCommandChannel", false]) then {
		l6AA_AirCommandChannelID radioChannelAdd [player];
		setCurrentChannel (l6AA_AirCommandChannelID + 5);
	};
}];
[{
    [] call l6AA_dzf_fnc_setUnitInsignia;
}, nil, 50] call CBA_fnc_waitAndExecute;


params ["_player", "_didJIP"];
private _group_player = groupId (group player); //get player group

_player addGoggles "UK3CB_G_Tactical_Black_Tactical_Gloves_Tan"; //add to every player
waitUntil {!isNull player};

if (_player getVariable ["16AA_Laserdesignator_Backpack", false]) then {
  _player addItemToBackpack "UK3CB_BAF_Soflam_Laserdesignator";
};

// Define groups
group_1pl = ["1 Plt HQ","1-1","1-2","1-3"];
group_2pl = ["2 Plt HQ","2-1","2-2","2-3"];
group_3pl = ["3 Plt HQ","3-1","3-2"];
group_4pl = ["4 Plt HQ", "4-1"];
group_13aasr = ["4-3"];
group_16csmr = ["4-4"];
group_jfist = ["7-0"];
group_hq = ["Coy HQ"];
group_itc = ["ITC"];
group_jhc = ["JHC"];
group_mi = ["MI"];

[_group_player] call l6AA_fnc_disableRemoteSensors;
[_group_player] call l6AA_fnc_setInsignias;
[_player] call l6AA_fnc_restoreInsigniasOnRespawn;

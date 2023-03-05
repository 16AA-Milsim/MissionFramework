player addGoggles "Rev_Shades_Yellow"; //add to every player
waitUntil {!isNull player};

if (player getVariable ["16AA_Laserdesignator_Backpack", false]) then {
  player addItemToBackpack "UK3CB_BAF_Soflam_Laserdesignator";
};

// Set speech volume to 0.25
FW_Acre_Volume_Value = 0.25; 
 
[0.4] call acre_api_fnc_setSelectableVoiceCurve; 
 
[{ 
    acre_sys_gui_volumeLevel = FW_Acre_Volume_Value; 
}, [], 1] call CBA_fnc_waitAndExecute;

// Set appropriate 16AA Drop Zone Flash for the players
_group_player = groupId (group player);
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
group_pf = ["6-0"];
[player, ""] call BIS_fnc_setUnitInsignia; 
switch true do
{
	case (_group_player in group_1pl): {[player,"16aa_w_gs_1pl_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_2pl): {[player,"16aa_w_gs_2pl_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_3pl): {[player,"16aa_w_gs_3pl_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_4pl): {[player,"16aa_w_gs_4pl_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_13aasr): {[player,"16aa_w_gs_13aasr_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_16csmr): {[player,"16aa_w_gs_16csmr_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_jfist): {[player,"16aa_w_gs_jfist_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_hq): {[player,"16aa_w_gs_hq_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_itc): {[player,"16aa_w_gs_itc_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_jhc): {[player,"16aa_w_gs_jhc_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_mi): {[player,"16aa_w_gs_mi_dzf"] call BIS_fnc_setUnitInsignia;};
	case (_group_player in group_pf): {[player,"16aa_eagle_gsub"] call BIS_fnc_setUnitInsignia;};
	default {[player,"16aa_w_eagle_gsub"] call BIS_fnc_setUnitInsignia;};
};

//Event Handlers
//restore radio settings on respawn
player addEventHandler ["Respawn",
    {        
		_newRadioList = [];
        _newRadioList set [0, 1];
        _newRadioList set [1, 1];
        _newRadioList set [2, 1];
        params ["_unit", "_corpse", "_newRadioList"];
		{
			private _radioType = _x;
			private _radios = [_radioType, _corpse] call acre_api_fnc_getAllRadiosByType; //return array of unique Radio IDs from corpse
			private _radioChannel = [];
			private _radioVolume = [];
			private _radioSpatial = [];
			private _pttList = [];
			_pttRadioList = [] call acre_api_fnc_getMultiPushToTalkAssignment; //return array of radioIDs assigned to each PTT key
			{
				//iterate through all radios by IDs, add their properties to arrays in a set order
				private _radioID = _x;
				private _currentChannel = [_radioID] call acre_api_fnc_getRadioChannel; //get channel of Radio
				private _currentVolume = [_radioID] call acre_api_fnc_getRadioVolume; //get volume of Radio
				private _currentSpatial = [_radioID] call acre_api_fnc_getRadioSpatial; //get spatial of Radio
				switch (_radioID) do 
				{ 
					//if ptt1 radio, add int 1
					case (_pttRadioList select 0): 
					{ 
						(_pttList pushBack 1); 
					}; 
					//if ptt2 radio, add int 2
					case (_pttRadioList select 1): 
					{ 
						(_pttList pushBack 2); 
					}; 
					//if ptt3 radio, add int 3
					case (_pttRadioList select 2): 
					{ 
						(_pttList pushBack 3); 
					}; 
					//if radio without ptt set, add int 9
					default 
					{ 
						(_pttList pushBack 9); 
					}; 
				};
				_radioChannel pushBack _currentChannel; //add channel to radioChannel
				_radioVolume pushBack _currentVolume; //add volume to radioVolume
				_radioSpatial pushBack _currentSpatial; //add spatial to radioSpatial
			} forEach _radios;
			//now we have four arrays - radioChannel, radioVolume, radioSpatial and pttList setup for every radio the player had
			[{
				params ["_newUnit", "_radioType", "_radioChannel", "_radioVolume", "_radioSpatial", "_pttList", "_newRadioList"];
				private _radios = [_radioType, _newUnit] call acre_api_fnc_getAllRadiosByType;
				{
					//iterate through all NEW radios by IDs, add properties in the order set above
					private _radioID = _x;
					private _channel = _radioChannel select _forEachIndex;
					private _volume = _radioVolume select _forEachIndex;
					private _spatial = _radioSpatial select _forEachIndex;
					private _pttKey = _pttList select _forEachIndex;
					if (_pttKey == 1) then {_newRadioList set [0, _radioID]}; //assign new radio to PTT slot 1
					if (_pttKey == 2) then {_newRadioList set [1, _radioID]}; //assign new radio to PTT slot 2
					if (_pttKey == 3) then {_newRadioList set [2, _radioID]}; //assign new radio to PTT slot 3
					[_radioID, _channel] call acre_api_fnc_setRadioChannel;
					[_radioID, _volume] call acre_api_fnc_setRadioVolume;
					[_radioID, _spatial] call acre_api_fnc_setRadioSpatial;
				} forEach _radios;
			}, [_newUnit, _radioType, _radioChannel, _radioVolume, _radioSpatial, _pttList, _newRadioList], 3] call CBA_fnc_waitAndExecute; //delay 3 secs for new radio IDs
		} forEach ["ACRE_PRC77", "ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC343", "ACRE_SEM52SL", "ACRE_SEM70", "ACRE_BF888S"]; // for each available ACRE RADIO
		[{
			params ["_newRadioList"];
			//assign the radio IDs of those with assigned PTTs
			private _ptt1 = _newRadioList select 0;
			private _ptt2 = _newRadioList select 1; 
			private _ptt3 = _newRadioList select 2; 
			_pttNewRadioList = [ [_ptt1, _ptt2, _ptt3] ] call acre_api_fnc_setMultiPushToTalkAssignment; //assign new radios to old PTT setup
		}, [_newRadioList], 5] call CBA_fnc_waitAndExecute; //delay 5 secs to allow above block to complete
	}
];

//copy insignia from corpse to respawned player
params ["_player"];
_player addMPEventHandler ["MPRespawn", {
	params ["_unit", "_corpse"];
	private _insignia = [_corpse] call BIS_fnc_getUnitInsignia;
	[_unit, _insignia] spawn {
		params ["_unit", "_insignia"];
		sleep 1;
		isNil {
			_unit setVariable ["BIS_fnc_setUnitInsignia_class", nil]; // you can also do [_unit, ""] call BIS_fnc_setUnitInsignia, but this way is faster (plus no network traffic)
			[_unit, _insignia] call BIS_fnc_setUnitInsignia;
		};
	};
}];
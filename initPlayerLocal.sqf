params ["_player", "_didJIP"];

// Wait until the player object is fully initialized and exists in the game world.
waitUntil {!isNull player};


// --- EQUIPMENT DISTRIBUTION ---

// TEMP DISABLED - If the player wears specific NVGs on their helmet -> move them to their inventory
// if (hmd player == "rhsusf_ANPVS_15") then {
// 	player unlinkItem "rhsusf_ANPVS_15";
// 	player addItem "rhsusf_ANPVS_15";
// };

// Add tactical glasses to everyone's inventory (not equipped by default)
if ((roleDescription player) != "Recruit") then {
	player addItem "rhs_googles_black";
};

// Define allowed groups for Greenmag Speedloader distribution
private _speedloaderAllowedGroups = [
	"1 Plt HQ", "1-1", "1-2", "1-3",
	"4 Plt HQ", "4-1", "4-3", "4-4",
	"7RHA", "Coy HQ"
];

// Add Greenmag Speedloader if missing from inventory and in allowed group
if ((groupId (group player) in _speedloaderAllowedGroups) && !("greenmag_item_speedloader" in (assignedItems player) + (items player) + (uniformItems player) + (vestItems player) + (backpackItems player))) then {
	player addItem "greenmag_item_speedloader";
};

if (
    player getVariable ["16AA_Laserdesignator_Backpack", false] &&
    !("UK3CB_BAF_Soflam_Laserdesignator" in (items player + backpackItems player + assignedItems player))
) then {
    player addItemToBackpack "UK3CB_BAF_Soflam_Laserdesignator";
};

if (
    player getVariable ["16AA_UAV_Backpack", false] &&
    !("16AA_UAV_Backpack" in (items player + backpackItems player + assignedItems player))
) then {
    player addItemToBackpack "16AA_UAV_Backpack";
};

// Set the Greenmag skill coefficient for the local player.
_player setVariable ["greenmag_main_MagSkillCoef", 0.7, true];


// --- AIR COMMAND CHANNEL ---

if (player getVariable ["16AA_AirCommandChannel", false]) then {
	l6AA_AirCommandChannelID radioChannelAdd [player]; // Add player to the custom radio channel.
	// Set current channel after a short delay to ensure channel is ready.
	[{setCurrentChannel (l6AA_AirCommandChannelID + 5);},nil,3] call CBA_fnc_waitAndExecute;
	
	// Add a mission event handler to switch back to the Air Command Channel on map click.
	addMissionEventHandler ["MapSingleClick", {
		params ["_units", "_pos", "_alt", "_shift"];
		setCurrentChannel (l6AA_AirCommandChannelID + 5);
	}];
};

// --- ZEUS SPLENDID CAMERA ACCESS ---
missionNamespace setVariable ["l6AA_fnc_initSplendidCamAceAction", {
	params [["_unit", player, [objNull]]];
	if (isNull _unit) exitWith {};
	if (!local _unit) exitWith {};
	if (isNil "ace_interact_menu_fnc_createAction") exitWith {};
	if (_unit getVariable ["l6AA_splendidCamAceAdded", false]) exitWith {};

	private _action = [
		"l6AA_SplendidCamera",
		"Open Splendid Camera",
		"",
		{ [] call BIS_fnc_camera; },
		{ !isNull (getAssignedCuratorLogic (_this select 1)) }
	] call ace_interact_menu_fnc_createAction;

	[_unit, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	_unit setVariable ["l6AA_splendidCamAceAdded", true];
}];

[] spawn {
	waitUntil { !isNull player };
	[player] call (missionNamespace getVariable ["l6AA_fnc_initSplendidCamAceAction", {}]);
};

// Restore access to Air Command Channel and ACE Greenmag setting upon player respawn.
_player addMPEventHandler ["MPRespawn", {
	params ["_unit", "_corpse"]; // _unit is the newly respawned player unit.
	
	// Restore Air Command Channel access
	if (_unit getVariable ["16AA_AirCommandChannel", false]) then {
		l6AA_AirCommandChannelID radioChannelAdd [_unit]; // Add respawned unit to the channel.
		setCurrentChannel (l6AA_AirCommandChannelID + 5); // Set it as current channel.
	};

	// Restore ACE Greenmag setting on respawn
	_unit setVariable ["greenmag_main_MagSkillCoef", 0.7, true];

	// Reattach ACE self action on the new body.
	[_unit] call (missionNamespace getVariable ["l6AA_fnc_initSplendidCamAceAction", {}]);
}];

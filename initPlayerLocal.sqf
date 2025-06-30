params ["_player", "_didJIP"];

// Wait until the player object is fully initialized and exists in the game world.
waitUntil {!isNull player};


// --- EQUIPMENT DISTRIBUTION ---

// If the player wears specific NVGs on their helmet -> move them to their inventory
if (hmd player == "rhsusf_ANPVS_15") then {
	player unlinkItem "rhsusf_ANPVS_15";
	player addItem "rhsusf_ANPVS_15";
};

// Add tactical glasses to everyone's inventory (not equipped by default)
if ((roleDescription player) != "Recruit") then {
	player addItem "rhs_googles_black";
};

// Define allowed groups for Greenmag Speedloader distribution
private _speedloaderAllowedGroups = [
	"1 Plt HQ", "1-1", "1-2", "1-3",
	"4 Plt HQ", "4-1", "4-3", "4-4",
	"Coy HQ"
];

// Add Greenmag Speedloader if missing from inventory and in allowed group
if ((groupId (group player) in _speedloaderAllowedGroups) && !("greenmag_item_speedloader" in (assignedItems player) + (items player) + (uniformItems player) + (vestItems player) + (backpackItems player))) then {
	player addItem "greenmag_item_speedloader";
};

if (player getVariable ["16AA_Laserdesignator_Backpack", false]) then {
	player addItemToBackpack "UK3CB_BAF_Soflam_Laserdesignator";
};

if (player getVariable ["16AA_UAV_Backpack", false]) then {
	player addItemToBackpack "B_UavTerminal";
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
}];

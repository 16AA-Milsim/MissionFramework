//anything in here gets executed on all clients+server on mission start (be aware of locality! and scripts with global effect)
//add Mission specific scripts at the end!
diag_log "--------------------[LOGGING] [MISSIONSTART]--------------------"; //Mission Start logging
diag_log "----------------------------------------------------------------";
diag_log format ["--------------------[LOGGING] [%1]--------------------", briefingName];
diag_log "----------------------------------------------------------------";
diag_log "--------------------[LOGGING] [MISSIONSTART]--------------------";

if (!isDedicated && !hasInterface && isMultiplayer) then { //anything in here gets executed on the headless clients
    //[] execVM "scripts\show_fps.sqf";   //excute show FPS marker
    //diag_log "--------------[LOGGING] [Executed show_fps on HC]---------------"; //this will only show in  the HCs logs
    //not needed anymore, done by ZHC mod
};

execVM "scripts\logging.sqf"; //run logging script

// Removes the ability to turn grass off
tawvd_disablenone = true;
tawvd_foot = 1600;
tawvd_car = 1600;
tawvd_air = 1600;
tawvd_drone = 1600;
tawvd_object = tawvd_foot;

// Disables ambient life and enables enviroment sounds
sleep 0.1; //to make sure the following takes effect, see BIS wiki
enableEnvironment [false, true];

// Friendly fire safe check
player addrating 90000;

//ACRE Channel Setup
["ACRE_PRC152", "default", 1, "description", "1 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 2, "description", "2 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 3, "description", "3 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 4, "description", "4 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 5, "description", "Coy Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 6, "description", "Fires Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 7, "description", "Flight (Internal)"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 8, "description", "Flight (CAS)"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 9, "description", "Logistics"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 10, "description", "Battalion net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 11, "description", "P Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 12, "description", "Med Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 1, "description", "1 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 2, "description", "2 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 3, "description", "3 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 4, "description", "4 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 5, "description", "Coy Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 6, "description", "Fires Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 7, "description", "Flight (Internal)"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 8, "description", "Flight (CAS)"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 9, "description", "Logistics"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 10, "description", "Battalion net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 11, "description", "P Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 12, "description", "Med Net"] call acre_api_fnc_setPresetChannelField;

["CAManBase", "Reloaded", { 
    params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"]; 
    if (isPlayer _unit) exitWith {}; 
    _oldMagazine params ["", ["_roundsLeftold", -1, [0]]]; 
    _newMagazine params ["_type", ""]; 
    if (_roundsLeftold > 0) exitWith {}; 
    (_type call BIS_fnc_ItemType) params ["_magType", "_magLoadedWith"]; 
    if (_magType != "Magazine" || {!(_magLoadedWith in ["Artillery","Bullet","Grenade","Missile","Rocket", "ShotgunShell","SmokeShell"])}) exitWith {}; 
    _unit addMagazine _type; 
}, true, [], true] call CBA_fnc_addClassEventHandler;

//Add mission specific scripts after here!
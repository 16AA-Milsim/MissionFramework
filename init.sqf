//anything in here gets executed on all clients+server on mission start (be aware of locality! and scripts with global effect)
//add Mission specific scripts at the end!

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
["ACRE_PRC152", "default", 2, "description", "4 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 3, "description", "Coy Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 4, "description", "Logistics"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 5, "description", "FAC Req Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 6, "description", "Fires Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 7, "description", "Air to Air"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 8, "description", "Air to Ground"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 9, "description", "CAS Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 10, "description", "Batt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 1, "description", "1 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 2, "description", "4 Plt Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 3, "description", "Coy Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 4, "description", "Logistics"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 5, "description", "FAC Req Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 6, "description", "Fires Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 7, "description", "Air to Air"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 8, "description", "Air to Ground"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 9, "description", "CAS Net"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 10, "description", "Batt Net"] call acre_api_fnc_setPresetChannelField;

//Stop onscreen AI chat
{_x setVariable ["BIS_noCoreConversations", true]} forEach allUnits;
0 fadeRadio 0;
enableSentences false;

//Add mission specific scripts after here!

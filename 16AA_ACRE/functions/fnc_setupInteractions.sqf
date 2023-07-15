// Settings Branch
_settingsBranch = ["Settings_Branch", "Radio Settings", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "ACRE_Interact"], _settingsBranch] call ace_interact_menu_fnc_addActionToClass;

// Show Instructions Action
_instructionsStatement = {
    [] execVM "scripts\instructionsRadioSettings.sqf";
};
_instructionsAction = ["Instructions_Action", "Instructions", "", _instructionsStatement, {true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "ACRE_Interact", "Settings_Branch"], _instructionsAction] call ace_interact_menu_fnc_addActionToClass;

// Show Saved Radio Settings Action
_confirmStatement = {
    [] execVM "scripts\showRadioSettings.sqf";
};
_showRadioSettingsAction = ["Show_Radio_Settings_Action", "Show Saved Radio Settings", "", _confirmStatement, {true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "ACRE_Interact", "Settings_Branch"], _showRadioSettingsAction] call ace_interact_menu_fnc_addActionToClass;

// Restore Radio Settings branch
_restoreRadioSettingsBranch = ["Restore_Radio_Settings_Branch", "<t color='#98d7ff'>Restore Radio Settings</t>", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "ACRE_Interact", "Settings_Branch"], _restoreRadioSettingsBranch] call ace_interact_menu_fnc_addActionToClass;
// Confirm Restore action
_confirmStatement = {
    [] execVM "scripts\restoreRadioSettings.sqf";
};
_confirmAction = ["Confirm_Restore_Radio_Settings", "<t color='#98d7ff'>Confirm</t>", "", _confirmStatement, {true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "ACRE_Interact", "Settings_Branch", "Restore_Radio_Settings_Branch"], _confirmAction] call ace_interact_menu_fnc_addActionToClass;

// Save Radio Settings branch
_saveRadioSettingsBranch = ["Save_Radio_Settings_Branch", "<t color='#ffa4a4'>Save Radio Settings</t>", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "ACRE_Interact", "Settings_Branch"], _saveRadioSettingsBranch] call ace_interact_menu_fnc_addActionToClass;
// Confirm Save action
_confirmStatement = {
    [] execVM "scripts\saveRadioSettings.sqf";
};
_confirmAction = ["Confirm_Save_Radio_Settings", "<t color='#ffa4a4'>Confirm</t>", "", _confirmStatement, {true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "ACRE_Interact", "Settings_Branch", "Save_Radio_Settings_Branch"], _confirmAction] call ace_interact_menu_fnc_addActionToClass;
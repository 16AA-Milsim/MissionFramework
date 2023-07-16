// Set speech volume to 0.25
FW_Acre_Volume_Value = 0.25; 
 
[0.4] call acre_api_fnc_setSelectableVoiceCurve; 
 
[{ 
    acre_sys_gui_volumeLevel = FW_Acre_Volume_Value; 
}, [], 5] call CBA_fnc_waitAndExecute;
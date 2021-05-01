//anything in here gets executed ONLY on the server/host on mission start

[] execVM "scripts\show_fps.sqf";
diag_log text "-------------------------[DEBUG - SHOW FPS CALLED]-------------------------";

"xyzxyz" serverCommand "#monitords 5"; //starts logging into server console,  make sure to change "xyzxyz" to the current "serverCommandPassword"
diag_log text "-------------------------[DEBUG - Console logging executed]-------------------------";
//anything in here gets executed ONLY on the server/host on mission start
//excute show FPS marker
[] execVM "scripts\show_fps.sqf";
diag_log text "--------------------[Executed show_fps on Server]--------------------"; //will show in server logs
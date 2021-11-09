//anything in here gets executed ONLY on the server/host on mission start
[] execVM "scripts\show_fps.sqf"; //execute show FPS marker
diag_log text "------------[LOGGING] [Executed show_fps on Server]-------------"; //will show in server logs
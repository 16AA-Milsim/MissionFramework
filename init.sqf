//anything in here gets executed on all clients+server on mission start

// Disables animals and enviroment sounds
enableEnvironment [false, true];

// Removes the ability to turn grass off
tawvd_disablenone = true;
tawvd_foot = 1600;
tawvd_car = 1600;
tawvd_air = 1600;
tawvd_drone = 1600;
tawvd_object = tawvd_foot;

// Friendly fire safe check
player addrating 90000;

if (!isDedicated && !hasInterface && isMultiplayer) then {//executes on FPS script on HCs
    execVM "scripts\show_fps.sqf";
    diag_log text "-------------------------[DEBUG - SHOW FPS CALLED]-------------------------";
};
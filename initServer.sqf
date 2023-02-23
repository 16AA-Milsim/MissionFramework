//Do not transfer AI drivers to HC
["LandVehicle", "InitPost", {
    params ["_entity"];
    if (!isPlayer(driver _entity) && !isNull driver _entity) then {
        group driver _entity setVariable["zhc_offload_blacklisted", true];
        "Vehicle ZHC blacklisted!" remoteExec ["systemChat", _entity];
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

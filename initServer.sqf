//Do not transfer AI drivers to HC
["LandVehicle", "InitPost", {
    params ["_entity"];
    if (!isPlayer(driver _entity) && !isNull driver _entity) then {
        group driver _entity setVariable["zhc_offload_blacklisted", true];
        "Vehicle ZHC blacklisted!" remoteExec ["systemChat", _entity];
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

["rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy", "InitPost", {
    params ["_entity"];
    _entity setVariable ["ace_medical_isMedicalFacility", true];
}, nil, [], true] call CBA_fnc_addClassEventHandler;

["rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy", "InitPost", {
    params ["_entity"];
    _entity setVariable ["ace_medical_isMedicalFacility", true];
}, nil, [], true] call CBA_fnc_addClassEventHandler;

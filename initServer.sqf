//Do not transfer AI drivers to HC
["LandVehicle", "InitPost", {
    params ["_entity"];
    if (!isPlayer(driver _entity) && !isNull driver _entity) then {
        group driver _entity setVariable["zhc_offload_blacklisted", true];
        "Vehicle ZHC blacklisted!" remoteExec ["systemChat", _entity];
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

l6AA_AirCommandChannelID = radioChannelCreate [[0.3, 0.3, 0.5, 1], "Air Command", "%UNIT_NAME", [], true];
publicVariable "l6AA_AirCommandChannelID";

// Trash Shed
// Use Land_Noticeboard_F for the noticeboard and call it noticeboard_1
// Use Land_Shed_02_F for the shed and call it shed_1.
if (isServer) then {
    noticeboard_1 addAction [
        "Clear Shed Contents",
        {
            params ["_target", "_caller", "_actionId", "_args"];
            private _shed = _args#0;
            private _shedBB = boundingBoxReal _shed;
            private _shedMin = _shedBB#0;
            private _shedMax = _shedBB#1;

            {
                private _relPos = _shed worldToModel (_x modelToWorldVisual [0,0,0]);

                if (
                    (_relPos#0 > _shedMin#0 && _relPos#0 < _shedMax#0) &&
                    (_relPos#1 > _shedMin#1 && _relPos#1 < _shedMax#1) &&
                    (_relPos#2 > _shedMin#2 && _relPos#2 < _shedMax#2) &&
                    {!(_x isKindOf "Man")} &&
                    _x != _shed &&
                    _x != _target
                ) then {
                    deleteVehicle _x;
                };
            } forEach (nearestObjects [_shed, ["All"], 7]);

            ["You cleared the shed."] remoteExec ["hint", _caller];
        },
        [shed_1], 1.5, true, true, "", "true", 10
    ];
};
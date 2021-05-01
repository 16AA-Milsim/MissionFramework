//thanks to Wyqer from KP Liberation for all the work he put into this
sleep 100;
private _sourcestr = "Server";
private _position = 0;

if (!isServer) then {
	if (!isNil "HLC1") then {
		if (!isNull HLC1) then {
			if (local HLC1) then {
				_sourcestr = "HlC1";
				_position = 1;
			};
		};
	};

	if (!isNil "HlC2") then {
		if (!isNull HlC2) then {
			if (local HlC2) then {
				_sourcestr = "HlC2";
				_position = 2;
			};
		};
	};

	if (!isNil "HlC3") then {
		if (!isNull HlC3) then {
			if (local HlC3) then {
				_sourcestr = "HlC3";
				_position = 3;
			};
		};
	};
	if (!isNil "HlC4") then {
		if (!isNull HlC4) then {
			if (local HlC4) then {
				_sourcestr = "HlC4";
				_position = 4;
			};
		};
	};
};

private _myfpsmarker = createMarker [format ["fpsmarker%1", _sourcestr], [0, -500 - (500 * _position)]];
_myfpsmarker setMarkerType "mil_start";
_myfpsmarker setMarkerSize [0.7, 0.7];

while {true} do {

	private _myfps = diag_fps;
	private _localgroups = {local _x} count allGroups;
	private _localunits = {local _x} count allUnits;

	_myfpsmarker setMarkerColor "ColorGREEN";
	if (_myfps < 30) then {_myfpsmarker setMarkerColor "ColorYELLOW";};
	if (_myfps < 20) then {_myfpsmarker setMarkerColor "ColorORANGE";};
	if (_myfps < 10) then {_myfpsmarker setMarkerColor "ColorRed";};

	_myfpsmarker setMarkerText format ["%1: %2 fps, %3 local groups, %4 local units", _sourcestr, (round (_myfps * 100.0)) / 100.0, _localgroups, _localunits];

	sleep 15;
};

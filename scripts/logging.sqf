/*
All credit goes to KP_Liberation and Wyqer for creating this script (https://github.com/KillahPotatoes/KP-Liberation)
Edited by Mildly_Interested (https://github.com/MildlyInterested)

	MIT License
	Copyright (c) 2015 GreuhZbug, Wyqer
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

This will log various things to RPT, ran every 5 minutes on client and every 60 seconds on HCs and Server
Server Output:
[LOGGING] [STATS] Source: Server - FPS: 51.28 - Local groups: 37 - Local units: 48 - Total units: 48 - Vehicles: 96 -  Active Scripts: [spawn: 17, execVM: 0, exec: 0, execFSM: 8]
*/

diag_log "-----------------[LOGGING] [Monitoring started]-----------------";

if(hasInterface) then {sleep 30;} else {sleep 10};

private _delay = 300;
private _source = "";

while {true} do {
	if (isDedicated) then {//if running on server run every 30 seconds
		_source = "Server";
        _delay = 60;
	};
	if (!isDedicated && !hasInterface && isMultiplayer) then {//if running on HC
		_source = name player;
		_delay = 60;
	};	
	if(hasInterface) then {// not HC, not server, must be player
		_source = name player;
        _delay = 300;
	};

	if (isServer) then {
		diag_log format ["[LOGGING] [STATS] [SERVER] Source: %1 - FPS: %2 - Local groups: %3 - Local units: %4 - Total units: %5 - Vehicles: %6 -  Active Scripts: [spawn: %7, execVM: %8, exec: %9, execFSM: %10]",
		_source,                                //1
		((round (diag_fps * 100.0)) / 100.0),   //2
		{local _x} count allGroups,             //3
		{local _x} count allUnits,              //4
		count allUnits,                         //5
		count vehicles,                         //6
		diag_activeScripts select 0,            //7
		diag_activeScripts select 1,            //8
        diag_activeScripts select 2,            //9
        diag_activeScripts select 3             //10
        ];
	};
	if (!isDedicated && !hasInterface && isMultiplayer) then {
		private _text = format ["[LOGGING] [STATS] [HC] Source: %1 - FPS: %2 - Local groups: %3 - Local units: %4 -  Active Scripts: [spawn: %5, execVM: %6, exec: %7, execFSM: %8]",
		_source,                                //1
		((round (diag_fps * 100.0)) / 100.0),   //2
		{local _x} count allGroups,             //3
		{local _x} count allUnits,              //4
		diag_activeScripts select 0, 			//5
		diag_activeScripts select 1,			//6
		diag_activeScripts select 2,			//7
		diag_activeScripts select 3				//8  
		];
		_text remoteExec ["diag_log",2];
	};
	if (hasInterface) then {
		private _text = format ["[LOGGING] [STATS] Source: %1 - FPS: %2 - Local groups: %3 - Local units: %4 -  Active Scripts: [spawn: %5, execVM: %6, exec: %7, execFSM: %8]",
		_source,                                //1
		((round (diag_fps * 100.0)) / 100.0),   //2
		{local _x} count allGroups,             //3
		{local _x} count allUnits,              //4
		diag_activeScripts select 0, 			//5
		diag_activeScripts select 1,			//6
		diag_activeScripts select 2,			//7
		diag_activeScripts select 3				//8  
		];
		_text remoteExec ["diag_log",2];
	};
	sleep _delay;
};
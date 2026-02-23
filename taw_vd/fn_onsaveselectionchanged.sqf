#include "defines.h"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the view distance dependant on whether the player
	is on foot, a car or an aircraft.
*/
private "_saveData";
params [["_control",controlNull,[controlNull]],["_index",-1,[0]]];

/* Error checks */
if(EQUAL(_index,-1) OR isNull _control) exitWith {};
_saveData = GVAR_PNS format["tawvd_slot_%1",_index];
if(isNil "_saveData") exitWith {};

/* Set variables to chosen slot data */
CONTROL(MENU_IDD,SLOT_NAME) ctrlSetText (SEL(_saveData,0));
if !([_index] call TAWVD_fnc_applySlot) exitWith {};

/* Update Menu */
[] call TAWVD_fnc_openMenu;

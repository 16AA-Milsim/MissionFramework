#include "defines.h"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the view distance dependant on whether the player
	is on foot, a car or an aircraft.
*/
private ["_controlGrp","_saveList","_defaultSlot","_varData","_slotText"];
disableSerialization;

/* Store displays */
_controlGrp = CONTROL(MENU_IDD,MANAGER_GROUP);
_saveList = CONTROL(MENU_IDD,SAVES_LIST);
lbClear _saveList; //Purge the list

/* Make the Saves manager group visible */
_controlGrp ctrlSetfade 0;
_controlGrp ctrlCommit .3;

_defaultSlot = GVAR_PNS ["tawvd_defaultSlot",-1];

/* Fill the listbox */
for "_i" from 0 to 9 do {
	_varData = GVAR_PNS format["tawvd_slot_%1",_i];
	if(!isNil "_varData") then {
		_slotText = SEL(_varData,0);
		if (_i isEqualTo _defaultSlot) then {
			_slotText = format["* %1",_slotText];
		};
		_saveList lbAdd _slotText;
		_saveList lbSetData [(lbSize _saveList)-1,"true"];
	} else {
		_slotText = format["Save Slot %1",_i];
		if (_i isEqualTo _defaultSlot) then {
			_slotText = format["* %1",_slotText];
		};
		_saveList lbAdd _slotText;
		_saveList lbSetData [(lbSize _saveList)-1,"false"];
	};
};

// Get the profileNamespace Radio Settings variables
private _baseRadios = profileNamespace getVariable ["radios_base", []];
private _channels = profileNamespace getVariable ["radios_channel", []];
private _volumes = profileNamespace getVariable ["radios_volume", []];
private _spatials = profileNamespace getVariable ["radios_spatial", []];

// Check if previous settings exist, if not exit with a hint
if (_baseRadios isEqualTo []) exitWith {
    hint "There are no saved settings";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute; // Clear hint
}; 

// Create a formatted string with the radio information and the Push To Talk assignment and Display as hint
private _hintString = "SAVED RADIO SETTINGS\n";
{
    _index = _forEachIndex;
    _baseRadio = (_baseRadios select _index) splitString "_" joinString " " select [4];
    _pttText = if (_index < 3) then { format [" - PTT %1", _index + 1] } else { "" };
    _spatial = _spatials select _index;
    _spatialText = switch (_spatial) do {
        case "LEFT": {"Left Ear"};
        case "RIGHT": {"Right Ear"};
        case "CENTER": {"Both Ears"};
    };
    _volumeText = format ["%1", str round((_volumes select _index) * 100)];
    _hintString = _hintString + format ["\nRadio %1%2:\n%3 - Channel %4\nVolume: %5%% - %6\n", _index + 1, _pttText, _baseRadio, _channels select _index, _volumeText, _spatialText];
} forEach _baseRadios;

hint _hintString;

private _baseRadios = [];
private _channels = [];
private _volumes = [];
private _spatials = [];

// Get the current radio list and PTT assignments for each radio
private _radios = [] call acre_api_fnc_getCurrentRadioList;
private _pttAssignment = call acre_api_fnc_getMultiPushToTalkAssignment;

// Check if the player is carrying any radios, if not, show the hint and exit
if (count _radios == 0) exitWith {
    hint "There are no radios in your inventory";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute; // Clear hint
};

// Rearrange the radios in the _radios array to set the PTT radios first
private _tempRadios = [];
{
    private _pttRadio = _x;
    {
        if (_pttRadio == _x) then {
            _tempRadios pushBack _x;
        };
    } forEach _radios;
} forEach _pttAssignment;

// Add any remaining radios to the end of the _tempRadios array
{
    if (_tempRadios find _x == -1) then {
        _tempRadios pushBack _x;
    };
} forEach _radios;

_radios = _tempRadios;

// Loop through each radio in the list and extract its base type, channel, volume, and spatial setting into arrays
{
    // Loop through maximum 6 radios
    if (_forEachIndex >= 6) exitWith {};
    _baseRadio = [_x] call acre_api_fnc_getBaseRadio;
    _baseRadios pushBack _baseRadio;
    _channel = [_x] call acre_api_fnc_getRadioChannel;
    _channels pushBack _channel;
    _volume = [_x] call acre_api_fnc_getRadioVolume;
    _volumes pushBack _volume;
    _spatial = [_x] call acre_api_fnc_getRadioSpatial;
    _spatials pushBack _spatial;
} forEach _radios;

// Save the variables/arrays to the profileNamespace
profileNamespace setVariable ["radios_base", _baseRadios];
profileNamespace setVariable ["radios_channel", _channels];
profileNamespace setVariable ["radios_volume", _volumes];
profileNamespace setVariable ["radios_spatial", _spatials];

hint "Radio Settings Saved";

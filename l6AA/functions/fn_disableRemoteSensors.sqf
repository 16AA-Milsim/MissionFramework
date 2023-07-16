params ["_group_player"];
//disable remote sensor on players who do not need to check AI raycasts
switch true do
{
	case (_group_player in group_1pl): {disableRemoteSensors true;};
	case (_group_player in group_2pl): {disableRemoteSensors true;};
	case (_group_player in group_3pl): {disableRemoteSensors true;};
	case (_group_player in group_4pl): {disableRemoteSensors true;};
	case (_group_player in group_13aasr): {disableRemoteSensors true;};
	case (_group_player in group_16csmr): {disableRemoteSensors true;};
	case (_group_player in group_jfist): {disableRemoteSensors true;};
	case (_group_player in group_hq): {disableRemoteSensors true;};
	case (_group_player in group_itc): {};
	case (_group_player in group_jhc): {};
	case (_group_player in group_mi): {};
	default {};
};
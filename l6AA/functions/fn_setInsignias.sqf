_group_player = groupId (group player);
[player, ""] call BIS_fnc_setUnitInsignia;
switch true do
{
	case (_group_player in group_1pl): {
		[player, "16aa_w_gs_1pl_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_2pl): {
		[player, "16aa_w_gs_2pl_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_3pl): {
		[player, "16aa_w_gs_3pl_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_4pl): {
		[player, "16aa_w_gs_4pl_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_13aasr): {
		[player, "16aa_w_gs_13aasr_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_16csmr): {
		[player, "16aa_w_gs_16csmr_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_jfist): {
		[player, "16aa_w_gs_jfist_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_hq): {
		[player, "16aa_w_gs_hq_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_itc): {
		[player, "16aa_w_gs_itc_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_jhc): {
		[player, "16aa_w_gs_jhc_dzf"] call BIS_fnc_setUnitInsignia;
	};
	case (_group_player in group_mi): {
		[player, "16aa_w_gs_mi_dzf"] call BIS_fnc_setUnitInsignia;
	};
	default {
		[player, "16aa_w_eagle_gsub"] call BIS_fnc_setUnitInsignia;
	};
};
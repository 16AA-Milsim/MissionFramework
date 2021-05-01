/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Configuration file for various variables of the KP cratefiller.
*/

// The Base object is for the player interaction, so at these object you can open the dialog
KPCF_cratefillerBase = [
    "Land_Cargo10_white_F",
    "Land_Cargo10_military_green_F"
];

// The Spawn object is the point where crates will spawn and acts the center for the KPCF_spawnRadius
KPCF_cratefillerSpawn = "Land_JumpTarget_F";

// This variable defines if the player will be able to spawn and delete crates
KPCF_canSpawnAndDelete = true;

// If set to "true" the item lists will be generated from the config
KPCF_generateLists = false;

// These variable defines the range where inventories can be edited
// Example: With an setting of 10 all objects in a radius of 10m from the center of the spawn object can be edited
KPCF_spawnRadius = 10;

// Defines the distance for the interaction (addAction / ACE)
KPCF_interactRadius = 5;

// Defines the available crates
KPCF_crates = [
    "ACE_Box_Ammo",
    "Box_NATO_Wps_F",
    "Box_NATO_Equip_F",
    "UK3CB_BAF_SupplyCrate_Ammo"
];


// Defines the blacklisted items
// Blacklisted items are used on every category with activated generatedLists and everytime on the magazines and attachments
// So this variable will ensure the block of unwanted items
KPCF_blacklistedItems = [
    ""
];

// ----- This Variable will only be used with activated generatedLists -----

// Defines the whitelisted items
// Whitelisted items will be added after the item detection to ensure the availability
KPCF_whitelistedItems = [
    ""
    //weapons


    //grenades


    //explosives


    //items


    //backpack


];

// ----- These Variables will be replaced with activated generatedLists -----

// Defines the available weapons
KPCF_weapons = [
    "UK3CB_BAF_L85A3",
    "UK3CB_BAF_L85A3_UGL",
    "UK3CB_BAF_L7A2",
    "UK3CB_BAF_L129A1",
    "UK3CB_BAF_L119A1_FG",
    "UK3CB_BAF_L115A3",
    "UK3CB_BAF_L128A1",
    "UK3CB_BAF_L135A1",
    "UK3CB_BAF_L131A1",
    "UK3CB_BAF_L110_762",
    "UK3CB_BAF_M6",
    "UK3CB_BAF_L16_Tripod",
    "UK3CB_BAF_L16",
    "ACE_VMH3",
    "rhs_weap_fgm148",
    "rhs_weap_m72a7",
    "rhs_weap_fim92",
    "launch_NLAW_F",
    "UK3CB_BAF_556_30Rnd",
    "UK3CB_BAF_9_17Rnd", 
    "rhsusf_mag_10Rnd_STD_50BMG_M33", 
    "rhsusf_mag_10Rnd_STD_50BMG_Mk211", 
    "UK3CB_BAF_127_100Rnd",
    "UK3CB_BAF_12G_Pellets", 
    "UK3CB_BAF_12G_Slugs",
    "UK3CB_BAF_338_5Rnd",
    "UK3CB_BAF_762_L42A1_20Rnd",
    "UK3CB_BAF_762_100Rnd", 
    "UK3CB_BAF_1Rnd_HEDP_Grenade_Shell", 
    "UK3CB_BAF_32Rnd_40mm_G_Box",
    "UK3CB_BAF_1Rnd_SmokePurple_Grenade_Shell",
    "UK3CB_BAF_1Rnd_Smoke_Grenade_Shell",
    "UK3CB_BAF_1Rnd_SmokeGreen_Grenade_Shell",
    "UK3CB_BAF_1Rnd_SmokeRed_Grenade_Shell",
    "UK3CB_BAF_1Rnd_SmokeBlue_Grenade_Shell",
    "UK3CB_BAF_1Rnd_SmokeYellow_Grenade_Shell",
    "UK3CB_BAF_1Rnd_SmokeOrange_Grenade_Shell",
    "UK3CB_BAF_1Rnd_60mm_Mo_AB_Shells",
    "UK3CB_BAF_1Rnd_60mm_Mo_Shells",
    "UK3CB_BAF_1Rnd_60mm_Mo_WPSmoke_White",
    "UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",
    "UK3CB_BAF_1Rnd_81mm_Mo_Shells",
    "UK3CB_BAF_1Rnd_81mm_Mo_WPSmoke_White",
    "UK3CB_BAF_1Rnd_81mm_Mo_Smoke_White",
    "UK3CB_BAF_1Rnd_81mm_Mo_IRFlare_White",
    "UK3CB_BAF_1Rnd_81mm_Mo_LG"
];

// Defines the available grenades
KPCF_grenades = [
    "ACE_CTS9",
    "UK3CB_BAF_SmokeShellYellow",
    "UK3CB_BAF_SmokeShellPurple",
    "UK3CB_BAF_SmokeShell",
    "UK3CB_BAF_SmokeShellGreen",
    "UK3CB_BAF_SmokeShellRed",
    "UK3CB_BAF_SmokeShellOrange",
    "rhs_mag_m67"
];

// Defines the available explosives
KPCF_explosives = [
    "rhsusf_m112_mag",    
    "rhsusf_m112x4_mag",
    "ClaymoreDirectionalMine_Remote_Mag",
    "rhs_magazine_rhs_mine_M19_mag",
    "SatchelCharge_Remote_Mag"
];

// Defines the available items
KPCF_items = [
    "ACE_ATragMX",
    "ACE_Clacker",
    "ACE_CableTie",
    "ACE_ConcertinaWireCoil",
    "ACE_DAGR",
    "ACE_DefusalKit",
    "ACE_Flashlight_KSF1",
    "ACE_Kestrel4500",
    "ACE_UAVBattery",
    "ACE_wirecutter",
    "ACE_microDAGR",
    "ACE_MX2A",
    "ACE_RangeCard",
    "ACE_SpottingScope",
    "ACE_TacticalLadder_Pack",
    "ACE_SpraypaintBlack",
    "ACE_SpraypaintBlue",
    "ACE_SpraypaintGreen",
    "ACE_SpraypaintRed",
    "ACE_EntrenchingTool",
    "ACE_Tripod",
    "ACE_Vector",
    "UK3CB_BAF_Soflam_Laserdesignator",
    "UK3CB_BAF_HMNVS",
    "ItemGPS",
    "ItemAndroid",
    "ItemcTab",
    "Toolkit",
    "B_UavTerminal",
    "ACRE_PRC117F",
    "ACRE_PRC152",
    "ACRE_PRC343",
    "ACE_artilleryTable",
    "Laserbatteries",
    "RKSL_optic_LDS",
    "UK3CB_BAF_MaxiKite",
    "rhsusf_acc_premier_anpvs27",
    "RKSL_optic_PMII_312_sunshade",
    "UK3CB_BAF_TA648",
    "uk3cb_baf_silencer_l85",
    "uk3cb_baf_sffh",
    "uk3cb_baf_llm_flashlight_black",
    "ACE_epinephrine",
    "ACE_fieldDressing",
    "ACE_elasticBandage",
    "ACE_packingBandage",
    "ACE_quikclot",
    "ACE_atropine",
    "ACE_bodyBag",
    "ACE_morphine",
    "ACE_personalAidKit",
    "ACE_salineIV",
    "ACE_salineIV_500",
    "ACE_salineIV_250",
    "ACE_bloodIV_500",
    "ACE_bloodIV_250",
    "ACE_bloodIV",
    "ACE_plasmaIV",
    "ACE_plasmaIV_250",
    "ACE_plasmaIV_500",
    "ACE_surgicalKit",
    "ACE_tourniquet",
    "kat_aatKit",
    "kat_accuvac",
    "kat_X_AED",
    "kat_AED",
    "kat_chestSeal",
    "kat_guedel",
    "kat_larynx",
    "kat_Painkiller",
    "kat_Pulseoximeter",
    "kat_aatKit",
    "Chemlight_blue",
    "Chemlight_green",
    "ACE_Chemlight_HiBlue",
    "ACE_Chemlight_HiGreen",
    "ACE_Chemlight_HiRed",
    "ACE_Chemlight_HiWhite",
    "ACE_Chemlight_HiYellow",
    "ACE_Chemlight_IR",
    "ACE_Chemlight_Orange",
    "Chemlight_red",
    "ACE_Chemlight_UltraHiOrange",
    "ACE_Chemlight_White",
    "Chemlight_yellow",
    "ACE_IR_Strobe_Item"

    


];

// Defines the available backpacks
KPCF_backpacks = [
    "ACE_gunbag",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_A",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_B",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_C",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_A",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_B",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D",
    "UK3CB_BAF_B_Bergen_MTP_Radio_H_A",
    "UK3CB_BAF_B_Bergen_MTP_Radio_H_B",
    "UK3CB_BAF_B_Bergen_MTP_Radio_L_A",
    "UK3CB_BAF_B_Bergen_MTP_Radio_L_B",
    "UK3CB_BAF_B_Bergen_MTP_JTAC_H_A",
    "UK3CB_BAF_B_Bergen_MTP_JTAC_L_A",
    "UK3CB_BAF_B_Bergen_MTP_SL_H_A",
    "UK3CB_BAF_B_Bergen_MTP_SL_L_A",
    "UK3CB_BAF_B_Bergen_MTP_Medic_H_A",
    "UK3CB_BAF_B_Bergen_MTP_Medic_H_B",
    "UK3CB_BAF_B_Bergen_MTP_Medic_L_A",
    "UK3CB_BAF_B_Bergen_MTP_Medic_L_B",
    "UK3CB_BAF_B_Bergen_MTP_Engineer_H_A",
    "UK3CB_BAF_B_Bergen_MTP_Engineer_L_A",
    "UK3CB_BAF_B_Bergen_MTP_Sapper_H_A",
    "UK3CB_BAF_B_Bergen_MTP_Sapper_L_A",
    "UK3CB_BAF_B_Bergen_MTP_PointMan_H_A",
    "UK3CB_BAF_B_Bergen_MTP_PointMan_L_A",
    "UK3CB_BAF_B_Carryall_MTP",
    "UK3CB_BAF_B_Kitbag_MTP"
];

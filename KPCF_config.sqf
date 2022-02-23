/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes
    Edited by Mildly_Interested - https://github.com/MildlyInterested
    
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Configuration file for various variables of the KP cratefiller.
*/

//For WHITELISTING settings check the "KPCF_whitelist.sqf" file

//Configure ACE specific settings, these settings won't affect any other crates or objects in your mission, only objects spawned by KP Cratefiller
KPCF_ace_drag_all = true;      //if you want to be able to ACE DRAG every crate (created by Cratefiller) regardless of weight set to "true"
KPCF_ace_carry_all = true;     //if you want to be able to ACE CARRY every crate (created by Cratefiller) regardless of weight set to "true"
KPCF_ace_cargo_one = true;     //sets required cargo space to 1 for every crate (created by Catefiller) if set to "true"

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
    "LSR_Crates_pelican_Empty_S",
    "LSR_Crates_pelican_Empty_M",
    "LSR_Crates_pelican_Empty_L",
    "LSR_Crates_pelican_pallet_L",
    "LSR_Crates_pelican_pallet_M"
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
     "UK3CB_BAF_556_30Rnd",
     "UK3CB_BAF_L85A3_UGL",
     "UK3CB_BAF_L135A1",
     "rhs_mag_M433_HEDP",
     "rhs_mag_m4009",
     "rhs_mag_M583A1_white",
     "rhs_mag_M585_white_cluster",
     "rhs_mag_m661_green",
     "rhs_mag_m662_red",
     "rhs_mag_M663_green_cluster",
     "rhs_mag_M664_red_cluster",
     "rhs_mag_m713_Red",
     "rhs_mag_m714_White",
     "rhs_mag_m715_Green",
     "rhs_mag_m716_yellow",
     "rhs_mag_M781_Practice",
     "UK3CB_BAF_L7A2",
     "UK3CB_BAF_762_100Rnd",
     "UK3CB_BAF_762_100Rnd_Blank",
     "UK3CB_BAF_762_200Rnd",
     "UK3CB_BAF_762_200Rnd_Blank",
     "UK3CB_BAF_L129A1",
     "UK3CB_BAF_762_L42A1_20Rnd",
     "UK3CB_BAF_762_L42A1_20Rnd_Blank",
     "ACE_5Rnd_127x99_API_Mag",
     "16aa_Weapons_L115A3_OD",
     "16aa_Magazine_338AP",
     "16AA_Magazine_338AP_T",
     "16AA_Magazine_338_blank_mag",
     "16AA_Magazine_338SP_NT",
     "16AA_Magazine_338SP_T",
     "UK3CB_BAF_L110_762",
     "UK3CB_BAF_L131A1",
     "UK3CB_BAF_9_17Rnd",
     "UK3CB_BAF_M6",
     "UK3CB_BAF_1Rnd_60mm_Mo_AB_Shells",
     "UK3CB_BAF_1Rnd_60mm_Mo_Shells",
     "UK3CB_BAF_1Rnd_60mm_Mo_Flare_White",
     "UK3CB_BAF_1Rnd_60mm_Mo_Smoke_Red",
     "UK3CB_BAF_1Rnd_60mm_Mo_WPSmoke_White",
     "UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",
     "ace_compat_rhs_usf3_m252_carry",
     "ace_csw_carryMortarBaseplate",
     "ACE_1Rnd_82mm_Mo_HE_Guided",
     "ACE_1Rnd_82mm_Mo_HE",
     "ACE_1Rnd_82mm_Mo_Illum",
     "ACE_1Rnd_82mm_Mo_HE_LaserGuided",
     "ACE_1Rnd_82mm_Mo_Smoke",
     "16aa_Weapon_FGM_148_Javelin",
     "16aa_Magazine_Javelin_Tube",
     "rhs_weap_fim92",
     "rhs_fim92_mag",
     "UK3CB_BAF_L111A1",
     "UK3CB_BAF_127_100Rnd",
     "UK3CB_BAF_L134A1",
     "UK3CB_BAF_32Rnd_40mm_G_Box",
     "UK3CB_BAF_Tripod",
     "rhs_weap_m72a7",
     "UK3CB_BAF_NLAW_Launcher",
     "ace_compat_rhs_usf3_mag_TOW2b",
     "ace_compat_rhs_usf3_mag_TOW2bb",
     "ACE_VMH3"
];

// Defines the available grenades
KPCF_grenades = [
    "MS_Strobe_Mag_1",
    "rhs_mag_an_m8hc",
    "rhs_mag_m18_green",
    "rhs_mag_m18_purple",
    "rhs_mag_m18_red",
    "rhs_mag_m18_yellow",
    "UK3CB_BAF_SmokeShellBlue",
    "rhs_mag_m67",
    "rhs_mag_m69",
    "rhs_mag_mk84",
    "ACE_Chemlight_HiBlue",
    "ACE_Chemlight_HiGreen",
    "ACE_Chemlight_HiRed",
    "ACE_Chemlight_HiWhite",
    "ACE_Chemlight_HiYellow",
    "ACE_Chemlight_IR",
    "ACE_Chemlight_UltraHiOrange"
];

// Defines the available explosives
KPCF_explosives = [ 
    "rhsusf_m112_mag",
    "rhsusf_m112x4_mag",
    "rhs_mine_M19_mag",
    "ClaymoreDirectionalMine_Remote_Mag",
    "rhsusf_mine_m49a1_3m_mag",
    "rhsusf_mine_m49a1_6m_mag",
    "rhsusf_mine_m49a1_10m_mag"
];

// Defines the available items
KPCF_items = [
    "ACE_adenosine",
    "ACE_epinephrine",
    "ACE_morphine",
    "ACE_fieldDressing",
    "ACE_elasticBandage",
    "ACE_packingBandage",
    "ACE_quikclot",
    "ACE_bloodIV_250",
    "ACE_bloodIV_500",
    "ACE_bloodIV",
    "ACE_plasmaIV_250",
    "ACE_plasmaIV_500",
    "ACE_plasmaIV",
    "ACE_salineIV_250",
    "ACE_salineIV_500",
    "ACE_salineIV",
    "ACE_bodyBag",
    "ACE_personalAidKit",
    "ACE_splint",
    "ACE_surgicalKit",
    "ACE_tourniquet",
    "kat_aatKit",
    "kat_accuvac",
    "kat_X_AED",
    "Attachable_Helistretcher",
    "kat_AED",
    "kat_chestSeal",
    "KAT_Empty_bloodIV_250",
    "KAT_Empty_bloodIV_500",
    "kat_guedel",
    "kat_larynx",
    "kat_Pulseoximeter",
    "kat_stethoscope",
    "ACE_RangeTable_82mm",
    "ACE_artilleryTable",
    "ACE_ATragMX",
    "ACE_CableTie",
    "ACE_DefusalKit",
    "ACE_EntrenchingTool",
    "ACE_Fortify",
    "ACE_Kestrel4500",
    "ACE_Flashlight_KSF1",
    "ACE_M26_Clacker",
    "ACE_Clacker",
    "ACE_MapTools",
    "ACE_microDAGR",
    "ACE_RangeCard",
    "ACE_SpottingScope",
    "ACE_SpraypaintBlack",
    "ACE_SpraypaintBlue",
    "ACE_SpraypaintGreen",
    "ACE_SpraypaintRed",
    "ACE_Tripod",
    "Laserbatteries",
    "ACE_wirecutter",
    "ACRE_PRC117F",
    "ACRE_PRC152",
    "ACRE_PRC343",
    "ACRE_VHF30108",
    "ItemAndroid",
    "ItemcTab",
    "itc_land_tablet_fdc",
    "uk3cb_baf_ta648",
    "uk3cb_baf_llm_ir_black",
    "uk3cb_baf_silencer_l115a3",
    "uk3cb_underbarrel_acc_fgrip_bipod",
    "rksl_optic_lds",
    "uk3cb_baf_sffh",
    "uk3cb_underbarrel_acc_grippod",
    "rksl_optic_pmii_525",
    "lsr_attachment_338_suppressor_black",
    "uk3cb_baf_silencer_l110",
    "rhsusf_acc_su230a_mrds",
    "rhsusf_acc_nt4_black",
    "rhsusf_acc_sf3p556",
    "rhsusf_acc_grip1",
    "UK3CB_BAF_Bayonet_L3A1",
    "rhs_altyn_visordown",
    "V_EOD_olive_F",
    "ToolKit"
];

// Defines the available backpacks
KPCF_backpacks = [
    "mpx_daysack",
    "rhsusf_eject_Parachute_backpack",
    "rhs_Tow_Gun_Bag",
    "rhs_TOW_Tripod_Bag",
    "B_rhsusf_B_BACKPACK",
    "UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A"

];

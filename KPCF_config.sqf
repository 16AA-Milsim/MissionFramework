/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Dubjunk - https://github.com/KillahPotatoes
     Edited by:
        Mildly_Interested - https://github.com/MildlyInterested
        Darojax - https://github.com/Darojax
        Blue - https://github.com/BlueTheKing
        Scarle
    
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Configuration file for various variables of the KP cratefiller.
*/

//For WHITELISTING settings check the "KPCF_whitelist.sqf" file

//Configure ACE specific settings, these settings won't affect any other crates or objects in your mission, only objects spawned by KP Cratefiller
KPCF_ace_drag_all = true;      //if you want to be able to ACE DRAG every crate (created by Cratefiller) regardless of weight set to "true"
KPCF_ace_carry_all = true;     //if you want to be able to ACE CARRY every crate (created by Cratefiller) regardless of weight set to "true"
KPCF_ace_cargo_one = true;     //sets required cargo space to 1 for every crate (created by Cratefiller) if set to "true"

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
    "ACE_medicalSupplyCrate_advanced",
    "L118_Pallet_L31A3",
    "L118_Pallet_L35A3",
    "L118_Pallet_L36",
    "L118_Pallet_L37A2",
    "L118_Pallet_L38A2",
    "L118_Pallet_L43A2",
    "L118_FuseCrate_L33A2"
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
   //RHS
    "rhs_weap_M107_d",
    "rhsusf_mag_10Rnd_STD_50BMG_mk211",
    "rhsusf_mag_10Rnd_STD_50BMG_M33",
    "rhs_mag_M441_HE",
    "rhs_mag_m4009",
    "rhs_mag_M583A1_white",
    "rhs_mag_30Rnd_556x45_M855A1_Stanag",
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
    "rhsusf_mag_17Rnd_9x19_FMJ",
    "rhs_M252_Gun_Bag",
    "rhs_M252_Bipod_Bag",
    "rhs_weap_fim92",
    "rhs_fim92_mag",
    "rhs_fgm148_magazine_AT",
    "rhs_mag_maaws_HEAT",
   //UK3CB
    "UK3CB_BAF_L85A3",
    "UK3CB_BAF_556_200Rnd",
    "UK3CB_BAF_L85A3_UGL",
    "UK3CB_BAF_L110_762",
    "UK3CB_BAF_M6",
    "UK3CB_BAF_1Rnd_60mm_Mo_AB_Shells",
    "UK3CB_BAF_1Rnd_60mm_Mo_Shells",
    "UK3CB_BAF_1Rnd_60mm_Mo_Flare_White",
    "UK3CB_BAF_1Rnd_60mm_Mo_Smoke_Red",
    "UK3CB_BAF_1Rnd_60mm_Mo_WPSmoke_White",
    "UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",
    "UK3CB_BAF_762_100Rnd",
    "UK3CB_BAF_32Rnd_40mm_G_Box",
    "UK3CB_BAF_L129A1",
    "UK3CB_BAF_L111A1",
    "UK3CB_BAF_127_100Rnd",
    "UK3CB_BAF_L134A1",
    "UK3CB_BAF_Tripod",
    "UK3CB_BAF_SmokeShellOrange",
   //3LSR
    "lsr_wepn_l7a2_stnd",
    "lsr_wepn_l7a2_rapid",
    "lsr_wepn_l7a2_lowrf",
    "lsr_wepn_l115a4_od",
    "lsr_wepn_l115a4_od_ghillie",
    "lsr_wepn_l115a4_dd",
    "lsr_wepn_l115a4_dd_ghillie",
    "lsr_wepn_l115a4_bb",
    "lsr_wepn_l115a4_bb_ghillie",
    "lsr_lnch_javelin",
    "lsr_static_javelin_low",
    "lsr_static_l111a1_low",
    "lsr_static_gpmg_low",
    "lsr_static_l134a1_low",
    "lsr_mag_l115a4_338AP",
    "lsr_mag_l115a4_338AP_T",
    "lsr_mag_l115a4_338SP",
    "lsr_mag_l115a4_338SP_T",
    "lsr_mag_fgm148_tube",
   //ACE
    "ace_20rnd_762x51_m993_ap_mag",
    "ACE_40mm_Flare_ir",
    "ace_compat_rhs_usf3_mag_TOW2b",
    "ace_compat_rhs_usf3_mag_TOW2bb",
   //GreenMag
    "greenmag_ammo_556x45_basic_30Rnd",
    "greenmag_ammo_556x45_basic_60Rnd",
    "greenmag_ammo_762x51_basic_30Rnd",
    "greenmag_ammo_762x51_basic_60Rnd",
    "greenmag_beltlinked_762x51_basic_50",
    "greenmag_beltlinked_762x51_basic_100",
    "greenmag_beltlinked_762x51_basic_150",
    "greenmag_beltlinked_762x51_basic_200",
    "greenmag_ammo_300_basic_30Rnd",
    "greenmag_ammo_300_basic_60Rnd",
    "greenmag_ammo_9x19_basic_30Rnd",
    "greenmag_ammo_9x19_basic_60Rnd",
    "greenmag_ammo_50BMG_basic_30Rnd",
    "greenmag_ammo_50BMG_basic_60Rnd",    
   //TBD
    "tbd_mortar_81mm_shell_he",
    "tbd_mortar_81mm_shell_illum",
    "tbd_mortar_81mm_shell_smoke",
    "tbd_mortars_105mm_casing_charge_1",
    "tbd_mortars_105mm_casing_charge_2",
    "tbd_mortars_105mm_casing_charge_3",
    "tbd_mortars_105mm_casing_charge_4",
    "tbd_mortars_105mm_casing_charge_5",
    "tbd_mortars_105mm_casing_charge_6",
    "tbd_mortars_105mm_casing_charge_7",
    "tbd_mortars_105mm_shell_dpicm",
    "tbd_mortars_105mm_tube_dpicm",
    "tbd_mortars_105mm_shell_he",
    "tbd_mortars_105mm_tube",
    "tbd_mortars_105mm_shell_laser",
    "tbd_mortars_105mm_tube_laser",
    "tbd_mortars_105mm_shell_smoke",
    "tbd_mortars_105mm_tube_smoke",
   //MAAWS
    "za_enhancedmaaws_mag_m4_ASM509",
    "za_enhancedmaaws_mag_m4_HE",    
    "za_enhancedmaaws_mag_m4_HEAT551",
    "za_enhancedmaaws_mag_m4_HEAT",
    "za_enhancedmaaws_mag_m4_HEDP",
    "za_enhancedmaaws_mag_m4_ILLUM",
    "za_enhancedmaaws_mag_m4_MT756",
   //BASE 
    "launch_MRAWS_green_F",
    "Starstreak",
    "launch_NLAW_F",
    "Starstreak2_missile"
];

// Defines the available grenades
KPCF_grenades = [
    //Strobes
    "MS_Strobe_Mag_1",
    //Smokes
    "rhs_mag_an_m8hc",
    "rhs_mag_m18_green",
    "rhs_mag_m18_purple",
    "rhs_mag_m18_red",
    "rhs_mag_m18_yellow",
    "rhs_grenade_m15_mag",
    "UK3CB_BAF_SmokeShellBlue",
    //HEs
    "rhs_mag_m67",
    "rhs_mag_m69",
    "rhs_mag_mk84",
    //Chemlights
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
    "SLAMDirectionalMine_Wire_Mag",
    "rhs_mine_M19_mag",                     //AT Mine
    "ClaymoreDirectionalMine_Remote_Mag",   //M18A1 Claymore
    "rhsusf_mine_m49a1_3m_mag",             //Tripwire Flare mine 3m
    "rhsusf_mine_m49a1_6m_mag",             //Tripwire Flare mine 6m
    "rhsusf_mine_m49a1_10m_mag"             //Tripwire Flare mine 10m
];

// Defines the available items
KPCF_items = [
    //ACE Medical
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
    "ACE_suture",
    "ACE_Humanitarian_Ration",
    "ACE_WaterBottle",
    //ACM
    "ACM_IV_14g",
    "ACM_IV_16g",
    "ACM_ACCUVAC",
    "ACM_Vial_Adenosine",
    "ACM_Vial_Amiodarone",
    "ACM_AmmoniaInhalant",
    "ACM_AED",
    "ACM_BVM",
    "ACM_Vial_CalciumChloride",
    "ACM_ChestSeal",
    "ACM_ChestTubeKit",
    "ACM_BloodBag_ON_1000",
    "ACM_BloodBag_ON_500",
    "ACM_BloodBag_ON_250",
    "ACM_ElasticWrap",
    "ACM_SuctionBag",
    "ACM_EmergencyTraumaDressing",
    "ACM_Vial_Epinephrine",
    "ACM_Vial_Ertapenem",
    "ACM_Vial_Esmolol",
    "ACM_IO_EZ",
    "ACM_IO_FAST",
    "ACM_Vial_Fentanyl",
    "ACM_FieldBloodTransfusionKit_250",
    "ACM_FieldBloodTransfusionKit_500",
    "ACM_GuedelTube",
    "ACM_IGel",
    "ACM_Vial_Ketamine",
    "ACM_Vial_Lidocaine",
    "ACM_Vial_Morphine",
    "ACM_Spray_Naloxone",
    "ACM_NCDKit",
    "ACM_NPA",
    "ACM_Vial_Ondansetron",
    "ACM_Paracetamol",
    "ACM_Inhaler_Penthrox",
    "ACM_PocketBVM",
    "ACM_OxygenTank_425",
    "ACM_PressureBandage",
    "ACM_PressureCuff",
    "ACM_PulseOximeter",
    "ACM_SAMSplint",
    "ACM_Stethoscope",
    "ACM_Syringe_10",
    "ACM_Syringe_1",
    "ACM_Syringe_3",
    "ACM_Syringe_5",
    "ACM_ThoracostomyKit",
    "ACM_Vial_TXA",
    //ACE Items
    "UK3CB_BAF_L16_RangeTable",
    "ACE_ATragMX",
    "ACE_CableTie",
    "ACE_DefusalKit",
    "ACE_EntrenchingTool",
    "ACE_Fortify",
    "ACE_Kestrel4500",
    "ACE_Flashlight_KSF1",
    "ACE_M26_Clacker",      //M152 Firing Device
    "ACE_Clacker",          //M57 Firing Device
    "ACE_MapTools",
    "ACE_microDAGR",
    "ACE_RangeCard",
    "ACE_SpottingScope",
    "ACE_SpraypaintBlack",
    "ACE_SpraypaintBlue",
    "ACE_SpraypaintGreen",
    "ACE_SpraypaintRed",
    "ACE_SpraypaintWhite",
    "ACE_SpraypaintYellow",
    "ACE_Tripod",
    "ACE_Vector",
    "ACE_wirecutter",
    "ACE_VMM3",
    "ACE_Sunflower_Seeds",
    "ace_marker_flags_black",
    "ace_marker_flags_blue",
    "ace_marker_flags_green",
    "ace_marker_flags_red",
    "ace_marker_flags_white",
    "ace_marker_flags_yellow",
    //ACRE
    "ACRE_PRC117F",
    "ACRE_PRC152",
    "ACRE_PRC343",
    "ACRE_VHF30108",
    //CTABs
    "ItemAndroid",
    "ItemcTab",
    "B_UavTerminal",
    "ITC_Land_B_UAV_Packed",
    "ITC_Land_B_AR2i_Packed",
    "itc_land_tablet_fdc",
    //Weapon Attachments
    "uk3cb_baf_ta648",
    "uk3cb_baf_llm_ir_black",
    "uk3cb_baf_silencer_l115a3",
    "uk3cb_underbarrel_acc_fgrip_bipod",
    "UK3CB_BAF_HMNVS",
    "UK3CB_BAF_Soflam_Laserdesignator",
    "rksl_optic_pmii_525",
    "lsr_attachment_338_suppressor_black",
    "uk3cb_baf_silencer_l110",
    "rhsusf_acc_su230a_mrds",
    "rhsusf_acc_nt4_black",
    "rhsusf_acc_sf3p556",
    "rhsusf_acc_grip1",
    "rhs_altyn_visordown",
    "FIR_JHMCS_II",
    "rhsusf_ihadss",
    //Misc Items
    "V_EOD_olive_F",
    "ToolKit",
    "Attachable_Helistretcher",
    "Laserbatteries",
    "UK3CB_BAF_M6_RangeTable",
    "FISH_Cream_Kit_Europe",
    "grad_axe",
    "lsr_item_tripod",
    "lsr_item_l111a1_barrel",
    "lsr_item_l111a1_receiver",
    "lsr_item_l134a1_barrel",
    "lsr_item_l134a1_receiver",
    "42cdo_vs17_item",
    //GreenMag
    "greenmag_item_speedloader"
];

// Defines the available backpacks
KPCF_backpacks = [
    "rhsusf_eject_Parachute_backpack",
    "rhs_Tow_Gun_Bag",
    "rhs_TOW_Tripod_Bag",
    "B_UAV_06_backpack_F",
    "B_UGV_02_Demining_backpack_F",
    "B_rhsusf_B_BACKPACK"
];
// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev

A3W_smallVehicles =
[
	"C_Quadbike_01_F"
];

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Offroad_01_F",
	"C_SUV_01_F",
	"C_Offroad_02_unarmed_F",
	"I_E_Offroad_01_covered_F",
	["C_Hatchback_01_F", "C_Hatchback_01_sport_F"],
	["C_Van_01_box_F", "C_Van_01_transport_F"]
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	/*"I_G_Offroad_01_armed_F",
	"I_G_Offroad_01_F",
	"I_G_Offroad_01_AT_F",
	"I_C_Offroad_02_LMG_F"*/
	"C_Offroad_01_F",
	"C_SUV_01_F",
	"C_Offroad_02_unarmed_F",
	"I_E_Offroad_01_covered_F",
	["C_Hatchback_01_F", "C_Hatchback_01_sport_F"],
	["C_Van_01_box_F", "C_Van_01_transport_F"]
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	["C_Truck_02_covered_F", "C_Truck_02_transport_F"],
    ["I_Truck_02_covered_F", "I_Truck_02_transport_F"]
];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"C_Scooter_Transport_01_F",
	"C_Boat_Civil_01_F",
	"I_C_Boat_Transport_02_F",
	["B_Lifeboat", "C_Boat_Civil_01_rescue_F"]
];

//Object List - Random Spawns.
staticWeaponsList =
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList =
[
	"C_Heli_Light_01_civil_F"
	// don't put cargo helicopters here, it doesn't make sense to find them in towns; they spawn in the CivHeli mission
];

//Object List - Random Planes.
staticPlaneList =
[
	"C_Plane_Civil_01_F"
	//"C_Plane_Civil_01_racing_F"
];

A3W_planeSpawnOdds = 0.25; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	[
		"hgun_PDW2000_F",                                                              //SMG PDW2000
	    "SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora
	    "SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
	    "SMG_05_F",                                                                    //SMG Protector Sub Metralhadora
	    ["SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex"], //SMG ADR-97 TR
		"arifle_AKS_F"                                                                 //    AKS-74U
	],
	[
		"hgun_PDW2000_F",                                                              //SMG PDW2000
	    "SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora
	    "SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
	    "SMG_05_F",                                                                    //SMG Protector Sub Metralhadora
	    ["SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex"], //SMG ADR-97 TR
		"arifle_AKS_F"                                                                 //    AKS-74U
	],
	[
		"hgun_PDW2000_F",                                                              //SMG PDW2000
	    "SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora
	    "SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
	    "SMG_05_F",                                                                    //SMG Protector Sub Metralhadora
	    ["SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex"], //SMG ADR-97 TR
		"arifle_AKS_F"                                                                 //    AKS-74U
	],
	[
		"hgun_PDW2000_F",                                                              //SMG PDW2000
	    "SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora
	    "SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
	    "SMG_05_F",                                                                    //SMG Protector Sub Metralhadora
	    ["SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex"], //SMG ADR-97 TR
		"arifle_AKS_F"                                                                 //    AKS-74U
	],
	[
		"hgun_PDW2000_F",                                                              //SMG PDW2000
	    "SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora
	    "SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
	    "SMG_05_F",                                                                    //SMG Protector Sub Metralhadora
	    ["SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex"], //SMG ADR-97 TR
		"arifle_AKS_F"                                                                 //    AKS-74U
	],
	//---------------------------------------------------------------------------------------------------------------------
	"hgun_PDW2000_F",                                                              //SMG PDW2000
	"SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora
	"SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
	"SMG_05_F", 
	["SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex"],
	"arifle_AKS_F",
	//---------------------------------------------------------------------------------------------------------------------
	"hgun_PDW2000_F",                                                              //SMG PDW2000
	"SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora
	"SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
	"SMG_05_F", 
	["SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex"],
	"arifle_AKS_F",
	//---------------------------------------------------------------------------------------------------------------------
	"hgun_PDW2000_F",                                                              //SMG PDW2000
	"SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora
	"SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
	"SMG_05_F", 
	["SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex"],
	"arifle_AKS_F",
	//---------------------------------------------------------------------------------------------------------------------
	["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
	["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
	["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
	["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
	//---------------------------------------------------------------------------------------------------------------------
	["arifle_CTAR_blk_F", "arifle_CTAR_ghex_F", "arifle_CTAR_hex_F"],                  //Fuzil CAR-95
	[
		["arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F"],     //SPAR-16
	    ["arifle_Mk20C_plain_F", "arifle_Mk20C_F"],                                   //Carabina Mk20
	    "arifle_TRG20_F"                                                              // TGR-21
	],	
	[
		"arifle_Katiba_C_F",
	    ["arifle_MXC_Black_F", "arifle_MXC_khk_F", "arifle_MXC_F"],
		["arifle_MSBS65_F", "arifle_MSBS65_black_F", "arifle_MSBS65_camo_F", "arifle_MSBS65_sand_F"]  
	],
	["arifle_AKM_F", "srifle_DMR_01_F", "srifle_DMR_06_hunter_F"]
];

vehicleAddition =
[
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "ToolKit", "ItemGPS", "Binocular"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "Medikit"],
	["B_IR_Grenade", "O_IR_Grenade", "I_IR_Grenade"],
	["SmokeShellGreen", "SmokeShellOrange", "SmokeShellRed", "SmokeShellBlue", "SmokeShellPurple", "SmokeShell"]
];

vehicleAddition2 =
[
	["Chemlight_blue", "Chemlight_green", "Chemlight_yellow", "Chemlight_red"],
	["B_IR_Grenade", "B_IR_Grenade", "NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP", "NVGoggles_INDEP", "NVGoggles_tna_F"],
    ["B_IR_Grenade", "B_IR_Grenade", "O_NVGoggles_ghex_F", "O_NVGoggles_hex_F", "O_NVGoggles_urb_F", "O_NVGoggles_grn_F"]
];

vehicleAddition3 =
[
	[
		["H_Hat_Safari_olive_F", "H_Hat_Safari_sand_F"],
		"H_Helmet_Skate",
	    "H_Hat_Tinfoil_F"
	],
	["H_Bandanna_gry", "H_Bandanna_blu", "H_Bandanna_cbr", "H_Bandanna_khk_hs", "H_Bandanna_khk", "H_Bandanna_mcamo", "H_Bandanna_sgg", "H_Bandanna_sand", "H_Bandanna_surfer", "H_Bandanna_surfer_blk", "H_Bandanna_surfer_grn", "H_Bandanna_camo"],
	["H_Cap_grn_BI", "H_Cap_blk", "H_Cap_blu", "H_Cap_blk_CMMG", "H_Cap_grn", "H_Cap_blk_ION", "H_Cap_oli", "H_Cap_oli_hs", "H_Cap_police", "H_Cap_press", "H_Cap_red", "H_Cap_surfer", "H_Cap_tan", "H_Cap_khaki_specops_UK", "H_Cap_usblack", "H_Cap_tan_specops_US", "H_Cap_blk_Raven", "H_Cap_brn_SPECOPS", "H_Cap_headphones"],
	["H_Beret_blk", "H_Beret_gen_F", "H_Beret_Colonel", "H_Beret_02"],
	["H_MilCap_blue", "H_MilCap_gen_F", "H_MilCap_gry", "H_MilCap_ghex_F", "H_MilCap_ocamo", "H_MilCap_mcamo", "H_MilCap_tna_F", "H_MilCap_dgtl"],
	["H_Booniehat_khk", "H_Booniehat_oli", "H_Booniehat_tan", "H_Booniehat_mcamo", "H_Booniehat_tna_F", "H_Booniehat_dgtl"],
	["H_Shemag_olive", "H_ShemagOpen_tan", "H_Beret_Colonel", "H_ShemagOpen_khk"],
	["H_Hat_blue", "H_Hat_brown", "H_Hat_camo", "H_Hat_checker", "H_Hat_grey", "H_Hat_tan"]
];

vehicleAddition4 =
[
	[
		"U_IG_Guerilla1_1",
		"U_IG_Guerilla2_1",
		"U_IG_Guerilla2_2",
	    "U_IG_Guerilla2_3",
	    "U_IG_Guerilla3_1",
	    "U_IG_Guerilla3_2",
	    "U_IG_Guerrilla_6_1",
	    "U_IG_leader"
	],
	[
		"U_I_C_Soldier_Para_1_F",
		"U_I_C_Soldier_Para_2_F",
		"U_I_C_Soldier_Para_3_F",
		"U_I_C_Soldier_Para_4_F",
		"U_I_C_Soldier_Para_5_F"
	],	
	"U_I_C_Soldier_Camo_F"
];

vehicleAddition5 =
[
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "V_SmershVest_01_F", "V_SmershVest_01_radio_F"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "V_Pocketed_black_F", "V_Pocketed_coyote_F", "V_Pocketed_olive_F"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "V_DeckCrew_blue_F", "V_DeckCrew_green_F", "V_DeckCrew_yellow_F", "V_DeckCrew_red_F", "V_DeckCrew_brown_F", "V_DeckCrew_violet_F", "V_DeckCrew_white_F"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "V_BandollierB_blk", "V_BandollierB_cbr", "V_BandollierB_rgr", "V_BandollierB_khk", "V_BandollierB_oli", "V_BandollierB_ghex_F"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "V_HarnessOGL_brn", "V_HarnessOGL_gry", "V_HarnessOGL_ghex_F"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "V_Chestrig_khk", "V_Chestrig_rgr", "V_Chestrig_blk", "V_Chestrig_oli"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "V_TacChestrig_cbr_F", "V_TacChestrig_grn_F", "V_TacChestrig_oli_F"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "V_HarnessO_brn", "V_HarnessO_gry", "V_HarnessO_ghex_F"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "V_TacVest_blk", "V_TacVest_brn", "V_TacVest_camo", "V_TacVest_khk", "V_TacVest_oli"],
	["FirstAidKit", "FirstAidKit", "V_Press_F"],
	["FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit","V_TacVest_blk_POLICE", "V_TacVest_gen_F"]
];

vehicleAddition6 =
[
	
	["acc_pointer_IR", "acc_flashlight", "optic_aco_smg", "optic_ACO_grn_smg"],
	["acc_pointer_IR", "acc_flashlight", "optic_Holosight_smg", "optic_Holosight_smg_blk_F"],
	["acc_pointer_IR", "acc_flashlight", "optic_Aco", "optic_ACO_grn"],
	["acc_pointer_IR", "acc_flashlight", "optic_Holosight", "optic_Holosight_blk_F", "optic_Holosight_khk_F", "optic_Holosight_arid_F", "optic_Holosight_lush_F"],
	["acc_pointer_IR", "acc_flashlight", "optic_MRCO"/*, "optic_KHS_old"*/],
	["acc_pointer_IR", "acc_flashlight"]
];

/*vehicleAddition7 =
[
	["B_LegStrapBag_black_F", "B_LegStrapBag_coyote_F", "B_LegStrapBag_olive_F", "B_LegStrapBag_black_F", "B_LegStrapBag_coyote_F", "B_LegStrapBag_olive_F"],	
	["B_LegStrapBag_black_F", "B_LegStrapBag_coyote_F", "B_LegStrapBag_olive_F", "B_AssaultPack_blk", "B_AssaultPack_rgr", "B_AssaultPack_mcamo", "B_AssaultPack_ocamo"],
	["B_LegStrapBag_black_F", "B_LegStrapBag_coyote_F", "B_LegStrapBag_olive_F", "B_AssaultPack_dgtl", "B_AssaultPack_khk", "B_AssaultPack_cbr", "B_AssaultPack_sgg",  "B_AssaultPack_tna_F","B_AssaultPack_Kerry"],
	["B_LegStrapBag_black_F", "B_LegStrapBag_coyote_F", "B_LegStrapBag_olive_F", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_oucamo", "B_FieldPack_ocamo", "B_FieldPack_ghex_F"]
];*/

vehicleAddition8 =
[
	["G_Tactical_Clear", "G_Tactical_Black"],
	["G_Aviator", "G_Lady_Blue", "G_Lady_Red", "G_Lady_Mirror", "G_Lady_Dark", "G_Lowprofile"],
	["G_Sport_Red", "G_Sport_Blackyellow", "G_Sport_BlackWhite", "G_Sport_Checkered", "G_Sport_Blackred", "G_Sport_Greenblack", "G_Spectacles_Tinted", "G_Spectacles"],
	["G_Squares_Tinted", "G_Squares"],
	["G_Combat", "G_Combat_Goggles_tna_F"],
	["G_EyeProtectors_F", "G_EyeProtectors_Earpiece_F"],
	["G_Balaclava_blk", "G_Balaclava_oli"],
	["G_Balaclava_lowprofile", "G_Balaclava_combat"],
	["G_Bandanna_aviator", "G_Bandanna_shades", "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_tan"],
	["G_Respirator_white_F", "G_Respirator_yellow_F", "G_Respirator_blue_F"],
	["G_Balaclava_TI_blk_F", "G_Balaclava_TI_G_blk_F", "G_Balaclava_TI_tna_F", "G_Balaclava_TI_G_tna_F"],
	["G_Blindfold_01_black_F", "G_Blindfold_01_white_F"]
];
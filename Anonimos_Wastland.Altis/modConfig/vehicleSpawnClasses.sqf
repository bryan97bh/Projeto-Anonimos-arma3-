// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev

A3W_smallVehicles =
[
	"C_Quadbike_01_F",
	["B_Quadbike_01_F", "O_Quadbike_01_F", "I_Quadbike_01_F", "I_G_Quadbike_01_F"]
];

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Quadbike_01_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Offroad_01_F",
	"C_Offroad_02_unarmed_F",
	"C_Offroad_02_unarmed_F",
	["C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"]
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	"B_Quadbike_01_F",
	"O_Quadbike_01_F",
	"I_Quadbike_01_F",
	"I_G_Quadbike_01_F",
	"O_Truck_02_covered_F",
	"I_Truck_02_covered_F",
	"O_Truck_02_transport_F",
	"I_Truck_02_transport_F",
    "C_Offroad_02_unarmed_F",
	"I_G_Offroad_01_armed_F",
	"I_G_Offroad_01_F",
	"I_G_Offroad_01_AT_F",
	"B_GEN_Offroad_01_gen_F",
	"I_E_Offroad_01_covered_F",
	"C_Offroad_02_unarmed_F",
	"I_C_Offroad_02_LMG_F",
	"C_Van_02_medevac_F"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
//	"I_Truck_02_Fuel_F",
//	"O_Truck_02_Fuel_F",
//	"I_Truck_02_medical_F",
//	"O_Truck_02_medical_F",
//	"B_MRAP_01_F",
//	"O_MRAP_02_F",
//	"I_MRAP_03_F"
	"I_G_Offroad_01_armed_F"
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
	"C_Heli_Light_01_civil_F",
	"B_Heli_Light_01_F",
	"O_Heli_Light_02_unarmed_F",
	"C_IDAP_Heli_Transport_02_F"
	// don't put cargo helicopters here, it doesn't make sense to find them in towns; they spawn in the CivHeli mission
];

//Object List - Random Planes.
staticPlaneList =
[
	"C_Plane_Civil_01_F",
	"C_Plane_Civil_01_racing_F"
];

A3W_planeSpawnOdds = 0.25; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	[
		"hgun_PDW2000_F",
		"SMG_01_F", // Vermin
		"SMG_02_F", // Sting
		"SMG_05_F", //Protector
		"arifle_AKS_F", //AKS-74U
		[
			"SMG_03C_TR_black", // ADR-97
			"SMG_03C_TR_camo",
			"SMG_03C_TR_hex",
			"SMG_03C_TR_khaki"
		]
	],
	["arifle_Katiba_C_F"],
	["arifle_AKM_F"],
	["srifle_DMR_06_hunter_F", "srifle_DMR_01_F"],
	["arifle_TRG20_F", "arifle_Mk20C_plain_F", "arifle_Mk20C_F"],
	["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
	["arifle_MXC_Black_F", "arifle_MXC_khk_F", "arifle_MXC_F"],
	["arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F"],
	["arifle_CTAR_blk_F", "arifle_CTAR_ghex_F", "arifle_CTAR_hex_F"],
	["arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F"]
];

vehicleAddition =
[
	"optic_Aco",
	"optic_MRCO",
	"optic_KHS_old",
	"optic_ACO_grn",
	"optic_aco_smg",
	"optic_Holosight",
	"optic_Holosight_smg",
	"acc_flashlight",
	"acc_pointer_IR",
	"Medikit",
	"Medikit",
	"FirstAidKit",
    "FirstAidKit",
    "Binocular",
    "ItemGPS",
	"H_Hat_Safari_olive_F",
	"H_Cap_blk",
	"H_Cap_oli",
	"H_Bandanna_khk",
	"H_ShemagOpen_khk",
	"H_RacingHelmet_1_black_F",
	"H_Booniehat_tan",
    "V_BandollierB_blk",
    "V_BandollierB_rgr",
    "V_TacVest_blk_POLICE",
    "V_HarnessO_brn",
    "V_HarnessOGL_ghex_F",
    "V_Press_F",
    "V_Press_F",
    "B_FieldPack_oucamo",
    "G_Balaclava_blk",
    "G_Spectacles_Tinted",
	"ToolKit",
    "NVGoggles",
    "NVGoggles_OPFOR",
    "NVGoggles_INDEP",
	"H_Hat_Tinfoil_F",
	"H_HeadBandage_bloody_F",
	"U_IG_Guerilla1_1",
	"U_IG_Guerilla2_1",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla2_3",
	"U_IG_Guerilla3_1",
	"U_IG_Guerilla3_2",
	"U_IG_Guerrilla_6_1",
	"U_IG_leader",
	"V_SmershVest_01_F",
	"V_TacVestIR_blk",
	"V_DeckCrew_brown_F",
	"V_TacVest_brn"
];

vehicleAddition2 =
[
    "SmokeShellGreen",
    "SmokeShellOrange",
    "SmokeShellRed",
    "SmokeShellBlue",
    "SmokeShellPurple",
    "SmokeShell",
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red",
    "NVGoggles",
    "NVGoggles_OPFOR",
    "NVGoggles_INDEP"
];

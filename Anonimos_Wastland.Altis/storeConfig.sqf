// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: storeConfig.sqf
# @@Author: His_Shadow, AgentRev, Armajunkies
# @@Create Date: 2013-09-16 20:40:58
#*********************************************************/

// This tracks which store owner the client is interacting with
currentOwnerName = "";

// Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost

// empty name = name is extracted from class config

pistolArray = compileFinal str
[
	// Handguns
	["PM 9mm Pistol", "hgun_Pistol_01_F", 100],
	["P07 Pistol", "hgun_P07_F", 100],
    ["P07 Pistol (Khaki)", "hgun_P07_khk_F", 100, "noDLC"],
	["Rook-40 Pistol", "hgun_Rook40_F", 150],
	["ACP-C2 Pistol", "hgun_ACPC2_F", 75],
	["Zubr Revolver", "hgun_Pistol_heavy_02_F", 200],
	["4-Five Pistol", "hgun_Pistol_heavy_01_F", 200],
	["4-Five Pistol (Green)", "hgun_Pistol_heavy_01_green_F", 200, "noDLC"]
	
];

smgArray = compileFinal str
[
	["PDW2000 SMG", "hgun_PDW2000_F", 250],
    ["Protector SMG", "SMG_05_F", 250],
	["Sting SMG", "SMG_02_F", 250],
	["Vermin SMG", "SMG_01_F", 250],
	["ADR-97C (Black)", "SMG_03C_black", 100],
	["ADR-97C (Camo)", "SMG_03C_camo", 100],
	["ADR-97C (Hex)", "SMG_03C_hex", 100],
	["ADR-97C (Khaki)","SMG_03C_khaki", 100],
	["ADR-97C TR (Black)", "SMG_03C_TR_black", 125],
	["ADR-97C TR (Camo)", "SMG_03C_TR_camo", 125],
	["ADR-97C TR (Hex)", "SMG_03C_TR_hex", 125],
	["ADR-97C TR (Khaki)", "SMG_03C_TR_khaki", 125],
	["ADR-97 (Black)", "SMG_03_black", 125],
	["ADR-97 (Camo)", "SMG_03_camo", 125],
	["ADR-97 (Hex)", "SMG_03_hex", 125],
	["ADR-97 (Khaki)", "SMG_03_khaki", 125],
	["ADR-97 TR (Black)", "SMG_03_TR_black", 150],
	["ADR-97 TR (Camo)", "SMG_03_TR_camo", 150],
	["ADR-97 TR (Hex)", "SMG_03_TR_hex", 150],
	["ADR-97 TR (Khaki)", "SMG_03_TR_khaki", 150]
];

rifleArray = compileFinal str
[
	// Underwater Gun
	["SDAR Underwater Rifle", "arifle_SDAR_F", 200],

	// Assault Rifles
	["Mk20 Carbine", "arifle_Mk20C_plain_F", 200],
	["Mk20 Carbine (Camo)", "arifle_Mk20C_F", 200],
	["Mk20 Rifle", "arifle_Mk20_plain_F", 250],
	["Mk20 Rifle (Camo)", "arifle_Mk20_F", 250],
	["Mk20 EGLM Rifle", "arifle_Mk20_GL_plain_F", 300],
	["Mk20 EGLM Rifle (Camo)", "arifle_Mk20_GL_F", 300],

	["TRG-20 Carbine", "arifle_TRG20_F", 200],
	["TRG-21 Rifle ", "arifle_TRG21_F", 250],
	["TRG-21 EGLM Rifle", "arifle_TRG21_GL_F", 300],

	["SPAR-16 Rifle (Black)", "arifle_SPAR_01_blk_F", 200],
	["SPAR-16 Rifle (Khaki)", "arifle_SPAR_01_khk_F", 200],
	["SPAR-16 Rifle (Sand)", "arifle_SPAR_01_snd_F", 200],
	["SPAR-16 EGLM Rifle (Black)", "arifle_SPAR_01_GL_blk_F", 300],
	["SPAR-16 EGLM Rifle (Khaki)", "arifle_SPAR_01_GL_khk_F", 300],
	["SPAR-16 EGLM Rifle (Sand)", "arifle_SPAR_01_GL_snd_F", 300],
	
	["CAR-95 Rifle (Black)", "arifle_CTAR_blk_F", 200],
	["CAR-95 Rifle (Green Hex)", "arifle_CTAR_ghex_F", 200],
	["CAR-95 Rifle (Hex)", "arifle_CTAR_hex_F", 200],
	["CAR-95 GL Rifle (Black)", "arifle_CTAR_GL_blk_F", 300],
	["CAR-95 GL Rifle (Green Hex)", "arifle_CTAR_GL_ghex_F", 300],
	["CAR-95 GL Rifle (Hex)", "arifle_CTAR_GL_hex_F", 300],
	
	["Katiba Carbine", "arifle_Katiba_C_F", 300],
	["Katiba Rifle", "arifle_Katiba_F", 325],
	["Katiba GL Rifle", "arifle_Katiba_GL_F", 350],

	["MX Carbine (Black)", "arifle_MXC_Black_F", 300],
	["MX Carbine (Khaki)", "arifle_MXC_khk_F", 300, "noDLC"],
	["MX Carbine (Sand)", "arifle_MXC_F", 300],
	["MX Rifle (Black)", "arifle_MX_Black_F", 325],
	["MX Rifle (Khaki)", "arifle_MX_khk_F", 325, "noDLC"],
	["MX Rifle (Sand)", "arifle_MX_F", 325],
	["MX 3GL Rifle (Black)", "arifle_MX_GL_Black_F", 350],
	["MX 3GL Rifle (Khaki)", "arifle_MX_GL_khk_F", 350, "noDLC"],
	["MX 3GL Rifle (Sand)", "arifle_MX_GL_F", 350],
	
	["Promet 6.5", "arifle_MSBS65_F", 350],
	["Promet 6.5 (Black)", "arifle_MSBS65_black_F", 350],
	["Promet 6.5 (Camo)", "arifle_MSBS65_camo_F", 350],
	["Promet 6.5 (Sand)", "arifle_MSBS65_sand_F", 350],
	["Promet GL 6.5", "arifle_MSBS65_GL_F", 500],
	["Promet GL 6.5 (Black)", "arifle_MSBS65_GL_black_F", 500],
	["Promet GL 6.5 (Camo)", "arifle_MSBS65_GL_camo_F", 500],
	["Promet GL 6.5 (Sand)", "arifle_MSBS65_GL_sand_F", 500],
	
	["Promet SR 6.5", "arifle_MSBS65_UBS_F", 750],
	["Promet SR 6.5 (Black)", "arifle_MSBS65_UBS_black_F", 750],
	["Promet SR 6.5 (Camo)", "arifle_MSBS65_UBS_camo_F", 750],
	["Promet SR 6.5 (Sand)", "arifle_MSBS65_UBS_sand_F", 750],
		
	["AKS-74U Carbine", "arifle_AKS_F", 275],
	["AKM Rifle", "arifle_AKM_F", 300],
	["AKU-12 Rifle (Black)", "arifle_AK12U_F", 300],
	["AKU-12 Rifle (Lush)", "arifle_AK12U_lush_F", 300],
	["AKU-12 Rifle (Arid)", "arifle_AK12U_arid_F", 300],
	["AK-12 Rifle (Black)", "arifle_AK12_F", 300],
	["AK-12 Rifle (Lush)", "arifle_AK12_lush_F", 300, "noDLC"],
	["AK-12 Rifle (Arid)", "arifle_AK12_arid_F", 300, "noDLC"],
	["AK-12 GL Rifle (Black)", "arifle_AK12_GL_F", 350],
	["AK-12 GL Rifle (Lush)", "arifle_AK12_GL_luch_F", 350, "noDLC"],
	["AK-12 GL Rifle (Arid)", "arifle_AK12_GL_arid_F", 350, "noDLC"],
	
	["Kozlice 12G", "sgun_HunterShotgun_01_F", 300],
	["Kozlice 12G (Sawed Off)", "sgun_HunterShotgun_01_sawedoff_F", 150],
	
	["Type 115 Stealth MMG (Black)", "arifle_ARX_blk_F", 2000],
    ["Type 115 Stealth MMG (Green Hex)", "arifle_ARX_ghex_F", 2000],
    ["Type 115 Stealth MMG (Hex)", "arifle_ARX_hex_F", 2000],
    
	// Marksman Rifles
	["MXM Rifle", "arifle_MXM_F", 400],
    ["MXM Rifle (Khaki)", "arifle_MXM_khk_F", 400, "noDLC"],
	["MXM Rifle (Black)", "arifle_MXM_Black_F", 450],
	["Rahim Rifle", "srifle_DMR_01_F", 500],
	["Mk18 ABR Rifle", "srifle_EBR_F", 500],
	
	["Promet MR 6.5", "arifle_MSBS65_Mark_F", 500],
	["Promet MR 6.5 (Black)", "arifle_MSBS65_Mark_black_F", 750],
	["Promet MR 6.5 (Camo)", "arifle_MSBS65_Mark_camo_F", 750],
	["Promet MR 6.5 (Sand)", "arifle_MSBS65_Mark_sand_F", 750],

	// DLC
    ["CMR-76 Stealth (Black)", "srifle_DMR_07_blk_F", 500],
    ["CMR-76 Stealth (Green Hex)", "srifle_DMR_07_ghex_F", 500],
    ["CMR-76 Stealth (Hex)", "srifle_DMR_07_hex_F", 500],
	
    ["SPAR-17 EMR Rifle (Black)", "arifle_SPAR_03_blk_F", 700],
    ["SPAR-17 EMR Rifle (Khaki)", "arifle_SPAR_03_khk_F", 700],
    ["SPAR-17 EMR Rifle (Sand)", "arifle_SPAR_03_snd_F", 700],

	["Mk14 Rifle (Classic)", "srifle_DMR_06_hunter_F", 350],
	["Mk14 Rifle (Camo)", "srifle_DMR_06_camo_F", 500],
	["Mk14 Rifle (Olive)", "srifle_DMR_06_olive_F", 500],
	
	["Mk-I EMR Rifle (Black)", "srifle_DMR_03_F", 700],
	["Mk-I EMR Rifle (Camo)", "srifle_DMR_03_multicam_F", 700],
	["Mk-I EMR Rifle (Khaki)", "srifle_DMR_03_khaki_F", 700],
	["Mk-I EMR Rifle (Sand)", "srifle_DMR_03_tan_F", 700],
	["Mk-I EMR Rifle (Woodland)", "srifle_DMR_03_woodland_F", 700],
	
	["MAR-10 Rifle (Black)", "srifle_DMR_02_F", 4500],
	["MAR-10 Rifle (Camo)", "srifle_DMR_02_camo_F", 4500],
	["MAR-10 Rifle (Sand)", "srifle_DMR_02_sniper_F", 4500],
	
	["Cyrus Rifle (Black)", "srifle_DMR_05_blk_F", 4500],
	["Cyrus Rifle (Hex)", "srifle_DMR_05_hex_F", 4500],
	["Cyrus Rifle (Tan)", "srifle_DMR_05_tan_f", 4500],

	// Sniper Rifles
	["ASP-1 Kir Rifle (Black)", "srifle_DMR_04_F", 1000],
	["ASP-1 Kir Rifle (Tan)", "srifle_DMR_04_tan_F", 1000],
	["M320 LRR Sniper", "srifle_LRR_F", 9000],
	["M320 LRR Sniper (Camo)", "srifle_LRR_camo_F", 9000],
    ["M320 LRR Sniper (Tropic)", "srifle_LRR_tna_F", 9000, "noDLC"],
	["GM6 Lynx Sniper", "srifle_GM6_F", 10000],
	["GM6 Lynx Sniper (Camo)", "srifle_GM6_camo_F", 10000],
    ["GM6 Lynx Sniper (Green Hex)", "srifle_GM6_ghex_F", 10000, "noDLC"]
];

lmgArray = compileFinal str
[
	["SPAR-16S LMG (Black)", "arifle_SPAR_02_blk_F", 400],
    ["SPAR-16S LMG (Khaki)", "arifle_SPAR_02_khk_F", 400],
    ["SPAR-16S LMG (Sand)", "arifle_SPAR_02_snd_F", 400],
	
	["LIM-85 LMG (Black)", "LMG_03_F", 1000],
	
	["CAR-95-1 LMG (Black)", "arifle_CTARS_blk_F", 400],
	["CAR-95-1 LMG (Green Hex)", "arifle_CTARS_ghex_F", 400],
	["CAR-95-1 LMG (Hex)", "arifle_CTARS_hex_F", 400],
	
	["MX SW LMG (Black)", "arifle_MX_SW_Black_F", 400],
	["MX SW LMG (Khaki)", "arifle_MX_SW_khk_F", 400, "noDLC"],
	["MX SW LMG (Sand)", "arifle_MX_SW_F", 400],
	
	["Mk200 LMG", "LMG_Mk200_F", 1000],
	["Mk200 LMG (Black)", "LMG_Mk200_black_F", 1000, "noDLC"],
	
	["Zafir LMG", "LMG_Zafir_F", 1500],
	
	["RPK-12 7.62", "arifle_RPK12_F", 1000, "noDLC"],
	["RPK-12 7.62 (Arid)", "arifle_RPK12_arid_F", 1000, "noDLC"],
	["RPK-12 7.62 (Lush)", "arifle_RPK12_lush_F", 1000, "noDLC"],
    
    ["Navid MMG (Tan)", "MMG_01_tan_F", 7500],
	["Navid MMG (Hex)", "MMG_01_hex_F", 7500],
    
	["SPMG MMG (Black)", "MMG_02_black_F", 7500],
	["SPMG MMG (Sand)", "MMG_02_sand_F", 7500],
	["SPMG MMG (MTP)", "MMG_02_camo_F", 7500]
];

launcherArray = compileFinal str
[
    ["RPG-7", "launch_RPG7_F", 1000],
	["RPG-42 Alamut", "launch_RPG32_F", 1000],
    ["RPG-42 Alamut (Green Hex)", "launch_RPG32_ghex_F", 1000, "noDLC"],
	["RPG-42 Alamut (Green)", "launch_RPG32_green_F", 1000, "noDLC"],
	["PCML", "launch_NLAW_F", 800],
	["MAAWS Mk4 Mod 0 (Green)", "launch_MRAWS_green_rail_F", 1100, "noDLC"], // RPG-42 and MAAWS are similar, but MAAWS has longer range
    ["MAAWS Mk4 Mod 0 (Olive)", "launch_MRAWS_olive_rail_F", 1100, "noDLC"],
    ["MAAWS Mk4 Mod 0 (Sand)", "launch_MRAWS_sand_rail_F", 1100, "noDLC"],
    ["MAAWS Mk4 Mod 1 (Green)", "launch_MRAWS_green_F", 1500, "noDLC"], // MAAWS Mod 1 has nightvision and laser rangefinder, while Mod 0 doesn't
    ["MAAWS Mk4 Mod 1 (Olive)", "launch_MRAWS_olive_F", 1500, "noDLC"],
    ["MAAWS Mk4 Mod 1 (Sand)", "launch_MRAWS_sand_F", 1500, "noDLC"],
    ["9M135 Vorona (Brown)", "launch_O_Vorona_brown_F", 2000, "noDLC"],
    ["9M135 Vorona (Green)", "launch_O_Vorona_green_F", 2000, "noDLC"],
	["Titan MPRL Compact (Sand)", "launch_Titan_short_F", 2000],
	["Titan MPRL Compact (Coyote)", "launch_O_Titan_short_F", 2000],
	["Titan MPRL Compact (Olive)", "launch_I_Titan_short_F", 2000],
    ["Titan MPRL Compact (Tropic)", "launch_B_Titan_short_tna_F", 2000, "noDLC"],
    ["Titan MPRL Compact (Green Hex)", "launch_O_Titan_short_ghex_F", 2000, "noDLC"],
	["Titan MPRL AA (Sand)", "launch_Titan_F", 1800],
	["Titan MPRL AA (Hex)", "launch_O_Titan_F", 1800],
	["Titan MPRL AA (Digi)", "launch_I_Titan_F", 1800],
	["Titan MPRL AA (Geometric)", "launch_I_Titan_eaf_F", 1800, "noDLC"],
	["Titan MPRL AA (Olive)", "launch_I_Titan_olive_F", 1800, "noDLC"],
    ["Titan MPRL AA (Green Hex)", "launch_O_Titan_ghex_F", 1800, "noDLC"],
    ["Titan MPRL AA (Tropic)", "launch_B_Titan_tna_F", 1800, "noDLC"]
];

allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call launcherArray);

staticGunsArray = compileFinal str
[
	// ["Vehicle Ammo Crate", "Box_NATO_AmmoVeh_F", 2500],
	["Static Titan AT 4Rnd (NATO)", "B_static_AT_F", 3500], // Static launchers only have 4 ammo, hence the low price
	["Static Titan AT 4Rnd (CSAT)", "O_static_AT_F", 3500],
	["Static Titan AT 4Rnd (AAF)", "I_static_AT_F", 3500],
	["Static Titan AA 4Rnd (NATO)", "B_static_AA_F", 3500],
	["Static Titan AA 4Rnd (CSAT)", "O_static_AA_F", 3500],
	["Static Titan AA 4Rnd (AAF)", "I_static_AA_F", 3500],
	["Mk30 HMG .50 Low tripod (NATO)", "B_HMG_01_F", 3000],
	["Mk30 HMG .50 Low tripod (CSAT)", "O_HMG_01_F", 3000],
	["Mk30 HMG .50 Low tripod (AAF)", "I_HMG_01_F", 3000],
	// ["Mk30A HMG .50 Sentry (NATO)", "B_HMG_01_A_F", 5000], // "A" = Autonomous = Overpowered
	// ["Mk30A HMG .50 Sentry (CSAT)", "O_HMG_01_A_F", 5000],
	// ["Mk30A HMG .50 Sentry (AAF)", "I_HMG_01_A_F", 5000],
	["Mk30 HMG .50 High tripod (NATO)", "B_HMG_01_high_F", 3000],
	["Mk30 HMG .50 High tripod (CSAT)", "O_HMG_01_high_F", 3000],
	["Mk30 HMG .50 High tripod (AAF)", "I_HMG_01_high_F", 3000],
	["Mk32 GMG 20mm Low tripod (NATO)", "B_GMG_01_F", 5000],
	["Mk32 GMG 20mm Low tripod (CSAT)", "O_GMG_01_F", 5000],
	["Mk32 GMG 20mm Low tripod (AAF)", "I_GMG_01_F", 5000],
	// ["Mk32A GMG 20mm Sentry (NATO)", "B_GMG_01_A_F", 10000], // "A" = Autonomous = Overpowered
	// ["Mk32A GMG 20mm Sentry (CSAT)", "O_GMG_01_A_F", 10000],
	// ["Mk32A GMG 20mm Sentry (AAF)", "I_GMG_01_A_F", 10000],
	["Mk32 GMG 20mm High tripod (NATO)", "B_GMG_01_high_F", 5000],
	["Mk32 GMG 20mm High tripod (CSAT)", "O_GMG_01_high_F", 5000],
	["Mk32 GMG 20mm High tripod (AAF)", "I_GMG_01_high_F", 5000],
	["Mk6 Mortar (NATO)", "B_Mortar_01_F", 12500],
	["Mk6 Mortar (CSAT)", "O_Mortar_01_F", 12500],
	["Mk6 Mortar (AAF)", "I_Mortar_01_F", 12500]
];

throwputArray = compileFinal str
[
	["RGN Mini Grenade", "MiniGrenade", 50],
	["RGO Frag Grenade", "HandGrenade", 100],
	["APERS Tripwire Mine", "APERSTripMine_Wire_Mag", 500],
	["APERS Bounding Mine", "APERSBoundingMine_Range_Mag", 600],
	["APERS Mine", "APERSMine_Range_Mag", 500],
	["Claymore Charge", "ClaymoreDirectionalMine_Remote_Mag", 400],
	["M6 SLAM Mine", "SLAMDirectionalMine_Wire_Mag", 600],
	["AT Mine", "ATMine_Range_Mag", 800],
    ["Training Mine", "TrainingMine_01_F", 100],
	["Explosive Charge", "DemoCharge_Remote_Mag", 800],
	["Explosive Satchel", "SatchelCharge_Remote_Mag", 1000],
    ["IED Small Urban", "IEDUrbanSmall_Remote_Mag", 900],
    ["IED Small Land", "IEDLandSmall_Remote_Mag", 900],
    ["IED Big Urban", "IEDUrbanBig_Remote_Mag", 1100],
    ["IED Big Land", "IEDLandBig_Remote_Mag", 1100],
	["Smoke Grenade (White)", "SmokeShell", 50],
	["Smoke Grenade (Purple)", "SmokeShellPurple", 50],
	["Smoke Grenade (Blue)", "SmokeShellBlue", 50],
	["Smoke Grenade (Green)", "SmokeShellGreen", 50],
	["Teargas Smoke Grenade (Yellow)", "SmokeShellYellow", 250],
	["Smoke Grenade (Orange)", "SmokeShellOrange", 50],
	["Smoke Grenade (Red)", "SmokeShellRed", 50]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = compileFinal str
[
	["9mm 10Rnd Mag", "10Rnd_9x21_Mag", 10],
	["9mm 16Rnd Mag", "16Rnd_9x21_Mag", 15],
	["9mm 30Rnd Mag", "30Rnd_9x21_Mag", 25],
    ["9mm 30Rnd SMG Mag", "30Rnd_9x21_Mag_SMG_02", 25],
	[".45 ACP 6Rnd Cylinder", "6Rnd_45ACP_Cylinder", 25],
	[".45 ACP 9Rnd Mag", "9Rnd_45ACP_Mag", 15],
	[".45 ACP 11Rnd Mag", "11Rnd_45ACP_Mag", 25],
	[".45 ACP 30Rnd Vermin Mag", "30Rnd_45ACP_MAG_SMG_01", 30],
	[".45 ACP 30Rnd Tracer (Green) Mag", "30Rnd_45ACP_Mag_SMG_01_tracer_green", 25],
    ["5.45mm 30Rnd Mag", "30Rnd_545x39_Mag_F", 30],
	["5.45mm 30Rnd Tracer (Yellow) Mag", "30Rnd_545x39_Mag_Tracer_F", 20],
	["5.45mm 30Rnd Tracer (Green) Mag", "30Rnd_545x39_Mag_Tracer_Green_F", 20],
	["5.56mm 20Rnd Underwater Mag", "20Rnd_556x45_UW_mag", 30],
	["5.56mm 30Rnd STANAG Mag", "30Rnd_556x45_Stanag", 25],
	["5.56mm 30Rnd STANAG Mag (Sand)", "30Rnd_556x45_Stanag_Sand_Green", 25],
	["5.56mm 30Rnd Tracer (Green) Mag", "30Rnd_556x45_Stanag_Tracer_Green", 20],
	["5.56mm 30Rnd Tracer (Yellow) Mag", "30Rnd_556x45_Stanag_Tracer_Yellow", 20],
	["5.56mm 30Rnd Tracer (Red) Mag", "30Rnd_556x45_Stanag_Tracer_Red", 20],
    ["5.56mm 150Rnd Mag", "150Rnd_556x45_Drum_Mag_F", 100],
	["5.56mm 150Rnd Mag (Green)", "150Rnd_556x45_Drum_Green_Mag_F", 100],
	["5.56mm 150Rnd Mag (Sand)", "150Rnd_556x45_Drum_Sand_Mag_F", 100],
	["5.56mm 150Rnd Tracer (Red) Mag", "150Rnd_556x45_Drum_Mag_Tracer_F", 75],
	["5.56mm 200Rnd Box", "200Rnd_556x45_Box_F", 125],
	["5.56mm 200Rnd Tracer (Yellow) Box", "200Rnd_556x45_Box_Tracer_F", 100],
	["5.56mm 200Rnd Tracer (Red) Box", "200Rnd_556x45_Box_Tracer_Red_F", 100],
	["5.7mm 50Rnd ADR-97 Mag", "50Rnd_570x28_SMG_03", 20],
	["5.8mm 30Rnd Mag", "30Rnd_580x42_Mag_F", 35],
	["5.8mm 30Rnd Tracer (Green) Mag", "30Rnd_580x42_Mag_Tracer_F", 30],	
	["5.8mm 100Rnd Mag", "100Rnd_580x42_Mag_F", 100],
	["5.8mm 100Rnd Mag (GHex)", "100Rnd_580x42_ghex_Mag_F", 100],
	["5.8mm 100Rnd Mag (Hex)", "100Rnd_580x42_hex_Mag_F", 100],
	["5.8mm 100Rnd Tracer (Green) Mag", "100Rnd_580x42_Mag_Tracer_F", 80],
	["6.5mm 20Rnd Mag", "20Rnd_650x39_Cased_Mag_F", 30],
	["6.5mm 30Rnd STANAG Mag", "30Rnd_65x39_caseless_mag", 30],
	["6.5mm 30Rnd Tracer (Red) Mag", "30Rnd_65x39_caseless_mag_Tracer", 35],
	["6.5mm 30Rnd Caseless Mag", "30Rnd_65x39_caseless_green", 30],
	["6.5mm 30Rnd Tracer (Green) Mag", "30Rnd_65x39_caseless_green_mag_Tracer", 35],
	["6.5mm 30Rnd STANAG Mag (Black)", "30Rnd_65x39_caseless_black_mag", 30],
	["6.5mm 30Rnd STANAG Mag (Khaki)", "30Rnd_65x39_caseless_khaki_mag", 30],
	["6.5mm 100Rnd Belt Case", "100Rnd_65x39_caseless_mag", 100],
	["6.5mm 100Rnd Tracer (Red) Belt Case", "100Rnd_65x39_caseless_mag_Tracer", 120],
	["6.5mm 100Rnd Belt Case (Black)", "100Rnd_65x39_caseless_black_mag", 100],
	["6.5mm 100Rnd Belt Case (Khaki)", "100Rnd_65x39_caseless_khaki_mag", 100],
	["6.5mm 200Rnd Belt Case", "200Rnd_65x39_cased_Box", 200],
	["6.5mm 200Rnd Tracer (Yellow) Belt Case", "200Rnd_65x39_cased_Box_Tracer", 225],
	//["7.62mm 10Rnd Mag", "10Rnd_762x51_Mag", 15],
	["7.62mm 10Rnd Mag", "10Rnd_762x54_Mag", 50],
	["7.62mm 20Rnd Mag", "20Rnd_762x51_Mag", 75],
    ["7.62mm 30Rnd Mag", "30Rnd_762x39_Mag_F", 50],
	["7.62mm 30Rnd Tracer (Yellow) Mag", "30Rnd_762x39_Mag_Tracer_F", 50],
	["7.62mm 30Rnd Tracer (Green) Mag", "30Rnd_762x39_Mag_Tracer_Green_F", 50],
	//["7.62mm 150Rnd Box", "150Rnd_762x51_Box", 150],
	//["7.62mm 150Rnd Tracer (Green) Box", "150Rnd_762x51_Box_Tracer", 125],
	["7.62mm 150Rnd Box", "150Rnd_762x54_Box", 250],
	["7.62mm 150Rnd Tracer (Green) Box", "150Rnd_762x54_Box_Tracer", 275],
	[".338 LM 10Rnd Mag", "10Rnd_338_Mag", 200],
	[".338 NM 130Rnd Belt", "130Rnd_338_Mag", 250],
	["9.3mm 10Rnd Mag", "10Rnd_93x64_DMR_05_Mag", 200],
	["9.3mm 150Rnd Belt", "150Rnd_93x64_Mag", 250],
	[".408 7Rnd Cheetah Mag", "7Rnd_408_Mag", 500],
	["12.7mm 5Rnd Mag", "5Rnd_127x108_Mag", 500],
	["12.7mm 5Rnd Armor-Piercing Mag", "5Rnd_127x108_APDS_Mag", 700],
	["12.7mm 10Rnd Subsonic Mag", "10Rnd_127x54_Mag", 400],
	[".50 BW 10Rnd Mag", "10Rnd_50BW_Mag_F", 200],            //                 hit                      hit,  radius
    ["PG-7VM HEAT Grenade", "RPG7_F", 300],                   // Direct damage:  343     | Splash damage:  13,  3.0m     | Guidance: none
    ["RPG-42 AT Rocket", "RPG32_F", 350],                     //                 422     |                 28,  2.5m     |           none
    ["RPG-42 HE Rocket", "RPG32_HE_F", 300],                  //                 200     |                 50,  6.0m     |           none
    ["MAAWS HEAT 75 Rocket", "MRAWS_HEAT_F", 350],            //                 495     |                 14,  2.0m     |           none
    ["MAAWS HEAT 55 Rocket", "MRAWS_HEAT55_F", 450],          //                 450     |                 14,  2.0m     |           none
    ["MAAWS HE Rocket", "MRAWS_HE_F", 300],                   //                 200     |                 50,  6.0m     |           none
    ["9M135 HEAT Missile", "Vorona_HEAT", 1000],              //                 634     |                 28,  2.5m     |           mouse
    ["9M135 HE Missile", "Vorona_HE", 750],                   //                 220     |                 45,  8.0m     |           mouse
    ["PCML AT Missile", "NLAW_F", 750],                       //                 462     |                 25,  2.4m     |           laser/IR, cold/hot ground vehicles
    ["Titan Anti-Tank Missile", "Titan_AT", 1000],            //                 515     |                 20,  2.0m     |           mouse, laser/IR, hot ground vehicles
    ["Titan Anti-Personnel Missile", "Titan_AP", 750],        //                 100     |                 25, 10.0m     |           mouse, laser/IR
    ["Titan AA Missile", "Titan_AA", 750],                    //                  80     |                 60,  6.0m     |           aircraft
	["40mm HE Grenade Round", "1Rnd_HE_Grenade_shell", 300],
	["40mm 3Rnd HE Grenades", "3Rnd_HE_Grenade_shell", 900],
	["40mm Smoke Round (White)", "1Rnd_Smoke_Grenade_shell", 50],
	["40mm Smoke Round (Purple)", "1Rnd_SmokePurple_Grenade_shell", 50],
	["40mm Smoke Round (Blue)", "1Rnd_SmokeBlue_Grenade_shell", 50],
	["40mm Smoke Round (Green)", "1Rnd_SmokeGreen_Grenade_shell", 50],
	["40mm Smoke Round (Teargas)", "1Rnd_SmokeYellow_Grenade_shell", 300],
	["40mm Smoke Round (Orange)", "1Rnd_SmokeOrange_Grenade_shell", 50],
	["40mm Smoke Round (Red)", "1Rnd_SmokeRed_Grenade_shell", 50],
	["40mm 3Rnd Smokes (White)", "3Rnd_Smoke_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Purple)", "3Rnd_SmokePurple_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Blue)", "3Rnd_SmokeBlue_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Green)", "3Rnd_SmokeGreen_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Teargas)", "3Rnd_SmokeYellow_Grenade_shell", 900],
	["40mm 3Rnd Smokes (Orange)", "3Rnd_SmokeOrange_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Red)", "3Rnd_SmokeRed_Grenade_shell", 100],
	["40mm Flare Round (White)", "UGL_FlareWhite_F", 25],
	["40mm Flare Round (Green)", "UGL_FlareGreen_F", 25],
	["40mm Flare Round (Yellow)", "UGL_FlareYellow_F", 25],
	["40mm Flare Round (Red)", "UGL_FlareRed_F", 25],
	["40mm Flare Round (IR)", "UGL_FlareCIR_F", 25],
	["40mm 3Rnd Flares (White)", "3Rnd_UGL_FlareWhite_F", 50],
	["40mm 3Rnd Flares (Green)", "3Rnd_UGL_FlareGreen_F", 50],
	["40mm 3Rnd Flares (Yellow)", "3Rnd_UGL_FlareYellow_F", 50],
	["40mm 3Rnd Flares (Red)", "3Rnd_UGL_FlareRed_F", 50],
	["40mm 3Rnd Flares (IR)", "3Rnd_UGL_FlareCIR_F", 50],
	
	//Contact DLC
	
	["12 Gauge 2Rnd Pellets", "2Rnd_12Gauge_Pellets", 10],
	["12 Gauge 2Rnd Slug", "2Rnd_12Gauge_Slug", 10],
	["12 Gauge 6Rnd Pellets", "6Rnd_12Gauge_Pellets", 30],
	["12 Gauge 6Rnd Slugs", "6Rnd_12Gauge_Slugs", 30],
	
	["6.5mm 30Rnd Promet Mag", "30Rnd_65x39_caseless_msbs_mag", 35],
	["6.5mm 30Rnd Promet Tracer Mag", "30Rnd_65x39_caseless_msbs_mag_Tracer", 35],
	
	["7.62mm 10Rnd Mag", "10Rnd_762x51_Mag", 25],
	
	["7.62 75Rnd AK12 Mag", "75rnd_762x39_AK12_Mag_F", 100],
	["7.62 75Rnd AK12 Mag (Arid)", "75rnd_762x39_AK12_Arid_Mag_F", 100],
	["7.62 75Rnd AK12 Mag (Lush)", "75rnd_762x39_AK12_Lush_Mag_F", 100],
	["7.62 75Rnd AK12 Tracer Mag", "75rnd_762x39_AK12_Mag_Tracer_F", 100],
	
	["7.62 75Rnd AKM Mag", "75rnd_762x39_Mag_F", 100],
	
	["7.62 30Rnd AK12 Mag (Arid)", "30rnd_762x39_AK12_Arid_Mag_F", 100],
	["7.62 30Rnd AK12 Mag (Lush)", "30rnd_762x39_AK12_Lush_Mag_F", 100]
	
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray = compileFinal str
[
	["Suppressor 9mm", "muzzle_snds_L", 50, "item"],
	["Suppressor .45 ACP", "muzzle_snds_acp", 75, "item"],
    ["Suppressor 5.56mm (Black)", "muzzle_snds_M", 100, "item"],
    ["Suppressor 5.56mm (Khaki)", "muzzle_snds_m_khk_F", 100, "item", "noDLC"],
    ["Suppressor 5.56mm (Sand)", "muzzle_snds_m_snd_F", 100, "item", "noDLC"],
	["Suppressor 5.7mm", "muzzle_snds_570", 75, "item"],
    ["Stealth Suppressor 5.8mm (Black)", "muzzle_snds_58_blk_F", 100, "item"],
	["Stealth Suppressor 5.8mm (Green Hex)", "muzzle_snds_58_ghex_F", 100, "item"],
	["Stealth Suppressor 5.8mm (Hex)", "muzzle_snds_58_hex_F", 100, "item"],
    ["Suppressor 6.5mm (Black)", "muzzle_snds_H", 100, "item"],
    ["Suppressor 6.5mm (Khaki)", "muzzle_snds_H_khk_F", 100, "item", "noDLC"],
    ["Suppressor 6.5mm (Sand)", "muzzle_snds_H_snd_F", 100, "item", "noDLC"],
    ["MK200 LMG Suppressor 6.5mm (Black)", "muzzle_snds_H_MG_blk_F", 100, "item", "noDLC"],
    ["MK200 LMG Suppressor 6.5mm (Khaki)", "muzzle_snds_H_MG_khk_F", 100, "item", "noDLC"],
    ["MK200 LMG Suppressor 6.5mm (Sand)", "muzzle_snds_H_MG", 100, "item"],
    ["Stealth Suppressor 6.5mm (Black)", "muzzle_snds_65_TI_blk_F", 200, "item"],
    ["Stealth Suppressor 6.5mm (Green Hex)", "muzzle_snds_65_TI_ghex_F", 200, "item"],
    ["Stealth Suppressor 6.5mm (Hex)", "muzzle_snds_65_TI_hex_F", 200, "item"],
    ["Suppressor 7.62mm (Black)", "muzzle_snds_B", 125, "item"],
    ["Suppressor 7.62mm (Khaki)", "muzzle_snds_B_khk_F", 125, "item", "noDLC"],
    ["Suppressor 7.62mm (Sand)", "muzzle_snds_B_snd_F", 125, "item", "noDLC"],
	["Suppressor 7.62mm (Arid)", "muzzle_snds_B_arid_F", 125, "item", "noDLC"],
	["Suppressor 7.62mm (Lush)", "muzzle_snds_B_lush_F", 125, "item", "noDLC"],
	["Suppressor .338", "muzzle_snds_338_black", 500, "item"],
	["Suppressor .338 (Green)", "muzzle_snds_338_green", 500, "item"],
	["Suppressor .338 (Sand)", "muzzle_snds_338_sand", 500, "item"],
	["Suppressor 9.3mm", "muzzle_snds_93mmg", 500, "item"],
	["Suppressor 9.3mm (Tan)", "muzzle_snds_93mmg_tan", 500, "item"],
	["Bipod (Black) (NATO)", "bipod_01_F_blk", 100, "item", "noDLC"],
	["Bipod (Black) (CSAT)", "bipod_02_F_blk", 100, "item", "noDLC"],
	["Bipod (Black) (AAF)", "bipod_03_F_blk", 100, "item", "noDLC"],
	["Bipod (MTP)", "bipod_01_F_mtp", 100, "item", "noDLC"],
	["Bipod (Hex)", "bipod_02_F_hex", 100, "item", "noDLC"],
	["Bipod (Olive)", "bipod_03_F_oli", 100, "item", "noDLC"],
	["Bipod (Sand)", "bipod_01_F_snd", 100, "item", "noDLC"],
	["Bipod (Tan)", "bipod_02_F_tan", 100, "item", "noDLC"],
    ["Bipod (Khaki)", "bipod_01_F_khk", 100, "item", "noDLC"],
	["Bipod (Arid)", "bipod_02_F_arid", 100, "item", "noDLC"],
	["Bipod (Lush)", "bipod_02_F_lush", 100, "item", "noDLC"],
	["Flashlight", "acc_flashlight", 25, "item"],
    ["Pistol Flashlight" ,"acc_flashlight_pistol", 25, "item"],
	["IR Laser Pointer", "acc_pointer_IR", 25, "item"],
	["Yorris J2 (Zubr)", "optic_Yorris", 25, "item"],
    ["MRD (4-five/Sand)", "optic_MRD", 25, "item"],
    ["MRD (4-five/Black)", "optic_MRD_black", 25, "item", "noDLC"],
	["ACO (Red)", "optic_Aco", 150, "item"],
    ["ACO SMG (Red)", "optic_aco_smg", 150, "item"],
	["ACO (Green)", "optic_Aco_grn", 150, "item"],
    ["ACO SMG (Green)", "optic_ACO_grn_smg", 150, "item"],
    ["Holosight SMG", "optic_Holosight_smg", 75, "item"],
    ["Holosight SMG (Black)", "optic_Holosight_smg_blk_F", 75, "item"],
    ["Holosight", "optic_Holosight", 75, "item"],
    ["Holosight (Black)", "optic_Holosight_blk_F", 75, "item", "noDLC"],
    ["Holosight (Khaki)", "optic_Holosight_khk_F", 75, "item", "noDLC"],
	["Holosight (Arid)", "optic_Holosight_arid_F", 75, "item"],
	["Holosight (Lush)", "optic_Holosight_lush_F", 75, "item"],
    ["Promet Modular Sight", "optic_ico_01_f", 100, "item"],
    ["Promet Modular Sight (Black)", "optic_ico_01_black_f", 100, "item"],
    ["Promet Modular Sight (Camo)", "optic_ico_01_camo_f", 100, "item"],
    ["Promet Modular Sight (Sand)", "optic_ico_01_sand_f", 100, "item"],
    ["MRCO", "optic_MRCO", 600, "item"],
    ["ARCO", "optic_Arco", 650, "item"],
    ["ARCO (Black)", "optic_Arco_blk_F", 650, "item", "noDLC"],
    ["ARCO (Green Hex)", "optic_Arco_ghex_F", 650, "item", "noDLC"],
	["ARCO (Arid)", "optic_Arco_arid_F", 650, "item", "noDLC"],
	["ARCO (Lush)", "optic_Arco_lush_F", 650, "item", "noDLC"],
	["ARCO AK (Arid)", "optic_Arco_AK_arid_F", 650, "item", "noDLC"],
	["ARCO AK (Black)", "optic_Arco_AK_blk_F", 650, "item", "noDLC"],
	["ARCO AK (Lush)", "optic_Arco_AK_lush_F", 650, "item", "noDLC"],
    ["RCO", "optic_Hamr", 650, "item"],
    ["RCO (Khaki)", "optic_Hamr_khk_F", 650, "item", "noDLC"],
    ["ERCO (Black)", "optic_ERCO_blk_F", 750, "item"],
    ["ERCO (Green)", "optic_ERCO_khk_F", 750, "item"],
    ["ERCO (Sand)", "optic_ERCO_snd_F", 750, "item"],
    ["MOS", "optic_SOS", 650, "item"],
    ["MOS (Khaki)", "optic_SOS_khk_F", 650, "item", "noDLC"],
    ["DMS", "optic_DMS", 700, "item"],
    ["DMS (Green Hex)","optic_DMS_ghex_F", 700, "item"],
	["DMS (Old)","optic_DMS_weathered_F", 700, "item"],
	["DMS Kir (Old)","optic_DMS_weathered_Kir_F", 700, "item"],
	["AMS", "optic_AMS", 500, "item"],
	["AMS (Khaki)", "optic_AMS_khk", 500, "item"],
	["AMS (Sand)", "optic_AMS_snd", 500, "item"],
    ["Kahlia (Sightless)", "optic_KHS_old", 500, "item"],
	["Kahlia (Black)", "optic_KHS_blk", 600, "item"],
	["Kahlia (Hex)", "optic_KHS_hex", 600, "item"],
	["Kahlia (Tan)", "optic_KHS_tan", 600, "item"],
	["LRPS", "optic_LRPS", 1200, "item"],
	["LRPS (Green Hex)", "optic_LRPS_ghex_F", 1200, "item", "noDLC"],
    ["LRPS (Tropic)", "optic_LRPS_tna_F", 1200, "item", "noDLC"],
	["NVS", "optic_NVS", 1200, "item"],
	["TWS", "optic_tws", 5000, "item", "HIDDEN"], // To hide from store list, add "HIDDEN" after "item", like "item", "HIDDEN"]
	["TWS MG", "optic_tws_mg", 6000, "item", "HIDDEN"],
	["Nightstalker", "optic_Nightstalker", 3000, "item", "HIDDEN"]
];

// If commented, means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[
	["Combat Helmet", "H_HelmetB", 150, "hat"],
	["Combat Helmet (Camo)", "H_HelmetB_camo", 250, "hat"],
	["Combat Helmet (Sand)", "H_HelmetB_sand", 150, "hat"],
	["Combat Helmet (Black)", "H_HelmetB_black", 150, "hat"],
	["Combat Helmet (Desert)", "H_HelmetB_desert", 150, "hat"],
	["Combat Helmet (Grass)", "H_HelmetB_grass", 150, "hat"],
	["Combat Helmet (Snakeskin)", "H_HelmetB_snakeskin", 150, "hat"],
	["Combat Helmet (Tropic)", "H_HelmetB_tna_F", 150, "hat"],
	["Stealth Combat Helmet", "H_HelmetB_TI_tna_F", 350, "hat"],
	["ECH (Light)", "H_HelmetB_light", 150, "hat"],
	["ECH (Light, Sand)", "H_HelmetB_light_sand", 150, "hat"],
	["ECH (Light, Black)", "H_HelmetB_light_black", 150, "hat"],
	["ECH (Light, Desert)", "H_HelmetB_light_desert", 150, "hat"],
	["ECH (Light, Snakeskin)", "H_HelmetB_light_snakeskin", 150, "hat"],
	["ECH (Light, Grass)", "H_HelmetB_light_grass", 150, "hat"],
	["ECH (Light, Tropic)", "H_HelmetB_Light_tna_F", 150, "hat"],
	["Enhanced Combat Helmet", "H_HelmetSpecB", 150, "hat"],
	["Enhanced Combat Helmet (Sand)", "H_HelmetSpecB_sand", 150, "hat"],
	["Enhanced Combat Helmet (Black)", "H_HelmetSpecB_blk", 150, "hat"],
	["Enhanced Combat Helmet (Desert)", "H_HelmetSpecB_paint2", 150, "hat"],
	["Enhanced Combat Helmet (Grass)", "H_HelmetSpecB_paint1", 150, "hat"],
	["Enhanced Combat Helmet (Snakeskin)", "H_HelmetSpecB_snakeskin", 150, "hat"],
	["Enhanced Combat Helmet (Tropic)", "H_HelmetB_Enh_tna_F", 150, "hat"],
	["Assassin Helmet (Black)", "H_HelmetSpecO_blk", 150, "hat"],
	["Assassin Helmet (Green Hex)", "H_HelmetSpecO_ghex_F", 150, "hat"],
	["Assassin Helmet (Hex)", "H_HelmetSpecO_ocamo", 150, "hat"],
	["Defender Helmet (Green Hex)", "H_HelmetLeaderO_ghex_F", 150, "hat"],
	["Defender Helmet (Hex)", "H_HelmetLeaderO_ocamo", 150, "hat"],
	["Defender Helmet (Urban)", "H_HelmetLeaderO_oucamo", 150, "hat"],
	["Protector Helmet (Green Hex)", "H_HelmetO_ghex_F", 150, "hat"],
	["Protector Helmet (Hex)", "H_HelmetO_ocamo", 150, "hat"],
	["Protector Helmet (Urban)", "H_HelmetO_oucamo", 150, "hat"],
	["Special Purpose Helmet (Green Hex)", "H_HelmetO_ViperSP_ghex_F", 1300, "hat"],
	["Special Purpose Helmet (Hex)", "H_HelmetO_ViperSP_hex_F", 1300, "hat"],
	["MICH", "H_HelmetIA", 150, "hat"],
    ["Basic Helmet (Black)", "H_PASGT_basic_black_F", 150, "hat"],
    ["Basic Helmet (Blue)", "H_PASGT_basic_blue_F", 150, "hat"],
    ["Basic Helmet (Blue, Press)", "H_PASGT_basic_blue_press_F", 150, "hat"],
    ["Basic Helmet (Blue, Press, Neck)", "H_PASGT_neckprot_blue_press_F", 150, "hat"],
    ["Basic Helmet (Olive)", "H_PASGT_basic_olive_F", 150, "hat"],
    ["Basic Helmet (White)", "H_PASGT_basic_white_F", 150, "hat"],
	// ["MICH (Camo)", "H_HelmetIA_net", 150, "hat"],			//Duplicate of MICH
	// ["MICH 2 (Camo)", "H_HelmetIA_camo", 150, "hat"],		//Duplicate of MICH
	["Crew Helmet (NATO)", "H_HelmetCrew_B", 150, "hat"],
	["Crew Helmet (CSAT, Hex)", "H_HelmetCrew_O", 150, "hat"],
	["Crew Helmet (CSAT, Green Hex)", "H_HelmetCrew_O_ghex_F", 150, "hat"],
	["Crew Helmet (AAF)", "H_HelmetCrew_I", 150, "hat"],
    ["Crew Helmet (Black)", "H_Tank_black_F", 150, "hat"],
	["Heli Crew Helmet (NATO)", "H_CrewHelmetHeli_B", 1000, "hat"],
	["Heli Crew Helmet (CSAT)", "H_CrewHelmetHeli_O", 1000, "hat"],
	["Heli Crew Helmet (AAF)", "H_CrewHelmetHeli_I", 1000, "hat"],
	["Heli Pilot Helmet (NATO)", "H_PilotHelmetHeli_B", 350, "hat"],
	["Heli Pilot Helmet (CSAT)", "H_PilotHelmetHeli_O", 350, "hat"],
	["Heli Pilot Helmet (AAF)", "H_PilotHelmetHeli_I", 350, "hat"],
	["Pilot Helmet (NATO)", "H_PilotHelmetFighter_B", 900, "hat"],
	["Pilot Helmet (CSAT)", "H_PilotHelmetFighter_O", 900, "hat"],
	["Pilot Helmet (AAF)", "H_PilotHelmetFighter_I", 900, "hat"],
    ["Hard Hat (Black)", "H_Construction_basic_black_F", 50, "hat"],
    ["Hard Hat (Orange)", "H_Construction_basic_orange_F", 50, "hat"],
    ["Hard Hat (Red)", "H_Construction_basic_red_F", 50, "hat"],
    ["Hard Hat (White)", "H_Construction_basic_white_F", 50, "hat"],
    ["Hard Hat (Yellow)", "H_Construction_basic_yellow_F", 50, "hat"],
	["Skate Helmet", "H_Helmet_Skate", 50, "hat"],
	["Beanie (Black)", "H_Watchcap_blk", 25, "hat"],
	["Beanie (Coyote)", "H_Watchcap_cbr", 25, "hat"],
	["Beanie (Khaki)", "H_Watchcap_khk", 25, "hat"],
	["Beanie (Green)", "H_Watchcap_camo", 25, "hat"],
    ["Headset (Black)", "H_HeadSet_black_F", 20, "hat"],
	["Military Cap (Blue)", "H_MilCap_blue", 25, "hat"],
	["Military Cap (Gendarmerie)", "H_MilCap_gen_F", 25, "hat"],
	["Military Cap (Gray)", "H_MilCap_gry", 25, "hat"],
	["Military Cap (Green Hex)", "H_MilCap_ghex_F", 25, "hat"],
	["Military Cap (Hex)", "H_MilCap_ocamo", 25, "hat"],
	["Military Cap (MTP)", "H_MilCap_mcamo", 25, "hat"],
	["Military Cap (Tropic)", "H_MilCap_tna_F", 25, "hat"],
	["Military Cap (AAF)", "H_MilCap_dgtl", 25, "hat"],
    ["Fedora (Blue)", "H_Hat_blue", 10, "hat"],
	["Fedora (Brown)", "H_Hat_brown", 10, "hat"],
	["Fedora (Camo)", "H_Hat_camo", 10, "hat"],
	["Fedora (Checker)", "H_Hat_checker", 10, "hat"],
	["Fedora (Gray)", "H_Hat_grey", 10, "hat"],
	["Fedora (Tan)", "H_Hat_tan", 10, "hat"],
	["Straw Hat", "H_StrawHat", 10, "hat"],
	["Straw Hat (Dark)", "H_StrawHat_dark", 10, "hat"],
    ["Booniehat (Khaki, Headset)", "H_Booniehat_khk_hs", 10, "hat"],
	["Booniehat (Khaki)", "H_Booniehat_khk", 10, "hat"],
	["Booniehat (Olive)", "H_Booniehat_oli", 10, "hat"],
	["Booniehat (Sand)", "H_Booniehat_tan", 10, "hat"],
	["Booniehat (MTP)", "H_Booniehat_mcamo", 10, "hat"],
	["Booniehat (Tropic)", "H_Booniehat_tna_F", 10, "hat"],
	["Booniehat (AAF)", "H_Booniehat_dgtl", 10, "hat"],
    ["Safari Hat (Olive)", "H_Hat_Safari_olive_F", 20, "hat"],
    ["Safari Hat (Sand)", "H_Hat_Safari_sand_F", 20, "hat"],
    ["Head Bandage (Clean)", "H_HeadBandage_clean_F", 5, "hat"],
    ["Head Bandage (Stained)", "H_HeadBandage_stained_F", 5, "hat"],
    ["Head Bandage (Bloody)", "H_HeadBandage_bloody_F", 5, "hat"],
	["Cap (BI)", "H_Cap_grn_BI", 10, "hat"],
	["Cap (Black)", "H_Cap_blk", 10, "hat"],
	["Cap (Blue)", "H_Cap_blu", 10, "hat"],
	["Cap (CMMG)", "H_Cap_blk_CMMG", 10, "hat"],
	["Cap (Green)", "H_Cap_grn", 10, "hat"],
	["Cap (ION)", "H_Cap_blk_ION", 10, "hat"],
	["Cap (Olive)", "H_Cap_oli", 10, "hat"],
	["Cap (Olive, Headset)", "H_Cap_oli_hs", 10, "hat"],
	["Cap (Police)", "H_Cap_police", 10, "hat"],
	["Cap (Press)", "H_Cap_press", 10, "hat"],
	["Cap (Red)", "H_Cap_red", 10, "hat"],
	["Cap (Surfer)", "H_Cap_surfer", 10, "hat"],
	["Cap (Tan)", "H_Cap_tan", 10, "hat"],
	["Cap (UK)", "H_Cap_khaki_specops_UK", 10, "hat"],
	["Cap (US Black)", "H_Cap_usblack", 10, "hat"],
	["Cap (US MTP)", "H_Cap_tan_specops_US", 10, "hat"],
	["Cap (AAF)", "H_Cap_blk_Raven", 10, "hat"],
	["Cap (OPFOR)", "H_Cap_brn_SPECOPS", 10, "hat"],
    ["Cap (White, IDAP)", "H_Cap_White_IDAP_F", 10, "hat"],
    ["Cap (Orange, IDAP)", "H_Cap_Orange_IDAP_F", 10, "hat"],
    ["Cap (Black, IDAP)", "H_Cap_Black_IDAP_F", 10, "hat"],
	["Rangemaster Cap", "H_Cap_headphones", 10, "hat"],
	["Beret (Black)", "H_Beret_blk", 10, "hat"],
	["Beret (Gendarmerie)", "H_Beret_gen_F", 10, "hat"],
	["Beret (Colonel)", "H_Beret_Colonel", 10, "hat"],
	["Beret (NATO)", "H_Beret_02", 10, "hat"],
	// ["Beret (Green)", "H_Beret_grn", 10, "hat"],					//Duplicate of Beret black - BI...
	// ["Beret (Police)", "H_Beret_blk_POLICE", 10, "hat"],			//Duplicate of Beret black - BI...
	// ["Beret (Red)", "H_Beret_red", 10, "hat"],					//Duplicate of Beret black - BI...
	// ["Beret (SAS)", "H_Beret_brn_SF", 10, "hat"],				//Duplicate of Beret black - BI...
	// ["Beret (SF)", "H_Beret_grn_SF", 10, "hat"],					//Duplicate of Beret black - BI...
	// ["Beret (RED)", "H_Beret_ocamo", 10, "hat"],					//Duplicate of Beret black - BI...
	// ["Black Turban", "H_TurbanO_blk", 10, "hat"],				//Duplicate of some random shit - BI...
	// ["Booniehat (Dirty)", "H_Booniehat_dirty", 10, "hat"],		//Duplicate of some shit - BI...
	// ["Booniehat (Green)", "H_Booniehat_grn", 10, "hat"],			//Duplicate of some shit - BI...
	// ["Booniehat (Khaki)", "H_Booniehat_indp", 10, "hat"],		//Duplicate of some shit - BI...
	["Bandana (Black)", "H_Bandanna_gry", 10, "hat"],
	["Bandana (Blue)", "H_Bandanna_blu", 10, "hat"],
	["Bandana (Coyote)", "H_Bandanna_cbr", 10, "hat"],
	["Bandana (Headset)", "H_Bandanna_khk_hs", 10, "hat"],
	["Bandana (Khaki)", "H_Bandanna_khk", 10, "hat"],
	["Bandana (MTP)", "H_Bandanna_mcamo", 10, "hat"],
	["Bandana (Sage)", "H_Bandanna_sgg", 10, "hat"],
	["Bandana (Sand)", "H_Bandanna_sand", 10, "hat"],
	["Bandana (Surfer)", "H_Bandanna_surfer", 10, "hat"],
	["Bandana (Surfer, Black)", "H_Bandanna_surfer_blk", 10, "hat"],
	["Bandana (Surfer, Green)", "H_Bandanna_surfer_grn", 10, "hat"],
	["Bandana (Woodland)", "H_Bandanna_camo", 10, "hat"],
	// ["Bandanna Mask (Black)", "H_BandMask_blk", 10, "hat"],		//Duplicate of some random shit - BI...
	// ["Bandanna Mask (Demon)", "H_BandMask_demon", 10, "hat"],	//Duplicate of some random shit - BI...
	// ["Bandanna Mask (Khaki)", "H_BandMask_khk", 10, "hat"],		//Duplicate of some random shit - BI...
	// ["Bandanna Mask (Reaper)", "H_BandMask_reaper", 10, "hat"],	//Duplicate of some random shit - BI...
	["Shemag (Olive)", "H_Shemag_olive", 25, "hat"],
	["Shemag (Olive, Headset)", "H_Shemag_olive_hs", 25, "hat"],
	["Shemag (Tan)", "H_ShemagOpen_tan", 25, "hat"],
	["Shemag (White)", "H_ShemagOpen_khk", 25, "hat"],
	// ["Shemag mask (Tan)", "H_Shemag_tan", 25, "hat"],			//Duplicate of Shemag khaki - BI...
	["Racing Helmet (Black)", "H_RacingHelmet_1_black_F", 25, "hat"],
	["Racing Helmet (Blue)", "H_RacingHelmet_1_blue_F", 25, "hat"],
	["Racing Helmet (Green)", "H_RacingHelmet_1_green_F", 25, "hat"],
	["Racing Helmet (Yellow)", "H_RacingHelmet_1_yellow_F", 25, "hat"],
	["Racing Helmet (Orange)", "H_RacingHelmet_1_orange_F", 25, "hat"],
	["Racing Helmet (Red)", "H_RacingHelmet_1_red_F", 25, "hat"],
	["Racing Helmet (White)", "H_RacingHelmet_1_white_F", 25, "hat"],
	["Racing Helmet (Fuel)", "H_RacingHelmet_1_F", 25, "hat"],
	["Racing Helmet (Bluking)", "H_RacingHelmet_2_F", 25, "hat"],
	["Racing Helmet (Redstone)", "H_RacingHelmet_3_F", 25, "hat"],
	["Racing Helmet (Vrana)", "H_RacingHelmet_4_F", 25, "hat"],
	
	//DLC Contact
	
	["Advanced Modular Helmet", "H_HelmetHBK_headset_F", 500, "hat"],
	["Advanced Modular Helmet (Chops)", "H_HelmetHBK_chops_F", 500, "hat"],
	["Advanced Modular Helmet (Ear Protectors)", "H_HelmetHBK_ear_F", 500, "hat"],
	["Advanced Modular Helmet (Olive)", "H_HelmetHBK_F", 500, "hat"],
	["Avenger Helmet", "H_HelmetAggressor_F", 300, "hat"],
	["Avenger Helmet (Cover B)", "H_HelmetAggressor_cover_F", 300, "hat"],
	["Avenger Helmet (Cover T)", "H_HelmetAggressor_cover_taiga_F", 300, "hat"],
	["Beret (LDF)", "H_Beret_EAF_01_F", 10, "hat"],
	["Booniehat (Green)", "H_Booniehat_mgrn", 10, "hat"],
	["Booniehat (Taiga)", "H_Booniehat_taiga", 10, "hat"],
	["Booniehat (Woodland)", "H_Booniehat_wdl", 10, "hat"],
	["Booniehat (LDF)", "H_Booniehat_eaf", 10, "hat"],
	["Combat Helmet (Woodland)", "H_HelmetB_plain_wdl", 150, "hat"],
	["Crew Helmet (Soft)", "H_Tank_eaf_F", 150, "hat"],
	["Enhanced Combat Helmet (Woodland)", "H_HelmetSpecB_wdl", 150, "hat"],
	["Heli Crew Helmet (LDF)", "H_CrewHelmetHeli_I_E", 350, "hat"],
	["Heli Pilot Helmet (LDF)", "H_PilotHelmetHeli_I_E", 350, "hat"],
	["Light Combat Helmet (Woodland)", "H_HelmetB_light_wdl", 150, "hat"],
	["Military Cap (Green)", "H_MilCap_grn", 25, "hat"],
	["Military Cap (Taiga)", "H_MilCap_taiga", 25, "hat"],
	["Military Cap (Woodland)", "H_MilCap_wdl", 25, "hat"],
	["Military Cap (LDF)", "H_MilCap_eaf", 25, "hat"],
	["Pilot Helmet (LDF)", "H_PilotHelmetFighter_I_E", 900, "hat"],
	["Tin Foil Hat", "H_Hat_Tinfoil_F", 25, "hat"]
	
	
	
];

uniformArray = compileFinal str
[
	["Default Uniform (NATO)", "U_B_CombatUniform_mcam", 100, "uni"],
	["Default Uniform (CSAT)", "U_O_officer_noInsignia_hex_F", 100, "uni", "noDLC"],
	["Default Uniform (AAF)", "U_I_CombatUniform", 100, "uni"],
    
	["Combat Fatigues Shirt (MTP)", "U_B_CombatUniform_mcam_tshirt", 100, "uni"],       //Blufor
    ["Combat Fatigues (Tropic)", "U_B_T_Soldier_F", 100, "uni"],
	["Recon Fatigues (Sage)", "U_B_SpecopsUniform_sgg", 100, "uni"],
    ["Recon Fatigues (MTP)", "U_B_CombatUniform_mcam_vest", 25, "uni"],
    ["Recon Fatigues (Tropic)", "U_B_T_Soldier_SL_F", 25, "uni", "noDLC"],
    ["Recon Fatigues (Woodland)", "U_B_CombatUniform_vest_mcam_wdl_f", 25, "uni", "noDLC"],
    
    ["Recon Fatigues (Hex)", "U_O_SpecopsUniform_ocamo", 100, "uni"],                   //Opfor
	["Combat Fatigues (Urban)", "U_O_CombatUniform_oucamo", 100, "uni"],
    ["Combat Fatigues (Green Hex)", "U_O_T_Soldier_F", 100, "uni"],
    
    ["Combat Fatigues Short (Digi)", "U_I_CombatUniform_shortsleeve", 100, "uni"],      //Independent
	["Combat Fatigues Shirt (Digi)", "U_I_CombatUniform_tshirt", 100, "uni"],
    ["Combat Fatigues (Stavrou)", "U_I_G_resistanceLeader_F", 100, "uni"],
    
    ["CTRG Combat Uniform (UBACS)", "U_B_CTRG_1", 100, "uni"],
	["CTRG Combat Uniform (UBACS2)", "U_B_CTRG_2", 100, "uni"],
	["CTRG Combat Uniform (Tee)", "U_B_CTRG_3", 100, "uni"],
    ["CTRG Stealth Uniform", "U_B_CTRG_Soldier_F", 1000, "uni"],
    ["CTRG Stealth Uniform (Rolled-Up)", "U_B_CTRG_Soldier_3_F", 1000, "uni"],
    ["CTRG Stealth Uniform (Tee)", "U_B_CTRG_Soldier_2_F", 1000, "uni"],
    ["CTRG Urban Uniform", "U_B_CTRG_Soldier_urb_1_F", 1000, "uni"],
    ["CTRG Urban Uniform (Rolled-Up)", "U_B_CTRG_Soldier_urb_3_F", 1000, "uni"],
    ["CTRG Urban Uniform (Tee)", "U_B_CTRG_Soldier_urb_2_F", 1000, "uni"],
    
    ["Paramilitary Garb (Jacket)", "U_I_C_Soldier_Para_2_F", 100, "uni"],
    ["Paramilitary Garb (Shirt)", "U_I_C_Soldier_Para_3_F", 100, "uni"],
    ["Paramilitary Garb (Shorts)", "U_I_C_Soldier_Para_5_F", 100, "uni"],
    ["Paramilitary Garb (Tank Top)", "U_I_C_Soldier_Para_4_F", 100, "uni"],
    ["Paramilitary Garb (Tee)", "U_I_C_Soldier_Para_1_F", 100, "uni"],
    
    ["Special Purpose Suit (Green Hex)", "U_O_V_Soldier_Viper_F", 500, "uni"],
    ["Special Purpose Suit (Hex)", "U_O_V_Soldier_Viper_hex_F", 500, "uni"],

    ["Gendarmerie Commander Uniform", "U_B_GEN_Commander_F", 100, "uni"],
    ["Gendarmerie Uniform", "U_B_GEN_Soldier_F", 100, "uni"],
    
    ["Syndikat Uniform", "U_I_C_Soldier_Camo_F", 100, "uni"],
    
	["Officer Fatigues (Hex)", "U_O_OfficerUniform_ocamo", 100, "uni"],
	["Officer Fatigues (Digi)", "U_I_OfficerUniform", 100, "uni"],
    
	["Pilot Coveralls (NATO)", "U_B_PilotCoveralls", 100, "uni"],
	["Pilot Coveralls (CSAT)", "U_O_PilotCoveralls", 100, "uni"],
	["Pilot Coveralls (AAF)", "U_I_pilotCoveralls", 100, "uni"],
    
	["Heli Pilot Coveralls (NATO)", "U_B_HeliPilotCoveralls", 100, "uni"],
	["Heli Pilot Coveralls (AAF)", "U_I_HeliPilotCoveralls", 100, "uni"],
    
    ["Tank Coverall", "U_Tank_green_F", 100, "uni"],
    
	["Wetsuit (NATO)", "U_B_Wetsuit", 400, "uni"],
	["Wetsuit (CSAT)", "U_O_Wetsuit", 400, "uni"],
	["Wetsuit (AAF)", "U_I_Wetsuit", 400, "uni"],
    
    ["Survival Fatigues (NATO)", "U_B_survival_uniform", 200, "uni"],
    
	["Light Ghillie (NATO)", "U_B_GhillieSuit", 400, "uni"],
	["Light Ghillie (CSAT)", "U_O_GhillieSuit", 400, "uni"],
	["Light Ghillie (AAF)", "U_I_GhillieSuit", 400, "uni"],
    ["Light Ghillie (Jungle) (NATO)", "U_B_T_Sniper_F", 400, "uni"],
    ["Light Ghillie (Jungle) (CSAT)", "U_O_T_Sniper_F", 400, "uni"],
    
	["Full Ghillie (Arid) (NATO)", "U_B_FullGhillie_ard", 2000, "uni"],
	["Full Ghillie (Arid) (CSAT)", "U_O_FullGhillie_ard", 2000, "uni"],
	["Full Ghillie (Arid) (AAF)", "U_I_FullGhillie_ard", 2000, "uni"],
	["Full Ghillie (Lush) (NATO)", "U_B_FullGhillie_lsh", 2500, "uni"],
	["Full Ghillie (Lush) (CSAT)", "U_O_FullGhillie_lsh", 2500, "uni"],
	["Full Ghillie (Lush) (AAF)", "U_I_FullGhillie_lsh", 2500, "uni"],
    ["Full Ghillie (Jungle) (NATO)", "U_B_T_FullGhillie_tna_F", 2000, "uni"],
    ["Full Ghillie (Jungle) (CSAT)", "U_O_T_FullGhillie_tna_F", 2000, "uni"],
	["Full Ghillie (Semi-Arid) (NATO)", "U_B_FullGhillie_sard", 2500, "uni"],
	["Full Ghillie (Semi-Arid) (CSAT)", "U_O_FullGhillie_sard", 2500, "uni"],
	["Full Ghillie (Semi-Arid) (AAF)", "U_I_FullGhillie_sard", 2500, "uni"],
    
    ["Guerilla Garment", "U_BG_Guerilla1_1", 100, "uni"],                    // BLUFOR
	["Guerilla Outfit (Plain, Dark)", "U_BG_Guerilla2_1", 100, "uni"],
	["Guerilla Outfit (Pattern)", "U_BG_Guerilla2_2", 100, "uni"],
	["Guerilla Outfit (Plain, Light)", "U_BG_Guerilla2_3", 100, "uni"],
	["Guerilla Smocks", "U_BG_Guerilla3_1", 100, "uni"],
    ["Guerilla Smocks 2", "U_BG_Guerilla3_2", 100, "uni"],
	["Guerilla Apparel", "U_BG_Guerrilla_6_1", 100, "uni"],
	["Guerilla Uniform", "U_BG_leader", 100, "uni"],
	
    ["Guerilla Garment", "U_OG_Guerilla1_1", 100, "uni"],                    // OPFOR
	["Guerilla Outfit (Plain, Dark)", "U_OG_Guerilla2_1", 100, "uni"],
	["Guerilla Outfit (Pattern)", "U_OG_Guerilla2_2", 100, "uni"],
	["Guerilla Outfit (Plain, Light)", "U_OG_Guerilla2_3", 100, "uni"],
	["Guerilla Smocks", "U_OG_Guerilla3_1", 100, "uni"],
    ["Guerilla Smocks 2", "U_OG_Guerilla3_2", 100, "uni"],
	["Guerilla Apparel", "U_OG_Guerrilla_6_1", 100, "uni"],
	["Guerilla Uniform", "U_OG_leader", 100, "uni"],
	
    ["Guerilla Garment", "U_IG_Guerilla1_1", 100, "uni"],                    // Independent
	["Guerilla Outfit (Plain, Dark)", "U_IG_Guerilla2_1", 100, "uni"],
	["Guerilla Outfit (Pattern)", "U_IG_Guerilla2_2", 100, "uni"],
	["Guerilla Outfit (Plain, Light)", "U_IG_Guerilla2_3", 100, "uni"],
	["Guerilla Smocks", "U_IG_Guerilla3_1", 100, "uni"],
    ["Guerilla Smocks 2", "U_IG_Guerilla3_2", 100, "uni"],
	["Guerilla Apparel", "U_IG_Guerrilla_6_1", 100, "uni"],
	["Guerilla Uniform", "U_IG_leader", 100, "uni"],
    
	["Polo (Competitor)", "U_Competitor", 100, "uni"],
	["Polo (Rangemaster)", "U_Rangemaster", 100, "uni"],
	//["Polo (Agent)", "U_NikosAgedBody", 150, "uni"]                // Impossible to wear - BI...
    /*["Worker Coveralls", "U_C_WorkerCoveralls", 25, "uni"],         // Can only be worn by civilian units
    ["T-Shirt (Blue)", "U_C_Poor_1", 25, "uni"],
    ["Polo (Red/white)", "U_C_Poloshirt_redwhite", 25, "uni"],
    ["Polo (Salmon)", "U_C_Poloshirt_salmon", 25, "uni"],
    ["Polo (Tri-color)", "U_C_Poloshirt_tricolour", 25, "uni"],
    ["Polo (Navy)", "U_C_Poloshirt_blue", 25, "uni"],
    ["Polo (Burgundy)", "U_C_Poloshirt_burgundy", 25, "uni"],
    ["Polo (Blue/green)", "U_C_Poloshirt_stripped", 25, "uni"],
    ["Racing Suit (Black)", "U_C_Driver_1_black", 25, "uni"],
    ["Racing Suit (Blue)", "U_C_Driver_1_blue", 25, "uni"],
    ["Racing Suit (Green)", "U_C_Driver_1_green", 25, "uni"],
    ["Racing Suit (Yellow)", "U_C_Driver_1_yellow", 25, "uni"],
    ["Racing Suit (Orange)", "U_C_Driver_1_orange", 25, "uni"],
    ["Racing Suit (Red)", "U_C_Driver_1_red", 25, "uni"],
    ["Racing Suit (White)", "U_C_Driver_1_white", 25, "uni"],
    ["Racing Suit (Fuel)", "U_C_Driver_1", 25, "uni"],
    ["Racing Suit (Bluking)", "U_C_Driver_2", 25, "uni"],
    ["Racing Suit (Redstone)", "U_C_Driver_3", 25, "uni"],
    ["Racing Suit (Vrana)", "U_C_Driver_4", 25, "uni"],*/
    //["Tron Light Suit (Blue)", "U_B_Protagonist_VR", 5000, "uni"],
    //["Tron Light Suit (Red)", "U_O_Protagonist_VR", 5000, "uni"],
    //["Tron Light Suit (Green)", "U_I_Protagonist_VR", 5000, "uni"],
	
	//DLC Contact
	
	["CBRN Suit (MTP)", "U_B_CBRN_Suit_01_MTP_F", 100, "uni"],
	["CBRN Suit (Tropic)", "U_B_CBRN_Suit_01_Tropic_F", 100, "uni"],
	["CBRN Suit (Woodland)", "U_B_CBRN_Suit_01_Wdl_F", 100, "uni"],
	
	["CBRN Suit (AAF)", "U_I_CBRN_Suit_01_AAF_F", 100, "uni"],
	["CBRN Suit (LDF)", "U_I_E_CBRN_Suit_01_EAF_F", 100, "uni"],
	
	["Combat Fatigues (Officer)", "U_I_E_Uniform_01_officer_F", 100, "uni"],
	["Combat Fatigues (Rolled-Up)", "U_I_E_Uniform_01_shortsleeve_F", 100, "uni"],
	["Combat Fatigues (Sweater)", "U_I_E_Uniform_01_sweater_F", 100, "uni"],
	["Combat Fatigues (Tank Top)", "U_I_E_Uniform_01_tanktop_F", 100, "uni"],
	
	["Combat Fatigues (Woodland)", "U_B_CombatUniform_mcam_wdl_F", 100, "uni"],
	["Combat Fatigues (Woodland, Tee)", "U_B_CombatUniform_tshirt_mcam_wdl_F", 100, "uni"],
	["Combat Fatigues (Woodland)", "U_B_CombatUniform_mcam_wdl_F", 100, "uni"],
	
	["Combat Fatigues (WLDF)", "U_I_E_Uniform_01_F", 100, "uni"],
	["Deserter Clothes (Jacket)", "U_I_L_Uniform_01_camo_F", 100, "uni"],
	["Deserter Clothes (T-Shirt)", "U_I_L_Uniform_01_deserter_F", 100, "uni"],
	
	["Heli Pilot Coveralls (LDF)", "U_I_E_Uniform_01_coveralls_F", 100, "uni"]
	
];

vestArray = compileFinal str
[
    //Rebreather
	["Rebreather (NATO)", "V_RebreatherB", 500, "vest"],
	["Rebreather (CSAT)", "V_RebreatherIR", 500, "vest"],
	["Rebreather (AAF)", "V_RebreatherIA", 500, "vest"],
    
    //No Protection, No Space
    ["Safety Vest (Yellow)", "V_Safety_yellow_F", 50, "vest", "noDLC"],
    ["Safety Vest (Orange)", "V_Safety_orange_F", 50, "vest", "noDLC"],
    ["Safety Vest (Blue)", "V_Safety_blue_F", 50, "vest", "noDLC"],
    ["Identification Vest (Medic)", "V_Plain_crystal_F", 50, "vest", "noDLC"],
    ["Identification Vest (IDAP)", "V_Plain_medical_F", 50, "vest", "noDLC"],
    
    //No Protection, but with some space
    ["Rangemaster Belt", "V_Rangemaster_belt", 20, "vest"],
    ["Multi-Pocket Vest (Black)", "V_Pocketed_black_F", 50, "vest", "noDLC"],
    ["Multi-Pocket Vest (Coyote)", "V_Pocketed_coyote_F", 50, "vest", "noDLC"],
    ["Multi-Pocket Vest (Olive)", "V_Pocketed_olive_F", 50, "vest", "noDLC"],
    ["Slash Bandolier (Black)", "V_BandollierB_blk", 100, "vest"],
	["Slash Bandolier (Coyote)", "V_BandollierB_cbr", 100, "vest"],
	["Slash Bandolier (Green)", "V_BandollierB_rgr", 100, "vest"],
	["Slash Bandolier (Khaki)", "V_BandollierB_khk", 100, "vest"],
	["Slash Bandolier (Olive)", "V_BandollierB_oli", 100, "vest"],
    ["Slash Bandolier (Green Hex)", "V_BandollierB_ghex_F", 100, "vest"],
    ["Leg Strap Bag (Black)", "V_LegStrapBag_black_F", 130, "vest", "noDLC"],
    ["Leg Strap Bag (Coyote)", "V_LegStrapBag_coyote_F", 130, "vest", "noDLC"],
    ["Leg Strap Bag (Olive)", "V_LegStrapBag_olive_F", 130, "vest", "noDLC"],
    ["LBV Grenadier Harness (Brown)", "V_HarnessOGL_brn", 150, "vest"],
	["LBV Grenadier Harness (Gray)", "V_HarnessOGL_gry", 150, "vest"],
    ["LBV Grenadier Herness (Green Hex)", "V_HarnessOGL_ghex_F", 150, "vest"],
    ["Chest Rig (Khaki)", "V_Chestrig_khk", 175, "vest"],
	["Chest Rig (Green)", "V_Chestrig_rgr", 175, "vest"],
	["Chest Rig (Black)", "V_Chestrig_blk", 175, "vest"],
	["Chest Rig (Olive)", "V_Chestrig_oli", 175, "vest"],
    ["Tactical Chest Rig (Coyote)", "V_TacChestrig_cbr_F", 175, "vest"],
    ["Tactical Chest Rig (Green)", "V_TacChestrig_grn_F", 175, "vest"],
    ["Tactical Chest Rig (Olive)", "V_TacChestrig_oli_F", 175, "vest"],
    ["LBV Harness (Brown)", "V_HarnessO_brn", 200, "vest"],
	["LBV Harness (Gray)", "V_HarnessO_gry", 200, "vest"],
    ["LBV Harness (Green Hex)", "V_HarnessO_ghex_F", 200, "vest"],
    ["Kipchak Vest", "V_SmershVest_01_F", 500, "vest", "noDLC"],
	["Kipchak Vest (Tactical Radio)", "V_SmershVest_01_radio_F", 500, "vest", "noDLC"],
    
    //Small Protection
    ["Raven Vest", "V_TacVestIR_blk", 225, "vest"],
    ["Tactical Vest (Black)", "V_TacVest_blk", 250, "vest"],
	["Tactical Vest (Brown)", "V_TacVest_brn", 250, "vest"],
	["Tactical Vest (Camo)", "V_TacVest_camo", 250, "vest"],
	["Tactical Vest (Khaki)", "V_TacVest_khk", 250, "vest"],
	["Tactical Vest (Olive)", "V_TacVest_oli", 250, "vest"],
    ["Tactical Vest (Slavrou)", "V_I_G_resistanceLeader_F", 250, "vest"],
    ["Press Vest", "V_Press_F", 275, "vest"],
    ["Deck Crew Vest (Blue)", "V_DeckCrew_blue_F", 275, "vest", "noDLC"],
    ["Deck Crew Vest (Green)", "V_DeckCrew_green_F", 275, "vest", "noDLC"],
    ["Deck Crew Vest (Yellow)", "V_DeckCrew_yellow_F", 275, "vest", "noDLC"],
    ["Deck Crew Vest (Red)", "V_DeckCrew_red_F", 275, "vest", "noDLC"],
    ["Deck Crew Vest (Brown)", "V_DeckCrew_brown_F", 275, "vest", "noDLC"],
    ["Deck Crew Vest (Violet)", "V_DeckCrew_violet_F", 275, "vest", "noDLC"],
    ["Deck Crew Vest (White)", "V_DeckCrew_white_F", 275, "vest", "noDLC"],
	["Tactical Vest (Police)", "V_TacVest_blk_POLICE", 300, "vest"],
    ["Tactical Vest (Gendarmerie)", "V_TacVest_gen_F", 300, "vest"],
    
    //Mid Protection
    ["Modular Carrier Lite (Geometric)", "V_CarrierRigKBT_01_light_EAF_F", 350, "vest", "noDLC"],
	["Modular Carrier Lite (Olive)", "V_CarrierRigKBT_01_light_Olive_F", 350, "vest", "noDLC"],
	["Carrier Lite (Green, US Flag)", "V_PlateCarrier1_rgr", 350, "vest"],
	["Carrier Lite (Green, no Flag)", "V_PlateCarrier1_rgr_noflag_F", 350, "vest"],
	["Carrier Lite (Black, no Flag)", "V_PlateCarrier1_blk", 350, "vest"],
	["Carrier Lite (CTRG, UK Flag)", "V_PlateCarrierL_CTRG", 350, "vest"],
    ["Carrier Lite (Tropic, US Flag)", "V_PlateCarrier1_tna_F", 350, "vest", "noDLC"],
    ["Carrier Lite (Woodland, no Flag)", "V_PlateCarrier1_wdl", 350, "vest", "noDLC"],
    ["GA Carrier Lite (Digi)", "V_PlateCarrierIA1_dgtl", 400, "vest"],
    ["Modular Carrier Lite (LDF)", "V_CarrierRigKBT_01_light_EAF_F", 500, "vest"],
    ["Modular Carrier Lite (Olive)", "V_CarrierRigKBT_01_light_Olive_F", 500, "vest"],
    
    //Heavy Protection
    ["Modular Carrier Vest (Geometric)", "V_CarrierRigKBT_01_EAF_F", 400, "vest", "noDLC"],
	["Modular Carrier Vest (Olive)", "V_CarrierRigKBT_01_Olive_F", 400, "vest", "noDLC"],
    ["GA Carrier Rig (Digi)", "V_PlateCarrierIA2_dgtl", 800, "vest"],
	["Carrier Rig (Green, US Flag)", "V_PlateCarrier2_rgr", 1000, "vest"],
	["Carrier Rig (Green, no Flag)", "V_PlateCarrier2_rgr_noflag_F", 1000, "vest"],
	["Carrier Rig (Black, no Flag)", "V_PlateCarrier2_blk", 1000, "vest"],
	["Carrier Rig (CTRG, UK Flag)", "V_PlateCarrierH_CTRG", 1000, "vest"],
    ["Carrier Rig (Tropic, US Flag)", "V_PlateCarrier2_tna_F", 1000, "vest", "noDLC"],
    ["Carrier Rig (Woodland, no Flag)", "V_PlateCarrier2_wdl", 1000, "vest", "noDLC"],
    ["Modular Carrier Vest (LDF)", "V_CarrierRigKBT_01_EAF_F", 1000, "vest"],
    ["Modular Carrier Vest (Olive)", "V_CarrierRigKBT_01_Olive_F", 1000, "vest"],
    
    //Explosive Resistant - IMBA Vest
	["Carrier GL Rig (Green)", "V_PlateCarrierGL_rgr", 2500, "vest", "HIDDEN"],
	["Carrier GL Rig (Black)", "V_PlateCarrierGL_blk", 2500, "vest", "HIDDEN"],
	["Carrier GL Rig (MTP)", "V_PlateCarrierGL_mtp", 2500, "vest", "HIDDEN"],
    ["Carrier GL Rig (Tropic)", "V_PlateCarrierGL_tna_F", 2500, "vest", "HIDDEN", "noDLC"],
    ["Carrier GL Rig (Woodland)", "V_PlateCarrierGL_wdl", 2500, "vest", "noDLC", "HIDDEN"],
    ["GA Carrier GL Rig (Digi)", "V_PlateCarrierIAGL_dgtl", 2500, "vest", "HIDDEN"],
	["GA Carrier GL Rig (Olive)", "V_PlateCarrierIAGL_oli", 2500, "vest", "HIDDEN"],
    ["Modular Carrier GL Rig (LDF)", "V_CarrierRigKBT_01_heavy_EAF_F", 2500, "vest"],
    ["Modular Carrier GL Rig (Olive)", "V_CarrierRigKBT_01_heavy_Olive_F", 2500, "vest"],
    ["EOD Vest (Blue)", "V_EOD_blue_F", 2500, "vest", "HIDDEN", "noDLC"],
    ["EOD Vest (Blue, IDAP)", "V_EOD_IDAP_blue_F", 2500, "vest", "HIDDEN", "noDLC"],
    ["EOD Vest (Coyote)", "V_EOD_coyote_F", 2500, "vest", "HIDDEN", "noDLC"],
    ["EOD Vest (Olive)", "V_EOD_olive_F", 2500, "vest", "HIDDEN", "noDLC"],
    
    //Balistic Protection - IMBA Vest
	["Carrier Special Rig (Green)", "V_PlateCarrierSpec_rgr", 2500, "vest", "HIDDEN"],
	["Carrier Special Rig (Black)", "V_PlateCarrierSpec_blk", 2500, "vest", "HIDDEN"],
	["Carrier Special Rig (MTP)", "V_PlateCarrierSpec_mtp", 2500, "vest", "HIDDEN"],
    ["Carrier Special Rig (Tropic)", "V_PlateCarrierSpec_tna_F", 2500, "vest", "HIDDEN", "noDLC"],
	["Carrier Special Rig (Woodland)", "V_PlateCarrierSpec_wdl", 2500, "vest", "noDLC", "HIDDEN"]	
];

backpackArray = compileFinal str
[
	["Parachute", "B_Parachute", 50, "backpack"],

	["Outdoor Pack (Black)", "B_OutdoorPack_blk", 75, "backpack"],
	["Outdoor Pack (Tan)", "B_OutdoorPack_tan", 75, "backpack"],
	// ["Outdoor Pack (Blue)", "B_OutdoorPack_blu", 100, "backpack"],				//Duplicate of Outdoor Pack (Tan) - BI...
	// ["Hunting Backpack", "B_HuntingBackpack", 100, "backpack"],					//Duplicate of Outdoor Pack (Tan) - BI...	
	
    ["Leg Strap Bag (Black)", "B_LegStrapBag_black_F", 130, "vest", "noDLC"],
    ["Leg Strap Bag (Coyote)", "B_LegStrapBag_coyote_F", 130, "vest", "noDLC"],
    ["Leg Strap Bag (Olive)", "B_LegStrapBag_olive_F", 130, "vest", "noDLC"],
    
    ["Messenger Bag (Black)", "B_Messenger_Black_F", 100, "backpack", "noDLC"],
    ["Messenger Bag (Coyote)", "B_Messenger_Coyote_F", 100, "backpack", "noDLC"],
    ["Messenger Bag (Gray)", "B_Messenger_Gray_F", 100, "backpack", "noDLC"],
    ["Messenger Bag (Olive)", "B_Messenger_Olive_F", 100, "backpack", "noDLC"],
    ["Messenger Bag (IDAP)", "B_Messenger_IDAP_F", 100, "backpack", "noDLC"],
    
	["Assault Pack (Black)", "B_AssaultPack_blk", 150, "backpack"],
	["Assault Pack (Green)", "B_AssaultPack_rgr", 150, "backpack"],
	["Assault Pack (MTP)", "B_AssaultPack_mcamo", 150, "backpack"],
	["Assault Pack (Hex)", "B_AssaultPack_ocamo", 150, "backpack"],
	["Assault Pack (Digi)", "B_AssaultPack_dgtl", 150, "backpack"],
	["Assault Pack (Khaki)", "B_AssaultPack_khk", 150, "backpack"],
	["Assault Pack (Coyote)", "B_AssaultPack_cbr", 150, "backpack"],
	["Assault Pack (Sage)", "B_AssaultPack_sgg", 150, "backpack"],
    ["Assault Pack (Tropic)", "B_AssaultPack_tna_F", 150, "backpack", "noDLC"],
	["Assault Pack (Kerry)", "B_AssaultPack_Kerry", 150, "backpack"],
	
	["Kitbag (Coyote)", "B_Kitbag_cbr", 200, "backpack"],
	["Kitbag (Green)", "B_Kitbag_rgr", 200, "backpack"],
	["Kitbag (MTP)", "B_Kitbag_mcamo", 200, "backpack"],
	["Kitbag (Sage)", "B_Kitbag_sgg", 200, "backpack"],
    
    ["Viper Light Harness (Black)", "B_ViperLightHarness_blk_F", 200, "backpack", "noDLC"],
    ["Viper Light Harness (Green Hex)", "B_ViperLightHarness_ghex_F", 200, "backpack", "noDLC"],
    ["Viper Light Harness (Hex)", "B_ViperLightHarness_hex_F", 200, "backpack", "noDLC"],
    ["Viper Light Harness (Khaki)", "B_ViperLightHarness_khk_F", 200, "backpack", "noDLC"],
    ["Viper Light Harness (Olive)", "B_ViperLightHarness_oli_F", 200, "backpack", "noDLC"],
	
	["Tactical Backpack (Green)", "B_TacticalPack_rgr", 250, "backpack"],
	["Tactical Backpack (MTP)", "B_TacticalPack_mcamo", 250, "backpack"],
	["Tactical Backpack (Hex)", "B_TacticalPack_ocamo", 250, "backpack"],
	//["Tactical Backpack (Black)", "	B_TacticalPack_blk", 250, "backpack"],		//Does not exist - BI....
	["Tactical Backpack (Olive)", "B_TacticalPack_oli", 250, "backpack"],
	
	["Field Pack (Black)", "B_FieldPack_blk", 300, "backpack"],
	["Field Pack (Coyote)", "B_FieldPack_cbr", 300, "backpack"],
	["Field Pack (Khaki)", "B_FieldPack_khk", 300, "backpack"],
	["Field Pack (Urban)", "B_FieldPack_oucamo", 300, "backpack"],
	["Field Pack (Hex)", "B_FieldPack_ocamo", 300, "backpack"],
    ["Field Pack (Green Hex)", "B_FieldPack_ghex_F", 300, "backpack", "noDLC"],
	
	["Bergen (Black)", "B_Bergen_blk", 350, "backpack"],
	["Bergen (Green)", "B_Bergen_rgr", 350, "backpack"],
	["Bergen (MTP)", "B_Bergen_mcamo", 350, "backpack"],
	["Bergen (Sage)", "B_Bergen_sgg", 350, "backpack"],
	// ["Bergen (Red)", "B_BergenC_red", 350, "backpack"],							//Shitty copy of Bergen without color and less capacity
	// ["Bergen (Green)", "B_BergenC_grn", 350, "backpack"],						//Shitty copy of Bergen without color and less capacity
	// ["Bergen (Blue)", "B_BergenC_blu", 350, "backpack"],							//Shitty copy of Bergen without color and less capacity
	
    ["Viper Harness (Black)", "B_ViperHarness_blk_F", 450, "backpack", "noDLC"],
    ["Viper Harness (Green Hex)", "B_ViperHarness_ghex_F", 450, "backpack", "noDLC"],
    ["Viper Harness (Hex)", "B_ViperHarness_hex_F", 450, "backpack", "noDLC"],
    ["Viper Harness (Khaki)", "B_ViperHarness_khk_F", 450, "backpack", "noDLC"],
    ["Viper Harness (Olive)", "B_ViperHarness_oli_F", 450, "backpack", "noDLC"],
    
	["Carryall (Khaki)", "B_Carryall_khk", 500, "backpack"],
	["Carryall (MTP)", "B_Carryall_mcamo", 500, "backpack"],
	["Carryall (Olive)", "B_Carryall_oli", 500, "backpack"],
	["Carryall (Hex)", "B_Carryall_ocamo", 500, "backpack"],
	["Carryall (Urban)", "B_Carryall_oucamo", 500, "backpack"],
    ["Carryall (Green Hex)", "B_Carryall_ghex_F", 500, "backpack", "noDLC"],
    
    ["Bergen Large (Digital)", "B_Bergen_dgtl_F", 1200, "backpack", "noDLC"],
    ["Bergen Large (Hex)", "B_Bergen_hex_F", 1200, "backpack", "noDLC"],
    ["Bergen Large (MTP)", "B_Bergen_mcamo_F", 1200, "backpack", "noDLC"],
    ["Bergen Large (Tropic)", "B_Bergen_tna_F", 1200, "backpack", "noDLC"],
	
	//DLC Contact
	
	["Assault Pack (Geometric)", "B_AssaultPack_eaf_F", 150, "backpack", "noDLC"],
	["Assault Pack (Woodland)", "B_AssaultPack_wdl_F", 150, "backpack", "noDLC"],
	["Carryall Backpack (Geometric)", "B_Carryall_eaf_F", 500, "backpack", "noDLC"],
	["Carryall Backpack (Green)", "B_Carryall_green_F", 500, "backpack", "noDLC"],
	["Carryall Backpack (Taiga)", "B_Carryall_taiga_F", 500, "backpack", "noDLC"],
	["Carryall Backpack (Woodland)", "B_Carryall_wdl_F", 500, "backpack", "noDLC"],
	["Combination Unit Respirator", "B_CombinationUnitRespirator_01_F", 500, "backpack", "noDLC"],
	["Field Pack (Green)", "B_FieldPack_green_F", 300, "backpack", "noDLC"],
	["Field Pack (Taiga)", "B_FieldPack_taiga_F", 300, "backpack", "noDLC"],
	
	["Radio Pack (Black)", "B_RadioBag_01_black_F", 500, "backpack", "noDLC"],
	["Radio Pack (Digital)", "B_RadioBag_01_digi_F", 500, "backpack", "noDLC"],
	["Radio Pack (Geometric)", "B_RadioBag_01_eaf_F", 500, "backpack", "noDLC"],
	["Radio Pack (Green Hex)", "B_RadioBag_01_ghex_F", 500, "backpack", "noDLC"],
	["Radio Pack (Hex)", "B_RadioBag_01_hex_F", 500, "backpack", "noDLC"],
	["Radio Pack (MTP)", "B_RadioBag_01_mtp_F", 500, "backpack", "noDLC"],
	["Radio Pack (Tropic)", "B_RadioBag_01_tropic_F", 500, "backpack", "noDLC"],
	["Radio Pack (Urban)", "B_RadioBag_01_oucamo_F", 500, "backpack", "noDLC"],
	["Radio Pack (Woodland)", "B_RadioBag_01_wdl_F", 500, "backpack", "noDLC"],
	
	["Self-Contained Breathing Apparatus", "B_SCBA_01_F", 500, "backpack", "noDLC"]
	
];

genItemArray = compileFinal str
[
	["UAV Terminal (NATO)", "B_UavTerminal", 500, "gps"],
	["UAV Terminal (CSAT)", "O_UavTerminal", 500, "gps"],
	["UAV Terminal (AAF)", "I_UavTerminal", 500, "gps"],
    
	["Quadcopter UAV (NATO)", "B_UAV_01_backpack_F", 3000, "backpack"],
	["Quadcopter UAV (CSAT)", "O_UAV_01_backpack_F", 3000, "backpack"],
	["Quadcopter UAV (AAF)", "I_UAV_01_backpack_F", 3000, "backpack"],
    
	["Hexacopter UAV (NATO)", "B_UAV_06_backpack_F", 4000, "backpack"],
	["Hexacopter UAV (CSAT)", "O_UAV_06_backpack_F", 4000, "backpack"],
	["Hexacopter UAV (AAF)", "I_UAV_06_backpack_F", 4000, "backpack"],
	["Hexacopter Medical UAV (NATO)", "B_UAV_06_medical_backpack_F", 5000, "backpack"],
	["Hexacopter Medical UAV (CSAT)", "O_UAV_06_medical_backpack_F", 5000, "backpack"],
	["Hexacopter Medical UAV (AAF)", "I_UAV_06_medical_backpack_F", 5000, "backpack"],
	["Hexacopter Demining UAV", "C_IDAP_UAV_06_antimine_backpack_F", 5000, "backpack", "HIDDEN"],
    
    ["UGV Demining ED-1D (NATO)", "B_UGV_02_Demining_backpack_F", 5000, "backpack", "HIDDEN"],  //Hidden as custom loadouts for vehicles are not possible for backpacks...
    ["UGV Demining ED-1D (CSAT)", "O_UGV_02_Demining_backpack_F", 5000, "backpack", "HIDDEN"],  //Hidden as custom loadouts for vehicles are not possible for backpacks...
    ["UGV Demining ED-1D (AAF)", "I_UGV_02_Demining_backpack_F", 5000, "backpack", "HIDDEN"],  //Hidden as custom loadouts for vehicles are not possible for backpacks...
    ["UGV Camera ED-1E (NATO)", "B_UGV_02_Science_backpack_F", 3000, "backpack", "HIDDEN"],  //Hidden as custom loadouts for vehicles are not possible for backpacks...
    ["UGV Camera ED-1E (CSAT)", "O_UGV_02_Science_backpack_F", 3000, "backpack", "HIDDEN"],  //Hidden as custom loadouts for vehicles are not possible for backpacks...
    ["UGV Camera ED-1E (AAF)", "I_UGV_02_Science_backpack_F", 3000, "backpack", "HIDDEN"],  //Hidden as custom loadouts for vehicles are not possible for backpacks...
        
	["GPS", "ItemGPS", 100, "gps"],
	["First Aid Kit", "FirstAidKit", 25, "item"],
	["Medikit", "Medikit", 250, "item"],
	["Toolkit", "ToolKit", 250, "item"],
	["Mine Detector", "MineDetector", 100, "item"],
	["Binoculars", "Binocular", 50, "binoc"],
	["Rangefinder", "Rangefinder", 200, "binoc"],
	["Laser Designator (NATO, Sand)", "Laserdesignator", 500, "binoc", "noDLC"],			// Removed team tag to allow all Desis for all teams ->  ["Laser Designator (NATO)", "Laserdesignator", 10000, "binoc", "WEST"],
	["Laser Designator (NATO, Khaki)", "Laserdesignator_01_khk_F", 500, "binoc"],
	["Laser Designator (NATO, Olive)", "Laserdesignator_03", 500, "binoc", "noDLC"],
	["Laser Designator (CSAT, Hex)", "Laserdesignator_02", 500, "binoc", "noDLC"],		// Attention: Check the main config and change the price if thermal is activated == overpowered
    ["Laser Designator (CSAT, Green Hex)", "Laserdesignator_02_ghex_F", 500, "binoc"],
    ["Remote Designator Bag (NATO)", "B_Static_Designator_01_weapon_F", 250, "backpack"],
	["Remote Designator Bag (CSAT)", "O_Static_Designator_02_weapon_F", 250, "backpack"],
    ["Remote Designator Bag (NATO Khaki)", "B_W_Static_Designator_01_weapon_F", 250, "backpack"],
	["IR Grenade (NATO)", "B_IR_Grenade", 100, "mag"],
	["IR Grenade (CSAT)", "O_IR_Grenade", 100, "mag"],
	["IR Grenade (AAF)", "I_IR_Grenade", 100, "mag"],
	["Chemlight (Blue)", "Chemlight_blue", 25, "mag"],
	["Chemlight (Green)", "Chemlight_green", 25, "mag"],
	["Chemlight (Yellow)", "Chemlight_yellow", 25, "mag"],
	["Chemlight (Red)", "Chemlight_red", 25, "mag"],
	["NV Goggles (Brown)", "NVGoggles", 250, "nvg"],
	["NV Goggles (Black)", "NVGoggles_OPFOR", 250, "nvg"],
	["NV Goggles (Green)", "NVGoggles_INDEP", 250, "nvg"],
    ["NV Goggles (Tropic)", "NVGoggles_tna_F", 250, "nvg", "noDLC"],
    ["Compact NVG (CSAT, Green Hex)", "O_NVGoggles_ghex_F", 250, "nvg", "noDLC"],
    ["Compact NVG (CSAT, Hex)", "O_NVGoggles_hex_F", 250, "nvg", "noDLC"],
    ["Compact NVG (CSAT, Urban)", "O_NVGoggles_urb_F", 250, "nvg", "noDLC"],
    ["Compact NVG (Green)", "O_NVGoggles_grn_F", 250, "nvg", "noDLC"],
    ["ENVG-II (NATO, Black)", "NVGogglesB_blk_F", 250, "nvg"],         // With Termal
    ["ENVG-II (NATO, Green)", "NVGogglesB_grn_F", 250, "nvg"],         // With Termal
    ["ENVG-II (NATO, Grey)", "NVGogglesB_gry_F", 250, "nvg"],          // With Termal
    ["Aviator Googles", "G_Aviator", 25, "gogg"],
    ["Lady Shades", "G_Lady_Blue", 25, "gogg"],
    ["Low Profile Googles", "G_Lowprofile", 25, "gogg"],
    ["Tactical Googles", "G_Tactical_Clear", 25, "gogg"],
    ["Tactical Shades", "G_Tactical_Black", 25, "gogg"],
    ["Ray Ban", "G_Spectacles_Tinted", 25, "gogg"],
	["Diving Goggles", "G_Diving", 100, "gogg"],
    ["Combat Goggles (Tan)", "G_Combat", 50, "gogg"],
    ["Combat Goggles (Green)", "G_Combat_Goggles_tna_F", 50, "gogg", "noDLC"],
	["Balaclava (Black)", "G_Balaclava_blk", 25, "gogg"],
	["Balaclava (Olive)", "G_Balaclava_oli", 25, "gogg"],
	["Balaclava (Low Profile G)", "G_Balaclava_lowprofile", 25, "gogg"],
	["Balaclava (Combat)", "G_Balaclava_combat", 25, "gogg"],
    ["Stealth Balaclava (Black)", "G_Balaclava_TI_blk_F", 75, "gogg"],
    ["Stealth Balaclava w. Googles (Black)", "G_Balaclava_TI_G_blk_F", 75, "gogg"],
    ["Stealth Balaclava (Green)", "G_Balaclava_TI_tna_F", 75, "gogg"],
    ["Stealth Balaclava w. Goggles (Green)", "G_Balaclava_TI_G_tna_F", 75, "gogg"],
	["Bandanna (Aviator)", "G_Bandanna_aviator", 25, "gogg"],
	["Bandanna (Shades)", "G_Bandanna_shades", 25, "gogg"],
	["Bandanna (Beast)", "G_Bandanna_beast", 25, "gogg"],
	["Bandanna (Black)", "G_Bandanna_blk", 25, "gogg"],
	["Bandanna (Khaki)", "G_Bandanna_khk", 25, "gogg"],
	["Bandanna (Olive)", "G_Bandanna_oli", 25, "gogg"],
	["Bandanna (Tan)", "G_Bandanna_tan", 25, "gogg"],
    ["Respirator (Blue)", "G_Respirator_blue_F", 25, "gogg"],
    ["Bandanna (White)", "G_Respirator_white_F", 25, "gogg"],
    ["Bandanna (Yellow)", "G_Respirator_yellow_F", 25, "gogg"],
    ["Safety Goggles", "G_EyeProtectors_F", 25, "gogg"],
    ["Safety Goggles (Earpiece)", "G_EyeProtectors_Earpiece_F", 25, "gogg"],
    ["Wireless Earpiece", "G_WirelessEarpiece_F", 25, "gogg"],
	
	//DLC Contact
	["APR (Black) [Teargas]", "G_AirPurifyingRespirator_02_black_F", 50, "gogg", "noDLC"],
	["APR (Olive) [Teargas]", "G_AirPurifyingRespirator_02_olive_F", 50, "gogg", "noDLC"],
	["APR (Sand) [Teargas]", "G_AirPurifyingRespirator_02_sand_F", 50, "gogg", "noDLC"],
	["APR (NATO) [Teargas]", "G_AirPurifyingRespirator_01_F", 50, "gogg", "noDLC"],
	["Blindfold (Black)", "G_Blindfold_01_black_F", 25, "gogg", "noDLC"],
	["Blindfold (White)", "G_Blindfold_01_white_F", 25, "gogg", "noDLC"],
	["Regular Facepiece [Teargas]", "G_RegulatorMask_F", 50, "gogg", "noDLC"]
];

#define GENSTORE_ITEM_PRICE(CLASS) ((call genItemArray) select {_x select 1 == CLASS} select 0 select 2)

allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call uniformArray + call vestArray + call backpackArray);

genObjectsArray = compileFinal str
[
    ["Camo Net", "CamoNet_INDP_open_F", 200, "object", "HIDDEN"], // unlisted, only for object saving
    
	["Empty Ammo Crate", "Box_NATO_Ammo_F", 200, "ammocrate"],
    ["Empty Weapon Crate", "Box_NATO_Wps_F", 200, "ammocrate"],
    ["Empty Weapon Spec. Crate", "Box_NATO_WpsSpecial_F", 200, "ammocrate"],
    ["Empty Explosive Crate", "Box_NATO_AmmoOrd_F", 200, "ammocrate"],
    ["Empty Grenades Crate", "Box_NATO_Grenades_F", 200, "ammocrate"],
    ["Empty Launcher Crate", "Box_NATO_WpsLaunch_F", 200, "ammocrate"],
    ["Empty Support Crate", "Box_NATO_Support_F", 200, "ammocrate"],
    ["Empty Ammo Crate (Wood)", "Box_Syndicate_Ammo_F", 200, "ammocrate"],
    ["Empty Weapon Crate (Wood)", "Box_Syndicate_Wps_F", 200, "ammocrate"],
    ["Empty Explosive Crate (Wood)", "Box_IED_Exp_F", 200, "ammocrate"],
    ["Empty Launcher Crate (Wood)", "Box_Syndicate_WpsLaunch_F", 200, "ammocrate"],
    ["Empty Unifrom Crate", "Box_NATO_Uniforms_F", 500, "ammocrate"],
    ["Empty Equipment Crate", "Box_NATO_Equip_F", 500, "ammocrate"],
	["Empty Ammo Crate (Camo)", "Box_FIA_Support_F", 250, "ammocrate"],
	["Metal Barrel", "Land_MetalBarrel_F", 100, "object"],
	["Toilet Box", "Land_ToiletBox_F", 100, "object"],
    ["Lamp Post (Shabby)", "Land_LampShabby_F", 100, "object"],
	["Lamp Post (Harbour)", "Land_LampHarbour_F", 100, "object"],
    ["Lamp Post (Halogen)", "Land_LampHalogen_F", 400, "object"],
    ["Lamp Portable (Double)", "Land_PortableLight_double_F", 100, "object"],
    ["Czech Hedgehog", "Land_CzechHedgehog_01_F", 150, "object"],
	["Bar Gate", "Land_BarGate_F", 150, "object"],
	// ["Pipes", "Land_Pipes_Large_F", 200, "object"],							// Useless - removed
	["Grave Obelisk", "Land_Grave_obelisk_F", 1000, "object"],
	["Maroula Obelisk", "Land_Maroula_F", 800, "object"],
	["Slide :)", "Land_Slide_F", 300, "object"],
	["Carousel :)", "Land_Carousel_01_F", 300, "object"],
	["Swing :)", "Land_Swing_01_F", 300, "object"],
	["Garage", "Land_i_Garage_V1_F", 2000, "object"],
	["Slum House Container", "Land_cargo_house_slum_F", 1500, "object"],
	["Scaffolding", "Land_Scaffolding_F", 250, "object"],
    ["Obstacle (Bridge)", "Land_Obstacle_Bridge_F", 80, "object"],
    // ["Pier Ladder", "Land_PierLadder_F", 200, "object"],                      // Removed due to bugusing/abuse with bases
	// ["Land Pier", "Land_Pier_F", 50000, "object"],							// Too big - removed
	["Highway Guardrail", "Land_Crash_barrier_F", 200, "object"],
	["Pop-Up Target", "TargetP_Inf_F", 100, "object"],
	// ["Razorwire Barrier", "Land_Razorwire_F", 100, "object"],                // No R3F Move/Load Button available - removed
	// ["Transmitter Tower (Tall)", "Land_TTowerBig_2_F", 15000, "object"],		// R3F Logistic Move/Load Button is on top of the building... - removed
	// ["Transmitter Tower (Big)", "Land_TTowerBig_1_F", 15000, "object"],		// R3F Logistic Move/Load Button is on top of the building... - removed
	["Flag (NATO)", "Flag_NATO_F", 500, "object"],
	["Flag (UNO)", "Flag_UNO_F", 500, "object"],
	["Flag (USA)", "Flag_US_F", 500, "object"],
	["Flag (UK)", "Flag_UK_F", 500, "object"],
	["Flag (AJ)", "FlagPole_F", 500, "object"],
    ["Sign (Military Area)", "Land_SignM_WarningMilitaryArea_english_F", 50, "object"],
    ["Sign (Military Vehicles)", "Land_SignM_WarningMilitaryVehicles_english_F", 50, "object"],
    ["Sign (Risk Area)", "Land_Sign_WarningUnexplodedAmmo_F", 50, "object"],
    ["Sign (For Rent)", "Land_SignM_forRent_F", 50, "object"],
    ["Sign (For Sale)", "Land_SignM_forSale_F", 50, "object"],
	["Industrial Shed (Small)", "Land_Shed_Small_F", 2000, "object"],
	["Industrial Shed (Big)", "Land_Shed_Big_F", 3000, "object"],
    ["Concrete Barrier (Small)", "Land_CncBarrier_F", 100, "object"],
	["Concrete Barrier (Medium)", "Land_CncBarrierMedium_F", 250, "object"],
	["Concrete Barrier (Medium, Long)", "Land_CncBarrierMedium4_F", 350, "object"],
	["Concrete Wall (Short)", "Land_CncWall1_F", 200, "object"],
	["Concrete Wall (Long)", "Land_CncWall4_F", 300, "object"],
	["Concrete Pipe", "Land_ConcretePipe_F", 200, "object"],
	["Concrete Frame", "Land_CncShelter_F", 200, "object"],
    ["Concrete Block", "BlockConcrete_F", 400, "object"],
	["Concrete Ramp", "Land_RampConcrete_F", 350, "object"],
	["Concrete Ramp (High)", "Land_RampConcreteHigh_F", 400, "object"],
	["Canal Wall Stairs", "Land_Canal_Wall_Stairs_F", 500, "object"],
	["Canal Wall (Small)", "Land_Canal_WallSmall_10m_F", 200, "object"],
    ["Ghost Hotel Platform", "Land_GH_Platform_F", 200, "object"],
    ["Ghost Hotel Stairs", "Land_GH_Stairs_F", 150, "object"],
    ["Tall Concrete Wall (4m)", "Land_ConcreteWall_01_l_4m_F", 200, "object"],
    ["Tall Concrete Wall (8m)", "Land_ConcreteWall_01_l_8m_F", 400, "object"],
    ["Tall Concrete Wall (Gate)", "Land_ConcreteWall_01_l_gate_F", 500, "object"],
    // ["Fortress Wall (5 m)", "Land_Fortress_01_5m_F", 500, "object"],                                 //Removed Fortress Walls, as they are too big
    // ["Fortress Wall (10 m)", "Land_Fortress_01_10m_F", 900, "object"],
    // ["Fortress Wall (Destroyed, Left)", "Land_Fortress_01_d_L_F", 400, "object"],
    // ["Fortress Wall (Destroyed, Right)", "Land_Fortress_01_d_R_F", 400, "object"],
    // ["Fortress Wall (Outer Corner, 50 deg)", "Land_Fortress_01_outterCorner_50_F", 500, "object"],
    // ["Fortress Wall (Outer Corner, 80 deg)", "Land_Fortress_01_outterCorner_80_F", 500, "object"],
    // ["Fortress Wall (Outer Corner, 90 deg)", "Land_Fortress_01_outterCorner_90_F", 500, "object"],
    ["Modular Bunker (1 Block)", "Land_Bunker_01_blocks_1_F", 100, "object"],
    ["Modular Bunker (3 Blocks)", "Land_Bunker_01_blocks_3_F", 200, "object"],
    ["Modular Bunker (Small)", "Land_Bunker_01_small_F", 900, "object"],
    ["Modular Bunker (Tall)", "Land_Bunker_01_tall_F", 1300, "object"],
    ["Modular Bunker (Big)", "Land_Bunker_01_big_F", 2000, "object"],
    ["Modular Bunker (HQ)", "Land_Bunker_01_HQ_F", 2000, "object"],
	["HBarrier (1 block, Tan)", "Land_HBarrier_1_F", 100, "object"],
    ["HBarrier (1 block, Green)", "Land_HBarrier_01_line_1_green_F", 100, "object"],
	["HBarrier (3 blocks, Tan)", "Land_HBarrier_3_F", 200, "object"],
    ["HBarrier (3 blocks, Green)", "Land_HBarrier_01_line_3_green_F", 200, "object"],
	["HBarrier (5 blocks, Tan)", "Land_HBarrier_5_F", 250, "object"],
    ["HBarrier (5 blocks, Green)", "Land_HBarrier_01_line_5_green_F", 250, "object"],
	["HBarrier Big (Tan)", "Land_HBarrierBig_F", 300, "object"],
    ["HBarrier Big (Green)", "Land_HBarrier_01_big_4_green_F", 300, "object"],
	["HBarrier Wall (4 blocks, Tan)", "Land_HBarrierWall4_F", 200, "object"],
    ["HBarrier Wall (4 blocks, Green)", "Land_HBarrier_01_wall_4_green_F", 200, "object"],
	["HBarrier Wall (6 blocks, Tan)", "Land_HBarrierWall6_F", 300, "object"],
    ["HBarrier Wall (6 blocks, Green)", "Land_HBarrier_01_wall_6_green_F", 300, "object"],
	["HBarrier Wall (Corner, Tan)", "Land_HBarrierWall_corner_F", 200, "object"],
    ["HBarrier Wall (Corner, Green)", "Land_HBarrier_01_wall_corner_green_F", 200, "object"],
	["HBarrier Corridor (Tan)", "Land_HBarrierWall_corridor_F", 400, "object"],
    ["HBarrier Corridor (Green)", "Land_HBarrier_01_wall_corridor_green_F", 400, "object"],
	["HBarrier Watchtower (Tan)", "Land_HBarrierTower_F", 500, "object"],
    ["HBarrier Watchtower (Green)", "Land_HBarrier_01_big_tower_green_F", 500, "object"],
	["Bag Fence (Corner, Tan)", "Land_BagFence_Corner_F", 50, "object"],
    ["Bag Fence (Corner, Green)", "Land_HBarrier_01_wall_corner_green_F", 50, "object"],
	["Bag Fence (End, Tan)", "Land_BagFence_End_F", 50, "object"],
    ["Bag Fence (End, Green)", "Land_BagFence_01_end_green_F", 50, "object"],
	["Bag Fence (Long, Tan)", "Land_BagFence_Long_F", 100, "object"],
    ["Bag Fence (Long, Green)", "Land_BagFence_01_long_green_F", 100, "object"],
	["Bag Fence (Round, Tan)", "Land_BagFence_Round_F", 100, "object"],
    ["Bag Fence (Round, Green)", "Land_BagFence_01_round_green_F", 100, "object"],
	["Bag Fence (Short, Tan)", "Land_BagFence_Short_F", 75, "object"],
    ["Bag Fence (Short, Green)", "Land_BagFence_01_short_green_F", 75, "object"],
    ["Bag Barricade (Short)", "Land_SandbagBarricade_01_half_F", 100, "object"],
    ["Bag Barricade (Tall)", "Land_SandbagBarricade_01_F", 150, "object"],
    ["Bag Barricade (Tall, Hole)", "Land_SandbagBarricade_01_hole_F", 150, "object"],
	["Bag Bunker (Small, Tan) ", "Land_BagBunker_Small_F", 250, "object"],
    ["Bag Bunker (Small, Green)", "Land_BagBunker_01_small_green_F", 250, "object"],
	["Bag Bunker (Large, Tan)", "Land_BagBunker_Large_F", 750, "object"],
    ["Bag Bunker (Large, Green)", "Land_BagBunker_01_large_green_F", 750, "object"],
	["Bag Bunker Tower (Tan)", "Land_BagBunker_Tower_F", 1000, "object"],
    ["Bag Bunker Tower (Green)", "Land_HBarrier_01_tower_green_F", 1000, "object"],
//  ["Military Wall (Big)", "Land_Mil_WallBig_4m_F", 600, "object"],			// Fall over after a few minutes - removed
	["Military Wired Fence (Short)", "Land_New_WiredFence_5m_F", 250, "object"],
	["Military Wired Fence (Long)", "Land_New_WiredFence_10m_F", 400, "object"],
	["Military Barrier (Small)", "Land_Mil_ConcreteWall_F", 300, "object"],
	["Military Cargo House", "Land_Cargo_House_V1_F", 900, "object"],
	["Military Cargo HQ", "Land_Cargo_HQ_V1_F", 2000, "object"],
	["Military Cargo Post", "Land_Cargo_Patrol_V1_F", 800, "object"],
	["Military Cargo Tower", "Land_Cargo_Tower_V1_F", 10000, "object"],
	["Military Cargo Container 2m", "Land_Cargo20_military_green_F", 5000, "object"],
	["Fuel Station", "Land_FuelStation_Feed_F", 10000, "object"],
	["Food Sack", "Land_Sacks_goods_F", 800],
	["Water Container", "Land_BarrelWater_F", 800],
	["Base locker (PIN: 0000)", "Land_Device_assembled_F", 25000, "object"],
    ["Base door (Pillbox)", "Land_PillboxWall_01_6m_F", 10000, "object"],
	["Base door (Canal Wall)", "Land_Canal_Wall_10m_F", 10000, "object"],  
	["Base door key (PIN: 0000)", "Land_TripodScreen_01_dual_v1_F", 2000, "object"],
    ["Safe (PIN: 0000)", "Box_GEN_Equip_F", 10000, "ammocrate"]
];

allGenStoreVanillaItems = compileFinal str (call genItemArray + call genObjectsArray + call allStoreGear);

//Text name, classname, buy cost, spawn type, sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
    ["Remote Designator (NATO)", "B_Static_Designator_01_F", GENSTORE_ITEM_PRICE("B_Static_Designator_01_weapon_F"), "vehicle", "HIDDEN"],  //hidden for paint and sale price
    ["Remote Designator (CSAT)", "O_Static_Designator_02_F", GENSTORE_ITEM_PRICE("O_Static_Designator_02_weapon_F"), "vehicle", "HIDDEN"],
    ["Remote Designator (NATO Khaki)", "B_W_Static_Designator_01_F", GENSTORE_ITEM_PRICE("B_W_Static_Designator_01_weapon_F"), "vehicle", "HIDDEN"],

	["Kart", "C_Kart_01_F", 500, "vehicle"],
    
    ["Tractor", "C_Tractor_01_F", 500, "vehicle"],

        ["Quadbike (Civilian)", "C_Quadbike_01_F", 600, "vehicle", "HIDDEN"], // hidden, just a paintjob
        ["Quadbike (NATO)", "B_Quadbike_01_F", 600, "vehicle", "HIDDEN"], //
        ["Quadbike (CSAT)", "O_Quadbike_01_F", 600, "vehicle", "HIDDEN"], //
        ["Quadbike (AAF)", "I_Quadbike_01_F", 600, "vehicle", "HIDDEN"], //
    ["Quadbike", "I_G_Quadbike_01_F", 600, "vehicle"],

	["Hatchback", "C_Hatchback_01_F", 800, "vehicle"],
	["Hatchback Sport", "C_Hatchback_01_sport_F", 1000, "vehicle"],
    
	["SUV", "C_SUV_01_F", 1100, "vehicle"],
    
	["Offroad", "C_Offroad_01_F", 1100, "vehicle"],
    ["Offroad Covered", "I_E_Offroad_01_covered_F", 1100, "vehicle"],
        ["Offroad Camo", "I_G_Offroad_01_F", 1100, "vehicle", "HIDDEN"], // hidden, just a paintjob
    ["Offroad Police", "B_GEN_Offroad_01_gen_F", 1250, "vehicle", "noDLC"],
    ["Offroad Repair", "C_Offroad_01_repair_F", 1500, "vehicle"],
    ["Offroad HMG", "I_G_Offroad_01_armed_F", 2500, "vehicle"],
    ["Offroad AT", "I_G_Offroad_01_AT_F", 5000, "vehicle"],
	
    
    ["MB 4WD", "C_Offroad_02_unarmed_F", 1000, "vehicle"],
        ["MB 4WD (Guerilla)", "I_C_Offroad_02_unarmed_F", 1000, "vehicle", "HIDDEN"], // hidden, just a paintjob
    ["MB 4WD LMG", "I_C_Offroad_02_LMG_F", 2000, "vehicle"],
    ["MB 4WD AT", "I_C_Offroad_02_AT_F", 5000, "vehicle"],

    ["Truck", "C_Van_01_transport_F", 700, "vehicle"],
        ["Truck Camo", "I_G_Van_01_transport_F", 800, "vehicle", "HIDDEN"], // hidden, just a paintjob
    ["Truck Box", "C_Van_01_box_F", 900, "vehicle"],
    ["Fuel Truck", "C_Van_01_fuel_F", 2000, "vehicle"],
        ["Fuel Truck Camo", "I_G_Van_01_fuel_F", 2100, "vehicle", "HIDDEN"], // hidden, just a paintjob
    
	["Van Cargo", "C_Van_02_vehicle_F", 1000, "vehicle"],
	["Van Transport", "C_Van_02_transport_F", 1000, "vehicle"],
	["Van Police Cargo", "B_GEN_Van_02_vehicle_F", 1250, "vehicle"],
	["Van Police Transport", "B_GEN_Van_02_transport_F", 1250, "vehicle"],
	["Van Ambulance", "C_Van_02_medevac_F", 1500, "vehicle"],
	["Van Repair", "C_Van_02_service_F", 2000, "vehicle"],
	
	// SKIPSAVE = will not be autosaved until first manual force save, good for cheap vehicles that usually get abandoned

	["HEMTT Tractor", "B_Truck_01_mover_F", 4000, "vehicle"],
	["HEMTT Box", "B_Truck_01_box_F", 5000, "vehicle"],
	["HEMTT Transport", "B_Truck_01_transport_F", 6000, "vehicle"],
	["HEMTT Covered", "B_Truck_01_covered_F", 7500, "vehicle"],
	["HEMTT Fuel", "B_Truck_01_fuel_F", 9000, "vehicle"],
	["HEMTT Medical", "B_Truck_01_medical_F", 10000, "vehicle"],
	//["HEMTT Repair", "B_Truck_01_Repair_F", 12500, "vehicle"],			//Removed to avoid bugusing with default arma rearm/repair function
	["HEMTT Resupply", "B_Truck_01_ammo_F", 12500, "vehicle"],				//Removed to avoid bugusing with default arma rearm/repair function
	
	["Tempest Device", "O_Truck_03_device_F", 5000, "vehicle"],
	["Tempest Transport", "O_Truck_03_transport_F", 6000, "vehicle"],
	["Tempest Covered", "O_Truck_03_covered_F", 7500, "vehicle"],
	["Tempest Fuel", "O_Truck_03_fuel_F", 9000, "vehicle"],
	["Tempest Medical", "O_Truck_03_medical_F", 10000, "vehicle"],
	//["Tempest Repair", "O_Truck_03_repair_F", 12500, "vehicle"],			//Removed to avoid bugusing with default arma rearm/repair function
	["Tempest Resupply", "O_Truck_03_ammo_F", 12500, "vehicle"],				//Removed to avoid bugusing with default arma rearm/repair function
	
	["Zamak Transport", "I_Truck_02_transport_F", 4000, "vehicle"],
		["Zamak Transport (IDAP)", "C_IDAP_Truck_02_transport_F", 4000, "vehicle", "HIDDEN"], // hidden, just a paintjob
	["Zamak Covered", "I_Truck_02_covered_F", 5000, "vehicle"],
		["Zamak Covered (IDAP)", "C_IDAP_Truck_02_F", 5000, "vehicle", "HIDDEN"], // hidden, just a paintjob
    ["Zamak Water (IDAP)", "C_IDAP_Truck_02_water_F", 5000, "vehicle"],
	["Zamak Fuel", "I_Truck_02_fuel_F", 7500, "vehicle"],
	["Zamak Medical", "I_Truck_02_medical_F", 9000, "vehicle"],
	//["Zamak Repair", "I_Truck_02_box_F", 10000, "vehicle"],				//Removed to avoid bugusing with default arma rearm/repair function
	["Zamak Resupply", "I_Truck_02_ammo_F", 12500, "vehicle"],				//Removed to avoid bugusing with default arma rearm/repair function
    
    ["UGV Stomper (NATO)", "B_UGV_01_F", 5000, "vehicle"],
	["UGV Stomper RCWS (NATO)", "B_UGV_01_rcws_F", 30000, "vehicle"],
	["UGV Stomper (AAF)", "I_UGV_01_F", 5000, "vehicle"],
	["UGV Stomper RCWS (AAF)", "I_UGV_01_rcws_F", 30000, "vehicle"],
	["UGV Saif (CSAT)", "O_UGV_01_F", 5000, "vehicle"],
	["UGV Saif RCWS (CSAT)", "O_UGV_01_rcws_F", 30000, "vehicle"]
];

armoredArray = compileFinal str
[
    ["Prowler Light", "B_CTRG_LSV_01_light_F", 1000, "vehicle"],
    ["Prowler", "B_T_LSV_01_unarmed_F", 2500, "vehicle"],
    ["Prowler HMG", "B_T_LSV_01_armed_F", 5500, "vehicle"],
	["Prowler AT", "B_T_LSV_01_AT_F", 8000, "vehicle"],
    ["Qilin", "O_T_LSV_02_unarmed_F", 2500, "vehicle"],
    ["Qilin Minigun", "O_T_LSV_02_armed_F", 4500, "vehicle"],
	["Qilin AT", "O_T_LSV_02_AT_F", 8000, "vehicle"],
    
	["Hunter", "B_MRAP_01_F", 4000, "vehicle"],
	["Hunter HMG", "B_MRAP_01_hmg_F", 15000, "vehicle"],
	["Hunter GMG", "B_MRAP_01_gmg_F", 17500, "vehicle"],
	["Ifrit", "O_MRAP_02_F", 4000, "vehicle"],
	["Ifrit HMG", "O_MRAP_02_hmg_F", 15000, "vehicle"],
	["Ifrit GMG", "O_MRAP_02_gmg_F", 17500, "vehicle"],
	["Strider", "I_MRAP_03_F", 4000, "vehicle"],
	["Strider HMG", "I_MRAP_03_hmg_F", 15000, "vehicle"],
	["Strider GMG", "I_MRAP_03_gmg_F", 17500, "vehicle"],
	["MSE-3 Marid", "O_APC_Wheeled_02_rcws_v2_F", 35000, "vehicle"],
	["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 37500, "vehicle"],
	["AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F", 40000, "vehicle"],
	["Rhino MGS", "B_AFV_Wheeled_01_cannon_F", 50000, "vehicle"],
    ["Rhino MGS UP", "B_AFV_Wheeled_01_up_cannon_F", 60000, "vehicle"]
];

tanksArray = compileFinal str
[
    ["ED-1E Camera UGV", "B_UGV_02_Science_F", GENSTORE_ITEM_PRICE("B_UGV_02_Science_backpack_F"), "vehicle"],
    ["ED-1E Camera UGV", "O_UGV_02_Science_F", GENSTORE_ITEM_PRICE("O_UGV_02_Science_backpack_F"), "vehicle"],
    ["ED-1E Camera UGV", "I_UGV_02_Science_F", GENSTORE_ITEM_PRICE("I_UGV_02_Science_backpack_F"), "vehicle"],
    ["ED-1D Demining UGV", "B_UGV_02_Demining_F", GENSTORE_ITEM_PRICE("B_UGV_02_Demining_backpack_F"), "vehicle"],
    ["ED-1D Demining UGV", "O_UGV_02_Demining_F", GENSTORE_ITEM_PRICE("O_UGV_02_Demining_backpack_F"), "vehicle"],
    ["ED-1D Demining UGV", "I_UGV_02_Demining_F", GENSTORE_ITEM_PRICE("I_UGV_02_Demining_backpack_F"), "vehicle"],

	["AWC 303 Nyx Recon", "I_LT_01_scout_F", 8000, "vehicle"],
    ["AWC 304 Nyx Autocannon", "I_LT_01_cannon_F", 35000, "vehicle"],
    ["AWC 301 Nyx AT", "I_LT_01_AT_F", 35000, "vehicle"],
    ["AWC 302 Nyx AA", "I_LT_01_AA_F", 35000, "vehicle"],
	["CRV-6e Bobcat (Resupply)", "B_APC_Tracked_01_CRV_F", 32500, "vehicle"],
	["IFV-6c Panther", "B_APC_Tracked_01_rcws_F", 35000, "vehicle"],
	["FV-720 Mora", "I_APC_tracked_03_cannon_F", 40000, "vehicle"],
	["BTR-K Kamysh", "O_APC_Tracked_02_cannon_F", 40000, "vehicle"],
	["IFV-6a Cheetah AA", "B_APC_Tracked_01_AA_F", 50000, "vehicle"],
	["ZSU-39 Tigris AA", "O_APC_Tracked_02_AA_F", 50000, "vehicle"],
	["M2A1 Slammer", "B_MBT_01_cannon_F", 60000, "vehicle"],
	["M2A4 Slammer HMG", "B_MBT_01_TUSK_F", 60000, "vehicle"], 			// Commander gun variant
	["MBT-52 Kuma", "I_MBT_03_cannon_F", 60000, "vehicle"],
	["T-100 Varsuk", "O_MBT_02_cannon_F", 60000, "vehicle"],
	["T-140 Angara", "O_MBT_04_cannon_F", 75000, "vehicle"],
    ["T-140K Angara", "O_MBT_04_command_F", 90000, "vehicle"]
];


helicoptersArray = compileFinal str
[
    ["AR-2 Darter UAV", "B_UAV_01_F", GENSTORE_ITEM_PRICE("B_UAV_01_backpack_F"), "vehicle"],
    ["AR-2 Darter UAV", "O_UAV_01_F", GENSTORE_ITEM_PRICE("O_UAV_01_backpack_F"), "vehicle"],
    ["AR-2 Darter UAV", "I_UAV_01_F", GENSTORE_ITEM_PRICE("I_UAV_01_backpack_F"), "vehicle"],
    
    ["AL-6 Pelican UAV", "B_UAV_06_F", GENSTORE_ITEM_PRICE("B_UAV_06_backpack_F"), "vehicle"],
    ["AL-6 Pelican UAV", "O_UAV_06_F", GENSTORE_ITEM_PRICE("O_UAV_06_backpack_F"), "vehicle"],
    ["AL-6 Pelican UAV", "I_UAV_06_F", GENSTORE_ITEM_PRICE("I_UAV_06_backpack_F"), "vehicle"],
    
    ["AL-6 Pelican Medical UAV", "B_UAV_06_medical_F", GENSTORE_ITEM_PRICE("B_UAV_06_medical_backpack_F"), "vehicle"],
    ["AL-6 Pelican Medical UAV", "O_UAV_06_medical_F", GENSTORE_ITEM_PRICE("O_UAV_06_medical_backpack_F"), "vehicle"],
    ["AL-6 Pelican Medical UAV", "I_UAV_06_medical_F", GENSTORE_ITEM_PRICE("I_UAV_06_medical_backpack_F"), "vehicle"],
    
    ["AL-6 Pelican Demining UAV", "C_IDAP_UAV_06_antimine_F", GENSTORE_ITEM_PRICE("C_IDAP_UAV_06_antimine_backpack_F"), "vehicle", "HIDDEN"],


    ["M-900 Civilian", "C_Heli_Light_01_civil_F", 2000, "vehicle"], // MH-6, no flares
	["MH-9 Hummingbird", "B_Heli_Light_01_F", 3000, "vehicle"], // MH-6
    ["PO-30 Orca (Unarmed)", "O_Heli_Light_02_unarmed_F", 5000, "vehicle"], // Ka-60
    ["WY-55 Hellcat (Unarmed)", "I_Heli_light_03_unarmed_F", 7500, "vehicle"], // AW159
    ["CH-49 Mohawk", "I_Heli_Transport_02_F", 9000, "vehicle"], // AW101
        ["EH302 IDAP", "C_IDAP_Heli_Transport_02_F", 9000, "vehicle", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
    
	
	["Mi-290 Taru (Crane)", "O_Heli_Transport_04_F", 6000, "vehicle"],
	["Mi-290 Taru (Box)", "O_Heli_Transport_04_box_F", 6000, "vehicle"],
	["Mi-290 Taru (Fuel)", "O_Heli_Transport_04_fuel_F", 8500, "vehicle"],
	["Mi-290 Taru (Bench)", "O_Heli_Transport_04_bench_F", 9000, "vehicle"],
	["Mi-290 Taru (Transport)", "O_Heli_Transport_04_covered_F", 9500, "vehicle"],
	["Mi-290 Taru (Medical)", "O_Heli_Transport_04_medevac_F", 10000, "vehicle"],
	//["Mi-290 Taru (Repair)", "O_Heli_Transport_04_repair_F", 15000, "vehicle"],		//Removed to avoid bugusing with default arma rearm/repair function
	//["Mi-290 Taru (Ammo)", "O_Heli_Transport_04_ammo_F", 25000, "vehicle"],			//Removed to avoid bugusing with default arma rearm/repair function
	
	["CH-67 Huron (Unarmed)", "B_Heli_Transport_03_unarmed_F", 9000, "vehicle"], 		// CH-47
	["CH-67 Huron (Armed)", "B_Heli_Transport_03_F", 12000, "vehicle"], 				// CH-47 with 2 side miniguns
	
	["UH-80 Ghost Hawk (Black)", "B_Heli_Transport_01_F", 12000, "vehicle"], 				// UH-60 Stealth with 2 side miniguns
	
    ["AH-9 Pawnee (Gun-Only)", "B_Heli_Light_01_dynamicLoadout_F", 25000, "vehicle", "variant_pawneeGun"], // Armed AH-6 (no missiles)
    ["AH-9 Pawnee", "B_Heli_Light_01_dynamicLoadout_F", 35000, "vehicle", "variant_pawneeNormal"], // Armed AH-6
    ["PO-30 Orca (DAR)", "O_Heli_Light_02_dynamicLoadout_F", 60000, "vehicle", "variant_orcaDAR"], // Armed Ka-60
    ["PO-30 Orca (DAGR)", "O_Heli_Light_02_dynamicLoadout_F", 85000, "vehicle", "variant_orcaDAGR", "HIDDEN"], // Armed Ka-60 with guided missles
    ["WY-55 Hellcat (Armed)", "I_Heli_light_03_dynamicLoadout_F", 65000, "vehicle"], // Armed AW159
    ["AH-99 Blackfoot", "B_Heli_Attack_01_dynamicLoadout_F", 95000, "vehicle"], // RAH-66 with gunner
    ["Mi-48 Kajman", "O_Heli_Attack_02_dynamicLoadout_F", 90000, "vehicle"], // Mi-28 with gunner 
    
    ["MQ-12 Falcon UAV", "B_T_UAV_03_F", 100000, "vehicle"] // Do NOT use "B_T_UAV_03_dynamicLoadout_F" (doesn't support ASRAAM pylons)
];

planesArray = compileFinal str
[
    ["Caesar BTT", "C_Plane_Civil_01_F", 2000, "vehicle"],
    ["Caesar Racing BTT (Armed)", "C_Plane_Civil_01_racing_F", 4500, "vehicle"],
    
    ["A-143 Buzzard AA", "I_Plane_Fighter_03_dynamicLoadout_F", 40000, "vehicle", "variant_buzzardAA"],
    ["A-143 Buzzard CAS", "I_Plane_Fighter_03_dynamicLoadout_F", 50000, "vehicle", "variant_buzzardCAS"],
    ["A-149 Gryphon", "I_Plane_Fighter_04_F", 60000, "vehicle"],
    ["F/A-181 Black Wasp", "B_Plane_Fighter_01_F", 65000, "vehicle"],
    ["F/A-181 Black Wasp Stealth", "B_Plane_Fighter_01_Stealth_F", 55000, "vehicle"],
    ["To-201 Shikra", "O_Plane_Fighter_02_F", 75000, "vehicle"],
    ["To-201 Shikra Stealth", "O_Plane_Fighter_02_Stealth_F", 65000, "vehicle"],
    
    ["A-164 Wipeout CAS", "B_Plane_CAS_01_dynamicLoadout_F", 100000, "vehicle"],
    ["To-199 Neophron CAS", "O_Plane_CAS_02_dynamicLoadout_F", 90000, "vehicle"],
    
    ["V-44 X Blackfish (Infantry)", "B_T_VTOL_01_infantry_F", 12000, "vehicle"],
	["V-44 X Blackfish (Vehicle)", "B_T_VTOL_01_vehicle_F", 12000, "vehicle"],
	["V-44 X Blackfish (Gunship)", "B_T_VTOL_01_armed_F", 150000, "vehicle"],
    ["Y-32 Xi'an (Infantry)", "O_T_VTOL_02_infantry_dynamicLoadout_F", 130000, "vehicle"],
    ["Y-32 Xi'an Gun Only (Infantry)", "O_T_VTOL_02_infantry_dynamicLoadout_F", 90000, "vehicle", "variant_xianGunOnly"],
    ["Y-32 Xi'an Unarmed (Infantry)", "O_T_VTOL_02_infantry_dynamicLoadout_F", 12000, "vehicle", "variant_xianUnarmed"],
    ["Y-32 Xi'an (Vehicle)", "O_T_VTOL_02_vehicle_dynamicLoadout_F", 130000, "vehicle"],
    ["Y-32 Xi'an Gun Only (Vehicle)", "O_T_VTOL_02_vehicle_dynamicLoadout_F", 130000, "vehicle", "variant_xianGunOnly"],
    ["Y-32 Xi'an Unarmed (Vehicle)", "O_T_VTOL_02_vehicle_dynamicLoadout_F", 12000, "vehicle", "variant_xianUnarmed"],
    
    ["KH-3A Fenghuang Missile UAV", "O_T_UAV_04_CAS_F", 100000, "vehicle"],
    ["MQ4A Greyhawk Missile UAV", "B_UAV_02_dynamicLoadout_F", 100000, "vehicle", "variant_greyhawkMissile"],
    ["K40 Ababil-3 Missile UAV", "O_UAV_02_dynamicLoadout_F", 100000, "vehicle", "variant_greyhawkMissile"],
    ["K40 Ababil-3 Missile UAV", "I_UAV_02_dynamicLoadout_F", 100000, "vehicle", "variant_greyhawkMissile"],
    ["UCAV Sentinel Missile UAV", "B_UAV_05_F", 100000, "vehicle", "variant_sentinelMissile"],
    
    ["MQ4A Greyhawk Bomber UAV", "B_UAV_02_dynamicLoadout_F", 40000, "vehicle", "variant_greyhawkBomber"], // Bomber UAVs are a lot harder to use, hence why they are cheaper than Missile ones
    ["K40 Ababil-3 Bomber UAV", "O_UAV_02_dynamicLoadout_F", 40000, "vehicle", "variant_greyhawkBomber"],
    ["K40 Ababil-3 Bomber UAV", "I_UAV_02_dynamicLoadout_F", 40000, "vehicle", "variant_greyhawkBomber"],
    ["UCAV Sentinel Bomber UAV", "B_UAV_05_F", 55000, "vehicle", "variant_sentinelBomber"]
];

boatsArray = compileFinal str
[
	["Water Scooter", "C_Scooter_Transport_01_F", 500, "boat", "SKIPSAVE"],

		["Rescue Boat", "C_Rubberboat", 500, "boat", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
        ["Rescue Boat (NATO)", "B_Lifeboat", 500, "boat", "SKIPSAVE", "HIDDEN"], //
        ["Rescue Boat (CSAT)", "O_Lifeboat", 500, "boat", "SKIPSAVE", "HIDDEN"], //
    ["Assault Boat", "B_Boat_Transport_01_F", 600, "boat", "SKIPSAVE"],
        ["Assault Boat (CSAT)", "O_Boat_Transport_01_F", 600, "boat", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
        ["Assault Boat (AAF)", "I_Boat_Transport_01_F", 600, "boat", "SKIPSAVE", "HIDDEN"], //
        ["Assault Boat (FIA)", "I_G_Boat_Transport_01_F", 600, "boat", "SKIPSAVE", "HIDDEN"], //
    ["Motorboat", "C_Boat_Civil_01_F", 1000, "boat", "SKIPSAVE"],
        ["Motorboat Rescue", "C_Boat_Civil_01_rescue_F", 1000, "boat", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
        ["Motorboat Police", "C_Boat_Civil_01_police_F", 1000, "boat", "SKIPSAVE", "HIDDEN"], //


	["RHIB", "I_C_Boat_Transport_02_F", 1500, "boat", "SKIPSAVE"],

	["Speedboat HMG", "O_Boat_Armed_01_hmg_F", 4000, "boat", "SKIPSAVE"],
	["Speedboat Minigun", "B_Boat_Armed_01_minigun_F", 4000, "boat", "SKIPSAVE"],
		["Speedboat Minigun (AAF)", "I_Boat_Armed_01_minigun_F", 4000, "boat", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
	["SDV Submarine (NATO)", "B_SDV_01_F", 1700, "submarine", "SKIPSAVE"],
	["SDV Submarine (CSAT)", "O_SDV_01_F", 1700, "submarine", "SKIPSAVE"],
	["SDV Submarine (AAF)", "I_SDV_01_F", 1700, "submarine", "SKIPSAVE"]
];

allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray);

uavArray = compileFinal str
[
	// Deprecated
];

noColorVehicles = compileFinal str
[
	// Deprecated
];

rgbOnlyVehicles = compileFinal str
[
	// Deprecated
];

_color = "#(rgb,1,1,1)color";
_texDir = "client\images\vehicleTextures\";
_kartDir = "\A3\soft_f_kart\Kart_01\Data\";
_mh9Dir = "\A3\air_f\Heli_Light_01\Data\";
_mohawkDir = "\A3\air_f_beta\Heli_Transport_02\Data\";
_taruDir = "\A3\air_f_heli\Heli_Transport_04\Data\";
_wreckDir = "\A3\structures_f\wrecks\data\";
_gorgonDir = "\A3\armor_f_gamma\APC_Wheeled_03\data\";

colorsArray = compileFinal str
[
	[ // Main colors
		"All", // "All" must always be first in colorsArray
		[
			["Black", _color + "(0.01,0.01,0.01,1)"], // #(argb,8,8,3)color(0.1,0.1,0.1,0.1)
			["Gray", _color + "(0.15,0.151,0.152,1)"], // #(argb,8,8,3)color(0.5,0.51,0.512,0.3)
			["White", _color + "(0.75,0.75,0.75,1)"], // #(argb,8,8,3)color(1,1,1,0.5)
			["Dark Blue", _color + "(0,0.05,0.15,1)"], // #(argb,8,8,3)color(0,0.3,0.6,0.05)
			["Blue", _color + "(0,0.03,0.5,1)"], // #(argb,8,8,3)color(0,0.2,1,0.75)
			["Teal", _color + "(0,0.3,0.3,1)"], // #(argb,8,8,3)color(0,1,1,0.15)
			["Green", _color + "(0,0.5,0,1)"], // #(argb,8,8,3)color(0,1,0,0.15)
			["Yellow", _color + "(0.5,0.4,0,1)"], // #(argb,8,8,3)color(1,0.8,0,0.4)
			["Orange", _color + "(0.4,0.09,0,1)"], // #(argb,8,8,3)color(1,0.5,0,0.4)
			["Red", _color + "(0.45,0.005,0,1)"], // #(argb,8,8,3)color(1,0.1,0,0.3)
			["Pink", _color + "(0.5,0.03,0.3,1)"], // #(argb,8,8,3)color(1,0.06,0.6,0.5)
			["Purple", _color + "(0.1,0,0.3,1)"], // #(argb,8,8,3)color(0.8,0,1,0.1)
			["NATO Tan", _texDir + "nato.paa"], // #(argb,8,8,3)color(0.584,0.565,0.515,0.3)
			["CSAT Brown", _texDir + "csat.paa"], // #(argb,8,8,3)color(0.624,0.512,0.368,0.3)
			["AAF Green", _texDir + "aaf.paa"], // #(argb,8,8,3)color(0.546,0.59,0.363,0.2)
			// ["Bloodshot", _texDir + "bloodshot.paa"],
			// ["Carbon", _texDir + "carbon.paa"],
			["Confederate", _texDir + "confederate.paa"],
			// ["Denim", _texDir + "denim.paa"],
			["Digital", _texDir + "digi.paa"],
			["Digital Black", _texDir + "digi_black.paa"],
			["Digital Desert", _texDir + "digi_desert.paa"],
			["Digital Woodland", _texDir + "digi_wood.paa"],
			// ["Doritos", _texDir + "doritos.paa"],
			["Drylands", _texDir + "drylands.paa"],
			["Hello Kitty", _texDir + "hellokitty.paa"],
			["Hex", _texDir + "hex.paa"],
			["Hippie", _texDir + "hippie.paa"],
			// ["ISIS", _texDir + "isis.paa"],
			// ["Leopard", _texDir + "leopard.paa"],
			// ["Mountain Dew", _texDir + "mtndew.paa"],
			["'Murica", _texDir + "murica.paa"],
			// ["Nazi", _texDir + "nazi.paa"],
			["Orange Camo", _texDir + "camo_orange.paa"],
			["Pink Camo", _texDir + "camo_pink.paa"],
			["Pride", _texDir + "pride.paa"],
			// ["Psych", _texDir + "psych.paa"],
			["Red Camo", _texDir + "camo_red.paa"],
			["Rusty", _texDir + "rusty.paa"],
			["Sand", _texDir + "sand.paa"],
			// ["Snake", _texDir + "snake.paa"],
			// ["Stripes", _texDir + "stripes.paa"],
			// ["Stripes 2", _texDir + "stripes2.paa"],
			// ["Stripes 3", _texDir + "stripes3.paa"],
			["Swamp", _texDir + "swamp.paa"],
			// ["Tiger", _texDir + "tiger.paa"],
			// ["Trippy", _texDir + "rainbow.paa"],
			["Union Jack", _texDir + "unionjack.paa"],
			["Urban", _texDir + "urban.paa"],
			["Weed", _texDir + "weed.paa"],
			["Woodland", _texDir + "woodland.paa"],
			["Woodland Dark", _texDir + "wooddark.paa"],
			["Woodland Tiger", _texDir + "woodtiger.paa"]
		]
	],
	[ // Kart colors
		"Kart_01_Base_F",
		[
			["Bluking (Kart)", ["Bluking"]],
			["Fuel (Kart)", ["Fuel"]],
			["Redstone (Kart)", ["Redstone"]],
			["Vrana (Kart)", ["Vrana"]],
			["Black (Kart)", ["Black"]], // ["Black (Kart)", [configName (configFile >> "CfgVehicles" >> "C_Kart_01_F" >> "TextureSources" >> "Black")]],
			["White (Kart)", ["White"]],
			["Blue (Kart)", ["Blue"]],
			["Green (Kart)", ["Green"]],
			["Yellow (Kart)", ["Yellow"]],
			["Orange (Kart)", ["Orange"]],
			["Red (Kart)", [[0, _kartDir + "kart_01_base_red_co.paa"]]] // no red TextureSource :(
		]
	],
	[ // Ambulance color
		"Van_02_medevac_base_F",
		[
			["IDAP Ambulance (Van)", ["IdapAmbulance"]]
		]
	],
	[ // Van colors
		"Van_02_base_F",
		[
			["AAN News (Van)", ["AAN"]],
			["Battle Bus (Van)", ["BattleBus"]],
			["Black (Van)", ["Black"]],
			["Blue (Van)", ["Blue"]],
			["Blue Pearl (Van)", ["BluePearl"]],
			["Daltgreen (Van)", ["Daltgreen"]],
			["Dazzle (Van)", ["Masked"]],
			["Guerilla 1 (Van)", ["FIA1"]],
			["Guerilla 2 (Van)", ["FIA2"]],
			["Guerilla 3 (Van)", ["FIA3"]],
			["Fuel (Van)", ["Fuel"]],
			["Green (Van)", ["Green"]],
			["IDAP (Van)", ["IDAP"]],
			["Orange (Van)", ["Orange"]],
			["Port Authority (Van)", ["CivService"]],
			["Red (Van)", ["Red"]],
			["Redstone (Van)", ["Redstone"]],
			["Swifd (Van)", ["Swifd"]],
			["Syndikat (Van)", ["Syndikat"]],
			["Vrana (Van)", ["Vrana"]],
			["White (Van)", ["White"]]
		]
	],
	[ // MH-9 colors
		"Heli_Light_01_base_F",
		[
			["AAF Camo (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_indp_co.paa"]]],
			["Blue 'n White (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_blue_co.paa"]]],
			["Blueline (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_blueline_co.paa"]]],
			["Cream Gravy (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_co.paa"]]],
			["Digital (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_digital_co.paa"]]],
			["Elliptical (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_elliptical_co.paa"]]],
			["Furious (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_furious_co.paa"]]],
			["Graywatcher (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_graywatcher_co.paa"]]],
			["ION (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_ion_co.paa"]]],
			["Jeans (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_jeans_co.paa"]]],
			["Light (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_light_co.paa"]]],
			["Shadow (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_shadow_co.paa"]]],
			["Sheriff (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sheriff_co.paa"]]],
			["Speedy (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_speedy_co.paa"]]],
			["Sunset (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sunset_co.paa"]]],
			["Vrana (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_vrana_co.paa"]]],
			["Wasp (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wasp_co.paa"]]],
			["Wave (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wave_co.paa"]]]
		]
	],
	[ // Mohawk colors
		"Heli_Transport_02_base_F",
		[
			["Dahoman (Mohawk)", [
				[0, _mohawkDir + "Skins\heli_transport_02_1_dahoman_co.paa"],
				[1, _mohawkDir + "Skins\heli_transport_02_2_dahoman_co.paa"],
				[2, _mohawkDir + "Skins\heli_transport_02_3_dahoman_co.paa"]
			]],
			["ION (Mohawk)", [
				[0, _mohawkDir + "Skins\heli_transport_02_1_ion_co.paa"],
				[1, _mohawkDir + "Skins\heli_transport_02_2_ion_co.paa"],
				[2, _mohawkDir + "Skins\heli_transport_02_3_ion_co.paa"]
			]],
			["IDAP (Mohawk)", [
				[0, "\A3\air_f_orange\heli_transport_02\data\heli_transport_02_1_idap_co.paa"],
				[1, "\A3\air_f_orange\heli_transport_02\data\heli_transport_02_2_idap_co.paa"],
				[2, "\A3\air_f_orange\heli_transport_02\data\heli_transport_02_3_idap_co.paa"],
				[3, "\A3\air_f_orange\heli_transport_02\data\heli_transport_02_int_02_idap_co.paa"]
			]]
		]
	],
    [ // Armed Orca paintjob
        "Heli_Light_02_dynamicLoadout_base_F",
        [
            ["Black (Orca)", ["Blackcustom"]]
        ]
    ],
    [ // Orca paintjob
        "Heli_Light_02_base_F",
        [
            ["Blue (Orca)", ["Blue"]]
        ]
    ],
	[ // Taru paintjob
		"Heli_Transport_04_base_F",
		[
			["Black (Taru)", ["Black"]]
		]
	],
    [ // Blackfoot paintjob
        "Heli_Attack_01_base_F",
        [
            ["Rusty (Blackfoot)", [[0, _wreckDir + "wreck_heli_attack_01_co.paa"]]]
        ]
    ],
	[ // Kajman paintjobs
		"Heli_Attack_02_base_F",
		[
			["Black (Kajman)", [
				[0, "\A3\air_f_beta\Heli_Attack_02\Data\heli_attack_02_body1_black_co.paa"],
				[1, "\A3\air_f_beta\Heli_Attack_02\Data\heli_attack_02_body2_black_co.paa"]
			]],
			["Rusty (Kajman)", [
				[0, _wreckDir + "wreck_heli_attack_02_body1_co.paa"],
				[1, _wreckDir + "wreck_heli_attack_02_body2_co.paa"]
			]],
			["Mossy (Kajman)", [
				[0, _wreckDir + "uwreck_heli_attack_02_body1_co.paa"],
				[1, _wreckDir + "uwreck_heli_attack_02_body2_co.paa"]
			]]
		]
	],
	[ // Ghost Hawk camo 
		"Heli_Transport_01_base_F",
		[
			["Olive (Ghost Hawk)", [
				[0, "\A3\air_f_beta\Heli_Transport_01\Data\heli_transport_01_ext01_blufor_co.paa"],
				[1, "\A3\air_f_beta\Heli_Transport_01\Data\heli_transport_01_ext02_blufor_co.paa"]
			]]
		]
	],
    [ // Zamak paintjobs
		"Truck_02_base_F",
		[
			//["AAF (Zamak)", ["Indep"]], // default
			["Hex (Zamak)", ["Opfor"]],
			["Orange (Zamak)", ["Orange"]]
		]
	],
	[ // Strider NATO color
		"MRAP_03_base_F",
		[
			["NATO Tan (Strider)", [
				[0, "\A3\soft_f_beta\MRAP_03\Data\mrap_03_ext_co.paa"],
				[1, "\A3\data_f\vehicles\turret_co.paa"]
			]]
		]
	],
	[ // Gorgon paintjobs
		"APC_Wheeled_03_base_F",
		[
			["Guerilla 1 (Gorgon)", ["Guerilla_01"]],
			["Guerilla 2 (Gorgon)", ["Guerilla_02"]],
			["Guerilla 3 (Gorgon)", ["Guerilla_03"]],
			["Tan (Gorgon)", [
				[0, _gorgonDir + "apc_wheeled_03_ext_co.paa"],
				[1, _gorgonDir + "apc_wheeled_03_ext2_co.paa"],
				[2, _gorgonDir + "rcws30_co.paa"],
				[3, _gorgonDir + "apc_wheeled_03_ext_alpha_co.paa"]
			]]
		]
	],
	[ // Hatchback wreck paintjob
		"Hatchback_01_base_F",
		[
			["Rusty (Hatchback)", [[0, _wreckDir + "civilcar_extwreck_co.paa"]]]
		]
	],
	[ // RHIB paintjob
		"Boat_Transport_02_base_F",
		[
			["Civilian (RHIB)", ["Civilian"]]
		]
	],
    [ // Prowler paintjobs
		"LSV_01_base_F",
		[
			["Olive (Prowler)", ["Olive"]],
			["Dazzle (Prowler)", ["Dazzle"]],
			["Black (Prowler)", ["Black"]],
			["Tan (Prowler)", ["Sand"]]
		]
	],
	[ // Qilin paintjobs
		"LSV_02_base_F",
		[
			//["Green Hex (Qilin)", ["GreenHex"]], // default
			["Hex (Qilin)", ["Arid"]],
			["Black (Qilin)", ["Black"]]
		]
	],
	[ // Blackfish paintjobs
		"VTOL_01_base_F",
		[
			//["Olive (Blackfish)", ["Olive"]], // default
			["Blue (Blackfish)", ["Blue"]]
		]
	],
	[ // Xi'an paintjobs
		"VTOL_02_base_F",
		[
			//["Green Hex (Xi'an)", ["GreenHex"]], // default
			["Hex (Xi'an)", ["Hex"]],
			["Gray Hex (Xi'an)", ["Grey"]]
		]
	],
    [ // Black Wasp paintjob
        "Plane_Fighter_01_Base_F",
        [
            ["Grey Camo (Black Wasp)", ["DarkGreyCamo"]]
        ]
    ],
    [ // Shikra paintjobs
        "Plane_Fighter_02_Base_F",
        [
            ["Grey Hex (Shikra)", ["CamoGreyHex"]],
            ["Russian Blue (Shikra)", ["CamoBlue"]]
        ]
    ],
    [ // Gryphon paintjobs
        "Plane_Fighter_04_Base_F",
        [
            ["Grey (Gryphon)", ["CamoGrey"]],
            ["Digital Grey (Gryphon)", ["DigitalCamoGrey"]]
        ]
    ],
    [ // Sentinel paintjob
        "UAV_05_Base_F",
        [
            ["Grey Camo (Sentinel)", ["DarkGreyCamo"]]
        ]
    ],
    [ // UGV paintjobs
		"UGV_01_base_F",
		[
			["Tan (UGV)", ["Blufor"]],
			["Hex (UGV)", ["Opfor"]],
			["Digital (UGV)", ["Indep"]],
			["Green Hex (UGV)", ["GreenHex"]]
		]
	],
	[ // Ifrit GreenHex
		"MRAP_02_base_F",
		[
			["Green Hex (Ifrit)", ["GreenHex"]]
		]
	],
	[ // Tempest GreenHex
		"Truck_03_base_F",
		[
			["Green Hex (Tempest)", ["GreenHex"]]
		]
	],
	[ // Marid GreenHex
		"APC_Wheeled_02_base_F",
		[
			["Green Hex (Marid)", ["GreenHex"]]
		]
	],
	[ // Kamysh & Tigris GreenHex
		"APC_Tracked_02_base_F",
		[
			["Green Hex (Kamysh)", ["GreenHex"]]
		]
	],
	[ // Varsuk & Sochor GreenHex
		"MBT_02_base_F",
		[
			["Green Hex (Varsuk)", ["GreenHex"]]
		]
	]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
// ["Medical Kit", "medkits", localize "STR_WL_ShopDescriptions_MedKit", "client\icons\medkit.paa", 400, 200],  // not needed since there are First Ait Kits
customPlayerItems = compileFinal str
[
	["Artillery Strike", "artillery", "", "client\icons\tablet.paa", 100000, 10000, "HIDDEN"],
	["Water Bottle", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\waterbottle.paa", 30, 15],
	["Canned Food", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 30, 15],
	["Repair Kit", "repairkit", localize "STR_WL_ShopDescriptions_RepairKit", "client\icons\briefcase.paa", 500, 250],
	["Jerry Can (Full)", "jerrycanfull", localize "STR_WL_ShopDescriptions_fuelFull", "client\icons\jerrycan.paa", 150, 75],
	["Jerry Can (Empty)", "jerrycanempty", localize "STR_WL_ShopDescriptions_fuelEmpty", "client\icons\jerrycan.paa", 50, 25],
	["Spawn Beacon", "spawnbeacon", localize "STR_WL_ShopDescriptions_spawnBeacon", "client\icons\spawnbeacon.paa", 9500, 750],
	["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\camonet.paa", 200, 100],
	["Syphon Hose", "syphonhose", localize "STR_WL_ShopDescriptions_SyphonHose", "client\icons\syphonhose.paa", 200, 100],
	["Vehicle Pinlock", "pinlock", localize "STR_WL_ShopDescriptions_Pinlock", "client\icons\keypad.paa", 250, 50]
	//["Energy Drink", "energydrink", localize "STR_WL_ShopDescriptions_Energy_Drink", "client\icons\energydrink.paa", 100, 50],
	//["Warchest", "warchest", localize "STR_WL_ShopDescriptions_Warchest", "client\icons\warchest.paa", 1000, 500]
];

call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";

storeConfigDone = compileFinal "true";
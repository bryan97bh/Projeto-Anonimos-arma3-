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

pistolArray = compileFinal str
[
	// Handguns
	["Pistola PM 9mm", "hgun_Pistol_01_F", 100],
	["Pistola P07", "hgun_P07_F", 100],
    ["Pistola P07 (Khaki)", "hgun_P07_khk_F", 100, "noDLC"],
	["Pistola P07 (PRETA)", "hgun_P07_blk_F", 100, "noDLC"],
	["Pistola Rook-40", "hgun_Rook40_F", 150],
	["Pistola ACP-C2", "hgun_ACPC2_F", 75],
	["Revólver Zubr", "hgun_Pistol_heavy_02_F", 200],
	["Pistola 4-Five", "hgun_Pistol_heavy_01_F", 200],
	["Pistola 4-Five (verde)", "hgun_Pistol_heavy_01_green_F", 200, "noDLC"]	
];

smgArray = compileFinal str
[
	["PDW2000 Sub Metralhadora", "hgun_PDW2000_F", 250],
    ["Protector Sub Metralhadora", "SMG_05_F", 250],
	["Sting Sub Metralhadora", "SMG_02_F", 250],
	["Vermin Sub Metralhadora", "SMG_01_F", 250],

	["ADR-97C (Preta)", "SMG_03C_black", 450],
	["ADR-97C (Camuflada)", "SMG_03C_camo", 450],
	["ADR-97C (Hex)", "SMG_03C_hex", 450],
	["ADR-97C (Khaki)","SMG_03C_khaki", 450],

	["ADR-97C TR (Preta)", "SMG_03C_TR_black", 450],
	["ADR-97C TR (Camuflada)", "SMG_03C_TR_camo", 450],
	["ADR-97C TR (Hex)", "SMG_03C_TR_hex", 450],
	["ADR-97C TR (Khaki)", "SMG_03C_TR_khaki", 450],

	["ADR-97 (Preta)", "SMG_03_black", 450],
	["ADR-97 (Camo)", "SMG_03_camo", 450],
	["ADR-97 (Hex)", "SMG_03_hex", 450],
	["ADR-97 (Khaki)", "SMG_03_khaki", 450],

	["ADR-97 TR (Preta)", "SMG_03_TR_black", 450],
	["ADR-97 TR (Camuflada)", "SMG_03_TR_camo", 450],
	["ADR-97 TR (Hex)", "SMG_03_TR_hex", 450],
	["ADR-97 TR (Khaki)", "SMG_03_TR_khaki", 450]
];

rifleArray = compileFinal str
[
	// Underwater Gun
	["SDAR Fuzil Subaquático", "arifle_SDAR_F", 1000],

	// Assault Rifles
	["Carabina Mk20", "arifle_Mk20C_plain_F", 450],
	["Carabina Mk20 (Camuflada)", "arifle_Mk20C_F", 450],
	["Fuzil Mk20", "arifle_Mk20_plain_F", 500],
	["Fuzil Mk20 (Camuflada)", "arifle_Mk20_F", 500],
	["Fuzil GL Mk20", "arifle_Mk20_GL_plain_F", 750],
	["Fuzil GL Mk20 (Camuflada)", "arifle_Mk20_GL_F", 750],

	["Carabina TRG-20", "arifle_TRG20_F", 450],
	["Fuzil TRG-21 ", "arifle_TRG21_F", 500],
	["Fuzil GL TRG-21", "arifle_TRG21_GL_F", 300],

	["Fuzil SPAR-16 (Preto)", "arifle_SPAR_01_blk_F", 500],
	["Fuzil SPAR-16 (Khaki)", "arifle_SPAR_01_khk_F", 500],
	["Fuzil SPAR-16 (Areia)", "arifle_SPAR_01_snd_F", 500],
	["Fuzil SPAR-16 GL (Preto)", "arifle_SPAR_01_GL_blk_F", 750],
	["Fuzil SPAR-16 GL (Khaki)", "arifle_SPAR_01_GL_khk_F", 750],
	["Fuzil SPAR-16 GL (Areia)", "arifle_SPAR_01_GL_snd_F", 750],
	
	["Fuzil CAR-95 (Preto)", "arifle_CTAR_blk_F", 600],
	["Fuzil CAR-95 (Verde Hex)", "arifle_CTAR_ghex_F", 600],
	["Fuzil CAR-95 (Hex)", "arifle_CTAR_hex_F", 600],
	["Fuzil CAR-95 GL (Preto)", "arifle_CTAR_GL_blk_F", 1300],
	["Fuzil CAR-95 GL (Verde Hex)", "arifle_CTAR_GL_ghex_F", 1300],
	["Fuzil CAR-95 GL (Hex)", "arifle_CTAR_GL_hex_F", 1300],
	
	["Carabina Katiba", "arifle_Katiba_C_F", 750],
	["Fuzil Katiba", "arifle_Katiba_F", 950],
	["Fuzil Katiba GL", "arifle_Katiba_GL_F", 1500],

	["Carabina MX (Preto)", "arifle_MXC_Black_F", 950],
	["Carabina MX (Khaki)", "arifle_MXC_khk_F", 950, "noDLC"],
	["Carabina MX (Areia)", "arifle_MXC_F", 950],
	["Fuzil MX (Preto)", "arifle_MX_Black_F", 950],
	["Fuzil MX (Khaki)", "arifle_MX_khk_F", 950, "noDLC"],
	["Fuzil MX (Areia)", "arifle_MX_F", 950],
	["Fuzil MX 3GL (Preto)", "arifle_MX_GL_Black_F", 1500],
	["Fuzil MX 3GL (Khaki)", "arifle_MX_GL_khk_F", 1500, "noDLC"],
	["Fuzil MX 3GL (Areia)", "arifle_MX_GL_F", 1500],
	
	["Fuzil Promet", "arifle_MSBS65_F", 1000],
	["Fuzil Promet (Preto)", "arifle_MSBS65_black_F", 1000],
	["Fuzil Promet (Camuflado)", "arifle_MSBS65_camo_F", 1000],
	["Fuzil Promet (Areia)", "arifle_MSBS65_sand_F", 1000],
	["Fuzil Promet GL", "arifle_MSBS65_GL_F", 1500],
	["Fuzil Promet GL (Preto)", "arifle_MSBS65_GL_black_F", 1500],
	["Fuzil Promet GL (Camuflado)", "arifle_MSBS65_GL_camo_F", 1500],
	["Fuzil Promet GL (Areia)", "arifle_MSBS65_GL_sand_F", 1500],
	
	["Fuzil Promet SR", "arifle_MSBS65_UBS_F", 1000],
	["Fuzil Promet SR (Preto)", "arifle_MSBS65_UBS_black_F", 1000],
	["Fuzil Promet SR (Camuflado)", "arifle_MSBS65_UBS_camo_F", 1000],
	["Fuzil Promet SR (Areia)", "arifle_MSBS65_UBS_sand_F", 1000],
		
	["Carabina AKS-74U", "arifle_AKS_F", 450],
	["Fuzil AKM", "arifle_AKM_F", 1500],
	["Fuzil AKU-12 (Preto)", "arifle_AK12U_F", 2000],
	["Fuzil AKU-12  (Exuberante)", "arifle_AK12U_lush_F", 2000],
	["Fuzil AKU-12 (Árido)", "arifle_AK12U_arid_F", 2000],
	["Fuzil AK-12 (Preto)", "arifle_AK12_F", 2200],
	["Fuzil AK-12 (Exuberante)", "arifle_AK12_lush_F", 2200, "noDLC"],
	["Fuzil AK-12 (Árido)", "arifle_AK12_arid_F", 2200, "noDLC"],
	["Fuzil AK-12 GL (Preto)", "arifle_AK12_GL_F", 2500],
	["Fuzil AK-12 GL (Exuberante)", "arifle_AK12_GL_luch_F", 2500, "noDLC"],
	["Fuzil AK-12 GL (Árido)", "arifle_AK12_GL_arid_F", 2500, "noDLC"],
	
	["Espingarda Kozlice 12G", "sgun_HunterShotgun_01_F", 500],
	["Espingarda Kozlice 12G (Cano serrado)", "sgun_HunterShotgun_01_sawedoff_F", 350],
	
	["Fuzil Type 115 .50 (Preta)", "arifle_ARX_blk_F", 2600],
    ["Fuzil Type 115 .50 (Verde Hex)", "arifle_ARX_ghex_F", 2600],
    ["Fuzil Type 115 .50 (Hex)", "arifle_ARX_hex_F", 2600],
    
	// Marksman Rifles
	["Fuzil MXM", "arifle_MXM_F", 1500],
    ["Fuzil MXM (Khaki)", "arifle_MXM_khk_F", 1500, "noDLC"],
	["Fuzil MXM (Preto)", "arifle_MXM_Black_F", 1500],
	["Fuzil Rahim", "srifle_DMR_01_F", 2000],
	["Fuzil Mk18 ABR", "srifle_EBR_F", 2500],
	
	["Fuzil Promet MR", "arifle_MSBS65_Mark_F", 2000],
	["Fuzil Promet MR (Preto)", "arifle_MSBS65_Mark_black_F", 2000],
	["Fuzil Promet MR (Camuflado)", "arifle_MSBS65_Mark_camo_F", 2000],
	["Fuzil Promet MR (Areia)", "arifle_MSBS65_Mark_sand_F", 2000],

	// DLC
    ["Fuzil CMR-76 (Preto)", "srifle_DMR_07_blk_F", 2000],
    ["Fuzil CMR-76 (Verde Hex)", "srifle_DMR_07_ghex_F", 2000],
    ["Fuzil CMR-76 (Hex)", "srifle_DMR_07_hex_F", 2000],
	
    ["Fuzil SPAR-17 EMR (Preta)", "arifle_SPAR_03_blk_F", 3000],
    ["Fuzil SPAR-17 EMR (Khaki)", "arifle_SPAR_03_khk_F", 3000],
    ["Fuzil SPAR-17 EMR (Areia)", "arifle_SPAR_03_snd_F", 3000],

	["Fuzil Mk14 (Classico)", "srifle_DMR_06_hunter_F", 3000],
	["Fuzil Mk14 (Camuflado)", "srifle_DMR_06_camo_F", 3000],
	["Fuzil Mk14 (Oliva)", "srifle_DMR_06_olive_F", 3000],
	
	["Fuzil Mk-I EMR (Preto)", "srifle_DMR_03_F", 2900],
	["Fuzil Mk-I EMR (Camuflado)", "srifle_DMR_03_multicam_F", 2900],
	["Fuzil Mk-I EMR (Khaki)", "srifle_DMR_03_khaki_F", 2900],
	["Fuzil Mk-I EMR (Areia)", "srifle_DMR_03_tan_F", 2900],
	["Fuzil Mk-I EMR (Woodland)", "srifle_DMR_03_woodland_F", 2900],
	
	["Fuzil MAR-10 (Preto)", "srifle_DMR_02_F", 5000],
	["Fuzil MAR-10 (Camuflado)", "srifle_DMR_02_camo_F", 5000],
	["Fuzil MAR-10 (Areia)", "srifle_DMR_02_sniper_F", 5000],
	
	["Fuzil Cyrus (Preto)", "srifle_DMR_05_blk_F", 5000],
	["Fuzil Cyrus (Hex)", "srifle_DMR_05_hex_F", 5000],
	["Fuzil Cyrus (Bronze)", "srifle_DMR_05_tan_f", 5000],

	// Sniper Rifles
	["Fuzil ASP-1 Kir (Preto)", "srifle_DMR_04_F", 1000],
	["Fuzil ASP-1 Kir (Bronze)", "srifle_DMR_04_tan_F", 1000],
	["Fuzil M320 LRR", "srifle_LRR_F", 8000],
	["Fuzil M320 LRR (Camuflado)", "srifle_LRR_camo_F", 8000],
    ["Fuzil M320 LRR (Tropical)", "srifle_LRR_tna_F", 8000, "noDLC"],
	["Fuzil GM6 Lynx", "srifle_GM6_F", 10000],
	["Fuzil GM6 Lynx (Camuflado)", "srifle_GM6_camo_F", 10000],
    ["Fuzil GM6 Lynx (Verde Hex)", "srifle_GM6_ghex_F", 10000, "noDLC"]
];

lmgArray = compileFinal str
[
	["Metralhadora Automática SPAR-16S (Preto)", "arifle_SPAR_02_blk_F", 2000],
    ["Metralhadora Automática SPAR-16S (Khaki)", "arifle_SPAR_02_khk_F", 2000],
    ["Metralhadora Automática SPAR-16S (Areia)", "arifle_SPAR_02_snd_F", 2000],
	
	["Metralhadora Automática LIM-85 (Preta)", "LMG_03_F", 2000],
	
	["Metralhadora Automática CAR-95-1 (Preta)", "arifle_CTARS_blk_F", 2100],
	["Metralhadora Automática CAR-95-1 (Verde Hex)", "arifle_CTARS_ghex_F", 2100],
	["Metralhadora Automática CAR-95-1 (Hex)", "arifle_CTARS_hex_F", 2100],
	
	["Metralhadora Automática MX SW (Preta)", "arifle_MX_SW_Black_F", 2250],
	["Metralhadora Automática MX SW (Khaki)", "arifle_MX_SW_khk_F", 2250, "noDLC"],
	["Metralhadora Automática MX SW (Areia)", "arifle_MX_SW_F", 2250],
	
	["Metralhadora Automática Mk200 (Areia)", "LMG_Mk200_F", 2500],
	["Metralhadora Automática Mk200 (Preta)", "LMG_Mk200_black_F", 2500, "noDLC"],
	
	["Metralhadora Pesada Zafir", "LMG_Zafir_F", 3000],
	
	["Metralhadora Pesada RPK-12 7.62", "arifle_RPK12_F", 3000, "noDLC"],
	["Metralhadora Pesada RPK-12 7.62 (Árida)", "arifle_RPK12_arid_F", 3000, "noDLC"],
	["Metralhadora Pesada RPK-12 7.62 (Exuberante)", "arifle_RPK12_lush_F", 3000, "noDLC"],
    
    ["Metralhadora Pesada Navid (Bronze)", "MMG_01_tan_F", 7500],
	["Metralhadora Pesada Navid (Hex)", "MMG_01_hex_F", 7500],
    
	["Metralhadora Pesada SPMG (Preta)", "MMG_02_black_F", 7500],
	["Metralhadora Pesada SPMG (Areia)", "MMG_02_sand_F", 7500],
	["Metralhadora Pesada SPMG (Multicam)", "MMG_02_camo_F", 7500],
	["TESTE", "gm_mg3_blk", 3000]
];

launcherArray = compileFinal str
[
    ["Lança Foguete RPG-7", "launch_RPG7_F", 2000],
	["Lança Foguete RPG-42 Alamut", "launch_RPG32_F", 3000],
    ["Lança Foguete RPG-42 Alamut (Verde Hex)", "launch_RPG32_ghex_F", 3000, "noDLC"],
	["Lança Foguete RPG-42 Alamut (verde)", "launch_RPG32_green_F", 3000, "noDLC"],
	["Lança Míssel Portátil PCML", "launch_NLAW_F", 1500],
	["Lança Foguete MAAWS Mk4 M0 (verde)", "launch_MRAWS_green_rail_F", 4000, "noDLC"], // RPG-42 and MAAWS are similar, but MAAWS has longer range
    ["Lança Foguete MAAWS Mk4 M0 (Oliva)", "launch_MRAWS_olive_rail_F", 4000, "noDLC"],
    ["Lança Foguete MAAWS Mk4 M0 (Areia)", "launch_MRAWS_sand_rail_F", 4000, "noDLC"],
    ["Lança Foguete MAAWS Mk4 M1 (Verde)", "launch_MRAWS_green_F", 4500, "noDLC"], // MAAWS Mod 1 has nightvision and laser rangefinder, while Mod 0 doesn't
    ["Lança Foguete MAAWS Mk4 M1 (Oliva)", "launch_MRAWS_olive_F", 4500, "noDLC"],
    ["Lança Foguete MAAWS Mk4 M1 (Areia)", "launch_MRAWS_sand_F", 4500, "noDLC"],
    ["Lança Míssel Portátil 9M135 Vorona (Marron)", "launch_O_Vorona_brown_F", 7000, "noDLC"],
    ["Lança Míssel Portátil 9M135 Vorona (Verde)", "launch_O_Vorona_green_F", 7000, "noDLC"],
	["Lança Míssel Portátil Antitanque (Areia)", "launch_Titan_short_F", 5000, "HIDDEN"],
	["Lança Míssel Portátil Antitanque (Coyote)", "launch_O_Titan_short_F", 5000, "HIDDEN"],
	["Lança Míssel Portátil Antitanque (Oliva)", "launch_I_Titan_short_F", 5000, "HIDDEN"],
    ["Lança Míssel Portátil Antitanque (Tropical)", "launch_B_Titan_short_tna_F", 5000, "noDLC", "HIDDEN"],
    ["Lança Míssel Portátil Antitanque (Verde Hex)", "launch_O_Titan_short_ghex_F", 5000, "noDLC", "HIDDEN"],
	["Lança Míssel Portátil Antiaério (Areia)", "launch_Titan_F", 7000],
	["Lança Míssel Portátil Antiaério (Hex)", "launch_O_Titan_F", 7000],
	["Lança Míssel Portátil Antiaério", "launch_I_Titan_F", 7000],
	["Lança Míssel Portátil Antiaério", "launch_I_Titan_eaf_F", 7000, "noDLC"],
	["Lança Míssel Portátil Antiaério", "launch_I_Titan_olive_F", 7000, "noDLC"],
    ["Lança Míssel Portátil Antiaério (Verde Hex)", "launch_O_Titan_ghex_F", 7000, "noDLC"],
    ["Lança Míssel Portátil Antiaério (Tropical)", "launch_B_Titan_tna_F", 7000, "noDLC"]
];

allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call launcherArray);

staticGunsArray = compileFinal str
[
	["GRUPO Browning .50", "", 0, ""],
    ["Browning.50 ALTA", "B_HMG_01_high_weapon_F", 4000],
	["Browning.50 BAIXA", "B_HMG_01_weapon_F", 3000],

	["GRUPO Browning M2.50", "", 0, ""],
	["Browning M2.50 COM MIRA ALTA", "I_HMG_02_high_weapon_F", 3000],
	["Browning M2.50 COM MIRA BAIXA", "I_HMG_02_weapon_F", 2500],
	
	["Browning M2.50 SEM MIRA ALTA", "I_G_HMG_02_high_weapon_F", 3000],
	["Browning M2.50 SEM MIRA BAIXA", "I_G_HMG_02_weapon_F", 2500],

    ["GRUPO Browning 20MM", "", 0, ""],
	["Browning 20MM ALTA", "B_GMG_01_high_weapon_F", 5000],
	["Browning 20MM BAIXA", "B_GMG_01_weapon_F", 4500],

    ["GRUPO LANÇADORES", "", 0, ""],
	["LANÇADOR AT", "B_AT_01_weapon_F", 7000],
	["LANÇADOR AA", "B_AA_01_weapon_F", 7000],
	["Tubo Morteiro 80mm", "B_Mortar_01_weapon_F", 12000],
	
	["GRUPO TRIPÉS", "", 0, ""],
    ["Tripé Alto para .50", "B_HMG_01_support_high_F", 500],
	["Tripé Baixo para .50|20MM|AT|AA", "B_HMG_01_support_F", 500],
	
	["Tripé Alto para M2.50", "I_HMG_02_support_high_F", 500],
	["Tripé Baixo para M2.50", "I_C_HMG_02_support_F", 500],
	["Base do Morteiro", "B_Mortar_01_support_F", 500]
];

throwputArray = compileFinal str
[
	["Granada de fragmentação Pequena RGN", "MiniGrenade", 50],
	["Granada de fragmentação Grande RGO", "HandGrenade", 100],
	["Mina Antipessoal com fio APERS", "APERSTripMine_Wire_Mag", 100, "HIDDEN"],
	["Mina Antipessoal Saltadora APERS", "APERSBoundingMine_Range_Mag", 150, "HIDDEN"],
	["Mina Antipessoal Pequena APERS", "APERSMine_Range_Mag", 100, "HIDDEN"],
	["Explosivo Claymore", "ClaymoreDirectionalMine_Remote_Mag", 300],
	["Mina Anti Veicular M6 SLAM ", "SLAMDirectionalMine_Wire_Mag", 350, "HIDDEN"],
	["Mina Antitanque", "ATMine_Range_Mag", 400, "HIDDEN"],
	["Carga Explosiva C4", "DemoCharge_Remote_Mag", 400],
	["Bolsa de Explosivos", "SatchelCharge_Remote_Mag", 500],
    ["IED Pequeno Urbano", "IEDUrbanSmall_Remote_Mag", 400],
    ["IED Pequeno Disfarçado", "IEDLandSmall_Remote_Mag", 450],
    ["IED Grande Urbano", "IEDUrbanBig_Remote_Mag", 950],
    ["IED Grande Disfarçado", "IEDLandBig_Remote_Mag", 1100],
	["Granada De Fumaça|Branca|", "SmokeShell", 50],
	["Granada De Fumaça|Roxa|", "SmokeShellPurple", 50],
	["Granada De Fumaça|Azul|", "SmokeShellBlue", 50],
	["Granada De Fumaça|Verde|", "SmokeShellGreen", 50],
	["Granada De Fumaça|Tóxica|Amarela|", "SmokeShellYellow", 150],
	["Granada De Fumaça|Laranja|", "SmokeShellOrange", 50],
	["Granada De Fumaça|Vermelha|", "SmokeShellRed", 50]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = compileFinal str
[
	["9mm 10|Munições|", "10Rnd_9x21_Mag", 10],
	["9mm 16|Munições|", "16Rnd_9x21_Mag", 15],
	["9mm 30|Munições|", "30Rnd_9x21_Mag", 25],
    ["9mm 30|Munições|", "30Rnd_9x21_Mag_SMG_02", 25],
	[".45 ACP 6|Munições|", "6Rnd_45ACP_Cylinder", 20],
	[".45 ACP 9|Munições|", "9Rnd_45ACP_Mag", 25],
	[".45 ACP 11|Munições|", "11Rnd_45ACP_Mag", 30],
	[".45 ACP 30|Munições|Kriss Vector", "30Rnd_45ACP_MAG_SMG_01", 35],
	[".45 ACP 30|Munições|Traçante|Verde|", "30Rnd_45ACP_Mag_SMG_01_tracer_green", 35],
    ["5.45mm 30|Munições|", "30Rnd_545x39_Mag_F", 30],
	["5.45mm 30|Munições|Traçante|Amarelo|", "30Rnd_545x39_Mag_Tracer_F", 20],
	["5.45mm 30|Munições|Traçante|Verde|", "30Rnd_545x39_Mag_Tracer_Green_F", 20],
	["5.56mm 20|Munições|Subaquático|", "20Rnd_556x45_UW_mag", 30],
	["5.56mm 30|Munições|STANAG|", "30Rnd_556x45_Stanag", 25],
	["5.56mm 30Rnd|Munições|STANAG|Areia|", "30Rnd_556x45_Stanag_Sand_Green", 75],
	["5.56mm 30Rnd|Munições|Traçante|Verde|", "30Rnd_556x45_Stanag_Tracer_Green", 75],
	["5.56mm 30Rnd|Munições|Traçante|Amarelo|", "30Rnd_556x45_Stanag_Tracer_Yellow", 75],
	["5.56mm 30Rnd|Munições|Traçante|Vermelho|", "30Rnd_556x45_Stanag_Tracer_Red", 75],
    ["5.56mm 150|Munições|", "150Rnd_556x45_Drum_Mag_F", 100],
	["5.56mm 150|Munições|verde|", "150Rnd_556x45_Drum_Green_Mag_F", 100],
	["5.56mm 150|Munições|Areia|", "150Rnd_556x45_Drum_Sand_Mag_F", 100],
	["5.56mm 150|Munições|Traçante|Verde|", "150Rnd_556x45_Drum_Mag_Tracer_F", 75],
	["5.56mm 200|Munições|Cinta|", "200Rnd_556x45_Box_F", 125],
	["5.56mm 200|Munições|Traçante|Amarelo|Cinta|", "200Rnd_556x45_Box_Tracer_F", 100],
	["5.56mm 200|Munições|Traçante|vermelho|Cinta|", "200Rnd_556x45_Box_Tracer_Red_F", 100],
	["5.7mm 50|Munições|ADR-97|", "50Rnd_570x28_SMG_03", 20],
	["5.8mm 30|Munições|", "30Rnd_580x42_Mag_F", 35],
	["5.8mm 30|Munições|Traçante|verde|", "30Rnd_580x42_Mag_Tracer_F", 30],	
	["5.8mm 100|Munições|", "100Rnd_580x42_Mag_F", 100],
	["5.8mm 100|Munições|Verde Hex|", "100Rnd_580x42_ghex_Mag_F", 100],
	["5.8mm 100|Munições|Hex|", "100Rnd_580x42_hex_Mag_F", 100],
	["5.8mm 100|Munições|Traçante|Verde|", "100Rnd_580x42_Mag_Tracer_F", 80],
	["6.5mm 20|Munições|", "20Rnd_650x39_Cased_Mag_F", 30],
	["6.5mm 30|Munições|STANAG|", "30Rnd_65x39_caseless_mag", 30],
	["6.5mm 30Rnd|Munições|Traçante|Vermelho|", "30Rnd_65x39_caseless_mag_Tracer", 35],
	["6.5mm 30Rnd|Munições|Caseless|", "30Rnd_65x39_caseless_green", 30],
	["6.5mm 30Rnd|Munições|Traçante|Verde|", "30Rnd_65x39_caseless_green_mag_Tracer", 35],
	["6.5mm 30|Munições|STANAG|Preto|", "30Rnd_65x39_caseless_black_mag", 30],
	["6.5mm 30|Munições|STANAG|Khaki|", "30Rnd_65x39_caseless_khaki_mag", 30],
	["6.5mm 100|Munições|Cinta|", "100Rnd_65x39_caseless_mag", 100],
	["6.5mm 100|Munições|Traçante|Vermelho|Cinta|", "100Rnd_65x39_caseless_mag_Tracer", 120],
	["6.5mm 100|Munições|Preto|Cinta|", "100Rnd_65x39_caseless_black_mag", 100],
	["6.5mm 100|Munições|Khaki|Cinta|", "100Rnd_65x39_caseless_khaki_mag", 100],
	["6.5mm 200|Munições|Cinta|", "200Rnd_65x39_cased_Box", 200],
	["6.5mm 200|Munições|Traçante|Amarelo|Cinta|", "200Rnd_65x39_cased_Box_Tracer", 225],
	["7.62mm 10|Munições|", "10Rnd_762x51_Mag", 15],
	["7.62mm 10|Munições|", "10Rnd_762x54_Mag", 50],
	["7.62mm 20|Munições|", "20Rnd_762x51_Mag", 75],
    ["7.62mm 30|Munições|", "30Rnd_762x39_Mag_F", 50],
	["7.62mm 30|Munições|Traçante|", "30Rnd_762x39_Mag_Tracer_F", 50],
	["7.62mm 30|Munições|Traçante|Verde|", "30Rnd_762x39_Mag_Tracer_Green_F", 50],
	["7.62mm 150|Munições|Cinta|", "150Rnd_762x51_Box", 150],
	["7.62mm 150|Munições|Traçante|Verde|Cinta|", "150Rnd_762x51_Box_Tracer", 125],
	["7.62mm 150|Munições|Cinta|", "150Rnd_762x54_Box", 250],
	["7.62mm 150|Munições|Traçante|Verde|Cinta|", "150Rnd_762x54_Box_Tracer", 275],
	[".338 LM 10|Munições|", "10Rnd_338_Mag", 200],
	[".338 NM 130|Munições|Cinta|", "130Rnd_338_Mag", 250],
	["9.3mm 10|Munições|", "10Rnd_93x64_DMR_05_Mag", 200],
	["9.3mm 150|Munições|Cinta|", "150Rnd_93x64_Mag", 250],
	[".408 7|Munições|Cheetah|", "7Rnd_408_Mag", 500],
	["12.7mm 5|Munições|", "5Rnd_127x108_Mag", 500],
	["12.7mm 5|Munições|Perfurante De Blindagem|", "5Rnd_127x108_APDS_Mag", 700],
	["12.7mm 10|Munições|Subsonicas|", "10Rnd_127x54_Mag", 400],
	[".50 BW 10|Munições|", "10Rnd_50BW_Mag_F", 200],            //                 hit                      hit,  radius
    ["PG-7VM HEAT|Granada|", "RPG7_F", 750],                     // Direct damage:  343     | Splash damage:  13,  3.0m     | Guidance: none
    ["RPG-42 AT|Foguete|", "RPG32_F", 950],                      //                 422     |                 28,  2.5m     |           none
    ["RPG-42 HE|Foguete|", "RPG32_HE_F", 500],                   //                 200     |                 50,  6.0m     |           none
    ["MAAWS HEAT 75|Foguete|", "MRAWS_HEAT_F", 950],             //                 495     |                 14,  2.0m     |           none
    ["MAAWS HEAT 55|Foguete|", "MRAWS_HEAT55_F", 750],           //                 450     |                 14,  2.0m     |           none
    ["MAAWS HE|Foguete|", "MRAWS_HE_F", 500],                    //                 200     |                 50,  6.0m     |           none
    ["9M135 HEAT|Míssil|", "Vorona_HEAT", 2000],                 //                 634     |                 28,  2.5m     |           mouse
    ["9M135 HE|Míssil|", "Vorona_HE", 1750],                     //                 220     |                 45,  8.0m     |           mouse
    ["PCML AT|Míssil|", "NLAW_F", 850],                          //                 462     |                 25,  2.4m     |           laser/IR, cold/hot ground vehicles
    ["Titan AT|Míssil|", "Titan_AT", 5000],                      //                 515     |                 20,  2.0m     |           mouse, laser/IR, hot ground vehicles
    ["Titan AP|Míssil|", "Titan_AP", 4000],                      //                 100     |                 25, 10.0m     |           mouse, laser/IR
    ["Titan AA|Míssil|", "Titan_AA", 5000],                      //                  80     |                 60,  6.0m     |           aircraft
	["40mm HE|Granada De Bocal|", "1Rnd_HE_Grenade_shell", 300],
	["40mm HE|3|Munições|Granadas De Bocal|", "3Rnd_HE_Grenade_shell", 850],
	["40mm Fumaça De Bocal|Branca|", "1Rnd_Smoke_Grenade_shell", 50],
	["40mm Fumaça De Bocal|Roxa|", "1Rnd_SmokePurple_Grenade_shell", 50],
	["40mm Fumaça De Bocal|Azul|", "1Rnd_SmokeBlue_Grenade_shell", 50],
	["40mm Fumaça De Bocal|Verde|", "1Rnd_SmokeGreen_Grenade_shell", 50],
	["40mm Fumaça De Bocal|Tóxica|", "1Rnd_SmokeYellow_Grenade_shell", 300],
	["40mm Fumaça De Bocal|Laranja|", "1Rnd_SmokeOrange_Grenade_shell", 50],
	["40mm Fumaça De Bocal|Vermelha|", "1Rnd_SmokeRed_Grenade_shell", 50],
	["40mm 3|Munições|Fumaça De Bocal|Branca|", "3Rnd_Smoke_Grenade_shell", 100],
	["40mm 3|Munições|Fumaça De Bocal|Roxa|", "3Rnd_SmokePurple_Grenade_shell", 100],
	["40mm 3|Munições|Fumaça De Bocal|Azul|", "3Rnd_SmokeBlue_Grenade_shell", 100],
	["40mm 3|Munições|Fumaça De Bocal|Verde|", "3Rnd_SmokeGreen_Grenade_shell", 100],
	["40mm 3|Munições|Fumaça De Bocal|Tóxica|", "3Rnd_SmokeYellow_Grenade_shell", 900],
	["40mm 3|Munições|Fumaça De Bocal|Laranja|", "3Rnd_SmokeOrange_Grenade_shell", 100],
	["40mm 3|Munições|Fumaça De Bocal|vermelha|", "3Rnd_SmokeRed_Grenade_shell", 100],
	["40mm Sinalizador (White)", "UGL_FlareWhite_F", 25],
	["40mm Sinalizador De Bocal|Verde|", "UGL_FlareGreen_F", 25],
	["40mm Sinalizador De Bocal|Amarelo|", "UGL_FlareYellow_F", 25],
	["40mm Sinalizador De Bocal|Vermelho", "UGL_FlareRed_F", 25],
	["40mm Sinalizador De Bocal|Infravermelho|", "UGL_FlareCIR_F", 25],
	["40mm 3|Sinalizadores De Bocal|Branco|", "3Rnd_UGL_FlareWhite_F", 50],
	["40mm 3|Sinalizadores De Bocal|Verde|", "3Rnd_UGL_FlareGreen_F", 50],
	["40mm 3|Sinalizadores De Bocal|Amarelo|", "3Rnd_UGL_FlareYellow_F", 50],
	["40mm 3|Sinalizadores De Bocal|Vermelho", "3Rnd_UGL_FlareRed_F", 50],
	["40mm 3|Sinalizadores De Bocal|Infravermelho|", "3Rnd_UGL_FlareCIR_F", 50],
	
	//Contact DLC
	
	["12 Gauge 2|Munições|Esferas|", "2Rnd_12Gauge_Pellets", 10],
	["12 Gauge 2|Munições|Balote|", "2Rnd_12Gauge_Slug", 10],
	["12 Gauge 6|Munições|Esferas|", "6Rnd_12Gauge_Pellets", 30],
	["12 Gauge 6|Munições|Balote|", "6Rnd_12Gauge_Slugs", 30],
	
	["6.5mm 30|Munições|Promet|", "30Rnd_65x39_caseless_msbs_mag", 35],
	["6.5mm 30|Munições|Promet|Traçante|", "30Rnd_65x39_caseless_msbs_mag_Tracer", 35],
	
	["7.62mm 10|Munições|", "10Rnd_762x51_Mag", 25],
	
	["7.62 75|Munições|AK12|", "75rnd_762x39_AK12_Mag_F", 100],
	["7.62 75|Munições|AK12|Árido|", "75rnd_762x39_AK12_Arid_Mag_F", 100],
	["7.62 75|Munições|AK12|Exuberante|", "75rnd_762x39_AK12_Lush_Mag_F", 100],
	["7.62 75|Munições|AK12|Traçante|", "75rnd_762x39_AK12_Mag_Tracer_F", 100],
	
	["7.62 75|Munições|AKM|Cinta|", "75rnd_762x39_Mag_F", 100],
	
	["7.62 30|Munições|AK12|Árido|", "30rnd_762x39_AK12_Arid_Mag_F", 100],
	["7.62 30|Munições|AK12|Exuberante|", "30rnd_762x39_AK12_Lush_Mag_F", 100],
	["TESTE", "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn", 300]
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray = compileFinal str
[
	["Supressor 9mm", "muzzle_snds_L", 150, "item"], 
	["Supressor .45 ACP", "muzzle_snds_acp", 175, "item"],
    ["Supressor 5.56mm|Preto|", "muzzle_snds_M", 1550, "item", "HIDDEN"],
    ["Supressor 5.56mm|Khaki", "muzzle_snds_m_khk_F", 1550, "item", "noDLC", "HIDDEN"],
    ["Supressor 5.56mm|Areia|", "muzzle_snds_m_snd_F", 1550, "item", "noDLC", "HIDDEN"],
	["Supressor 5.7mm", "muzzle_snds_570", 1800, "item", "HIDDEN"],
    ["Supressor 5.8mm|Verde Hex|" , "muzzle_snds_58_ghex_F", 2000, "item", "HIDDEN"],
	["Supressor 5.8mm|Hex|", "muzzle_snds_58_hex_F", 2000, "item", "HIDDEN"],
    ["Supressor 6.5mm|Preto|", "muzzle_snds_H", 2500, "item", "HIDDEN"],
    ["Supressor 6.5mm|Khaki|", "muzzle_snds_H_khk_F", 2500, "item", "noDLC", "HIDDEN"],
    ["Supressor 6.5mm|Areia|", "muzzle_snds_H_snd_F", 2500, "item", "noDLC", "HIDDEN"],
    ["Supressor MK200 LMG|Preto|", "muzzle_snds_H_MG_blk_F", 2750, "item", "noDLC", "HIDDEN"],
    ["Supressor MK200 LMG|Khaki|", "muzzle_snds_H_MG_khk_F", 2750, "item", "noDLC", "HIDDEN"],
    ["Supressor MK200 LMG|Areia|", "muzzle_snds_H_MG", 2750, "item", "HIDDEN"],
    ["Supressor Stealth 6.5mm|Preto|", "muzzle_snds_65_TI_blk_F", 2500, "item", "HIDDEN"],
    ["Supressor Stealth 6.5mm|Verde Hex|", "muzzle_snds_65_TI_ghex_F", 2500, "item", "HIDDEN"],
    ["Supressor Stealth 6.5mm|Hex|", "muzzle_snds_65_TI_hex_F", 2500, "item", "HIDDEN"],
    ["Supressor 7.62mm|Preto|", "muzzle_snds_B", 3500, "item", "HIDDEN"],
    ["Supressor 7.62mm|Khaki|", "muzzle_snds_B_khk_F", 3500, "item", "noDLC", "HIDDEN"],
    ["Supressor 7.62mm|Areia|", "muzzle_snds_B_snd_F", 3500, "item", "noDLC", "HIDDEN"],
	["Supressor 7.62mm|Árido|", "muzzle_snds_B_arid_F", 3500, "item", "noDLC", "HIDDEN"],
	["Supressor 7.62mm|Exuberante|", "muzzle_snds_B_lush_F", 3500, "item", "noDLC", "HIDDEN"],
    ["Supressor .338", "muzzle_snds_338_black", 5000, "item", "HIDDEN"],
	["Supressor .338|Verde|", "muzzle_snds_338_green", 5000, "item", "HIDDEN"],
	["Supressor .338|Areia|", "muzzle_snds_338_sand", 5000, "item", "HIDDEN"],
	["Supressor 9.3mm", "muzzle_snds_93mmg", 5000, "item", "HIDDEN"],
	["Supressor 9.3mm (Tan)", "muzzle_snds_93mmg_tan", 5000, "item", "HIDDEN"],
	["Bipé|Preto| (NATO)", "bipod_01_F_blk", 100, "item", "noDLC"],
	["Bipé|Preto| (CSAT)", "bipod_02_F_blk", 100, "item", "noDLC"],
	["Bipé|Preto| (AAF)", "bipod_03_F_blk", 100, "item", "noDLC"],
	["Bipé|Multicam|", "bipod_01_F_mtp", 100, "item", "noDLC"],
	["Bipé|Hex|", "bipod_02_F_hex", 100, "item", "noDLC"],
	["Bipé|Oliva|", "bipod_03_F_oli", 100, "item", "noDLC"],
	["Bipé|Areia|", "bipod_01_F_snd", 100, "item", "noDLC"],
	["Bipé|Bronze|", "bipod_02_F_tan", 100, "item", "noDLC"],
    ["Bipé|Khaki|", "bipod_01_F_khk", 100, "item", "noDLC"],
	["Bipé|Árido|", "bipod_02_F_arid", 100, "item", "noDLC"],
	["Bipé|Exuberante|", "bipod_02_F_lush", 100, "item", "noDLC"],
	["Lanterna|Fuzil|", "acc_flashlight", 25, "item"],
    ["Lanterna|Pistola|" ,"acc_flashlight_pistol", 25, "item"],
	["Laser Infravermelho", "acc_pointer_IR", 25, "item"],
	["Red Dot|Pistola Zubr|", "optic_Yorris", 25, "item"],
    ["Red Dot|Pistola 4-five|Areia|", "optic_MRD", 25, "item"],
    ["Red Dot|4-five|Preta|", "optic_MRD_black", 25, "item", "noDLC"],
	["ACO|Vermelha|", "optic_Aco", 150, "item"],
    ["ACO SMG|Vermelha|", "optic_aco_smg", 150, "item"],
	["ACO|verde|", "optic_Aco_grn", 150, "item"],
    ["ACO SMG|Verde|", "optic_ACO_grn_smg", 150, "item"],
    ["Mira Holográfica SMG", "optic_Holosight_smg", 75, "item"],
    ["Mira Holográfica SMG|Preta|", "optic_Holosight_smg_blk_F", 75, "item"],
    ["Mira Holográfica", "optic_Holosight", 75, "item"],
    ["Mira Holográfica|Preta", "optic_Holosight_blk_F", 75, "item", "noDLC"],
    ["Mira Holográfica|Khaki|", "optic_Holosight_khk_F", 75, "item", "noDLC"],
	["Mira Holográfica|Arid|", "optic_Holosight_arid_F", 75, "item"],
	["Mira Holográfica|Exuberante|", "optic_Holosight_lush_F", 75, "item"],
    ["Mira Modular|Promet", "optic_ico_01_f", 100, "item"],
    ["Mira Modular|Promet|Preto|", "optic_ico_01_black_f", 100, "item"],
    ["Mira Modular|Promet|Camuflado|", "optic_ico_01_camo_f", 100, "item"],
    ["Mira Modular|Promet|Areia|", "optic_ico_01_sand_f", 100, "item"],
    ["MRCO", "optic_MRCO", 600, "item"],
    ["ARCO", "optic_Arco", 650, "item"],
    ["ARCO|Preta|", "optic_Arco_blk_F", 650, "item", "noDLC"],
    ["ARCO|Verde Hex|", "optic_Arco_ghex_F", 650, "item", "noDLC"],
	["ARCO|Árido|", "optic_Arco_arid_F", 650, "item", "noDLC"],
	["ARCO|Exuberante|", "optic_Arco_lush_F", 650, "item", "noDLC"],
	["ARCO AK|Árido|", "optic_Arco_AK_arid_F", 650, "item", "noDLC"],
	["ARCO AK|Preto|", "optic_Arco_AK_blk_F", 650, "item", "noDLC"],
	["ARCO AK|Exuberante|", "optic_Arco_AK_lush_F", 650, "item", "noDLC"],
    ["RCO", "optic_Hamr", 650, "item"],
    ["RCO|Khaki|", "optic_Hamr_khk_F", 650, "item", "noDLC"],
    ["ERCO|Preta", "optic_ERCO_blk_F", 750, "item"],
    ["ERCO|Verde|", "optic_ERCO_khk_F", 750, "item"],
    ["ERCO|Areia|", "optic_ERCO_snd_F", 750, "item"],
    ["MOS", "optic_SOS", 1000, "item"],
    ["MOS|Khaki|", "optic_SOS_khk_F", 1000, "item", "noDLC"],
    ["DMS", "optic_DMS", 1200, "item"],
    ["DMS|Verde Hex|","optic_DMS_ghex_F", 1200, "item"],
	["DMS|Desgastada|","optic_DMS_weathered_F", 1200, "item"],
	["DMS Kir|Desgastada|","optic_DMS_weathered_Kir_F", 1200, "item"],
	["AMS", "optic_AMS", 1500, "item", "HIDDEN"],
	["AMS|Khaki|", "optic_AMS_khk", 1500, "item", "HIDDEN"],
	["AMS|Areia|", "optic_AMS_snd", 1500, "item", "HIDDEN"],
    ["Kahlia|Desgastada|", "optic_KHS_old", 900, "item"],
	["Kahlia|Preta|", "optic_KHS_blk", 1600, "item"],
	["Kahlia|Hex|", "optic_KHS_hex", 1600, "item"],
	["Kahlia|Bronze|", "optic_KHS_tan", 1600, "item"],
	["LRPS", "optic_LRPS", 2000, "item", "HIDDEN"],
	["LRPS|Verde Hex|", "optic_LRPS_ghex_F", 2000, "item", "noDLC", "HIDDEN"],
    ["LRPS|Tropical|", "optic_LRPS_tna_F", 2000, "item", "noDLC", "HIDDEN"],
	["Mira De Visão Noturna", "optic_NVS", 3000, "item"],
	["Mira De VIsão Térmica", "optic_tws", 5000, "item", "HIDDEN"], // To hide from store list, add "HIDDEN" after "item", like "item", "HIDDEN"]
	["Mira de Visão Térmica|MG|", "optic_tws_mg", 6000, "item", "HIDDEN"],
	["Nightstalker", "optic_Nightstalker", 3000, "item", "HIDDEN"]
];

// If commented, means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[
	["Aleatorios", "", 0, ""],
	["Bandagem Principal (Limpo)", "H_HeadBandage_clean_F", 5, "hat"],
    ["Bandagem Principal (Manchado)", "H_HeadBandage_stained_F", 5, "hat"],
    ["Bandagem Principal (Sangrento)", "H_HeadBandage_bloody_F", 5, "hat"],
    ["Fone de ouvido (Preto)", "H_HeadSet_black_F", 20, "hat"],
	["Capacete de Skate", "H_Helmet_Skate", 90, "hat"], // 14- exp 4
	["Capacete de Aluminio", "H_Hat_Tinfoil_F", 25, "hat"],
	["======================================================", "", 0, ""],

    ////Ba 13- exp 2
    ["Capacete de Obra", "", 0, ""],
    ["(Preto)", "H_Construction_basic_black_F", 50, "hat"],
    ["(Laranja)", "H_Construction_basic_orange_F", 50, "hat"],
    ["(Vermelho)", "H_Construction_basic_red_F", 50, "hat"],
    ["(Branco)", "H_Construction_basic_white_F", 50, "hat"],
    ["(Amarelo)", "H_Construction_basic_yellow_F", 50, "hat"],
	["======================================================", "", 0, ""],

	["Chapéu", "", 0, ""],
    ["Fedora (Azul)", "H_Hat_blue", 10, "hat"],
	["Fedora (Castanho)", "H_Hat_brown", 10, "hat"],
	["Fedora (Camuflado)", "H_Hat_camo", 10, "hat"],
	["Fedora (Checker)", "H_Hat_checker", 10, "hat"],
	["Fedora (Cinzento)", "H_Hat_grey", 10, "hat"],
	["Fedora (Tan)", "H_Hat_tan", 10, "hat"],
	["Chapéu de Palha", "H_StrawHat", 10, "hat"],
	["Chapéu de Palha (Sombrio)", "H_StrawHat_dark", 10, "hat"],
    ["Chapéu Safari (Oliva)", "H_Hat_Safari_olive_F", 20, "hat"],
    ["Chapéu Safari (Areia)", "H_Hat_Safari_sand_F", 20, "hat"],
	["======================================================", "", 0, ""],
	
    ["Boné", "", 0, ""],
	["(BI)", "H_Cap_grn_BI", 10, "hat"],
	["(Preto)", "H_Cap_blk", 10, "hat"],
	["(Azul)", "H_Cap_blu", 10, "hat"],
	["(CMMG)", "H_Cap_blk_CMMG", 10, "hat"],
	["(Verde)", "H_Cap_grn", 10, "hat"],
	["(ION)", "H_Cap_blk_ION", 10, "hat"],
	["(Oliva)", "H_Cap_oli", 10, "hat"],
	["(Oliva, Fone de Ouvido)", "H_Cap_oli_hs", 10, "hat"],
	["(Policial)", "H_Cap_police", 10, "hat"],
	["(Imprensa)", "H_Cap_press", 10, "hat"],
	["(Vermelho)", "H_Cap_red", 10, "hat"],
	["(Surfista)", "H_Cap_surfer", 10, "hat"],
	["(Tan)", "H_Cap_tan", 10, "hat"],
	["(UK)", "H_Cap_khaki_specops_UK", 10, "hat"],
	["(US Preto)", "H_Cap_usblack", 10, "hat"],
	["(US MTP)", "H_Cap_tan_specops_US", 10, "hat"],
	["(AAF)", "H_Cap_blk_Raven", 10, "hat"],
	["(OPFOR)", "H_Cap_brn_SPECOPS", 10, "hat"],
    ["(Branco, IDAP)", "H_Cap_White_IDAP_F", 10, "hat"],
    ["(Laranja, IDAP)", "H_Cap_Orange_IDAP_F", 10, "hat"],
    ["(Preto, IDAP)", "H_Cap_Black_IDAP_F", 10, "hat"],
	["Rangemaster", "H_Cap_headphones", 10, "hat"],
    ["======================================================", "", 0, ""],

    //Ba 14- exp 4
    ["Capacete de Corrida", "", 0, ""],
	["(Preto)", "H_RacingHelmet_1_black_F", 95, "hat"],
	["(Azul)", "H_RacingHelmet_1_blue_F", 95, "hat"],
	["(Verde)", "H_RacingHelmet_1_green_F", 95, "hat"],
	["(Amarelo)", "H_RacingHelmet_1_yellow_F", 95, "hat"],
	["(Laranja)", "H_RacingHelmet_1_orange_F", 95, "hat"],
	["(Vermelho)", "H_RacingHelmet_1_red_F", 95, "hat"],
	["(Branco)", "H_RacingHelmet_1_white_F", 95, "hat"],
	["(Fuel)", "H_RacingHelmet_1_F", 95, "hat"],
	["(Bluking)", "H_RacingHelmet_2_F", 95, "hat"],
	["(Redstone)", "H_RacingHelmet_3_F", 95, "hat"],
	["(Vrana)", "H_RacingHelmet_4_F", 95, "hat"],
	["======================================================", "", 0, ""],
    
    ["Bandana ", "", 0, ""],
	["(Surfista)", "H_Bandanna_surfer", 10, "hat"],
	["(Surfista, Preto)", "H_Bandanna_surfer_blk", 10, "hat"],
	["(Surfista, Verde)", "H_Bandanna_surfer_grn", 10, "hat"],
	["(Preto)", "H_Bandanna_gry", 10, "hat"],
	["(Azul)", "H_Bandanna_blu", 10, "hat"],
	["(Coiote)", "H_Bandanna_cbr", 10, "hat"],
	["(Fone de Ouvido)", "H_Bandanna_khk_hs", 10, "hat"],
	["(Cáqui)", "H_Bandanna_khk", 10, "hat"],
	["(MTP)", "H_Bandanna_mcamo", 10, "hat"],
	["(Sage)", "H_Bandanna_sgg", 10, "hat"],
	["(Areia)", "H_Bandanna_sand", 10, "hat"],
	["(Musgo)", "H_Bandanna_camo", 10, "hat"],
    ["======================================================", "", 0, ""],

    ["Toca", "", 0, ""],
    ["(Preto)", "H_Watchcap_blk", 25, "hat"],
	["(Coiote)", "H_Watchcap_cbr", 25, "hat"],
	["(Cáqui)", "H_Watchcap_khk", 25, "hat"],
	["(Verde)", "H_Watchcap_camo", 25, "hat"],

    ["Shemag", "", 0, ""],
    ["(Oliva)", "H_Shemag_olive", 25, "hat"],
	["(Oliva, Fone de Ouvido)", "H_Shemag_olive_hs", 25, "hat"],
	["(Tan)", "H_ShemagOpen_tan", 25, "hat"],
	["(Branco)", "H_ShemagOpen_khk", 25, "hat"],
	["======================================================", "", 0, ""],

    ["Chapéu de Selva", "", 0, ""],
    ["(Cáqui Fone de Ouvido)", "H_Booniehat_khk_hs", 10, "hat"],
	["(Cáqui)", "H_Booniehat_khk", 10, "hat"],
	["(Oliva)", "H_Booniehat_oli", 10, "hat"],
	["(Areia)", "H_Booniehat_tan", 10, "hat"],
	["(MTP)", "H_Booniehat_mcamo", 10, "hat"],
	["(Tropical)", "H_Booniehat_tna_F", 10, "hat"],
	["(AAF)", "H_Booniehat_dgtl", 10, "hat"],
	["(Verde)", "H_Booniehat_mgrn", 10, "hat"],
	["(Taiga)", "H_Booniehat_taiga", 10, "hat"],
	["(Musgo)", "H_Booniehat_wdl", 10, "hat"],
	["(LDF)", "H_Booniehat_eaf", 10, "hat"],
	["======================================================", "", 0, ""],

    ["Corbetura Militar", "", 0, ""],
	["(Azul)", "H_MilCap_blue", 25, "hat"],
	["(Gendarmerie)", "H_MilCap_gen_F", 25, "hat"],
	["(Cinzento)", "H_MilCap_gry", 25, "hat"],
	["(Verde Hex)", "H_MilCap_ghex_F", 25, "hat"],
	["(Hex)", "H_MilCap_ocamo", 25, "hat"],
	["(MTP)", "H_MilCap_mcamo", 25, "hat"],
	["(Tropical)", "H_MilCap_tna_F", 25, "hat"],
	["(AAF)", "H_MilCap_dgtl", 25, "hat"],
	["(Verde)", "H_MilCap_grn", 25, "hat"],
	["(Taiga)", "H_MilCap_taiga", 25, "hat"],
	["(Floresta)", "H_MilCap_wdl", 25, "hat"],
	["(LDF)", "H_MilCap_eaf", 25, "hat"],
	["======================================================", "", 0, ""],

    ["Boina", "", 0, ""],
	["(Black)", "H_Beret_blk", 50, "hat"],
	["(Gendarmerie)", "H_Beret_gen_F", 50, "hat"],
	["(Colonel)", "H_Beret_Colonel", 50, "hat"],
	["(NATO)", "H_Beret_02", 50, "hat"],
	["(LDF)", "H_Beret_EAF_01_F", 50, "hat"],
	["======================================================", "", 0, ""],

    //Ba 2- exp 4
	["Tripulação", "", 0, ""],
    ["(Preto)", "H_Tank_black_F", 100, "hat"],
	["(Soft)", "H_Tank_eaf_F", 100, "hat"],

    //Ba 14- exp 4
	["proteção nivel 1", "", 0, ""],
	["Capacete Leve ECH (Areia)", "H_HelmetB_light_sand", 250, "hat"],
	["Capacete Leve ECH (Preto)", "H_HelmetB_light_black", 250, "hat"],
	["Capacete Leve ECH (Deserto)", "H_HelmetB_light_desert", 250, "hat"],
	["Capacete Leve ECH (Pele de Cobra)", "H_HelmetB_light_snakeskin", 250, "hat"],
	["Capacete Leve ECH (Relva)", "H_HelmetB_light_grass", 250, "hat"],
	["Capacete Leve ECH (Tropical)", "H_HelmetB_Light_tna_F", 250, "hat"],
	["Capacete Leve (Floresta)", "H_HelmetB_light_wdl", 250, "hat"],
	["======================================================", "", 0, ""],

	//Ba 15- exp 6
	["proteção nivel 2", "", 0, ""],
	["Basico (Preto)", "H_PASGT_basic_black_F", 350, "hat"],
    ["Basico (Azul)", "H_PASGT_basic_blue_F", 350, "hat"],
    ["Basico (Azul, Relva)", "H_PASGT_basic_blue_press_F", 350, "hat"],
	["Basico (Oliva)", "H_PASGT_basic_olive_F", 350, "hat"],
    ["Basico (Branco)", "H_PASGT_basic_white_F", 350, "hat"],
	["Capacete (Padrão)", "H_HelmetB", 350, "hat"],
	["Capacete (Camuflado)", "H_HelmetB_camo", 350, "hat"],
	["Capacete (Areia)", "H_HelmetB_sand", 350, "hat"],
	["Capacete (Preto)", "H_HelmetB_black", 350, "hat"],
	["Capacete (Deserto)", "H_HelmetB_desert", 350, "hat"],
	["Capacete (Relva)", "H_HelmetB_grass", 350, "hat"],
	["Capacete (Pele de Cobra)", "H_HelmetB_snakeskin", 350, "hat"],
	["Capacete (Tropical)", "H_HelmetB_tna_F", 350, "hat"],
	["Capacete Furtivo ", "H_HelmetB_TI_tna_F", 350, "hat"],
	["Capacete Leve ECH", "H_HelmetB_light", 350, "hat"],
	["Capacete Modular", "H_HelmetHBK_headset_F", 350, "hat"],
	["Capacete Modular (Oliva)", "H_HelmetHBK_F", 350, "hat"],
	["Capacete de Combate (Floresta)", "H_HelmetB_plain_wdl", 350, "hat"],
	["MICH", "H_HelmetIA", 350, "hat"],
	["Tripulação de Helicóptero", "H_CrewHelmetHeli_B", 350, "hat"],
	["Tripulação de Helicóptero (CSAT)", "H_CrewHelmetHeli_O", 350, "hat"],
	["Tripulação de Helicóptero (AAF)", "H_CrewHelmetHeli_I", 350, "hat"],
	["Tripulação Helicóptero (LDF)", "H_CrewHelmetHeli_I_E", 350, "hat"],
	["Tripulação de Helicóptero (NATO)", "H_PilotHelmetHeli_B", 350, "hat"],
	["Tripulação de Helicóptero (CSAT)", "H_PilotHelmetHeli_O", 350, "hat"],
	["Tripulação de Helicóptero (AAF)", "H_PilotHelmetHeli_I", 350, "hat"],
	["Helicóptero Piloto (LDF)", "H_PilotHelmetHeli_I_E", 350, "hat"],
	["======================================================", "", 0, ""],

	//Ba 15- exp 7
	["proteção nivel 3", "", 0, ""],
    ["Capacete Modular (Chops)", "H_HelmetHBK_chops_F", 400, "hat"],
	["Capacete Modular (Protetor de Ouvido)", "H_HelmetHBK_ear_F", 400, "hat"],
	["======================================================", "", 0, ""],

	//Ba 15- exp 8
	["proteção nivel 4", "", 0, ""],
    ["Basico (Azul, Relva, Pescoço)", "H_PASGT_neckprot_blue_press_F", 500, "hat"],
	["Balistico  (Verde Hex)", "H_HelmetO_ghex_F", 500, "hat"],
	["Balistico  (Hex)", "H_HelmetO_ocamo", 500, "hat"],
	["Balistico  (Urbano)", "H_HelmetO_oucamo", 500, "hat"],
	["Tripulação", "H_HelmetCrew_B", 500, "hat"],
	["Tripulação (Hex)", "H_HelmetCrew_O", 500, "hat"],
	["Tripulação (Verde Hex)", "H_HelmetCrew_O_ghex_F", 500, "hat"],
	["Tripulação", "H_HelmetCrew_I", 500, "hat"],
	["Piloto (NATO)", "H_PilotHelmetFighter_B", 1000, "hat"],
	["Piloto Helmet (CSAT)", "H_PilotHelmetFighter_O", 1000, "hat"], //capacete OPFOR
	["Piloto (AAF)", "H_PilotHelmetFighter_I", 1000, "hat"],
	["Pilot (LDF)", "H_PilotHelmetFighter_I_E", 1000, "hat"],
	["======================================================", "", 0, ""],

	//Ba 16- exp 10
	["proteção nivel 5", "", 0, ""],
	["Balistico ", "H_HelmetSpecB", 600, "hat"],
	["Balistico (Areia)", "H_HelmetSpecB_sand", 600, "hat"],
	["Balistico (Preto)", "H_HelmetSpecB_blk", 600, "hat"],
	["Balistico (Deserto)", "H_HelmetSpecB_paint2", 600, "hat"],
	["Balistico (Relva)", "H_HelmetSpecB_paint1", 600, "hat"],
	["Balistico (Pele de cobra)", "H_HelmetSpecB_snakeskin", 600, "hat"],
	["Balistico (Tropico)", "H_HelmetB_Enh_tna_F", 600, "hat"],
	["Balistico  ASS (Preto)", "H_HelmetSpecO_blk", 600, "hat"],
	["Balistico  ASS (Verde Hex)", "H_HelmetSpecO_ghex_F", 600, "hat"],
	["Balistico  ASS (Hex)", "H_HelmetSpecO_ocamo", 600, "hat"],
	["Capacete Vingador", "H_HelmetAggressor_F", 600, "hat"],
	["Capacete Vingador (Coberto B)", "H_HelmetAggressor_cover_F", 600, "hat"],
	["Capacete Vingador (Coberto T)", "H_HelmetAggressor_cover_taiga_F", 600, "hat"],
	["Capacete Melhorado (Floresta)", "H_HelmetSpecB_wdl", 600, "hat"],
	["======================================================", "", 0, ""],

    //Ba 17- exp 12
	["proteção nivel 6", "", 0, ""],
	["Defender (Verde Hex)", "H_HelmetLeaderO_ghex_F", 1000, "hat"],
	["Defender (Hex)", "H_HelmetLeaderO_ocamo", 1000, "hat"],
	["Defender (Urbano)", "H_HelmetLeaderO_oucamo", 1000, "hat"],
	["Spetsnaz (Verde Hex)", "H_HelmetO_ViperSP_ghex_F", 1500, "hat", "HIDDEN"],
	["Spetsnaz (Hex)", "H_HelmetO_ViperSP_hex_F", 1500, "hat", "HIDDEN"]	
];

goggArray = compileFinal str
[
	["Óculos de Visão Noturna", "", 0, ""],
	["(Castanho)", "NVGoggles", 250, "nvg"],
	["(Preto)", "NVGoggles_OPFOR", 250, "nvg"],
	["(Verde)", "NVGoggles_INDEP", 250, "nvg"],
    ["(Tropical)", "NVGoggles_tna_F", 250, "nvg", "noDLC"],
	["------------------------------------------------------------------------", "", 0, ""],
    ["compacto (Verde Hex)", "O_NVGoggles_ghex_F", 250, "nvg", "noDLC"],
    ["compacto (Hex)", "O_NVGoggles_hex_F", 250, "nvg", "noDLC"],
    ["compacto (Urbano)", "O_NVGoggles_urb_F", 250, "nvg", "noDLC"],
    ["compacto (Verde)", "O_NVGoggles_grn_F", 250, "nvg", "noDLC"],
    ["ENVG (Preto)", "NVGogglesB_blk_F", 350, "nvg"],         // With Termal
    ["ENVG (Verde)", "NVGogglesB_grn_F", 350, "nvg"],         // With Termal
    ["ENVG (Cinzento)", "NVGogglesB_gry_F", 350, "nvg"],      // With Termal
	["======================================================", "", 0, ""],

	["Óculos", "", 0, ""],
	["Óculos Mergulho", "G_Diving", 100, "gogg"],
	["Óculos Táticos", "G_Tactical_Clear", 25, "gogg"],
    ["Óculos Táticos", "G_Tactical_Black", 25, "gogg"],
	["Óculos de Combate (Tan)", "G_Combat", 50, "gogg"],
    ["Óculos de Combate (Verde)", "G_Combat_Goggles_tna_F", 50, "gogg", "noDLC"],
    ["Óculos de Piloto", "G_Aviator", 25, "gogg"],
    ["Óculos", "G_Lady_Blue", 25, "gogg"],
	["Ladies Shades (Fire)", "G_Lady_Red", 10, "gogg"],
    ["Óculos de Proteção", "G_Lowprofile", 25, "gogg"],
	["Ladies Shades (Iridium)", "G_Lady_Mirror", 10, "gogg"],
	["Ladies Shades (Sea)", "G_Lady_Dark", 10, "gogg"],
	["Sport Shades (Fire)", "G_Sport_Red", 10, "gogg"],
	["Sport Shades (Poison)", "G_Sport_Blackyellow", 10, "gogg"],
	["Sport Shades (Shadow)", "G_Sport_BlackWhite", 10, "gogg"],
	["Sport Shades (Style)", "G_Sport_Checkered", 10, "gogg"],
	["Sport Shades (Vulcan)", "G_Sport_Blackred", 10, "gogg"],
	["Sport Shades (Yetti)", "G_Sport_Greenblack", 10, "gogg"],
    ["Square Shades", "G_Squares_Tinted", 10, "gogg"],
	["Square Spectacles", "G_Squares", 10, "gogg"],
	["Óculos", "G_Spectacles_Tinted", 25, "gogg"],
	["Spectacle Glasses", "G_Spectacles", 10, "gogg"],
	["Óculos de Segurança", "G_EyeProtectors_F", 25, "gogg"],
    ["Óculos de Segurança (Armação)", "G_EyeProtectors_Earpiece_F", 25, "gogg"],
	
    ["Balaclava", "", 0, ""],
	["(Preto)", "G_Balaclava_blk", 25, "gogg"],
	["(Oliva)", "G_Balaclava_oli", 25, "gogg"],
	["(Low Profile G)", "G_Balaclava_lowprofile", 25, "gogg"],
	["(Combate)", "G_Balaclava_combat", 25, "gogg"],
    ["Furtiva (Preto)", "G_Balaclava_TI_blk_F", 75, "gogg"],
    ["Furtiva II (Preto)", "G_Balaclava_TI_G_blk_F", 75, "gogg"],
    ["Furtiva (Verde)", "G_Balaclava_TI_tna_F", 75, "gogg"],
    ["Furtiva II (Verde)", "G_Balaclava_TI_G_tna_F", 75, "gogg"],
	["======================================================", "", 0, ""],

    ["Bandanna", "", 0, ""],
	["(Aviador)", "G_Bandanna_aviator", 25, "gogg"],
	["(Óculos)", "G_Bandanna_shades", 25, "gogg"],
	["(Besta)", "G_Bandanna_beast", 25, "gogg"],
	["(Preto)", "G_Bandanna_blk", 25, "gogg"],
	["(Cáque)", "G_Bandanna_khk", 25, "gogg"],
	["(Oliva)", "G_Bandanna_oli", 25, "gogg"],
	["(Tan)", "G_Bandanna_tan", 25, "gogg"],
	["======================================================", "", 0, ""],

	["VARIADOS", "", 0, ""],
	["Fone de Ouvido sem Fio", "G_WirelessEarpiece_F", 25, "gogg"],
	["Respirador (Azul)", "G_Respirator_blue_F", 25, "gogg"],
	["Respirador (Branco)", "G_Respirator_white_F", 25, "gogg"],
    ["Respirador (Amarelo)", "G_Respirator_yellow_F", 25, "gogg"],
	["Venda para Olho (Preto)", "G_Blindfold_01_black_F", 25, "gogg", "noDLC"],
	["Venda para Olho (Branco)", "G_Blindfold_01_white_F", 25, "gogg", "noDLC"],
	["======================================================", "", 0, ""],

    ["Máscara de Gás", "", 0, ""],
	["(Preto)", "G_AirPurifyingRespirator_02_black_F", 500, "gogg", "noDLC"],
	["(Oliva)", "G_AirPurifyingRespirator_02_olive_F", 500, "gogg", "noDLC"],
	["(Areia)", "G_AirPurifyingRespirator_02_sand_F", 500, "gogg", "noDLC"],
	["------------------------------------------------------------------------", "", 0, ""],
	["Máscara de Gás", "G_RegulatorMask_F", 500, "gogg", "noDLC"],
	["Máscara de Gás", "G_AirPurifyingRespirator_01_F", 500, "gogg", "noDLC"]	
];

uniformArray = compileFinal str
[
	["UNICOS", "", 0, ""],
	["------------------------------------------------------------------------", "", 0, ""],
	["TRAJE DE MERGULHO", "", 0, ""],
	["(NATO)", "U_B_Wetsuit", 500, "uni"],					  //Blufor
	["(CSAT)", "U_O_Wetsuit", 500, "uni"],
	["(AAF)", "U_I_Wetsuit", 500, "uni"],
    ["------------------------------------------------------------------------", "", 0, ""],
	["Traje Ghillie Incompleto", "", 0, ""],
    ["(NATO)", "U_B_GhillieSuit", 1000, "uni"],				  
	["(CSAT)", "U_O_GhillieSuit", 1000, "uni"],
	["(AAF)", "U_I_GhillieSuit", 1000, "uni"],
    ["(Jungle) (NATO)", "U_B_T_Sniper_F", 1000, "uni"],
    ["(Jungle) (CSAT)", "U_O_T_Sniper_F", 1000, "uni"],
	["------------------------------------------------------------------------", "", 0, ""],
	["PADRAO", "", 0, ""],
	["Uniforme Meia Manga (Digital)", "U_I_CombatUniform_shortsleeve", 100, "uni"],     
	["(NATO)", "U_B_CombatUniform_mcam", 100, "uni"],
	["(CSAT)", "U_O_officer_noInsignia_hex_F", 100, "uni", "noDLC"],
	["(AAF)", "U_I_CombatUniform", 100, "uni"],
    ["------------------------------------------------------------------------", "", 0, ""],
	["Macacão de Piloto", "", 0, ""],
	["(NATO)", "U_B_PilotCoveralls", 100, "uni"],				//Blufor
	["(CSAT)", "U_O_PilotCoveralls", 100, "uni"],
	["(AAF)", "U_I_pilotCoveralls", 100, "uni"],
	["------------------------------------------------------------------------", "", 0, ""],
    ["Macacão Helicóptero", "", 0, ""],
	["(NATO)", "U_B_HeliPilotCoveralls", 100, "uni"],
	["(AAF)", "U_I_HeliPilotCoveralls", 100, "uni"],
	["(LDF)", "U_I_E_Uniform_01_coveralls_F", 100, "uni"],
	["======================================================", "", 0, ""],

    ["Traje de Combate", "", 0, ""],
	["(Oficial)", "U_I_E_Uniform_01_officer_F", 100, "uni"],
	["(Manga Dobrada)", "U_I_E_Uniform_01_shortsleeve_F", 100, "uni"],
	["(Suéter)", "U_I_E_Uniform_01_sweater_F", 100, "uni"],
	["(Regata)", "U_I_E_Uniform_01_tanktop_F", 100, "uni"],
	["(Floresta)", "U_B_CombatUniform_mcam_wdl_F", 100, "uni"],
	["(Floresta, Tee)", "U_B_CombatUniform_tshirt_mcam_wdl_F", 100, "uni"],
	["(Floresta)", "U_B_CombatUniform_mcam_wdl_F", 100, "uni"],
	["(WLDF)", "U_I_E_Uniform_01_F", 100, "uni"],
	["(Jaqueta)", "U_I_L_Uniform_01_camo_F", 100, "uni"],
	["(T-Shirt)", "U_I_L_Uniform_01_deserter_F", 100, "uni"],
	["Furitvo CTRG", "U_B_CTRG_Soldier_F", 200, "uni"],
	["======================================================", "", 0, ""],

    ["Traje CBRN", "", 0, ""],
	["(MTP)", "U_B_CBRN_Suit_01_MTP_F", 300, "uni"],
	["(Tropical)", "U_B_CBRN_Suit_01_Tropic_F", 300, "uni"],
	["(Floresta)", "U_B_CBRN_Suit_01_Wdl_F", 300, "uni"],
	["(AAF)", "U_I_CBRN_Suit_01_AAF_F", 300, "uni"],
	["(LDF)", "U_I_E_CBRN_Suit_01_EAF_F", 300, "uni"],
	["======================================================", "", 0, ""],

    ["VARIADOS", "", 0, ""],
	["Syndikat Uniform", "U_I_C_Soldier_Camo_F", 100, "uni"],
	["Uniforme de Oficial (Hex)", "U_O_OfficerUniform_ocamo", 100, "uni"],
	["Uniforme de Oficial (Digital)", "U_I_OfficerUniform", 100, "uni"],
    ["Vestuário de Guerrilha", "U_BG_Guerilla1_1", 100, "uni"],                    // BLUFOR
	["Roupa Guerrilha (Plainador, Escuro)", "U_BG_Guerilla2_1", 100, "uni"],
	["Roupa Guerrilha (Xadres)", "U_BG_Guerilla2_2", 100, "uni"],
	["Roupa Guerrilha (Plainador, Leve)", "U_BG_Guerilla2_3", 100, "uni"],
	["Guerrilha Smocks", "U_BG_Guerilla3_1", 100, "uni"],
    ["Guerrilha Smocks 2", "U_BG_Guerilla3_2", 100, "uni"],
	["Guerrilha Apparel", "U_BG_Guerrilla_6_1", 100, "uni"],
	["Uniforme de Guerrilha", "U_BG_leader", 100, "uni"],
	["Uniforme Furtivo CTRG", "U_B_CTRG_Soldier_F", 200, "uni"],
	["======================================================", "", 0, ""],

	["EXCLUSIVO INDEPENDENTE", "", 0, ""],
    ["Traje Paramilitar", "", 0, ""],
    ["(Jaqueta)", "U_I_C_Soldier_Para_2_F", 100, "uni"],
    ["(Manga Curta)", "U_I_C_Soldier_Para_3_F", 100, "uni"],
    ["(Meia Manga)", "U_I_C_Soldier_Para_5_F", 100, "uni"],
    ["(Regata)", "U_I_C_Soldier_Para_4_F", 100, "uni"],
    ["(Shemag)", "U_I_C_Soldier_Para_1_F", 100, "uni"],
	["------------------------------------------------------------------------", "", 0, ""],
	["Guerrilha", "", 0, ""],
    ["Garment", "U_OG_Guerilla1_1", 100, "uni"],                
	["(Plain, Dark)", "U_OG_Guerilla2_1", 100, "uni"],
	["(Pattern)", "U_OG_Guerilla2_2", 100, "uni"],
	["(Plain, Light)", "U_OG_Guerilla2_3", 100, "uni"],
	["Smocks", "U_OG_Guerilla3_1", 100, "uni"],
    ["Smocks 2", "U_OG_Guerilla3_2", 100, "uni"],
	["Apparel", "U_OG_Guerrilla_6_1", 100, "uni"],
	["Uniform", "U_OG_leader", 100, "uni"],
	["Macacão de Tanque", "U_Tank_green_F", 100, "uni"],
	["Vestuário de Guerrilha", "U_IG_Guerilla1_1", 100, "uni"],                   
	["Roupa Guerrilha (Plainador, Escuro)", "U_IG_Guerilla2_1", 100, "uni"],
	["Roupa Guerrilha (Xadres)", "U_IG_Guerilla2_2", 100, "uni"],
	["Roupa Guerrilha (Plainador, Leve)", "U_IG_Guerilla2_3", 100, "uni"],
	["Guerilla Smocks", "U_IG_Guerilla3_1", 100, "uni"],
    ["Guerilla Smocks 2", "U_IG_Guerilla3_2", 100, "uni"],
	["Guerilla Apparel", "U_IG_Guerrilla_6_1", 100, "uni"],
	["Uniforme de guerrilha", "U_IG_leader", 100, "uni"]
];

vestArray = compileFinal str
[
    //Rebreather
	["RESPIRADOR", "", 0, ""],
	["Respirador (AAF)", "V_RebreatherIA", 1000, "vest"],
	["======================================================", "", 0, ""],
    
    //No Protection, No Space
	["Sem proteção, sem espaço", "", 0, ""],
    ["Colete de Segurança (Amarelo)", "V_Safety_yellow_F", 50, "vest", "noDLC"],
    ["Colete de Segurança (Laranja)", "V_Safety_orange_F", 50, "vest", "noDLC"],
    ["Colete de Segurança (Azul)", "V_Safety_blue_F", 50, "vest", "noDLC"],
    ["Colete de Identificação (Médico)", "V_Plain_crystal_F", 50, "vest", "noDLC"],
    ["Colete de Identificação (IDAP)", "V_Plain_medical_F", 50, "vest", "noDLC"],
	["======================================================", "", 0, ""],
    
    //No Protection, but with some space
	["Sem proteção, mas com algum espaço", "", 0, ""],
    ["Cinto de Lider", "V_Rangemaster_belt", 20, "vest"],
    ["Colete Mutibolso (Preto)", "V_Pocketed_black_F", 50, "vest", "noDLC"],
    ["Colete Mutibolso (Coiote)", "V_Pocketed_coyote_F", 50, "vest", "noDLC"],
    ["Colete Mutibolso (Verde Oliva)", "V_Pocketed_olive_F", 50, "vest", "noDLC"],
	["Bolsa de Perna (Preto)", "V_LegStrapBag_black_F", 130, "vest", "noDLC"],
    ["Bolsa de Perna (Coiote)", "V_LegStrapBag_coyote_F", 130, "vest", "noDLC"],
    ["Bolsa de Perna (Verde Oliva)", "V_LegStrapBag_olive_F", 130, "vest", "noDLC"],
    ["Bandoleira Vertica (Preto)", "V_BandollierB_blk", 100, "vest"],
	["Bandoleira Vertica (Coiote)", "V_BandollierB_cbr", 100, "vest"],
	["Bandoleira Vertica (Verde)", "V_BandollierB_rgr", 100, "vest"],
	["Bandoleira Vertica (Cáqui)", "V_BandollierB_khk", 100, "vest"],
	["Bandoleira Vertica (Verde Oliva)", "V_BandollierB_oli", 100, "vest"],
    ["Bandoleira Vertica (Verde Hex)", "V_BandollierB_ghex_F", 100, "vest"],
    ["Cinto Granadeiro LBV (Castanho)", "V_HarnessOGL_brn", 150, "vest"],                 
	["Cinto Granadeiro LBV (Cinzento)", "V_HarnessOGL_gry", 150, "vest"],                 
    ["Cinto Granadeiro LBV (Verde Hex)", "V_HarnessOGL_ghex_F", 150, "vest"],             
    ["Suporte Peitoral (Cáqui)", "V_Chestrig_khk", 100, "vest"],                          
	["Suporte Peitoral (Verde)", "V_Chestrig_rgr", 100, "vest"],                          
	["Suporte Peitoral (Preto)", "V_Chestrig_blk", 100, "vest"],                          
	["Suporte Peitoral (Verde Oliva)", "V_Chestrig_oli", 100, "vest"],                    
    ["Suporte Peitoral Tático (Coiote)", "V_TacChestrig_cbr_F", 100, "vest"],             
    ["Suporte Peitoral Tático (Verde)", "V_TacChestrig_grn_F", 100, "vest"],              
    ["Suporte Peitoral Tático (Verde Oliva)", "V_TacChestrig_oli_F", 100, "vest"],        
    ["Cinto de Carga (Castanho)", "V_HarnessO_brn", 100, "vest"],                         
	["Cinto de Carga (Cinzento)", "V_HarnessO_gry", 100, "vest"],                         
    ["Cinto de Carga (Verde Hex)", "V_HarnessO_ghex_F", 100, "vest"],                     
    ["Traje Kipchak", "V_SmershVest_01_F", 150, "vest", "noDLC"],                         
	["Traje Kipchak (Tático Rádio)", "V_SmershVest_01_radio_F", 150, "vest", "noDLC"],    	
	["======================================================", "", 0, ""],
    
    //Small Protection
	["Pequena proteção", "", 0, ""],
    ["Colete Tático (Preto)", "V_TacVest_blk", 250, "vest"],                                               //CA-100 BA-15 EX-8
	["Colete Tático (Castanho)", "V_TacVest_brn", 250, "vest"],                                            //CA-100 BA-15 EX-8
	["Colete Tático (Camuflado)", "V_TacVest_camo", 250, "vest"],                                          //CA-100 BA-15 EX-8
	["Colete Tático (Cáqui)", "V_TacVest_khk", 250, "vest"],                                               //CA-100 BA-15 EX-8
	["Colete Tático (Verde Oliva)", "V_TacVest_oli", 250, "vest"],                                         //CA-100 BA-15 EX-8
    ["Colete Tático (Slavrou)", "V_I_G_resistanceLeader_F", 250, "vest"],                                  //CA-100 BA-15 EX-8
	["Colete Raven", "V_TacVestIR_blk", 225, "vest"],                                                      //CA-140 BA-15 EX-8
    ["Colete Imprensa", "V_Press_F", 275, "vest"],                                                         //CA-40 BA-26 EX-12
    ["Traje Equipe Plataforma (Azul)", "V_DeckCrew_blue_F", 275, "vest", "noDLC"],                         //CA-50 BA-26 EX-12
    ["Traje Equipe Plataforma (Verde)", "V_DeckCrew_green_F", 275, "vest", "noDLC"],                       //CA-50 BA-26 EX-12
    ["Traje Equipe Plataforma (Amarelo)", "V_DeckCrew_yellow_F", 275, "vest", "noDLC"],                    //CA-50 BA-26 EX-12
    ["Traje Equipe Plataforma (Vermelho)", "V_DeckCrew_red_F", 275, "vest", "noDLC"],                      //CA-50 BA-26 EX-12
    ["Traje Equipe Plataforma (Castanho)", "V_DeckCrew_brown_F", 275, "vest", "noDLC"],                    //CA-50 BA-26 EX-12
    ["Traje Equipe Plataforma (Violeta)", "V_DeckCrew_violet_F", 275, "vest", "noDLC"],                    //CA-50 BA-26 EX-12
    ["Traje Equipe Plataforma (Branco)", "V_DeckCrew_white_F", 275, "vest", "noDLC"],                      //CA-50 BA-26 EX-12
	["Colete Tático (Policial)", "V_TacVest_blk_POLICE", 300, "vest"],                                     //CA-100 BA-26 EX-12
    ["Colete Tático (Gendarmerie)", "V_TacVest_gen_F", 300, "vest"],                                       //CA-100 BA-26 EX-12
	["======================================================", "", 0, ""],
    
    //Mid Protection
	["Proteção Média", "", 0, ""],
	["Colete Modular Pesado (Geometrico)", "V_CarrierRigKBT_01_EAF_F", 500, "vest", "noDLC"],              //CA-60 BA-40 EX-16
	["Colete Modular Pesado (Oliva)", "V_CarrierRigKBT_01_Olive_F", 500, "vest", "noDLC"],                 //CA-60 BA-40 EX-16
	["Colete Leve GA (Digital)", "V_PlateCarrierIA1_dgtl", 500, "vest"],                                   //CA-120 BA-40 EX-16
	["Colete Pesado GA (Digital)", "V_PlateCarrierIA2_dgtl", 800, "vest"],                                 //CA-120 BA-40 EX-16
    ["Colete Modular Leve (LDF)", "V_CarrierRigKBT_01_light_EAF_F", 500, "vest"],                          //CA-130 BA-40 EX-16
    ["Colete Modular Leve (Oliva)", "V_CarrierRigKBT_01_light_Olive_F", 500, "vest"],                      //CA-130 BA-40 EX-16
    ["Colete Modular Leve (Geométrico)", "V_CarrierRigKBT_01_light_EAF_F", 500, "vest", "noDLC"],          //CA-130 BA-40 EX-16
	["Colete Modular Leve (Oliva)", "V_CarrierRigKBT_01_light_Olive_F", 500, "vest", "noDLC"],             //CA-130 BA-40 EX-16
	["Colete Balistíco Leve (Verde, Bandeira USA)", "V_PlateCarrier1_rgr", 500, "vest"],                   //CA-140 BA-40 EX-16
	["Colete Balistíco Leve (Verde, Sem Bandeira)", "V_PlateCarrier1_rgr_noflag_F", 500, "vest"],          //CA-140 BA-40 EX-16
	["Colete Balistíco Leve (Preto, Sem Bandeira)", "V_PlateCarrier1_blk", 500, "vest"],                   //CA-140 BA-40 EX-16
	["Colete Balistíco Leve (CTRG, Bandeira UK)", "V_PlateCarrierL_CTRG", 500, "vest"],                    //CA-140 BA-40 EX-16
    ["Colete Balistíco Leve (Tropical, Bandeira USA)", "V_PlateCarrier1_tna_F", 500, "vest", "noDLC"],     //CA-140 BA-40 EX-16
    ["Colete Balistíco Leve (Floresta, Sem Bandeira)", "V_PlateCarrier1_wdl", 500, "vest", "noDLC"],       //CA-140 BA-40 EX-16
	["======================================================", "", 0, ""],
    
    //Heavy Protection
	["Proteção Pesada", "", 0, ""],
	["Colete Balistíco (Verde, Bandeira USA)", "V_PlateCarrier2_rgr", 1000, "vest"],                      //CA-140 BA-58 EX-20
	["Colete Balistíco (Verde, Sem Bandeira)", "V_PlateCarrier2_rgr_noflag_F", 1000, "vest"],             //CA-140 BA-58 EX-20
	["Colete Balistíco (Preto, Sem Bandeira)", "V_PlateCarrier2_blk", 1000, "vest"],                      //CA-140 BA-58 EX-20
	["Colete Balistíco (CTRG, Bandeira UK)", "V_PlateCarrierH_CTRG", 1000, "vest"],                       //CA-140 BA-58 EX-20
    ["Colete Balistíco (Tropical, Bandeira USA)", "V_PlateCarrier2_tna_F", 1000, "vest", "noDLC"],        //CA-140 BA-58 EX-20
    ["Colete Balistíco (Floresta, Sem Bandeira)", "V_PlateCarrier2_wdl", 1000, "vest", "noDLC"],          //CA-140 BA-58 EX-20
	["======================================================", "", 0, ""],

	//Balistic Protection - IMBA Vest
	//["Proteção Balística", "", 0, ""],
	["Colete Especial Pesado (Verde)", "V_PlateCarrierSpec_rgr", 5000, "vest", "HIDDEN"],                            //CA-100 BA-81 EX-24
	["Colete Especial Pesado (Preto)", "V_PlateCarrierSpec_blk", 5000, "vest", "HIDDEN"],                            //CA-100 BA-81 EX-24
	["Colete Especial Pesado (MTP)", "V_PlateCarrierSpec_mtp", 5000, "vest", "HIDDEN"],                              //CA-100 BA-81 EX-24
    ["Colete Especial Pesado (Tropical)", "V_PlateCarrierSpec_tna_F", 5000, "vest", "noDLC", "HIDDEN"],              //CA-100 BA-81 EX-24
	["Colete Especial Pesado (Floresta)", "V_PlateCarrierSpec_wdl", 5000, "vest", "noDLC", "HIDDEN"],                //CA-100 BA-81 EX-24
    //["======================================================", "", 0, ""],

    //Explosive Resistant - IMBA Vest  //CA-30 BA-32 EX-78
	["Resistente a Explosivos ", "", 0, ""],
    ["Colete Modular LG Pesado (LDF)", "V_CarrierRigKBT_01_heavy_EAF_F", 4000, "vest"],                    //CA-130 BA-32 EX-16
    ["Colete Modular LG Pesado (Oliva)", "V_CarrierRigKBT_01_heavy_Olive_F", 4000, "vest"],                //CA-130 BA-32 EX-16
	["Colete EOD (Azul)", "V_EOD_blue_F", 3000, "vest", "noDLC"],                                          //CA-30 BA-32 EX-78
    ["Colete EOD (Azul, IDAP)", "V_EOD_IDAP_blue_F", 3000, "vest", "noDLC"],                               //CA-30 BA-32 EX-78
    ["Colete EOD (Coiote)", "V_EOD_coyote_F", 3000, "vest", "noDLC"],                                      //CA-30 BA-32 EX-78
    ["Colete EOD (Oliva)", "V_EOD_olive_F", 3000, "vest", "noDLC"],                                        //CA-30 BA-32 EX-78
	["GA Colete LG Pesado (Digital)", "V_PlateCarrierIAGL_dgtl", 3500, "vest"],                            //CA-120 BA-32 EX-78
	["GA Colete LG Pesado (Oliva)", "V_PlateCarrierIAGL_oli", 3500, "vest"],                               //CA-120 BA-32 EX-78
	["Colete LG Pesado (Verde)", "V_PlateCarrierGL_rgr", 4000, "vest"],                                    //CA-140 BA-32 EX-78
	["Colete LG Pesado (Preto)", "V_PlateCarrierGL_blk", 4000, "vest"],                                    //CA-140 BA-32 EX-78
	["Colete LG Pesado (MTP)", "V_PlateCarrierGL_mtp", 4000, "vest"],                                      //CA-140 BA-32 EX-78
    ["Colete LG Pesado (Tropical)", "V_PlateCarrierGL_tna_F", 4000, "vest", "noDLC"],                      //CA-140 BA-32 EX-16
    ["Colete LG Pesado (Floresta)", "V_PlateCarrierGL_wdl", 4000, "vest", "noDLC"]                         //CA-140 BA-32 EX-16
];

backpackArray = compileFinal str
[
	["VARIADOS", "", 0, ""],
	["Paraquedas", "B_Parachute", 50, "backpack"],
	["Equipamento Respiratório Autônomo", "B_SCBA_01_F", 25, "backpack", "noDLC"],
	["Respirador Avançado", "B_CombinationUnitRespirator_01_F", 50, "backpack", "noDLC"],    
	["======================================================", "", 0, ""], 

    ["Bolsa de Perna", "", 0, ""],
	["(Preto)", "B_LegStrapBag_black_F", 200, "vest", "noDLC"],             
    ["(Coiote)", "B_LegStrapBag_coyote_F", 200, "vest", "noDLC"],           
    ["(Oliva)", "B_LegStrapBag_olive_F", 200, "vest", "noDLC"],  
	["======================================================", "", 0, ""],

    ["Mochila de Rádio", "", 0, ""],
	["(Preto)", "B_RadioBag_01_black_F", 200, "backpack", "noDLC"],        
	["(Digital)", "B_RadioBag_01_digi_F", 200, "backpack", "noDLC"],
	["(Geometrico)", "B_RadioBag_01_eaf_F", 200, "backpack", "noDLC"],
	["(Verde Hex)", "B_RadioBag_01_ghex_F", 200, "backpack", "noDLC"],
	["(Hex)", "B_RadioBag_01_hex_F", 200, "backpack", "noDLC"],
	["(MTP)", "B_RadioBag_01_mtp_F", 200, "backpack", "noDLC"],
	["(Tropical)", "B_RadioBag_01_tropic_F", 200, "backpack", "noDLC"],
	["(Urbano)", "B_RadioBag_01_oucamo_F", 200, "backpack", "noDLC"],
	["(Floresta)", "B_RadioBag_01_wdl_F", 200, "backpack", "noDLC"],
	["======================================================", "", 0, ""],

    ["Mochila FORCE", "", 0, ""],
	["(Preto)", "B_OutdoorPack_blk", 300, "backpack"],                      
	["(Tan)", "B_OutdoorPack_tan", 300, "backpack"],
	["======================================================", "", 0, ""],	      

    ["Bolsa de Mensageiro", "", 0, ""],
    ["(Preto)", "B_Messenger_Black_F", 350, "backpack", "noDLC"],      
    ["(Coiote)", "B_Messenger_Coyote_F", 350, "backpack", "noDLC"],
    ["(Cinzento)", "B_Messenger_Gray_F", 350, "backpack", "noDLC"],
    ["(Oliva)", "B_Messenger_Olive_F", 350, "backpack", "noDLC"],
    ["(IDAP)", "B_Messenger_IDAP_F", 350, "backpack", "noDLC"],
	["======================================================", "", 0, ""],

	["Mochila de Assalto", "", 0, ""],
	["(Preto)", "B_AssaultPack_blk", 400, "backpack"],                   
	["(Verde)", "B_AssaultPack_rgr", 400, "backpack"],
	["(MTP)", "B_AssaultPack_mcamo", 400, "backpack"],
	["(Hex)", "B_AssaultPack_ocamo", 400, "backpack"],
	["(Digital)", "B_AssaultPack_dgtl", 400, "backpack"],
	["(Cáqui)", "B_AssaultPack_khk", 400, "backpack"],
	["(Coiote)", "B_AssaultPack_cbr", 400, "backpack"],
	["(Sage)", "B_AssaultPack_sgg", 400, "backpack"],
    ["(Tropical)", "B_AssaultPack_tna_F", 400, "backpack", "noDLC"],
	["(Kerry)", "B_AssaultPack_Kerry", 400, "backpack"],
	["(Geometric)", "B_AssaultPack_eaf_F", 400, "backpack", "noDLC"],        
	["(Floresta)", "B_AssaultPack_wdl_F", 400, "backpack", "noDLC"],
	["======================================================", "", 0, ""],

    ["Mochila de Campo", "", 0, ""],
	["(Preto)", "B_FieldPack_blk", 500, "backpack"],                       
	["(Coiote)", "B_FieldPack_cbr", 500, "backpack"],
	["(Cáqui)", "B_FieldPack_khk", 500, "backpack"],
	["(Urbano)", "B_FieldPack_oucamo", 500, "backpack"],
	["(Hex)", "B_FieldPack_ocamo", 500, "backpack"],
    ["(Verde Hex)", "B_FieldPack_ghex_F", 500, "backpack", "noDLC"],
	["(Verde)", "B_FieldPack_green_F", 500, "backpack", "noDLC"],              
	["(Taiga)", "B_FieldPack_taiga_F", 500, "backpack", "noDLC"],
	["======================================================", "", 0, ""],

    ["Mochila Tática", "", 0, ""],
	["(Verde)", "B_TacticalPack_rgr", 600, "backpack"],                      
	["(MTP)", "B_TacticalPack_mcamo", 600, "backpack"],
	["(Hex)", "B_TacticalPack_ocamo", 600, "backpack"],
	["(Oliva)", "B_TacticalPack_oli", 600, "backpack"],
	["======================================================", "", 0, ""],
	
    ["Mochila Viper Leve", "", 0, ""],
	["(Black)", "B_ViperLightHarness_blk_F", 650, "backpack", "noDLC"],  
    ["(Green Hex)", "B_ViperLightHarness_ghex_F", 650, "backpack", "noDLC"],
    ["(Hex)", "B_ViperLightHarness_hex_F", 650, "backpack", "noDLC"],
    ["(Khaki)", "B_ViperLightHarness_khk_F", 650, "backpack", "noDLC"],
    ["(Olive)", "B_ViperLightHarness_oli_F", 650, "backpack", "noDLC"],
	["======================================================", "", 0, ""],

	["Mochila Suporte", "", 0, ""],
	["(Coiote)", "B_Kitbag_cbr", 700, "backpack"],                          
	["(Verde)", "B_Kitbag_rgr", 700, "backpack"],
	["(MTP)", "B_Kitbag_mcamo", 700, "backpack"],
	["(Sage)", "B_Kitbag_sgg", 700, "backpack"],
	["======================================================", "", 0, ""],
    
	["Mochila de Carga Leve", "", 0, ""],
	["(Preto)", "B_Bergen_blk", 700, "backpack"],                       
	["(Verde)", "B_Bergen_rgr", 700, "backpack"],
	["(MTP)", "B_Bergen_mcamo", 700, "backpack"],
	["(Sage)", "B_Bergen_sgg", 700, "backpack"],
	["======================================================", "", 0, ""],

	["Mochila Viper Pesado", "", 0, ""],
    ["(Preto)", "B_ViperHarness_blk_F", 750, "backpack", "noDLC"],        
    ["(Verde Hex)", "B_ViperHarness_ghex_F", 750, "backpack", "noDLC"],
    ["(Hex)", "B_ViperHarness_hex_F", 750, "backpack", "noDLC"],
    ["(Cáqui)", "B_ViperHarness_khk_F", 750, "backpack", "noDLC"],
    ["(Oliva)", "B_ViperHarness_oli_F", 750, "backpack", "noDLC"],
	["======================================================", "", 0, ""],

    ["Mochila de Carga Média", "", 0, ""],
	["(Cáqui)", "B_Carryall_khk", 800, "backpack"],                       
	["(MTP)", "B_Carryall_mcamo", 800, "backpack"],
	["(Oliva)", "B_Carryall_oli", 800, "backpack"],
	["(Hex)", "B_Carryall_ocamo", 800, "backpack"],
	["(Urbano)", "B_Carryall_oucamo", 800, "backpack"],
    ["(Verde Hex)", "B_Carryall_ghex_F", 800, "backpack", "noDLC"],
	["(Geometrico)", "B_Carryall_eaf_F", 800, "backpack", "noDLC"],                    
	["(Verde)", "B_Carryall_green_F", 800, "backpack", "noDLC"],
	["(Taiga)", "B_Carryall_taiga_F", 800, "backpack", "noDLC"],
	["(Floresta)", "B_Carryall_wdl_F", 800, "backpack", "noDLC"],
	["======================================================", "", 0, ""],

    ["Mochila de Carga Pesada", "", 0, ""],
    ["(Digital)", "B_Bergen_dgtl_F", 1200, "backpack", "noDLC"],        
    ["(Hex)", "B_Bergen_hex_F", 1200, "backpack", "noDLC"],
    ["(MTP)", "B_Bergen_mcamo_F", 1200, "backpack", "noDLC"],
    ["(Tropical)", "B_Bergen_tna_F", 1200, "backpack", "noDLC"]	
];

genItemArray = compileFinal str
[
	["UTILIDADES", "", 0, ""],
	["Kit Médico", "FirstAidKit", 20, "item"],
	["Estojo Médico", "Medikit", 1000, "item"],
	["Estojo de Ferramentas", "ToolKit", 3000, "item"],
	["Detector de Minas", "MineDetector", 500, "item", "HIDDEN"],
	["Binóculos", "Binocular", 500, "binoc"],
	["Focalizador", "Rangefinder", 1000, "binoc"],
	["Granada Infra Vermelho", "B_IR_Grenade", 100, "mag"],
	["Granada Infra Vermelho", "O_IR_Grenade", 100, "mag", "HIDDEN"],
	["Granada Infra Vermelho", "I_IR_Grenade", 100, "mag", "HIDDEN"],
	["======================================================", "", 0, ""],
	
	["GEO LOCALIZADOR", "", 0, ""],
	["GPS", "ItemGPS", 500, "gps"],
	["Controle Terminal VANT | Independente", "I_UavTerminal", 3000, "gps"],
	["======================================================", "", 0, ""],

    ["Designador Laser", "", 0, ""],
	["(Areia)", "Laserdesignator", 2000, "binoc", "noDLC"],			// Removed team tag to allow all Desis for all teams ->  ["Laser Designator (NATO)", "Laserdesignator", 10000, "binoc", "WEST"],
	["(Cáqui)", "Laserdesignator_01_khk_F", 2000, "binoc"],
	["(Olivea)", "Laserdesignator_03", 2000, "binoc", "noDLC"],
	["(Hex)", "Laserdesignator_02", 2000, "binoc", "noDLC"],		// Attention: Check the main config and change the price if thermal is activated == overpowered
    ["(Verde Hex)", "Laserdesignator_02_ghex_F", 2000, "binoc"],
	["======================================================", "", 0, ""],

	["Designator Remoto ", "", 0, ""],
    ["Independente", "B_W_Static_Designator_01_weapon_F", 2500, "backpack", "noDLC"],
	["======================================================", "", 0, ""],

    ["Bastaão de Luz", "", 0, ""],
	["(Azul)", "Chemlight_blue", 25, "mag"],
	["(Verde)", "Chemlight_green", 25, "mag"],
	["(Amarelo)", "Chemlight_yellow", 25, "mag"],
	["(Vermelho)", "Chemlight_red", 25, "mag"]
];

#define GENSTORE_ITEM_PRICE(CLASS) ((call genItemArray) select {_x select 1 == CLASS} select 0 select 2)

allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call goggArray + call uniformArray + call vestArray + call backpackArray);

genObjectsArray = compileFinal str
[
	["Camo Net", "CamoNet_INDP_open_F", 200, "object", "HIDDEN"], // unlisted, only for object saving

	["----FERRAMENTAS DE BASE----", "", 0, ""],
	["Cofre | SENHA PADRÃO: 0000 |", "Box_GEN_Equip_F", 10000, "ammocrate"],
	["Container de Carga (TARU) ", "Land_Pod_Heli_Transport_04_box_F", 5000, "object"],
    ["TravaBase | SENHA PADRÃO: 0000 |", "Land_Device_assembled_F", 25000, "object"],
	["======================================================", "", 0, ""],

	["----Portão da Base----", "", 0, ""],
	["Painel do Portão | SENHA PADRÃO: 0000 |", "Land_TripodScreen_01_dual_v1_F", 2000, "object"],
	["(Fino) 3 Metros", "Land_PillboxWall_01_3m_round_F", 3000, "object"],
    ["(Fino) 6 Metros", "Land_PillboxWall_01_6m_F", 5000, "object"],
	["(Grosso) 10 Metros", "Land_Canal_Wall_10m_F", 10000, "object"],  
	["======================================================", "", 0, ""],

    ["----UTILIDADES DE BASE----", "", 0, ""],
	["Bomba de Gasolina", "Land_FuelStation_Feed_F", 10000, "object"],
	["Saco de Comida", "Land_Sacks_goods_F", 5000],
	["Barril de Água", "Land_BarrelWater_F", 5000],
    ["======================================================", "", 0, ""],

	["----UTILIDADES DE CONSTRUÇÃO----", "", 0, ""],
    ["Andaime", "Land_Scaffolding_F", 250, "object"],
	["Ponte de Madeira", "Land_Obstacle_Bridge_F", 80, "object"],
	["Hotel Fantasma (Plataforma)", "Land_GH_Platform_F", 200, "object"],
    ["Hotel Fantasma (Escada)", "Land_GH_Stairs_F", 150, "object"],
	["======================================================", "", 0, ""],
    
    ["----Material de Concreto----", "", 0, ""],
	["Protetor de Painel", "Land_CncShelter_F", 200, "object"],
    ["Abrigo de Concreto", "BlockConcrete_F", 400, "object"],
	["Rampa de Concreto", "Land_RampConcrete_F", 350, "object"],
	["Rampa de Concreto (Alta)", "Land_RampConcreteHigh_F", 400, "object"],
	["======================================================", "", 0, ""],

	["----GRUPO DE PAREDES----", "", 0, ""],
    ["(Única)", "Land_CncWall1_F", 200, "object"],
	["(Longo)", "Land_CncWall4_F", 300, "object"],
    ["Concreto(Alta) (4m)", "Land_ConcreteWall_01_l_4m_F", 200, "object"],
    ["Concreto(Alta) (8m)", "Land_ConcreteWall_01_l_8m_F", 400, "object"],
    ["(Alta | Portão)", "Land_ConcreteWall_01_l_gate_F", 500, "object"],
	["Muro de Canal (Escadas)", "Land_Canal_Wall_Stairs_F", 500, "object"],
	["Muro de Canal (Pequeno)", "Land_Canal_WallSmall_10m_F", 500, "object"],
	["======================================================", "", 0, ""],

	["----ILUMINAÇAO----", "", 0, ""],
    ["Poste de iluminação (Gasto)", "Land_LampShabby_F", 100, "object"],
	["Poste de iluminação (Porto)", "Land_LampHarbour_F", 100, "object"],
    ["Poste de iluminação (Halogênio)", "Land_LampHalogen_F", 400, "object"],
    ["Lampada Potatil (Dupla)", "Land_PortableLight_double_F", 100, "object"],
	["======================================================", "", 0, ""],

    ["----GRUPO DE CAIXAS----", "", 0, ""],
	["Caixa de Munição | Vazia", "Box_NATO_Ammo_F", 200, "ammocrate"],
    ["Caixa de Arma | Vazia", "Box_NATO_Wps_F", 200, "ammocrate"],
    ["Caixa de Arma Especial | Vazia", "Box_NATO_WpsSpecial_F", 200, "ammocrate"],
    ["Caixa de Explosivos | Vazia", "Box_NATO_AmmoOrd_F", 200, "ammocrate"],
    ["Caixa de Granadas | Vazia", "Box_NATO_Grenades_F", 200, "ammocrate"],
    ["Caixa de Lançadores | Vazia", "Box_NATO_WpsLaunch_F", 200, "ammocrate"],
    ["Caixa de Suporte | Vazia", "Box_NATO_Support_F", 200, "ammocrate"],
    ["Caixa de munição (Madeira) | Vazia", "Box_Syndicate_Ammo_F", 200, "ammocrate"],
    ["Caixa de Arma (Madeira) | Vazia", "Box_Syndicate_Wps_F", 200, "ammocrate"],
    ["Caixa de Explosivos (Madeira) | Vazia", "Box_IED_Exp_F", 200, "ammocrate"],
    ["Caixa de Lançadores (Madeira) | Vazia", "Box_Syndicate_WpsLaunch_F", 200, "ammocrate"],
    ["Caixa de Uniforme | Vazia", "Box_NATO_Uniforms_F", 500, "ammocrate"],
    ["Caixa de Equipamentos | Vazia", "Box_NATO_Equip_F", 500, "ammocrate"],
	["Caixa de Munição (Camuflado) | Vazia", "Box_FIA_Support_F", 250, "ammocrate"],
	["======================================================", "", 0, ""],
	
	["----GRUPO DE BANDEIRAS----", "", 0, ""],
	["(NATO)", "Flag_NATO_F", 500, "object"],
	["(UNO)", "Flag_UNO_F", 500, "object"],
	["(USA)", "Flag_US_F", 500, "object"],
	["(UK)", "Flag_UK_F", 500, "object"],
	["(ANÔNIMOS)", "FlagPole_F", 500, "object"],
	["======================================================", "", 0, ""],

    ["----GRUPO DE PLACAS----", "", 0, ""],
    ["(Área Militar)", "Land_SignM_WarningMilitaryArea_english_F", 50, "object"],
    ["(Veículos Militares)", "Land_SignM_WarningMilitaryVehicles_english_F", 50, "object"],
    ["(Área de Risco)", "Land_Sign_WarningUnexplodedAmmo_F", 50, "object"],
    ["(Para alugar)", "Land_SignM_forRent_F", 50, "object"],
    ["(À venda)", "Land_SignM_forSale_F", 50, "object"],
    ["======================================================", "", 0, ""],
    
    ["----BARREIRA HESCO----", "", 0, ""],
	["(1 Bloco, Tan)", "Land_HBarrier_1_F", 100, "object"],
    ["(1 Bloco, Verde)", "Land_HBarrier_01_line_1_green_F", 100, "object"],
	["(3 Blocos, Tan)", "Land_HBarrier_3_F", 200, "object"],
    ["(3 Blocos, Verde)", "Land_HBarrier_01_line_3_green_F", 200, "object"],
	["(5 Blocos, Tan)", "Land_HBarrier_5_F", 250, "object"],
    ["(5 Blocos, Verde)", "Land_HBarrier_01_line_5_green_F", 250, "object"],
	["Grande (Tan)", "Land_HBarrierBig_F", 300, "object"],
    ["Grande (Verde)", "Land_HBarrier_01_big_4_green_F", 300, "object"],
	["Rampa (4 Blocos, Tan)", "Land_HBarrierWall4_F", 200, "object"],
    ["Rampa (4 Blocos, Verde)", "Land_HBarrier_01_wall_4_green_F", 200, "object"],
	["Rampa (6 Blocos, Tan)", "Land_HBarrierWall6_F", 300, "object"],
    ["Rampa (6 Blocos, Verde)", "Land_HBarrier_01_wall_6_green_F", 300, "object"],
	["Rampa (Canto, Tan)", "Land_HBarrierWall_corner_F", 200, "object"],
    ["Rampa (Canto, Verde)", "Land_HBarrier_01_wall_corner_green_F", 200, "object"],
	["Corredor (Tan)", "Land_HBarrierWall_corridor_F", 400, "object"],
    ["Corredor (Verde)", "Land_HBarrier_01_wall_corridor_green_F", 400, "object"],
	["Torre de vigia (Tan)", "Land_HBarrierTower_F", 500, "object"],
    ["Torre de vigia (Verde)", "Land_HBarrier_01_big_tower_green_F", 500, "object"],
	["Casamata (Tan)", "Land_BagBunker_Tower_F", 1000, "object"],
    ["Casamata (Verde)", "Land_HBarrier_01_tower_green_F", 1000, "object"],
	["======================================================", "", 0, ""],

    ["----SACO DE AREIA----", "", 0, ""],
	["(Canto, Tan)", "Land_BagFence_Corner_F", 50, "object"],
    ["(Canto, Verde)", "Land_HBarrier_01_wall_corner_green_F", 50, "object"],
	["(Final, Tan)", "Land_BagFence_End_F", 50, "object"],
    ["(Final, Verde)", "Land_BagFence_01_end_green_F", 50, "object"],
	["(Longo, Tan)", "Land_BagFence_Long_F", 100, "object"],
    ["(Longo, Verde)", "Land_BagFence_01_long_green_F", 100, "object"],
	["(Curvo, Tan)", "Land_BagFence_Round_F", 100, "object"],
    ["(Curvo, Verde)", "Land_BagFence_01_round_green_F", 100, "object"],
	["(Curto, Tan)", "Land_BagFence_Short_F", 75, "object"],
    ["(Curto, Verde)", "Land_BagFence_01_short_green_F", 75, "object"],
    ["(Baixa)", "Land_SandbagBarricade_01_half_F", 100, "object"],
    ["(Alta)", "Land_SandbagBarricade_01_F", 150, "object"],
    ["(Alta, Janela)", "Land_SandbagBarricade_01_hole_F", 150, "object"],
	["======================================================", "", 0, ""],

    ["----Casamata Modular----", "", 0, ""],
    ["(Pequeno)", "Land_Bunker_01_small_F", 900, "object"],
    ["(Alta)", "Land_Bunker_01_tall_F", 1300, "object"],
    ["(Grande)", "Land_Bunker_01_big_F", 2000, "object"],
    ["(QG)", "Land_Bunker_01_HQ_F", 2000, "object"],
	["======================================================", "", 0, ""],

	["----Casamata de Areia----", "", 0, ""],
	["(Pequena, Tan) ", "Land_BagBunker_Small_F", 250, "object"],
    ["(Pequena, Verde)", "Land_BagBunker_01_small_green_F", 250, "object"],
	["(Grande, Tan)", "Land_BagBunker_Large_F", 750, "object"],
    ["(Grande, Verde)", "Land_BagBunker_01_large_green_F", 750, "object"],
    ["======================================================", "", 0, ""],

	["----Barreiras----", "", 0, ""],
	["(Pequeno)", "Land_CncBarrier_F", 100, "object"],
	["(Única)", "Land_CncBarrierMedium_F", 250, "object"],
    ["Verde (1 Bloco)", "Land_Bunker_01_blocks_1_F", 100, "object"],
    ["Verde (3 Blocos)", "Land_Bunker_01_blocks_3_F", 200, "object"],
	["Barreira de Concreto (Médio, Longo)", "Land_CncBarrierMedium4_F", 350, "object"],
	["Cerca com Fio Militar (Pequeno)", "Land_New_WiredFence_5m_F", 250, "object"],
	["Cerca com Fio Militar (Longo)", "Land_New_WiredFence_10m_F", 400, "object"],
	["Barreira de Concreto Plana", "Land_Mil_ConcreteWall_F", 300, "object"],
	["======================================================", "", 0, ""],

	["----Construção Militares----", "", 0, ""],
    ["QG de Equipamento Militares", "Land_Cargo_HQ_V1_F", 2000, "object"],
	["Posto de Depósito Militar", "Land_Cargo_Patrol_V1_F", 800, "object"],
	["Torre Militar Alta", "Land_Cargo_Tower_V1_F", 10000, "object"],
	["Depósito Militar", "Land_Cargo_House_V1_F", 900, "object"],
	["======================================================", "", 0, ""],
	
	["----Variados----", "", 0, ""],
    ["Ouriço Checo", "Land_CzechHedgehog_01_F", 150, "object"],
	["Cancela de Portão", "Land_BarGate_F", 150, "object"],
	["Guard Rail", "Land_Crash_barrier_F", 200, "object"],
	["Alvo Rebatível", "TargetP_Inf_F", 100, "object"],
	["Galpão Industrial (Pequeno)", "Land_Shed_Small_F", 1000, "object"],
	["Galpão Industrial (Grande)", "Land_Shed_Big_F", 1500, "object"],
	["Quadra", "Land_BC_Court_F", 1000, "object"],
    ["0000000", "Land_Highway_Pillar_01_F", 10000, "object", "HIDDEN"], 
	["0000000", "Land_Rail_ConcreteRamp_F", 10000, "object", "HIDDEN"], 
	["0000000", "Land_PillboxBunker_01_big_F", 2000, "object", "HIDDEN"],
	["0000000", "Land_FireEscape_01_short_F", 1000, "object", "HIDDEN"],
	["0000000", "Land_ServiceHangar_01_R_F", 30000, "object", "HIDDEN"],
	["Military Wall (Big)", "Land_Mil_WallBig_4m_F", 600, "object", "HIDDEN"]			// Fall over after a few minutes - removed
	//["Container de Carga 2m", "Land_Cargo20_military_green_F", 1000, "object"],  
	//["Tambor de Metal", "Land_MetalBarrel_F", 100, "object"],    //removido
];

allGenStoreVanillaItems = compileFinal str (call genItemArray + call genObjectsArray + call allStoreGear);

//Text name, classname, buy cost, spawn type, sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
    ["Kart", "C_Kart_01_F", 500, "vehicle", "SKIPSAVE"], 
    ["Quadriciclo", "I_G_Quadbike_01_F", 600, "vehicle"],
        ["Quadbike (Civilian)", "C_Quadbike_01_F", 700, "vehicle", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
        ["Quadbike (NATO)", "B_Quadbike_01_F", 700, "vehicle", "SKIPSAVE", "HIDDEN"], 
        ["Quadbike (CSAT)", "O_Quadbike_01_F", 700, "vehicle", "SKIPSAVE", "HIDDEN"],
        ["Quadbike (AAF)", "I_Quadbike_01_F", 700, "vehicle", "SKIPSAVE", "HIDDEN"], 
	["Trator", "C_Tractor_01_F", 500, "vehicle", "SKIPSAVE"],
    ["------------------------------------------------------------------------", "", 0, ""],
    ["Carros", "", 0, ""],
	["Hatchback | Normal", "C_Hatchback_01_F", 1000, "vehicle", "SKIPSAVE"],
	["Hatchback Sport | Tunado", "C_Hatchback_01_sport_F", 2000, "vehicle", "SKIPSAVE"],
	["------------------------------------------------------------------------", "", 0, ""],
	["SUV", "C_SUV_01_F", 1500, "vehicle"],
	["------------------------------------------------------------------------", "", 0, ""],
	["Caminhonete | Desarmada", "C_Offroad_01_F", 1000, "vehicle", "SKIPSAVE"],
    ["Caminhonete | Coberta", "I_E_Offroad_01_covered_F", 1500, "vehicle"],
        ["Offroad Camo", "I_G_Offroad_01_F", 1100, "vehicle", "HIDDEN"], // hidden, just a paintjob
    ["Caminhonete | Policial", "B_GEN_Offroad_01_gen_F", 1250, "vehicle", "noDLC"],
    ["Caminhonete | Reparo", "C_Offroad_01_repair_F", 5000, "vehicle"],
	["------------------------------------------------------------------------", "", 0, ""],
    ["MB 4WD", "C_Offroad_02_unarmed_F", 1000, "vehicle"],
        ["MB 4WD (Guerilla)", "I_C_Offroad_02_unarmed_F", 1000, "vehicle", "HIDDEN"], // hidden, just a paintjob
    ["------------------------------------------------------------------------", "", 0, ""],
	["Prowler | Leve | Desarmado", "B_CTRG_LSV_01_light_F", 2000, "vehicle"],
	["Prowler | Desarmado", "B_T_LSV_01_unarmed_F", 2500, "vehicle"],
	["Qilin | Desarmado", "O_T_LSV_02_unarmed_F", 2500, "vehicle"],
	["======================================================", "", 0, ""],

	["Van", "", 0, ""],
	["Carga", "C_Van_02_vehicle_F", 1000, "vehicle"],
	["Transporte Pessoal", "C_Van_02_transport_F", 1100, "vehicle"],
	["Transporte de Garga", "B_GEN_Van_02_vehicle_F", 1250, "vehicle"],
	["Transporte Policial", "B_GEN_Van_02_transport_F", 1250, "vehicle"],
	["Ambulância", "C_Van_02_medevac_F", 1500, "vehicle"],
	["Reparo", "C_Van_02_service_F", 5000, "vehicle"],
	["======================================================", "", 0, ""],

    ["Carro Blindado", "", 0, ""],
	["Hunter | Desarmado | 4 Tripulantes", "B_MRAP_01_F", 10000, "vehicle"],
	["Ifrit | Desarmado | 4 Tripulantes", "O_MRAP_02_F", 10000, "vehicle"],
	["Strider | Desarmado | 4 Tripulantes", "I_MRAP_03_F", 10000, "vehicle"],
    ["======================================================", "", 0, ""],
    
	["Caminhão", "", 0, ""],
    ["Aberto", "C_Van_01_transport_F", 1000, "vehicle"],
    ["Fechado", "C_Van_01_box_F", 1100, "vehicle"],
    ["Combustível", "C_Van_01_fuel_F", 2000, "vehicle"],
	    ["Truck Camo", "I_G_Van_01_transport_F", 800, "vehicle", "HIDDEN"], // hidden, just a paintjob
        ["Fuel Truck Camo", "I_G_Van_01_fuel_F", 2100, "vehicle", "HIDDEN"], // hidden, just a paintjob
    ["======================================================", "", 0, ""],
    
    ["HEMTT", "", 0, ""],
	["Guincho", "B_Truck_01_mover_F", 4000, "vehicle"],
	["Carga", "B_Truck_01_box_F", 9500, "vehicle"],
	["Transporte", "B_Truck_01_transport_F", 5000, "vehicle"],
	["Coberto", "B_Truck_01_covered_F", 6000, "vehicle"],
	["Combustível", "B_Truck_01_fuel_F", 7500, "vehicle"],
	["Médico", "B_Truck_01_medical_F", 6000, "vehicle"],
	["Repair", "B_Truck_01_Repair_F", 12500, "vehicle", "HIDDEN"],			        //Removed to avoid bugusing with default arma rearm/repair function
	["Remuniciador", "B_Truck_01_ammo_F", 15000, "vehicle"],				//Removed to avoid bugusing with default arma rearm/repair function
	["======================================================", "", 0, ""],

	["Tempest", "", 0, ""],
	["Transporte", "O_Truck_03_transport_F", 5000, "vehicle"],
	["Coberto", "O_Truck_03_covered_F", 6000, "vehicle"],
	["Combustível", "O_Truck_03_fuel_F", 7500, "vehicle"],
	["Médico", "O_Truck_03_medical_F", 6000, "vehicle"],
	["Device", "O_Truck_03_device_F", 5000, "vehicle", "HIDDEN"],
	["Repair", "O_Truck_03_repair_F", 12500, "vehicle", "HIDDEN"],			//Removed to avoid bugusing with default arma rearm/repair function
	["Remuniciador", "O_Truck_03_ammo_F", 15000, "vehicle"],				//Removed to avoid bugusing with default arma rearm/repair function
	["======================================================", "", 0, ""],

	["Zamak", "", 0, ""],
	["Transporte", "I_Truck_02_transport_F", 5000, "vehicle"],	
	["Transporte Civil", "C_Truck_02_transport_F", 4000, "vehicle"], 
	["Coberto", "I_Truck_02_covered_F", 6000, "vehicle"],	
    ["Coberto Civil", "C_Truck_02_covered_F", 5000, "vehicle"],
	["Combustível", "I_Truck_02_fuel_F", 7500, "vehicle"],
	["Médico", "I_Truck_02_medical_F", 6000, "vehicle"],
    ["Zamak Covered (IDAP)", "C_IDAP_Truck_02_F", 5000, "vehicle", "HIDDEN"], // hidden, just a paintjob
	["Zamak Transport (IDAP)", "C_IDAP_Truck_02_transport_F", 4000, "vehicle", "HIDDEN"], // hidden, just a paintjob
	["Zamak Water (IDAP)", "C_IDAP_Truck_02_water_F", 5000, "vehicle"],
	["Zamak Repair", "I_Truck_02_box_F", 10000, "vehicle", "HIDDEN"],				//Removed to avoid bugusing with default arma rearm/repair function
	["Remuniciador", "I_Truck_02_ammo_F", 15000, "vehicle"]				//Removed to avoid bugusing with default arma rearm/repair function
];

armoredArray = compileFinal str
[
    ["MB 4WD", "", 0, ""],
    ["LMG", "I_C_Offroad_02_LMG_F", 3500, "vehicle"],
    ["Lança Míssil Anti-Tanque", "I_C_Offroad_02_AT_F", 5000, "vehicle"],
	["======================================================", "", 0, ""],

	["Caminhonete", "", 0, ""],
	["Browning .50", "I_G_Offroad_01_armed_F", 3500, "vehicle"],
    ["Lança Míssil Anti-Tanque", "I_G_Offroad_01_AT_F", 5000, "vehicle"],
	["======================================================", "", 0, ""],

	["Prowler", "", 0, ""],
    ["Browning .50", "B_T_LSV_01_armed_F", 6000, "vehicle"],
	["Lança Míssil Anti-Tanque", "B_T_LSV_01_AT_F", 15500, "vehicle"],
	["======================================================", "", 0, ""],

    ["Qilin", "", 0, ""],
    ["Minigun", "O_T_LSV_02_armed_F", 5000, "vehicle"],
	["Lança Míssil Anti-Tanque", "O_T_LSV_02_AT_F", 13500, "vehicle"],
	["======================================================", "", 0, ""],
    	
	["Hunter", "", 0, ""],
	["Browning .50 | 4 Tripulantes", "B_MRAP_01_hmg_F", 15000, "vehicle"],
	["Lança Granadas | 4 Tripulantes", "B_MRAP_01_gmg_F", 17500, "vehicle"],
	["======================================================", "", 0, ""],

    ["Ifrit", "", 0, ""],
	["Browning .50 | 4 Tripulantes", "O_MRAP_02_hmg_F", 15000, "vehicle"],
	["Lança Granadas | 4 Tripulantes", "O_MRAP_02_gmg_F", 17500, "vehicle"],
	["======================================================", "", 0, ""],

    ["Strider", "", 0, ""],
	["Browning .50 | 4 Tripulantes", "I_MRAP_03_hmg_F", 15000, "vehicle"],
	["Lança Granadas| 4 Tripulantes", "I_MRAP_03_gmg_F", 17500, "vehicle"]
];

tanksArray = compileFinal str
[
	["CRV-6e Bobcat | Remuniciador", "B_APC_Tracked_01_CRV_F", 32500, "vehicle"],
	["------------------------------------------------------------------------", "", 0, ""],
	["GRUPO AWC 303 Nyx", "", 0, ""],
    ["Radar | Reconhecimento", "I_LT_01_scout_F", 10000, "vehicle"],
    ["Canhão Automático | 30mm", "I_LT_01_cannon_F", 25000, "vehicle"],
    ["Lança Míssil Anti-Tanque", "I_LT_01_AT_F", 30000, "vehicle"],
    ["Lança Míssil Anti-Aéreo", "I_LT_01_AA_F", 30000, "vehicle"],
	["======================================================", "", 0, ""],

	["TRANSPORTADOR DE TROPA BLINDADO", "", 0, ""],
	["MSE-3 Marid", "O_APC_Wheeled_02_rcws_v2_F", 35000, "vehicle"],
	["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 37500, "vehicle"],
	["AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F", 40000, "vehicle"],
	["======================================================", "", 0, ""],

    ["VEÍCULO BLINDADO DE COMBATE", "", 0, ""],
	["IFV-6c Panther", "B_APC_Tracked_01_rcws_F", 35000, "vehicle"],
	["FV-720 Mora", "I_APC_tracked_03_cannon_F", 40000, "vehicle"],
	["BTR-K Kamysh", "O_APC_Tracked_02_cannon_F", 40000, "vehicle"],
	["======================================================", "", 0, ""],

    ["VEÍCULO ANTIAÉREO", "", 0, ""],
	["IFV-6a Cheetah AA | Lança Míssil Anti-Aéreo", "B_APC_Tracked_01_AA_F", 50000, "vehicle"],
	["ZSU-39 Tigris AA | Lança Míssil Anti-Aéreo", "O_APC_Tracked_02_AA_F", 50000, "vehicle"],
	["======================================================", "", 0, ""],

	["Rhino MGS", "", 0, ""],
	["Padrão", "B_AFV_Wheeled_01_cannon_F", 50000, "vehicle"],
    ["Melhorado Browning .50", "B_AFV_Wheeled_01_up_cannon_F", 60000, "vehicle"],
	["======================================================", "", 0, ""],

    ["M2A1 Slammer", "", 0, ""],
	["Padrão", "B_MBT_01_cannon_F", 60000, "vehicle"],
	["Melhorado Browning .50", "B_MBT_01_TUSK_F", 65000, "vehicle"], 			// Commander gun variant
	["======================================================", "", 0, ""],
	
    ["Carro de Combate", "", 0, ""],
	["MBT-52 Kuma", "I_MBT_03_cannon_F", 60000, "vehicle"],
	["T-100 Varsuk", "O_MBT_02_cannon_F", 60000, "vehicle"],
	["======================================================", "", 0, ""],

    ["T-140 Angara", "", 0, ""],
	["Padrão", "O_MBT_04_cannon_F", 75000, "vehicle"],
    ["Melhorado Canhão Automático | 30mm", "O_MBT_04_command_F", 90000, "vehicle"],

	["M5 Sandstorm MLRS", "B_MBT_01_mlrs_F", 80000, "vehicle", "HIDDEN"],
    ["M4 Scorcher", "B_MBT_01_arty_F", 80000, "vehicle", "HIDDEN"],
    ["Zamak MRL", "I_Truck_02_MRL_F", 50000, "vehicle", "HIDDEN"]
];


helicoptersArray = compileFinal str
[
	["DESARMADOS", "", 0, ""],
    ["M-900 Modelo Cívil", "C_Heli_Light_01_civil_F", 2000, "vehicle", "SKIPSAVE"], // MH-6, no flares
	["MH-9 Hummingbird", "B_Heli_Light_01_F", 3000, "vehicle"], // MH-6
    ["PO-30 Orca | Desarmado", "O_Heli_Light_02_unarmed_F", 5000, "vehicle"], // Ka-60
    ["WY-55 Hellcat | Desarmado", "I_Heli_light_03_unarmed_F", 7500, "vehicle"], // AW159
    ["CH-49 Mohawk", "I_Heli_Transport_02_F", 9000, "vehicle"], // AW101
        ["EH302 IDAP", "C_IDAP_Heli_Transport_02_F", 9000, "vehicle", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
	["======================================================", "", 0, ""],	
    
	["GRUPO Mi-290 Taru", "", 0, ""],
	["Leve", "O_Heli_Transport_04_F", 6000, "vehicle"],
	["Carga", "O_Heli_Transport_04_box_F", 20000, "vehicle"],
	["Combustível", "O_Heli_Transport_04_fuel_F", 8500, "vehicle"],
	["Bancos", "O_Heli_Transport_04_bench_F", 9000, "vehicle"],
	["transporte", "O_Heli_Transport_04_covered_F", 9500, "vehicle"],
	["Tipo Médico", "O_Heli_Transport_04_medevac_F", 10000, "vehicle"],
	["(Repair)", "O_Heli_Transport_04_repair_F", 15000, "vehicle", "HIDDEN"],		//Removed to avoid bugusing with default arma rearm/repair function
	["(Ammo)", "O_Heli_Transport_04_ammo_F", 25000, "vehicle", "HIDDEN"],			//Removed to avoid bugusing with default arma rearm/repair function
	["======================================================", "", 0, ""],

	["GRUPO CH-67 Huron", "", 0, ""],
	["Desarmado", "B_Heli_Transport_03_unarmed_F", 9000, "vehicle"], 	// CH-47
	["Armado", "B_Heli_Transport_03_F", 12000, "vehicle"], 				// CH-47 with 2 side miniguns
	["======================================================", "", 0, ""],

	["GRUPO AH-9 Pawnee", "", 0, ""],
    ["Somente Minigun", "B_Heli_Light_01_dynamicLoadout_F", 15000, "vehicle", "variant_pawneeGun"], // Armed AH-6 (no missiles)
    ["Completo", "B_Heli_Light_01_dynamicLoadout_F", 25000, "vehicle", "variant_pawneeNormal"], // Armed AH-6
	["CAS", "B_Heli_Light_01_dynamicLoadout_F", 20000, "vehicle", "variant_pawneeDelta"], // Armed AH-6
	["======================================================", "", 0, ""],

	["GRUPO PO-30 Orca", "", 0, ""],
    ["DAR", "O_Heli_Light_02_dynamicLoadout_F", 35000, "vehicle", "variant_orcaDAR"], // Armed Ka-60
    ["DAGR", "O_Heli_Light_02_dynamicLoadout_F", 45000, "vehicle", "variant_orcaDAGR"], // Armed Ka-60 with guided missles
	["======================================================", "", 0, ""],

    ["GRUPO HELICÓPTEROS ARMADOS", "", 0, ""],
    ["WY-55 Hellcat | Armedo", "I_Heli_light_03_dynamicLoadout_F", 30000, "vehicle"],    // Armed AW159
	["UH-80 Ghost Hawk | Minigun", "B_Heli_Transport_01_F", 12000, "vehicle"], 		     // UH-60 Stealth with 2 side miniguns
	["======================================================", "", 0, ""],

    ["GRUPO HELICÓPTERO DE ATAQUE", "", 0, ""],
    ["AH-99 Blackfoot", "B_Heli_Attack_01_dynamicLoadout_F", 95000, "vehicle"],          // RAH-66 with gunner
    ["Mi-48 Kajman", "O_Heli_Attack_02_dynamicLoadout_F", 90000, "vehicle"]              // Mi-28 with gunner 
    
];

planesArray = compileFinal str
[
	["Caesar", "C_Plane_Civil_01_F", 3000, "vehicle"],
    ["Super Tucano", "C_Plane_Civil_01_racing_F", 20000, "vehicle"],
    ["------------------------------------------------------------------------", "", 0, ""],

    ["GRUPO A-143 Buzzard", "", 0, ""],
    ["CAS", "I_Plane_Fighter_03_dynamicLoadout_F", 40000, "vehicle", "variant_buzzardCAS"],
    ["AA", "I_Plane_Fighter_03_dynamicLoadout_F", 50000, "vehicle", "variant_buzzardAA"],
    ["BOMBARDEIRO 1", "I_Plane_Fighter_03_dynamicLoadout_F", 60000, "vehicle", "variant_buzzardb1"],
	["BOMBARDEIRO 2", "I_Plane_Fighter_03_dynamicLoadout_F", 70000, "vehicle", "variant_buzzardb2"],
	["======================================================", "", 0, ""],

    ["GRUPO A-149 Gryphon", "", 0, ""],
    ["CAS", "I_Plane_Fighter_04_F", 80000, "vehicle"],
	["AA", "I_Plane_Fighter_04_F", 85000, "vehicle", "variant_GryphonAA"],
	["======================================================", "", 0, ""],

    ["GRUPO F/A-181 Black Wasp", "", 0, ""],
    ["CAS", "B_Plane_Fighter_01_F", 130000, "vehicle"],
	["AA", "B_Plane_Fighter_01_F", 150000, "vehicle", "variant_F18AA"],
	["BOMBARDEIRO1", "B_Plane_Fighter_01_F", 190000, "vehicle", "variant_F18b1"],
    ["Furtivo", "B_Plane_Fighter_01_Stealth_F", 100000, "vehicle"],
	["======================================================", "", 0, ""],

    ["GRUPO To-201 Shikra", "", 0, ""],
    ["CAS", "O_Plane_Fighter_02_F", 140000, "vehicle"],
	["AA", "O_Plane_Fighter_02_F", 160000, "vehicle", "variant_ShikraAA"],
	["BOMBARDEIRO 1", "O_Plane_Fighter_02_F", 190000, "vehicle", "variant_Shikrab1"],
    ["Furtivo", "O_Plane_Fighter_02_Stealth_F", 110000, "vehicle"],
	["======================================================", "", 0, ""],

    ["GRUPO A-10 Wipeout", "", 0, ""],
    ["CAS", "B_Plane_CAS_01_dynamicLoadout_F", 100000, "vehicle"],
	["CAS 2", "B_Plane_CAS_01_dynamicLoadout_F", 110000, "vehicle", "variant_A10B2"],
	["BOMBARDEIRO 3", "B_Plane_CAS_01_dynamicLoadout_F", 100000, "vehicle", "variant_A10B3"],
	["======================================================", "", 0, ""],

    ["To-199 Neophron", "", 0, ""],
    ["CAS", "O_Plane_CAS_02_dynamicLoadout_F", 130000, "vehicle"],
    ["CAS 2", "O_Plane_CAS_02_dynamicLoadout_F", 150000, "vehicle", "variant_NeophronB2"],
	["BOMBARDEIRO 3", "O_Plane_CAS_02_dynamicLoadout_F", 120000, "vehicle", "variant_NeophronB1"],
	["======================================================", "", 0, ""],

	["V-44 X Blackfish", "", 0, ""],
    ["Transporta Infantaria", "B_T_VTOL_01_infantry_F", 12000, "vehicle"],
	["Transporta Veículo", "B_T_VTOL_01_vehicle_F", 12000, "vehicle"],
	["Armado", "B_T_VTOL_01_armed_F", 150000, "vehicle"],
	["======================================================", "", 0, ""],

    ["Y-32 Xian", "", 0, ""],
    ["Completo|Transporta Infantaria", "O_T_VTOL_02_infantry_dynamicLoadout_F", 130000, "vehicle"],
    ["Canhão 30mm|Transporta Infantaria", "O_T_VTOL_02_infantry_dynamicLoadout_F", 90000, "vehicle", "variant_xianGunOnly"],
    ["Desarmado|Transporta Infantaria", "O_T_VTOL_02_infantry_dynamicLoadout_F", 12000, "vehicle", "variant_xianUnarmed"],
    ["------------------------------------------------------------------------", "", 0, ""],
    ["Completo|Transporta Veículo", "O_T_VTOL_02_vehicle_dynamicLoadout_F", 130000, "vehicle"],
    ["Canhão 30mm|Transporta Veículo", "O_T_VTOL_02_vehicle_dynamicLoadout_F", 130000, "vehicle", "variant_xianGunOnly"],
    ["Desarmado|Transporta Veículo", "O_T_VTOL_02_vehicle_dynamicLoadout_F", 12000, "vehicle", "variant_xianUnarmed"]
];

boatsArray = compileFinal str
[
	["Jet Sky | 3 Tripulantes", "C_Scooter_Transport_01_F", 500, "boat", "SKIPSAVE"],

    ["Bote de Assalto | 5 Tripulantes", "B_Boat_Transport_01_F", 600, "boat", "SKIPSAVE"],
        ["Assault Boat (CSAT)", "O_Boat_Transport_01_F", 600, "boat", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
        ["Assault Boat (AAF)", "I_Boat_Transport_01_F", 600, "boat", "SKIPSAVE", "HIDDEN"], //
        ["Assault Boat (FIA)", "I_G_Boat_Transport_01_F", 600, "boat", "SKIPSAVE", "HIDDEN"], //
		["Rescue Boat", "C_Rubberboat", 500, "boat", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
        ["Rescue Boat (NATO)", "B_Lifeboat", 500, "boat", "SKIPSAVE", "HIDDEN"], //
        ["Rescue Boat (CSAT)", "O_Lifeboat", 500, "boat", "SKIPSAVE", "HIDDEN"], //

    ["Lancha Rápida | 3 Tripulantes", "C_Boat_Civil_01_F", 1000, "boat", "SKIPSAVE"],
        ["Motorboat Rescue", "C_Boat_Civil_01_rescue_F", 1000, "boat", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
        ["Motorboat Police", "C_Boat_Civil_01_police_F", 1000, "boat", "SKIPSAVE", "HIDDEN"], //


	["Bote Militar|Desarmado| 6 Tripulantes", "I_C_Boat_Transport_02_F", 1500, "boat", "SKIPSAVE"],

	["Bote Militar|40mm|.50| 8 Tripulantes", "O_Boat_Armed_01_hmg_F", 4000, "boat", "SKIPSAVE"],
	["Bote Militar|40mm|Minigun| 8 Tripulantes", "B_Boat_Armed_01_minigun_F", 4000, "boat", "SKIPSAVE"],
		["Speedboat Minigun (AAF)", "I_Boat_Armed_01_minigun_F", 4000, "boat", "SKIPSAVE", "HIDDEN"], // hidden, just a paintjob
	["Mini-Submarino | 4 Tribulantes |", "B_SDV_01_F", 8000, "submarine", "SKIPSAVE"]
];

DronesArray = compileFinal str
[
	["Quadricóptero Reconhecimento", "", 0, ""],
	["Independente", "I_UAV_01_F", 3000, "vehicle"],
	["======================================================", "", 0, ""],
    
	["Hexacóptero de Carga", "", 0, ""],
	["Independente", "I_UAV_06_F", 4000, "vehicle"],
	["======================================================", "", 0, ""],

    ["Hexacóptero Médico", "", 0, ""],
	["Independente", "I_UAV_06_medical_F", 5000, "vehicle"],
	["======================================================", "", 0, ""],

    ["Hexacóptero Demolidor", "", 0, ""],
	["4 Cargas", "C_IDAP_UAV_06_antimine_F", 20000, "vehicle"],
	["======================================================", "", 0, ""],
	
    ["ED-1E de Reconhecimento", "", 0, ""],    
    ["Independente", "I_UGV_02_Science_F", 3000, "vehicle"],
	["======================================================", "", 0, ""],

    ["ED-1E de Demolidor", "", 0, ""],
    ["Independente |5,56mm|12 Pelotas|12 Balotes", "I_UGV_02_Demining_F", 10000, "vehicle"],
	["======================================================", "", 0, ""],

    ["UGV STOMPER", "", 0, ""],
	["DESARMARDO", "I_UGV_01_F", 5000, "vehicle"],
	["12,5mm/40mm", "I_UGV_01_rcws_F", 15000, "vehicle"],
	["======================================================", "", 0, ""],

    ["DRONES de ATAQUE", "", 0, ""],
	["MQ-12 Falcon|24 Foguetes|2 ATGM|2 AA", "B_T_UAV_03_F", 100000, "vehicle"], // Do NOT use "B_T_UAV_03_dynamicLoadout_F" (doesn't support ASRAAM pylons)
    ["KH-3A Fenghuang | 4 Mísseis", "O_T_UAV_04_CAS_F", 100000, "vehicle"],
    ["------------------------------------------------------------------------", "", 0, ""],
    ["K40 Ababil/MQ4A Greyhawk", "", 0, ""],
	["skalpel 4 Mísseis", "I_UAV_02_dynamicLoadout_F", 100000, "vehicle", "variant_greyhawkMissile"],
	["skalpel 6 Mísseis", "I_UAV_02_dynamicLoadout_F", 150000, "vehicle", "variant_greyhawkMissile6"],
    ["GBU12 2 Bombas", "I_UAV_02_dynamicLoadout_F", 40000, "vehicle", "variant_greyhawkBomber"],
	["GBU12 4 Bombas", "I_UAV_02_dynamicLoadout_F", 80000, "vehicle", "variant_greyhawkBomber4"],
	["Cluster 2 Bombas ", "I_UAV_02_dynamicLoadout_F", 50000, "vehicle", "variant_greyhawkCluster"],
	["DAGR 24 Foguetes", "I_UAV_02_dynamicLoadout_F", 80000, "vehicle", "variant_greyhawkDAGR"],
	["------------------------------------------------------------------------", "", 0, ""],
	["Sentinel", "", 0, ""],
	["skalpel 4 Mísseis | RADAR", "B_UAV_05_F", 150000, "vehicle", "variant_sentinelMissile"],
	["skalpel 6 Mísseis | RADAR", "B_UAV_05_F", 175000, "vehicle", "variant_sentinelMissile2"],
	["GBU12 2 Bombas    | RADAR", "B_UAV_05_F", 55000, "vehicle", "variant_sentinelBomber2"],
    ["GBU12 4 Bombas    | RADAR", "B_UAV_05_F", 90000, "vehicle", "variant_sentinelBomber4"],
	["SDB 8 Bombas      | RADAR", "B_UAV_05_F", 70000, "vehicle", "variant_sentinelBomber8"],
	["Cluster 2 Bombas  | RADAR", "B_UAV_05_F", 75000, "vehicle", "variant_sentinelCluster"],
	["======================================================", "", 0, ""],
	
	["SISTEMA ANTIAÉREO", "", 0, ""],
	["Radar AN/MPQ-105", "I_E_Radar_System_01_F", 40000],
	["MIM-145Â Defender", "I_E_SAM_System_03_F", 50000]
];

allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray + call DronesArray);

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
			["Digital", _texDir + "digi.paa"],
			["Digital Black", _texDir + "digi_black.paa"],
			["Digital Desert", _texDir + "digi_desert.paa"],
			["Digital Woodland", _texDir + "digi_wood.paa"],
			["Drylands", _texDir + "drylands.paa"],
			["Hex", _texDir + "hex.paa"],
			["Orange Camo", _texDir + "camo_orange.paa"],
			["Pink Camo", _texDir + "camo_pink.paa"],
			["Red Camo", _texDir + "camo_red.paa"],
			["Rusty", _texDir + "rusty.paa"],
			["Sand", _texDir + "sand.paa"],
			["Swamp", _texDir + "swamp.paa"],
			["Urban", _texDir + "urban.paa"],
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
	["UTILIDADES", "", 0, ""],
    ["Spawn Beacon", "spawnbeacon", localize "STR_WL_ShopDescriptions_spawnBeacon", "client\icons\spawnbeacon.paa", 9500, 1000],
	["Tenda Camuflada", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\camonet.paa", 200, 100],
	//["Warchest", "warchest", localize "STR_WL_ShopDescriptions_Warchest", "client\icons\warchest.paa", 1000, 500]
	["Suporte de Artilharia", "artillery", "", "client\icons\tablet.paa", 100000, 10000, "HIDDEN"],
    ["======================================================", "", 0, ""],

	["COMIDAS", "", 0, ""],
	["Garrafa d`agua", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\waterbottle.paa", 100, 75],
	["Lata de Comida", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 100, 75],
	["Energético", "energydrink", localize "STR_WL_ShopDescriptions_Energy_Drink", "client\icons\energydrink.paa", 2000, 1000],
	["======================================================", "", 0, ""],

	["FERRAMENTAS DE CARROS", "", 0, ""],
	["Kit de Reparo", "repairkit", localize "STR_WL_ShopDescriptions_RepairKit", "client\icons\briefcase.paa", 500, 250],
	["TravaCarro", "pinlock", localize "STR_WL_ShopDescriptions_Pinlock", "client\icons\keypad.paa", 250, 50],
	["Cifão de Combustível", "syphonhose", localize "STR_WL_ShopDescriptions_SyphonHose", "client\icons\syphonhose.paa", 200, 100],
	["Galão Combustível (Cheio)", "jerrycanfull", localize "STR_WL_ShopDescriptions_fuelFull", "client\icons\jerrycan.paa", 150, 75],
	["Galão Combustível (Vazio)", "jerrycanempty", localize "STR_WL_ShopDescriptions_fuelEmpty", "client\icons\jerrycan.paa", 50, 25],
	["======================================================", "", 0, ""],

    ["DROGAS", "", 0, ""],
	["LSD", "lsd", localize "STR_WL_ShopDescriptions_LSD", "client\icons\lsd.paa", 1500, 1000],
	["Cannabis", "marijuana", localize "STR_WL_ShopDescriptions_Marijuana", "client\icons\marijuana.paa", 2500, 1500],
	["Cocaina", "cocaine", localize "STR_WL_ShopDescriptions_Cocaine", "client\icons\cocaine.paa", 2500, 2000],
	["Heroina", "heroin", localize "STR_WL_ShopDescriptions_Heroin", "client\icons\heroin.paa", 3000, 2500],
	["======================================================", "", 0, ""],

	["RADIOS", "", 0, ""],
	["AN/PRC-148 JEM", "tf_anprc148jem_3", 50, "item"],
    ["AN/PRC-152", "tf_anprc152", 50, "item"],
    ["AN/PRC-154", "tf_anprc154", 50, "item"],
    ["FADAK", "tf_anprc154_2", 50, "item"],
    ["PNR-1000A", "tf_fadak_3", 50, "item"],
    ["Rádio", "tf_anprc148jem_6", 50, "item"],
    ["RF-7800S-TR", "tf_microdagr", 50, "item"],
    ["AN/ARC-164 Rádio Mochila Verde", "tf_anarc164", 50, "backpack"],
    ["AN/ARC-210 Rádio Mochila Arido", "tf_anarc210", 50, "backpack"],
    ["AN/PRC-155 Rádio Mochila Verde", "tf_anprc155", 50, "backpack"],
    ["AN/PRC-155 Rádio Mochila Coyote", "tf_anprc155_coyote", 50, "backpack"],
    ["MR6000L Rádio Mochila", "tf_mr6000l", 50, "backpack"],
    ["MR3000 RHS", "tf_mr3000_rhs", 50, "backpack"],
    ["MR3000 Multicam", "tf_mr3000_multicam", 50, "backpack"],
    ["RT-1523G - SAGE", "tf_rt1523g_sage", 50, "backpack"],
    ["RT-1523G - SAGE", "tf_rt1523g_bwmod", 50, "backpack"]
];

call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";

storeConfigDone = compileFinal "true";
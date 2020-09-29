//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 21:58
//	@file Args:

if (!isServer) exitWith {};

private ["_group", "_pos", "_leader", "_man2", "_man3", "_man4", "_man5", "_man6", "_man7", "_man8", "_man9", "_man10", "_man11", "_man12", "_man13", "_man14", "_man15", "_man16", "_man17", "_man18", "_man19", "_man20"];


_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

// Leader
_leader = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _leader;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_leader linkItem "NVGoggles_INDEP";
_leader addHeadgear "H_HelmetB_camo";
_leader addGoggles "G_Bandanna_tan";
_leader addUniform "U_I_FullGhillie_ard";
_leader addVest "V_TacVest_khk";

_leader addMagazine "10Rnd_Mk14_762x51_Mag";
_leader addWeapon "srifle_DMR_03_woodland_F";
_leader addPrimaryWeaponItem "optic_LRPS_tna_F";
_leader addPrimaryWeaponItem "muzzle_snds_B_khk_F";
_leader addPrimaryWeaponItem "bipod_03_F_oli";

_leader addMagazines ["SmokeShell", 2];
_leader addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_leader addItemToVest "HandGrenade";};
		
_leader call setMissionSkill;
_leader addRating 1e11;
_leader spawn refillPrimaryAmmo;
_leader addEventHandler ["Killed", server_playerDied];

// Soldier2 - AT-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man2 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man2;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man2 linkItem "NVGoggles";
_man2 addHeadgear "H_HelmetB_camo";
_man2 addGoggles "G_Bandanna_tan";
_man2 addUniform "U_I_FullGhillie_ard";
_man2 addVest "V_TacVest_brn";
_man2 addBackpack "B_AssaultPack_Kerry";


_man2 addMagazine "10Rnd_93x64_DMR_05_Mag";
_man2 addWeapon "srifle_DMR_05_tan_f";
_man2 addPrimaryWeaponItem "optic_LRPS";
_man2 addPrimaryWeaponItem "muzzle_snds_93mmg_tan";
_man2 addPrimaryWeaponItem "bipod_01_F_snd";

_man2 addMagazine "Titan_AT";
_man2 addWeapon "launch_B_Titan_short_F";
for "_i" from 1 to 1 do {_man2 addItemToBackpack "Titan_AT";};
for "_i" from 1 to 1 do {_man2 addItemToBackpack "Titan_AP";};

_man2 addMagazines ["SmokeShell", 2];
_man2 addItemToVest "FirstAidKit";
		
_man2 call setMissionSkill;
_man2 addRating 1e11;
_man2 spawn refillPrimaryAmmo;
_man2 addEventHandler ["Killed", server_playerDied];

// Soldier3 - AA-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man3 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man3;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man3 linkItem "NVGoggles";
_man3 addHeadgear "H_HelmetB_camo";
_man3 addGoggles "G_Bandanna_tan";
_man3 addUniform "U_I_FullGhillie_ard";
_man3 addVest "V_TacVest_brn";
_man3 addBackpack "B_FieldPack_cbr";

_man3 addMagazine "10Rnd_338_Mag";
_man3 addWeapon "srifle_DMR_02_sniper_F";
_man3 addPrimaryWeaponItem "optic_LRPS";
_man3 addPrimaryWeaponItem "muzzle_snds_338_sand";
_man3 addPrimaryWeaponItem "bipod_02_F_tan";

_man3 addMagazine "Titan_AA";
_man3 addWeapon "launch_O_Titan_F";
for "_i" from 1 to 2 do {_man3 addItemToBackpack "Titan_AA";};

_man3 addMagazines ["SmokeShell", 2];
_man3 addItemToVest "FirstAidKit";
		
_man3 call setMissionSkill;
_man3 addRating 1e11;
_man3 spawn refillPrimaryAmmo;
_man3 addEventHandler ["Killed", server_playerDied];

// Soldier4 GL-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man4 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man4;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man4 linkItem "NVGoggles_INDEP";
_man4 addHeadgear "H_HelmetB_camo";
_man4 addGoggles "G_Bandanna_oli";
_man4 addUniform "U_I_FullGhillie_lsh";
_man4 addVest "V_TacVest_oli";
_man4 addBackpack "B_LegStrapBag_olive_F";

_man4 addMagazine "5Rnd_127x108_APDS_Mag";
_man4 addWeapon "srifle_GM6_F";
_man4 addPrimaryWeaponItem "optic_LRPS";

_man4 addMagazines ["SmokeShell", 2];
_man4 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man4 addItemToBackpack "5Rnd_127x108_Mag";};
		
_man4 call setMissionSkill;
_man4 addRating 1e11;
_man4 spawn refillPrimaryAmmo;
_man4 addEventHandler ["Killed", server_playerDied];


// Soldier5 GL-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man5 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man5;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man5 linkItem "NVGoggles_INDEP";
_man5 addHeadgear "H_HelmetB_camo";
_man5 addGoggles "G_Bandanna_oli";
_man5 addUniform "U_I_FullGhillie_lsh";
_man5 addVest "V_TacVest_oli";

_man5 addMagazine "7Rnd_408_Mag";
_man5 addWeapon "srifle_LRR_F";
_man5 addPrimaryWeaponItem "optic_LRPS";

_man5 addMagazines ["SmokeShell", 2];
_man5 addItemToVest "FirstAidKit";
		
_man5 call setMissionSkill;
_man5 addRating 1e11;
_man5 spawn refillPrimaryAmmo;
_man5 addEventHandler ["Killed", server_playerDied];

// Soldier6 SNIPER-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man6 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man6;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man6 linkItem "NVGoggles_INDEP";
_man6 addHeadgear "H_HelmetB_camo";
_man6 addGoggles "G_Bandanna_tan";
_man6 addUniform "U_I_FullGhillie_sard";
_man6 addVest "V_TacVest_camo";

_man6 addMagazine "10Rnd_127x54_Mag";
_man6 addWeapon "srifle_DMR_04_F";
_man6 addPrimaryWeaponItem "optic_LRPS";
_man6 addPrimaryWeaponItem "bipod_02_F_blk";

_man6 addMagazines ["SmokeShell", 2];
_man6 addItemToVest "FirstAidKit";
		
_man6 call setMissionSkill;
_man6 addRating 1e11;
_man6 spawn refillPrimaryAmmo;
_man6 addEventHandler ["Killed", server_playerDied];

// Soldier7 CB-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man7 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man7;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man7 linkItem "NVGoggles_INDEP";
_man7 addHeadgear "H_HelmetB_camo";
_man7 addGoggles "G_Bandanna_tan";
_man7 addUniform "U_I_FullGhillie_sard";
_man7 addVest "V_TacVest_camo";

_man7 addMagazine "10Rnd_Mk14_762x51_Mag";
_man7 addWeapon "srifle_DMR_06_camo_F";
_man7 addPrimaryWeaponItem "muzzle_snds_B_khk_F";
_man7 addPrimaryWeaponItem "optic_LRPS_ghex_F";
_man7 addPrimaryWeaponItem "bipod_03_F_oli";

_man7 addMagazines ["SmokeShell", 2];
_man7 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man7 addItemToVest "HandGrenade";};
		
_man7 call setMissionSkill;
_man7 addRating 1e11;
_man7 spawn refillPrimaryAmmo;
_man7 addEventHandler ["Killed", server_playerDied];

// Soldier8 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man8 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man8;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man8 linkItem "NVGoggles";
_man8 addHeadgear "H_HelmetB_camo";
_man8 addGoggles "G_Bandanna_tan";
_man8 addUniform "U_I_FullGhillie_ard";
_man8 addVest "V_TacVest_brn";

_man8 addMagazine "10Rnd_Mk14_762x51_Mag";
_man8 addWeapon "srifle_EBR_F";
_man8 addPrimaryWeaponItem "muzzle_snds_B";
_man8 addPrimaryWeaponItem "optic_LRPS";
_man8 addPrimaryWeaponItem "bipod_03_F_blk";

_man8 addMagazines ["SmokeShellPurple", 2];
_man8 addItemToVest "FirstAidKit";
		
_man8 call setMissionSkill;
_man8 addRating 1e11;
_man8 spawn refillPrimaryAmmo;
_man8 addEventHandler ["Killed", server_playerDied];

// Soldier9 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man9 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man9;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man9 linkItem "NVGoggles_INDEP";
_man9 addHeadgear "H_HelmetB_camo";
_man9 addGoggles "G_Bandanna_tan";
_man9 addUniform "U_I_FullGhillie_lsh";
_man9 addVest "V_TacVest_brn";

_man9 addMagazine "10Rnd_Mk14_762x51_Mag";
_man9 addWeapon "arifle_SPAR_03_khk_F";
_man9 addPrimaryWeaponItem "muzzle_snds_B_khk_F";
_man9 addPrimaryWeaponItem "optic_LRPS_tna_F";
_man9 addPrimaryWeaponItem "bipod_01_F_mtp";

_man9 addMagazines ["SmokeShellBlue", 2];
_man9 addItemToVest "FirstAidKit";
	
_man9 call setMissionSkill;
_man9 addRating 1e11;
_man9 spawn refillPrimaryAmmo;
_man9 addEventHandler ["Killed", server_playerDied];

// Soldier10 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man10 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man10;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man10 linkItem "NVGoggles_INDEP";
_man10 addHeadgear "H_HelmetB_camo";
_man10 addGoggles "G_Bandanna_tan";
_man10 addUniform "U_I_FullGhillie_sard";
_man10 addVest "V_TacVest_brn";

_man10 addMagazine "10Rnd_Mk14_762x51_Mag";
_man10 addWeapon "srifle_DMR_03_khaki_F";
_man10 addPrimaryWeaponItem "muzzle_snds_B_khk_F";
_man10 addPrimaryWeaponItem "optic_LRPS_ghex_F";
_man10 addPrimaryWeaponItem "bipod_01_F_khk";

_man10 addMagazines ["SmokeShellGreen", 2];
_man10 addItemToVest "FirstAidKit";
		
_man10 call setMissionSkill;
_man10 addRating 1e11;
_man10 spawn refillPrimaryAmmo;
_man10 addEventHandler ["Killed", server_playerDied];

// Soldier11 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man11 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man11;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man11 linkItem "NVGoggles_INDEP";
_man11 addHeadgear "H_HelmetB_camo";
_man11 addGoggles "G_Bandanna_tan";
_man11 addUniform "U_I_FullGhillie_sard";
_man11 addVest "V_TacVest_brn";

_man11 addMagazine "10Rnd_338_Mag";
_man11 addWeapon "srifle_DMR_02_F";
_man11 addPrimaryWeaponItem "optic_LRPS";
_man11 addPrimaryWeaponItem "muzzle_snds_338_black";
_man11 addPrimaryWeaponItem "bipod_02_F_blk";

_man11 addMagazines ["SmokeShell", 2];
_man11 addItemToVest "FirstAidKit";
		
_man11 call setMissionSkill;
_man11 addRating 1e11;
_man11 spawn refillPrimaryAmmo;
_man11 addEventHandler ["Killed", server_playerDied];

// Soldier12 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man12 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man12;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man12 linkItem "NVGoggles_INDEP";
_man12 addHeadgear "H_HelmetB_camo";
_man12 addGoggles "G_Bandanna_tan";
_man12 addUniform "U_I_FullGhillie_lsh";
_man12 addVest "V_TacVest_brn";

_man12 addMagazine "10Rnd_338_Mag";
_man12 addWeapon "srifle_DMR_02_camo_F";
_man12 addPrimaryWeaponItem "optic_LRPS";
_man12 addPrimaryWeaponItem "muzzle_snds_338_black";
_man12 addPrimaryWeaponItem "bipod_02_F_blk";

_man12 addMagazines ["SmokeShell", 2];
_man12 addItemToVest "FirstAidKit";
		
_man12 call setMissionSkill;
_man12 addRating 1e11;
_man12 spawn refillPrimaryAmmo;
_man12 addEventHandler ["Killed", server_playerDied];

// Soldier13 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man13 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man13;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man13 linkItem "NVGoggles_INDEP";
_man13 addHeadgear "H_HelmetB_camo";
_man13 addGoggles "G_Bandanna_tan";
_man13 addUniform "U_I_FullGhillie_sard";
_man13 addVest "V_TacVest_brn";

_man13 addMagazine "10Rnd_93x64_DMR_05_Mag";
_man13 addWeapon "srifle_DMR_05_hex_F";
_man13 addPrimaryWeaponItem "optic_LRPS";
_man13 addPrimaryWeaponItem "muzzle_snds_93mmg";
_man13 addPrimaryWeaponItem "bipod_02_F_blk";

_man13 addMagazines ["SmokeShell", 2];
_man13 addItemToVest "FirstAidKit";
		
_man13 call setMissionSkill;
_man13 addRating 1e11;
_man13 spawn refillPrimaryAmmo;
_man13 addEventHandler ["Killed", server_playerDied];

// Soldier14 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man14 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man14;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man14 linkItem "NVGoggles_INDEP";
_man14 addHeadgear "H_HelmetB_camo";
_man14 addGoggles "G_Bandanna_tan";
_man14 addUniform "U_I_FullGhillie_sard";
_man14 addVest "V_TacVest_brn";

_man14 addMagazine "10Rnd_93x64_DMR_05_Mag";
_man14 addWeapon "srifle_DMR_05_blk_F";
_man14 addPrimaryWeaponItem "optic_LRPS";
_man14 addPrimaryWeaponItem "muzzle_snds_93mmg";
_man14 addPrimaryWeaponItem "bipod_02_F_blk";

_man14 addMagazines ["SmokeShell", 2];
_man14 addItemToVest "FirstAidKit";
		
_man14 call setMissionSkill;
_man14 addRating 1e11;
_man14 spawn refillPrimaryAmmo;
_man14 addEventHandler ["Killed", server_playerDied];

// Soldier15-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man15 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man15;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man15 linkItem "NVGoggles_INDEP";
_man15 addHeadgear "H_HelmetB_camo";
_man15 addGoggles "G_Bandanna_oli";
_man15 addUniform "U_I_FullGhillie_lsh";
_man15 addVest "V_TacVest_oli";
_man15 addBackpack "B_LegStrapBag_olive_F";

_man15 addMagazine "5Rnd_127x108_APDS_Mag";
_man15 addWeapon "srifle_GM6_ghex_F";
_man15 addPrimaryWeaponItem "optic_LRPS_tna_F";

_man15 addMagazines ["SmokeShell", 2];
_man15 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man15 addItemToBackpack "5Rnd_127x108_Mag";};
		
_man15 call setMissionSkill;
_man15 addRating 1e11;
_man15 spawn refillPrimaryAmmo;
_man15 addEventHandler ["Killed", server_playerDied];

// Soldier16-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man16 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man16;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man16 linkItem "NVGoggles_INDEP";
_man16 addHeadgear "H_HelmetB_camo";
_man16 addGoggles "G_Bandanna_oli";
_man16 addUniform "U_I_FullGhillie_ard";
_man16 addVest "V_TacVest_brn";
_man16 addBackpack "B_LegStrapBag_olive_F";

_man16 addMagazine "5Rnd_127x108_APDS_Mag";
_man16 addWeapon "srifle_GM6_camo_F";
_man16 addPrimaryWeaponItem "optic_LRPS";

_man16 addMagazines ["SmokeShell", 2];
_man16 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man16 addItemToBackpack "5Rnd_127x108_Mag";};
		
_man16 call setMissionSkill;
_man16 addRating 1e11;
_man16 spawn refillPrimaryAmmo;
_man16 addEventHandler ["Killed", server_playerDied];

// Soldier17-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man17 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man17;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man17 linkItem "NVGoggles_INDEP";
_man17 addHeadgear "H_HelmetB_camo";
_man17 addGoggles "G_Bandanna_oli";
_man17 addUniform "U_I_FullGhillie_lsh";
_man17 addVest "V_TacVest_oli";

_man17 addMagazine "7Rnd_408_Mag";
_man17 addWeapon "srifle_LRR_tna_F";
_man17 addPrimaryWeaponItem "optic_LRPS_tna_F";

_man17 addMagazines ["SmokeShell", 2];
_man17 addItemToVest "FirstAidKit";
		
_man17 call setMissionSkill;
_man17 addRating 1e11;
_man17 spawn refillPrimaryAmmo;
_man17 addEventHandler ["Killed", server_playerDied];

// Soldier18-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man18 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man18;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man18 linkItem "NVGoggles_INDEP";
_man18 addHeadgear "H_HelmetB_camo";
_man18 addGoggles "G_Bandanna_oli";
_man18 addUniform "U_I_FullGhillie_sard";
_man18 addVest "V_TacVest_brn";

_man18 addMagazine "7Rnd_408_Mag";
_man18 addWeapon "srifle_LRR_camo_F";
_man18 addPrimaryWeaponItem "optic_LRPS";

_man18 addMagazines ["SmokeShell", 2];
_man18 addItemToVest "FirstAidKit";
		
_man18 call setMissionSkill;
_man18 addRating 1e11;
_man18 spawn refillPrimaryAmmo;
_man18 addEventHandler ["Killed", server_playerDied];

// Soldier19-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man19 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man19;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man19 linkItem "NVGoggles_INDEP";
_man19 addHeadgear "H_HelmetB_camo";
_man19 addGoggles "G_Bandanna_oli";
_man19 addUniform "U_I_FullGhillie_ard";
_man19 addVest "V_TacVest_brn";

_man19 addMagazine "10Rnd_127x54_Mag";
_man19 addWeapon "srifle_DMR_04_Tan_F";
_man19 addPrimaryWeaponItem "optic_LRPS";
_man19 addPrimaryWeaponItem "bipod_02_F_hex";

_man19 addMagazines ["SmokeShell", 2];
_man19 addItemToVest "FirstAidKit";
		
_man19 call setMissionSkill;
_man19 addRating 1e11;
_man19 spawn refillPrimaryAmmo;
_man19 addEventHandler ["Killed", server_playerDied];

// Soldier20-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man20 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man20;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man20 linkItem "NVGoggles_INDEP";
_man20 addHeadgear "H_HelmetB_camo";
_man20 addGoggles "G_Bandanna_oli";
_man20 addUniform "U_I_FullGhillie_sard";
_man20 addVest "V_TacVest_brn";

_man20 addMagazine "30Rnd_65x39_caseless_msbs_mag_Tracer";
_man20 addWeapon "arifle_MSBS65_Mark_F";
_man20 addPrimaryWeaponItem "optic_LRPS_tna_F";
_man20 addPrimaryWeaponItem "bipod_01_F_khk";
_man20 addPrimaryWeaponItem "muzzle_snds_65_TI_ghex_F";

_man20 addMagazines ["SmokeShell", 2];
_man20 addItemToVest "FirstAidKit";
		
_man20 call setMissionSkill;
_man20 addRating 1e11;
_man20 spawn refillPrimaryAmmo;
_man20 addEventHandler ["Killed", server_playerDied];

_leader = leader _group;
[_group, _pos] call defendArea;
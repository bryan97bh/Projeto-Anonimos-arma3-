//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 21:58
//	@file Args:

if (!isServer) exitWith {};

private ["_group", "_pos", "_leader", "_man2", "_man3", "_man4", "_man5", "_man6", "_man7", "_man8", "_man9", "_man10", "_man11", "_man12", "_man13", "_man14", "_man15"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

// Leader
_leader = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _leader;
sleep 0.1; 
_leader addHeadgear "H_Shemag_olive";
_leader addGoggles "G_WirelessEarpiece_F";
_leader addUniform "U_I_C_Soldier_Bandit_3_F";
_leader addVest "V_TacVest_brn";

_leader addMagazine "30Rnd_762x39_Mag_Tracer_F";
_leader addWeapon "arifle_AKM_F";

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
sleep 0.1; 
_man2 addHeadgear "H_ShemagOpen_khk";
_man2 addGoggles "G_WirelessEarpiece_F";
_man2 addUniform "U_I_C_Soldier_Para_5_F";
_man2 addVest "V_BandollierB_cbr";
_man2 addBackpack "B_Kitbag_mcamo";


_man2 addMagazine "30Rnd_545x39_Mag_Tracer_F";
_man2 addWeapon "arifle_AKS_F";

_man2 addMagazine "RPG7_F";
_man2 addWeapon "launch_RPG7_F";
for "_i" from 1 to 4 do {_man2 addItemToBackpack "RPG7_F";};

_man2 addMagazines ["SmokeShell", 2];
_man2 addItemToVest "FirstAidKit";
		
_man2 call setMissionSkill;
_man2 addRating 1e11;
_man2 spawn refillPrimaryAmmo;
_man2 addEventHandler ["Killed", server_playerDied];

// Soldier3 - AA-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man3 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man3;
sleep 0.1;
_man3 addHeadgear "H_Watchcap_cbr";
_man3 addGoggles "G_WirelessEarpiece_F";
_man3 addUniform "U_I_C_Soldier_Para_2_F";
_man3 addVest "V_BandollierB_cbr";
_man3 addBackpack "B_FieldPack_cbr";

_man3 addMagazine "30Rnd_545x39_Mag_Tracer_F";
_man3 addWeapon "arifle_AKS_F";

_man3 addMagazine "Titan_AA";
_man3 addWeapon "launch_B_Titan_F";
for "_i" from 1 to 2 do {_man3 addItemToBackpack "Titan_AA";};

_man3 addItemToVest "FirstAidKit";
		
_man3 call setMissionSkill;
_man3 addRating 1e11;
_man3 spawn refillPrimaryAmmo;
_man3 addEventHandler ["Killed", server_playerDied];

// Soldier4 GL-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man4 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man4;
sleep 0.1; 
_man4 addHeadgear "H_HelmetB";
_man4 addGoggles "G_Bandanna_khk";
_man4 addUniform "U_I_C_Soldier_Para_1_F";
_man4 addVest "V_TacVest_brn";

_man4 addMagazine "30rnd_762x39_AK12_Arid_Mag_Tracer_F";
_man4 addWeapon "arifle_AK12_GL_arid_F";
_man4 addPrimaryWeaponItem "muzzle_snds_B_snd_F";

_man4 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man4 addItemToVest "1Rnd_HE_Grenade_shell";};
		
_man4 call setMissionSkill;
_man4 addRating 1e11;
_man4 spawn refillPrimaryAmmo;
_man4 addEventHandler ["Killed", server_playerDied];


// Soldier5 GL-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man5 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man5;
sleep 0.1; 
_man5 addHeadgear "H_HelmetB";
_man5 addGoggles "G_Bandanna_khk";
_man5 addUniform "U_I_C_Soldier_Para_1_F";
_man5 addVest "V_TacVest_brn";

_man5 addMagazine "30rnd_762x39_AK12_Arid_Mag_Tracer_F";
_man5 addWeapon "arifle_AK12_GL_arid_F";
_man5 addPrimaryWeaponItem "muzzle_snds_B_snd_F";

_man5 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man5 addItemToVest "1Rnd_HE_Grenade_shell";};
	
_man5 call setMissionSkill;
_man5 addRating 1e11;
_man5 spawn refillPrimaryAmmo;
_man5 addEventHandler ["Killed", server_playerDied];


// Soldier6 SNIPER-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man6 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man6;
sleep 0.1;
_man6 addHeadgear "H_Booniehat_mgrn";
_man6 addGoggles "G_Bandanna_tan";
_man6 addUniform "U_C_HunterBody_grn";
_man6 addVest "V_Rangemaster_belt";

_man6 addMagazine "10Rnd_Mk14_762x51_Mag";
_man6 addWeapon "srifle_DMR_06_hunter_F";
_man6 addPrimaryWeaponItem "optic_KHS_old";

_man6 addMagazines ["SmokeShell", 2];
_man6 addItemToVest "FirstAidKit";
		
_man6 call setMissionSkill;
_man6 addRating 1e11;
_man6 spawn refillPrimaryAmmo;
_man6 addEventHandler ["Killed", server_playerDied];

// Soldier7 CB-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man7 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man7;
sleep 0.1; 
_man7 addHeadgear "H_HeadBandage_bloody_F";
_man7 addGoggles "G_WirelessEarpiece_F";
_man7 addUniform "U_I_C_Soldier_Bandit_1_F";
_man7 addVest "V_TacVest_camo";

_man7 addMagazine "30Rnd_762x39_Mag_Tracer_F";
_man7 addWeapon "arifle_AKM_F";

_man7 addMagazines ["SmokeShell", 2];
_man7 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man7 addItemToVest "HandGrenade";};

_man7 enablegunlights "forceOn";		
_man7 call setMissionSkill;
_man7 addRating 1e11;
_man7 spawn refillPrimaryAmmo;
_man7 addEventHandler ["Killed", server_playerDied];

// Soldier8 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man8 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man8;
sleep 0.1; 
_man8 addHeadgear "G_WirelessEarpiece_F";
_man8 addGoggles "G_Balaclava_oli";
_man8 addUniform "U_I_C_Soldier_Para_5_F";
_man8 addVest "V_PlateCarrierSpec_rgr";

_man8 addMagazine "2Rnd_12Gauge_Pellets";
_man8 addWeapon "sgun_HunterShotgun_01_F";

_man8 addItemToVest "FirstAidKit";
		
_man8 call setMissionSkill;
_man8 addRating 1e11;
_man8 spawn refillPrimaryAmmo;
_man8 addEventHandler ["Killed", server_playerDied];

// Soldier9 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man9 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man9;
sleep 0.1; 
_man9 addHeadgear "G_WirelessEarpiece_F";
_man9 addGoggles "G_Balaclava_oli";
_man9 addUniform "U_I_C_Soldier_Para_5_F";
_man9 addVest "V_PlateCarrierSpec_rgr";

_man9 addMagazine "2Rnd_12Gauge_Pellets";
_man9 addWeapon "sgun_HunterShotgun_01_F";

_man9 addItemToVest "FirstAidKit";
		
_man9 call setMissionSkill;
_man9 addRating 1e11;
_man9 spawn refillPrimaryAmmo;
_man9 addEventHandler ["Killed", server_playerDied];

// Soldier10 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man10 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man10;
sleep 0.1; 
_man10 addHeadgear "G_WirelessEarpiece_F";
_man10 addGoggles "G_Balaclava_oli";
_man10 addUniform "U_I_C_Soldier_Para_5_F";
_man10 addVest "V_PlateCarrierSpec_rgr";

_man10 addMagazine "2Rnd_12Gauge_Pellets";
_man10 addWeapon "sgun_HunterShotgun_01_F";

_man10 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man10 addItemToVest "2Rnd_12Gauge_Slug";};
		
_man10 call setMissionSkill;
_man10 addRating 1e11;
_man10 spawn refillPrimaryAmmo;
_man10 addEventHandler ["Killed", server_playerDied];

// Soldier11 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man11 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man11;
sleep 0.1; 
_man11 addHeadgear "H_ShemagOpen_khk";
_man11 addGoggles "G_WirelessEarpiece_F";
_man11 addUniform "U_I_C_Soldier_Bandit_3_F";
_man11 addVest "V_TacVest_brn";

_man11 addMagazine "30Rnd_762x39_Mag_Tracer_F";
_man11 addWeapon "arifle_AKM_F";

_man11 addItemToVest "FirstAidKit";
		
_man11 call setMissionSkill;
_man11 addRating 1e11;
_man11 spawn refillPrimaryAmmo;
_man11 addEventHandler ["Killed", server_playerDied];

// Soldier12 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man12 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man12;
sleep 0.1; 
_man12 addHeadgear "H_ShemagOpen_khk";
_man12 addGoggles "G_WirelessEarpiece_F";
_man12 addUniform "U_I_C_Soldier_Bandit_3_F";
_man12 addVest "V_TacVest_brn";

_man12 addMagazine "30Rnd_762x39_Mag_Tracer_F";
_man12 addWeapon "arifle_AKM_F";

_man12 addItemToVest "FirstAidKit";
		
_man12 call setMissionSkill;
_man12 addRating 1e11;
_man12 spawn refillPrimaryAmmo;
_man12 addEventHandler ["Killed", server_playerDied];

// Soldier13 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man13 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man13;
sleep 0.1; 
_man13 addHeadgear "H_ShemagOpen_khk";
_man13 addGoggles "G_WirelessEarpiece_F";
_man13 addUniform "U_I_C_Soldier_Bandit_3_F";
_man13 addVest "V_TacVest_brn";

_man13 addMagazine "30Rnd_762x39_Mag_Tracer_F";
_man13 addWeapon "arifle_AKM_F";

_man13 addItemToVest "FirstAidKit";
		
_man13 call setMissionSkill;
_man13 addRating 1e11;
_man13 spawn refillPrimaryAmmo;
_man13 addEventHandler ["Killed", server_playerDied];

// Soldier14 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man14 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man14;
sleep 0.1; 
_man14 addHeadgear "H_ShemagOpen_khk";
_man14 addGoggles "G_WirelessEarpiece_F";
_man14 addUniform "U_I_C_Soldier_Bandit_3_F";
_man14 addVest "V_TacVest_brn";

_man14 addMagazine "30Rnd_762x39_Mag_Tracer_F";
_man14 addWeapon "arifle_AKM_F";

_man14 addItemToVest "FirstAidKit";
		
_man14 call setMissionSkill;
_man14 addRating 1e11;
_man14 spawn refillPrimaryAmmo;
_man14 addEventHandler ["Killed", server_playerDied];

// Soldier15 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man15 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man15;
sleep 0.1; 
_man15 addHeadgear "G_WirelessEarpiece_F";
_man15 addGoggles "G_Balaclava_oli";
_man15 addUniform "U_I_C_Soldier_Para_5_F";
_man15 addVest "V_PlateCarrierSpec_rgr";

_man15 addMagazine "2Rnd_12Gauge_Pellets";
_man15 addWeapon "sgun_HunterShotgun_01_F";

_man15 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man15 addItemToVest "2Rnd_12Gauge_Slug";};
		
_man15 call setMissionSkill;
_man15 addRating 1e11;
_man15 spawn refillPrimaryAmmo;
_man15 addEventHandler ["Killed", server_playerDied];

_leader = leader _group;
[_group, _pos] call defendArea;
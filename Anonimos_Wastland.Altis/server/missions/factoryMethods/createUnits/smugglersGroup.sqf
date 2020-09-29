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
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_leader linkItem "NVGoggles";
_leader addHeadgear "H_Cap_blk_CMMG";
_leader addGoggles "G_WirelessEarpiece_F";
_leader addUniform "U_I_G_resistanceLeader_F";
_leader addVest "V_PlateCarrierGL_blk";

_leader addMagazine "30Rnd_762x39_AK12_Mag_Tracer_F";
_leader addWeapon "arifle_AK12_F";
_leader addPrimaryWeaponItem "optic_NVS";
_leader addPrimaryWeaponItem "muzzle_snds_B";
_leader addPrimaryWeaponItem "acc_flashlight";

_leader addMagazines ["SmokeShell", 2];
_leader addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_leader addItemToVest "HandGrenade";};

_leader enablegunlights "forceOn";		
_leader call setMissionSkill;
_leader addRating 1e11;
_leader spawn refillPrimaryAmmo;
_leader addEventHandler ["Killed", server_playerDied];


// Soldier2 - AT-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man2 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man2;
sleep 0.1; 
_man2 addHeadgear "H_Bandanna_gry";
_man2 addGoggles "G_Aviator";
_man2 addUniform "U_I_C_Soldier_Bandit_2_F";
_man2 addVest "V_Chestrig_blk";
_man2 addBackpack "B_Kitbag_cbr_Bandit_2_F";


_man2 addMagazine "30Rnd_9x21_Yellow_Mag";
_man2 addWeapon "hgun_PDW2000_F";
_man2 addPrimaryWeaponItem "muzzle_snds_L";
_man2 addPrimaryWeaponItem "optic_Aco_smg";

_man2 addMagazine "MRAWS_HEAT_F";
_man2 addWeapon "launch_MRAWS_green_rail_F";
for "_i" from 1 to 2 do {_man2 addItemToBackpack "MRAWS_HEAT_F";};
for "_i" from 1 to 2 do {_man2 addItemToBackpack "MRAWS_HE_F";};
for "_i" from 1 to 2 do {_man2 addItemToBackpack "MRAWS_HEAT55_F";};

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
_man3 addHeadgear "H_Cap_headphones";
_man3 addGoggles "G_Sport_Blackred";
_man3 addUniform "U_B_CTRG_2";
_man3 addVest "V_Chestrig_khk";
_man3 addBackpack "B_FieldPack_cbr";

_man3 addMagazine "30Rnd_762x39_AK12_Mag_Tracer_F";
_man3 addWeapon "arifle_AKM_F";

_man3 addMagazine "Titan_AA";
_man3 addWeapon "launch_B_Titan_F";
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
_man4 addHeadgear "H_MilCap_gry";
_man4 addGoggles "G_Sport_Blackyellow";
_man4 addUniform "U_I_C_Soldier_Bandit_3_F"; 
_man4 addVest "V_Chestrig_khk";

_man4 addMagazine "30Rnd_556x45_Stanag_green";
_man4 addWeapon "arifle_SPAR_01_GL_blk_F";
_man4 addPrimaryWeaponItem "optic_Holosight_blk_F";
_man4 addPrimaryWeaponItem "acc_flashlight";

_man4 addMagazines ["SmokeShell", 2];
_man4 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man4 addItemToVest "1Rnd_HE_Grenade_shell";};

_man4 enablegunlights "forceOn";		
_man4 call setMissionSkill;
_man4 addRating 1e11;
_man4 spawn refillPrimaryAmmo;
_man4 addEventHandler ["Killed", server_playerDied];


// Soldier5 GL-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man5 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man5;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man5 addHeadgear "H_EarProtectors_black_F";
_man5 addGoggles "G_Shades_Black";
_man5 addUniform "U_I_C_Soldier_Bandit_2_F";
_man5 addVest "V_TacVest_camo";

_man5 addMagazine "30Rnd_65x39_caseless_msbs_mag_Tracer";
_man5 addWeapon "arifle_MSBS65_GL_sand_F";
_man5 addPrimaryWeaponItem "optic_Holosight";

_man5 addMagazines ["SmokeShell", 2];
_man5 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man5 addItemToVest "1Rnd_HE_Grenade_shell";};
		
_man5 call setMissionSkill;
_man5 addRating 1e11;
_man5 spawn refillPrimaryAmmo;
_man5 addEventHandler ["Killed", server_playerDied];


// Soldier6 SNIPER-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man6 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man6;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man6 addHeadgear "H_Watchcap_camo";
_man6 addGoggles "G_WirelessEarpiece_F";
_man6 addUniform "U_B_CTRG_Soldier_urb_3_F";
_man6 addVest "V_Pocketed_olive_F";

_man6 addMagazine "30Rnd_65x39_caseless_green_mag_Tracer";
_man6 addWeapon "arifle_ARX_blk_F";
_man6 addPrimaryWeaponItem "optic_NVS";
_man6 addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
_man6 addPrimaryWeaponItem "bipod_01_F_blk";

_man6 addMagazines ["SmokeShell", 2];
_man6 addItemToVest "FirstAidKit";
for "_i" from 1 to 3 do {_man6 addItemToVest "10Rnd_50BW_Mag_F";};
		
_man6 call setMissionSkill;
_man6 addRating 1e11;
_man6 spawn refillPrimaryAmmo;
_man6 addEventHandler ["Killed", server_playerDied];

// Soldier7 CB-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man7 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man7;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man7 addHeadgear "H_WirelessEarpiece_F";
_man7 addGoggles "G_Tactical_Black";
_man7 addUniform "U_I_C_Soldier_Para_1_F";
_man7 addVest "V_PlateCarrier1_rgr";

_man7 addMagazine "200Rnd_556x45_Box_Tracer_F";
_man7 addWeapon "LMG_03_F";

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
sleep 0.1; 
_man8 addHeadgear "G_WirelessEarpiece_F";
_man8 addGoggles "G_WirelessEarpiece_F";
_man8 addUniform "U_I_C_Soldier_Bandit_5_F";
_man8 addVest "V_Rangemaster_belt";

_man8 addMagazine "30Rnd_545x39_Mag_Green_F";
_man8 addWeapon "arifle_AKS_F";

_man8 addMagazines ["SmokeShell", 2];
_man8 addItemToVest "FirstAidKit";

_man8 call setMissionSkill;
_man8 addRating 1e11;
_man8 spawn refillPrimaryAmmo;
_man8 addEventHandler ["Killed", server_playerDied];

// Soldier9 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man9 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man9;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man9 addHeadgear "G_WirelessEarpiece_F";
_man9 addGoggles "G_WirelessEarpiece_F";
_man9 addUniform "U_I_C_Soldier_Bandit_1_F";
_man9 addVest "V_TacVestIR_blk";

_man9 addMagazine "30Rnd_762x39_AK12_Mag_Tracer_F";
_man9 addWeapon "arifle_AK12U_F";
_man9 addPrimaryWeaponItem "optic_Holosight_blk_F";
_man9 addPrimaryWeaponItem "acc_flashlight";

_man9 addMagazines ["SmokeShell", 2];
_man9 addItemToVest "FirstAidKit";

_man9 enablegunlights "forceOn";		
_man9 call setMissionSkill;
_man9 addRating 1e11;
_man9 spawn refillPrimaryAmmo;
_man9 addEventHandler ["Killed", server_playerDied];

// Soldier10 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man10 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man10;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man10 linkItem "NVGoggles";
_man10 addHeadgear "H_HelmetSpecB";
_man10 addGoggles "G_Balaclava_combat";
_man10 addUniform "U_I_L_Uniform_01_deserter_F";
_man10 addVest "V_HarnessO_gry";

_man10 addMagazine "50Rnd_570x28_SMG_03";
_man10 addWeapon "SMG_03_TR_hex";
_man10 addPrimaryWeaponItem "optic_MRCO";
_man10 addPrimaryWeaponItem "muzzle_snds_570";

_man10 addMagazines ["SmokeShell", 2];
_man10 addItemToVest "FirstAidKit";
	
_man10 call setMissionSkill;
_man10 addRating 1e11;
_man10 spawn refillPrimaryAmmo;
_man10 addEventHandler ["Killed", server_playerDied];

// Soldier11 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man11 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man11;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man11 addHeadgear "G_WirelessEarpiece_F";
_man11 addGoggles "G_WirelessEarpiece_F";
_man11 addUniform "U_I_C_Soldier_Bandit_1_F";
_man11 addVest "V_BandollierB_cbr";

_man11 addMagazine "2Rnd_12Gauge_Pellets";
_man11 addWeapon "sgun_HunterShotgun_01_sawedoff_F";

_man11 addMagazines ["SmokeShell", 2];
_man11 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man11 addItemToVest "2Rnd_12Gauge_Slug";};

		
_man11 call setMissionSkill;
_man11 addRating 1e11;
_man11 spawn refillPrimaryAmmo;
_man11 addEventHandler ["Killed", server_playerDied];

// Soldier12 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man12 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man12;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man12 addHeadgear "H_Cap_Black_IDAP_F";
_man12 addGoggles "G_WirelessEarpiece_F";
_man12 addUniform "U_C_E_LooterJacket_01_F";
_man12 addVest "V_TacVestIR_blk";
_man12 addBackpack "B_Kitbag_cbr_Bandit_2_F";

_man12 addMagazine "50Rnd_570x28_SMG_03";
_man12 addWeapon "SMG_03C_khaki";
_man12 addPrimaryWeaponItem "muzzle_snds_570";

_man12 addMagazine "MRAWS_HEAT_F";
_man12 addWeapon "launch_MRAWS_green_rail_F";
for "_i" from 1 to 2 do {_man12 addItemToBackpack "MRAWS_HEAT_F";};
for "_i" from 1 to 2 do {_man12 addItemToBackpack "MRAWS_HE_F";};
for "_i" from 1 to 2 do {_man12 addItemToBackpack "MRAWS_HEAT55_F";};

_man12 addMagazines ["SmokeShell", 2];
_man12 addItemToVest "FirstAidKit";
		
_man12 call setMissionSkill;
_man12 addRating 1e11;
_man12 spawn refillPrimaryAmmo;
_man12 addEventHandler ["Killed", server_playerDied];

// Soldier13 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man13 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man13;
sleep 0.1; 
_man13 addHeadgear "H_Cap_brn_SPECOPS";
_man13 addGoggles "G_WirelessEarpiece_F";
_man13 addUniform "U_OrestesBody";
_man13 addVest "V_BandollierB_rgr";

_man13 addMagazine "30Rnd_45ACP_Mag_SMG_01_Tracer_Green";
_man13 addWeapon "SMG_01_F";
_man13 addPrimaryWeaponItem "muzzle_snds_acp";

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
_man14 addHeadgear "G_WirelessEarpiece_F";
_man14 addGoggles "G_Lady_Blue";
_man14 addUniform "U_I_L_Uniform_01_tshirt_skull_F";

_man14 addMagazine "10Rnd_Mk14_762x51_Mag";
_man14 addWeapon "srifle_DMR_06_hunter_F";

_man14 addItemToVest "FirstAidKit";
	
_man14 call setMissionSkill;
_man14 addRating 1e11;
_man14 spawn refillPrimaryAmmo;
_man14 addEventHandler ["Killed", server_playerDied];

// Soldier15 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man15 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man15;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man15 addHeadgear "H_ShemagOpen_tan";
_man15 addGoggles "G_WirelessEarpiece_F";
_man15 addUniform "U_I_C_Soldier_Para_4_F";
_man15 addVest "V_PlateCarrierL_CTRG";

_man15 addMagazine "130Rnd_338_Mag";
_man15 addWeapon "MMG_02_black_F";

_man15 addMagazines ["SmokeShell", 2];
_man15 addItemToVest "FirstAidKit";
		
_man15 call setMissionSkill;
_man15 addRating 1e11;
_man15 spawn refillPrimaryAmmo;
_man15 addEventHandler ["Killed", server_playerDied];

_leader = leader _group;
[_group, _pos] call defendArea;
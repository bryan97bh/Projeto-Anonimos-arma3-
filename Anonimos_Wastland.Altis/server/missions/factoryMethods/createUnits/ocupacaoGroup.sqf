//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 21:58
//	@file Args:

if (!isServer) exitWith {};

private ["_group", "_pos", "_leader", "_man2", "_man3", "_man4", "_man5", "_man6", "_man7", "_man8", "_man9", "_man10"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

// Leader
_leader = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _leader;
sleep 0.1;
_leader addHeadgear "H_Beret_CSAT_01_F";
_leader addGoggles "G_WirelessEarpiece_F";
_leader addUniform "U_O_R_Gorka_01_black_F";
_leader addVest "V_PlateCarrierSpec_blk";

_leader addMagazine "30Rnd_556x45_Stanag_red";
_leader addWeapon "arifle_SPAR_01_blk_F";
_leader addPrimaryWeaponItem "optic_Arco_AK_blk_F";
_leader addPrimaryWeaponItem "muzzle_snds_M";
_leader addPrimaryWeaponItem "acc_pointer_IR";

_leader addMagazines ["SmokeShell", 2];
_leader addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_leader addItemToVest "HandGrenade";};

_leader enablegunlights "forceOn";		
_leader call setMissionSkill;
_leader addRating 1e11;
_leader spawn refillPrimaryAmmo;
_leader addEventHandler ["Killed", server_playerDied];


// Soldier2 - AT
_man2 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man2;
sleep 0.1; 
_man2 addHeadgear "H_Beret_02";
_man2 addGoggles "G_Bandanna_blk";
_man2 addUniform "U_O_R_Gorka_01_black_F";
_man2 addVest "V_PlateCarrier2_blk";
_man2 addBackpack "B_ViperHarness_blk_F";

_man2 addMagazine "30Rnd_556x45_Stanag_red";
_man2 addWeapon "arifle_SPAR_01_blk_F";
_man2 addPrimaryWeaponItem "optic_Aco";

_man2 addMagazine "NLAW_F";
_man2 addWeapon "launch_NLAW_F";
for "_i" from 1 to 2 do {_man2 addItemToBackpack "NLAW_F";};

_man2 addMagazines ["SmokeShell", 2];
_man2 addItemToVest "FirstAidKit";
		
_man2 call setMissionSkill;
_man2 addRating 1e11;
_man2 spawn refillPrimaryAmmo;
_man2 addEventHandler ["Killed", server_playerDied];

// Soldier3 - AA
_man3 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man3;
sleep 0.1; 
_man3 addHeadgear "H_Beret_02";
_man3 addGoggles "G_Bandanna_blk";
_man3 addUniform "U_O_R_Gorka_01_black_F";
_man3 addVest "V_PlateCarrier2_blk";
_man3 addBackpack "B_ViperHarness_blk_F";

_man3 addMagazine "30Rnd_556x45_Stanag_red";
_man3 addWeapon "arifle_SPAR_01_blk_F";
_man3 addPrimaryWeaponItem "optic_Aco";

_man3 addMagazine "Titan_AA";
_man3 addWeapon "launch_B_Titan_olive_F";
for "_i" from 1 to 2 do {_man3 addItemToBackpack "Titan_AA";};

_man3 addMagazines ["SmokeShell", 2];
_man3 addItemToVest "FirstAidKit";
		
_man3 call setMissionSkill;
_man3 addRating 1e11;
_man3 spawn refillPrimaryAmmo;
_man3 addEventHandler ["Killed", server_playerDied];

// Soldier4 GL
_man4 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man4;
sleep 0.1; 
_man4 linkItem "NVGoggles_OPFOR";
_man4 addHeadgear "H_PASGT_basic_black_F";
_man4 addGoggles "G_Balaclava_TI_blk_F";
_man4 addUniform "U_O_R_Gorka_01_black_F";
_man4 addVest "V_PlateCarrier2_blk";

_man4 addMagazine "30Rnd_556x45_Stanag_red";
_man4 addWeapon "arifle_SPAR_01_GL_blk_F";
_man4 addPrimaryWeaponItem "optic_Holosight_blk_F";

_man4 addMagazines ["SmokeShell", 2];
_man4 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man4 addItemToVest "1Rnd_HE_Grenade_shell";};
		
_man4 call setMissionSkill;
_man4 addRating 1e11;
_man4 spawn refillPrimaryAmmo;
_man4 addEventHandler ["Killed", server_playerDied];


// Soldier5 GL
_man5 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man5;
sleep 0.1;
_man5 linkItem "NVGoggles_OPFOR";
_man5 addHeadgear "H_PASGT_basic_black_F";
_man5 addGoggles "G_Balaclava_TI_blk_F";
_man5 addUniform "U_O_R_Gorka_01_black_F";
_man5 addVest "V_PlateCarrier2_blk";

_man5 addMagazine "30Rnd_556x45_Stanag_red";
_man5 addWeapon "arifle_SPAR_01_GL_blk_F";
_man5 addPrimaryWeaponItem "optic_Holosight_blk_F";

_man5 addMagazines ["SmokeShell", 2];
_man5 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man5 addItemToVest "1Rnd_HE_Grenade_shell";};
		
_man5 call setMissionSkill;
_man5 addRating 1e11;
_man5 spawn refillPrimaryAmmo;
_man5 addEventHandler ["Killed", server_playerDied];


// Soldier6 SNIPER
_man6 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man6;
sleep 0.1;
_man6 addHeadgear "H_Watchcap_blk";
_man6 addGoggles "G_Bandanna_beast";
_man6 addUniform "U_O_R_Gorka_01_black_F";
_man6 addVest "V_PlateCarrier2_blk";

_man6 addMagazine "20Rnd_762x51_Mag";
_man6 addWeapon "arifle_SPAR_03_blk_F";
_man6 addPrimaryWeaponItem "optic_AMS";
_man6 addPrimaryWeaponItem "muzzle_snds_B";
_man6 addPrimaryWeaponItem "bipod_01_F_blk";

_man6 addMagazines ["SmokeShell", 2];
_man6 addItemToVest "FirstAidKit";
		
_man6 call setMissionSkill;
_man6 addRating 1e11;
_man6 spawn refillPrimaryAmmo;
_man6 addEventHandler ["Killed", server_playerDied];

// Soldier7 CB
_man7 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man7;
sleep 0.1; 
_man7 addHeadgear "H_Beret_Colonel";
_man7 addGoggles "G_WirelessEarpiece_F";
_man7 addUniform "U_O_R_Gorka_01_black_F";
_man7 addVest "V_PlateCarrier2_blk";

_man7 addMagazine "150Rnd_556x45_Drum_Mag_Tracer_F";
_man7 addWeapon "arifle_SPAR_02_blk_F";
_man7 addPrimaryWeaponItem "optic_MRCO";
_man7 addPrimaryWeaponItem "bipod_01_F_blk";

_man7 addMagazines ["SmokeShell", 2];
_man7 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man7 addItemToVest "HandGrenade";};
		
_man7 call setMissionSkill;
_man7 addRating 1e11;
_man7 spawn refillPrimaryAmmo;
_man7 addEventHandler ["Killed", server_playerDied];

// Soldier8 SD
_man8 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man8;
sleep 0.1;
_man8 addHeadgear "H_Beret_Colonel";
_man8 addGoggles "G_WirelessEarpiece_F";
_man8 addUniform "U_O_R_Gorka_01_black_F";
_man8 addVest "V_PlateCarrier2_blk";

_man8 addMagazine "30Rnd_556x45_Stanag_red";
_man8 addWeapon "arifle_SPAR_01_blk_F";
_man8 addPrimaryWeaponItem "acc_flashlight";

_man8 addMagazines ["SmokeShell", 2];
_man8 addItemToVest "FirstAidKit";

_man8 enablegunlights "forceOn";		
_man8 call setMissionSkill;
_man8 addRating 1e11;
_man8 spawn refillPrimaryAmmo;
_man8 addEventHandler ["Killed", server_playerDied];

// Soldier9 SD
_man9 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man9;
sleep 0.1; 
_man9 addHeadgear "H_Beret_Colonel";
_man9 addGoggles "G_WirelessEarpiece_F";
_man9 addUniform "U_O_R_Gorka_01_black_F";
_man9 addVest "V_PlateCarrier2_blk";

_man9 addMagazine "30Rnd_556x45_Stanag_red";
_man9 addWeapon "arifle_SPAR_01_blk_F";
_man9 addPrimaryWeaponItem "acc_flashlight";

_man9 addMagazines ["SmokeShell", 2];
_man9 addItemToVest "FirstAidKit";

_man9 enablegunlights "forceOn";		
_man9 call setMissionSkill;
_man9 addRating 1e11;
_man9 spawn refillPrimaryAmmo;
_man9 addEventHandler ["Killed", server_playerDied];

// Soldier10  SD
_man10 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man10;
sleep 0.1; 
_man10 addHeadgear "H_Beret_Colonel";
_man10 addGoggles "G_WirelessEarpiece_F";
_man10 addUniform "U_O_R_Gorka_01_black_F";
_man10 addVest "V_PlateCarrier2_blk";

_man10 addMagazine "30Rnd_556x45_Stanag_red";
_man10 addWeapon "arifle_SPAR_01_blk_F";
_man10 addPrimaryWeaponItem "acc_flashlight";

_man10 addMagazines ["SmokeShell", 2];
_man10 addItemToVest "FirstAidKit";

_man10 enablegunlights "forceOn";		
_man10 call setMissionSkill;
_man10 addRating 1e11;
_man10 spawn refillPrimaryAmmo;
_man10 addEventHandler ["Killed", server_playerDied];

_leader = leader _group;
[_group, _pos] call defendArea;
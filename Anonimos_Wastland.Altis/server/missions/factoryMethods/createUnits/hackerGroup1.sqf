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
sleep 0.1; 
_leader linkItem "NVGoggles";
_leader addHeadgear "H_HelmetB_desert";
_leader addGoggles "G_Tactical_Black";
_leader addUniform "U_B_CombatUniform_mcam_vest";
_leader addVest "V_PlateCarrierGL_mtp";

_leader addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_leader addWeapon "arifle_MX_F";
_leader addPrimaryWeaponItem "muzzle_snds_H_snd_F";
_leader addPrimaryWeaponItem "acc_pointer_IR";
_leader addPrimaryWeaponItem "optic_ERCO_snd_F";

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
_man2 linkItem "NVGoggles";
_man2 addHeadgear "H_HelmetB_desert";
_man2 addGoggles "G_Combat";
_man2 addUniform "U_B_CombatUniform_mcam";
_man2 addVest "V_PlateCarrier1_rgr";
_man2 addBackpack "B_AssaultPack_khk";

_man2 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man2 addWeapon "arifle_MXC_F";
_man2 addPrimaryWeaponItem "optic_Holosight";

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
sleep 0.1; 
_man3 linkItem "NVGoggles";
_man3 addHeadgear "H_HelmetB_desert";
_man3 addGoggles "G_Combat";
_man3 addUniform "U_B_CombatUniform_mcam_vest";
_man3 addVest "V_PlateCarrier1_rgr";
_man3 addBackpack "B_FieldPack_cbr";

_man3 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man3 addWeapon "arifle_MXC_F";
_man3 addPrimaryWeaponItem "optic_Holosight";

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
sleep 0.1; 
_man4 addHeadgear "H_HelmetB_desert";
_man4 addGoggles "G_Combat";
_man4 addUniform "U_B_CombatUniform_mcam_vest";
_man4 addVest "V_PlateCarrier1_rgr";

_man4 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man4 addWeapon "arifle_MX_GL_F";
_man4 addPrimaryWeaponItem "optic_Aco";

_man4 addMagazines ["SmokeShell", 2];
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
_man5 addHeadgear "H_HelmetB_desert";
_man5 addGoggles "G_Combat";
_man5 addUniform "U_B_CombatUniform_mcam_vest";
_man5 addVest "V_PlateCarrier1_rgr";

_man5 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man5 addWeapon "arifle_MX_GL_F";
_man5 addPrimaryWeaponItem "optic_Aco";

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
sleep 0.1; 
_man6 addHeadgear "H_HelmetB_desert";
_man6 addGoggles "G_Combat";
_man6 addUniform "U_B_CombatUniform_mcam_vest";
_man6 addVest "V_PlateCarrier1_rgr";

_man6 addMagazine "20Rnd_762x51_Mag";
_man6 addWeapon "srifle_DMR_03_tan_F";
_man6 addPrimaryWeaponItem "muzzle_snds_B_snd_F";
_man6 addPrimaryWeaponItem "optic_AMS_snd";
_man6 addPrimaryWeaponItem "bipod_01_F_snd";

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
_man7 addHeadgear "H_HelmetB_desert";
_man7 addGoggles "G_Combat";
_man7 addUniform "U_B_CombatUniform_mcam_vest";
_man7 addVest "V_PlateCarrier1_rgr";

_man7 addMagazine "130Rnd_338_Mag";
_man7 addWeapon "MMG_02_sand_F";
_man7 addPrimaryWeaponItem "optic_ERCO_snd_F";
_man7 addPrimaryWeaponItem "bipod_01_F_snd";

_man7 addItemToVest "FirstAidKit";
		
_man7 call setMissionSkill;
_man7 addRating 1e11;
_man7 spawn refillPrimaryAmmo;
_man7 addEventHandler ["Killed", server_playerDied];

// Soldier8 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man8 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man8;
sleep 0.1; 
_man8 addHeadgear "H_HelmetB_desert";
_man8 addGoggles "G_Combat";
_man8 addUniform "U_B_CombatUniform_mcam_vest";
_man8 addVest "V_PlateCarrier1_rgr";

_man8 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man8 addWeapon "arifle_MX_F";
_man8 addPrimaryWeaponItem "acc_flashlight";

_man8 enablegunlights "forceOn";
_man8 addMagazines ["SmokeShell", 2];
_man8 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man8 addItemToVest "HandGrenade";};
		
_man8 call setMissionSkill;
_man8 addRating 1e11;
_man8 spawn refillPrimaryAmmo;
_man8 addEventHandler ["Killed", server_playerDied];

// Soldier9 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man9 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man9;
sleep 0.1; 
_man9 addHeadgear "H_HelmetB_desert";
_man9 addGoggles "G_Combat";
_man9 addUniform "U_B_CombatUniform_mcam_vest";
_man9 addVest "V_PlateCarrier1_rgr";

_man9 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man9 addWeapon "arifle_MX_F";
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
sleep 0.1; 
_man10 addHeadgear "H_HelmetB_desert";
_man10 addGoggles "G_Combat";
_man10 addUniform "U_B_CombatUniform_mcam_vest";
_man10 addVest "V_PlateCarrier1_rgr";

_man10 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man10 addWeapon "arifle_MX_F";
_man10 addPrimaryWeaponItem "acc_flashlight";

_man10 addMagazines ["SmokeShell", 2];
_man10 addItemToVest "FirstAidKit";
		
_man10 enablegunlights "forceOn";
_man10 call setMissionSkill;
_man10 addRating 1e11;
_man10 spawn refillPrimaryAmmo;
_man10 addEventHandler ["Killed", server_playerDied];

//Soldier11-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man11 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man11;
sleep 0.1; 
_man11 linkItem "NVGoggles";
_man11 addHeadgear "H_HelmetB_desert";
_man11 addGoggles "G_Tactical_Black";
_man11 addUniform "U_B_CombatUniform_mcam_vest";
_man11 addVest "V_PlateCarrierGL_mtp";

_man11 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man11 addWeapon "arifle_MX_F";
_man11 addPrimaryWeaponItem "muzzle_snds_H_snd_F";
_man11 addPrimaryWeaponItem "acc_pointer_IR";
_man11 addPrimaryWeaponItem "optic_ERCO_snd_F";

_man11 addMagazines ["SmokeShell", 2];
_man11 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man11 addItemToVest "HandGrenade";};

_man11 enablegunlights "forceOn";		
_man11 call setMissionSkill;
_man11 addRating 1e11;
_man11 spawn refillPrimaryAmmo;
_man11 addEventHandler ["Killed", server_playerDied];

// Soldier12 - AT-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man12 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man12;
sleep 0.1; 
_man12 linkItem "NVGoggles";
_man12 addHeadgear "H_HelmetB_desert";
_man12 addGoggles "G_Combat";
_man12 addUniform "U_B_CombatUniform_mcam";
_man12 addVest "V_PlateCarrier1_rgr";
_man12 addBackpack "B_AssaultPack_khk";

_man12 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man12 addWeapon "arifle_MXC_F";
_man12 addPrimaryWeaponItem "optic_Holosight";

_man12 addMagazine "Titan_AT";
_man12 addWeapon "launch_B_Titan_short_F";
for "_i" from 1 to 1 do {_man12 addItemToBackpack "Titan_AT";};
for "_i" from 1 to 1 do {_man12 addItemToBackpack "Titan_AP";};

_man12 addMagazines ["SmokeShell", 2];
_man12 addItemToVest "FirstAidKit";
		
_man12 call setMissionSkill;
_man12 addRating 1e11;
_man12 spawn refillPrimaryAmmo;
_man12 addEventHandler ["Killed", server_playerDied];

// Soldier13 - AA-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man13 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man13;
sleep 0.1; 
_man13 linkItem "NVGoggles";
_man13 addHeadgear "H_HelmetB_desert";
_man13 addGoggles "G_Combat";
_man13 addUniform "U_B_CombatUniform_mcam_vest";
_man13 addVest "V_PlateCarrier1_rgr";
_man13 addBackpack "B_FieldPack_cbr";

_man13 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man13 addWeapon "arifle_MXC_F";
_man13 addPrimaryWeaponItem "optic_Holosight";

_man13 addMagazine "Titan_AA";
_man13 addWeapon "launch_B_Titan_F";
for "_i" from 1 to 2 do {_man13 addItemToBackpack "Titan_AA";};

_man13 addMagazines ["SmokeShell", 2];
_man13 addItemToVest "FirstAidKit";
		
_man13 call setMissionSkill;
_man13 addRating 1e11;
_man13 spawn refillPrimaryAmmo;
_man13 addEventHandler ["Killed", server_playerDied];

// Soldier14 GL-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man14 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man14;
sleep 0.1; 
_man14 addHeadgear "H_HelmetB_desert";
_man14 addGoggles "G_Combat";
_man14 addUniform "U_B_CombatUniform_mcam_vest";
_man14 addVest "V_PlateCarrier1_rgr";

_man14 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man14 addWeapon "arifle_MX_GL_F";
_man14 addPrimaryWeaponItem "optic_Aco";

_man14 addMagazines ["SmokeShell", 2];
_man14 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man14 addItemToVest "1Rnd_HE_Grenade_shell";};
		
_man14 call setMissionSkill;
_man14 addRating 1e11;
_man14 spawn refillPrimaryAmmo;
_man4 addEventHandler ["Killed", server_playerDied];

// Soldier5 GL-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man15 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man15;
sleep 0.1; 
_man15 addHeadgear "H_HelmetB_desert";
_man15 addGoggles "G_Combat";
_man15 addUniform "U_B_CombatUniform_mcam_vest";
_man15 addVest "V_PlateCarrier1_rgr";

_man15 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man15 addWeapon "arifle_MX_GL_F";
_man15 addPrimaryWeaponItem "optic_Aco";

_man15 addMagazines ["SmokeShell", 2];
_man15 addItemToVest "FirstAidKit";
for "_i" from 1 to 4 do {_man15 addItemToVest "1Rnd_HE_Grenade_shell";};
		
_man15 call setMissionSkill;
_man15 addRating 1e11;
_man15 spawn refillPrimaryAmmo;
_man15 addEventHandler ["Killed", server_playerDied];

// Soldier16 SNIPER-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man16 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man16;
sleep 0.1; 
_man16 addHeadgear "H_HelmetB_desert";
_man16 addGoggles "G_Combat";
_man16 addUniform "U_B_CombatUniform_mcam_vest";
_man16 addVest "V_PlateCarrier1_rgr";

_man16 addMagazine "20Rnd_762x51_Mag";
_man16 addWeapon "srifle_DMR_03_tan_F";
_man16 addPrimaryWeaponItem "muzzle_snds_B_snd_F";
_man16 addPrimaryWeaponItem "optic_AMS_snd";
_man16 addPrimaryWeaponItem "bipod_01_F_snd";

_man16 addMagazines ["SmokeShell", 2];
_man16 addItemToVest "FirstAidKit";
		
_man16 call setMissionSkill;
_man16 addRating 1e11;
_man16 spawn refillPrimaryAmmo;
_man16 addEventHandler ["Killed", server_playerDied];

// Soldier17 CB-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man17 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man17;
sleep 0.1; 
_man17 addHeadgear "H_HelmetB_desert";
_man17 addGoggles "G_Combat";
_man17 addUniform "U_B_CombatUniform_mcam_vest";
_man17 addVest "V_PlateCarrier1_rgr";

_man17 addMagazine "130Rnd_338_Mag";
_man17 addWeapon "MMG_02_sand_F";
_man17 addPrimaryWeaponItem "optic_ERCO_snd_F";
_man17 addPrimaryWeaponItem "bipod_01_F_snd";

_man17 addItemToVest "FirstAidKit";
		
_man17 call setMissionSkill;
_man17 addRating 1e11;
_man17 spawn refillPrimaryAmmo;
_man17 addEventHandler ["Killed", server_playerDied];

// Soldier18 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man18 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man18;
sleep 0.1; 
_man18 addHeadgear "H_HelmetB_desert";
_man18 addGoggles "G_Combat";
_man18 addUniform "U_B_CombatUniform_mcam_vest";
_man18 addVest "V_PlateCarrier1_rgr";

_man18 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man18 addWeapon "arifle_MX_F";
_man18 addPrimaryWeaponItem "acc_flashlight";

_man18 enablegunlights "forceOn";
_man18 addMagazines ["SmokeShell", 2];
_man18 addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_man18 addItemToVest "HandGrenade";};
		
_man18 call setMissionSkill;
_man18 addRating 1e11;
_man18 spawn refillPrimaryAmmo;
_man18 addEventHandler ["Killed", server_playerDied];

// Soldier19 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man19 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man19;
sleep 0.1; 
_man19 addHeadgear "H_HelmetB_desert";
_man19 addGoggles "G_Combat";
_man19 addUniform "U_B_CombatUniform_mcam_vest";
_man19 addVest "V_PlateCarrier1_rgr";

_man19 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man19 addWeapon "arifle_MX_F";
_man19 addPrimaryWeaponItem "acc_flashlight";

_man19 addMagazines ["SmokeShell", 2];
_man19 addItemToVest "FirstAidKit";
		
_man19 enablegunlights "forceOn";
_man19 call setMissionSkill;
_man19 addRating 1e11;
_man19 spawn refillPrimaryAmmo;
_man19 addEventHandler ["Killed", server_playerDied];

// Soldier20 SD-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_man20 = _group createUnit ["C_man_1", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man20;
sleep 0.1; 
_man20 addHeadgear "H_HelmetB_desert";
_man20 addGoggles "G_Combat";
_man20 addUniform "U_B_CombatUniform_mcam_vest";
_man20 addVest "V_PlateCarrier1_rgr";

_man20 addMagazine "30Rnd_65x39_caseless_mag_Tracer";
_man20 addWeapon "arifle_MX_F";
_man20 addPrimaryWeaponItem "acc_flashlight";

_man20 addMagazines ["SmokeShell", 2];
_man20 addItemToVest "FirstAidKit";
		
_man20 enablegunlights "forceOn";
_man20 call setMissionSkill;
_man20 addRating 1e11;
_man20 spawn refillPrimaryAmmo;
_man20 addEventHandler ["Killed", server_playerDied];


_leader = leader _group;
[_group, _pos] call defendArea;
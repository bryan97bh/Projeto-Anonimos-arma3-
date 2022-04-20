// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: RespawnAI1.sqf
//	@file Author: Mazureik
//	@file Created: 17/01/2021 17:19

while {true} do {
private _LZ17 = selectRandom [
"Town_19","Town_20","Town_21"]; //cidade de respawn
_headgearTypes1 = 
[
	"H_Hat_Safari_olive_F", "H_Hat_Safari_sand_F",
    "H_Helmet_Skate", "H_Hat_Tinfoil_F",
    "H_Bandanna_gry", "H_Bandanna_blu", "H_Bandanna_cbr", "H_Bandanna_khk_hs", "H_Bandanna_khk", "H_Bandanna_mcamo", "H_Bandanna_sgg", "H_Bandanna_sand", "H_Bandanna_surfer", "H_Bandanna_surfer_blk", "H_Bandanna_surfer_grn", "H_Bandanna_camo",
	"H_Cap_grn_BI", "H_Cap_blk", "H_Cap_blu", "H_Cap_blk_CMMG", "H_Cap_grn", "H_Cap_blk_ION", "H_Cap_oli", "H_Cap_oli_hs", "H_Cap_police", "H_Cap_press", "H_Cap_red", "H_Cap_surfer", "H_Cap_tan", "H_Cap_khaki_specops_UK", "H_Cap_usblack", "H_Cap_tan_specops_US", "H_Cap_blk_Raven", "H_Cap_brn_SPECOPS", "H_Cap_headphones",
	"H_Beret_blk", "H_Beret_gen_F", "H_Beret_Colonel", "H_Beret_02",
	"H_MilCap_blue", "H_MilCap_gen_F", "H_MilCap_gry", "H_MilCap_ghex_F", "H_MilCap_ocamo", "H_MilCap_mcamo", "H_MilCap_tna_F", "H_MilCap_dgtl",
	"H_Booniehat_khk", "H_Booniehat_oli", "H_Booniehat_tan", "H_Booniehat_mcamo", "H_Booniehat_tna_F", "H_Booniehat_dgtl",
	"H_Shemag_olive", "H_ShemagOpen_tan", "H_Beret_Colonel", "H_ShemagOpen_khk",
	"H_Hat_blue", "H_Hat_brown", "H_Hat_camo", "H_Hat_checker", "H_Hat_grey", "H_Hat_tan"
];
_nvsTypes1 = 
[
	"O_NVGoggles_ghex_F", 
	"O_NVGoggles_hex_F", 
	"O_NVGoggles_urb_F", 
	"O_NVGoggles_grn_F",
	"NVGoggles", 
	"NVGoggles_OPFOR", 
	"NVGoggles_INDEP", 
	"NVGoggles_INDEP", 
	"NVGoggles_tna_F"
];
_GogglesTypes1 = 
[
	"G_Tactical_Clear", "G_Tactical_Black",
	"G_Aviator", "G_Lady_Blue", "G_Lady_Red", "G_Lady_Mirror", "G_Lady_Dark", "G_Lowprofile",
	"G_Sport_Red", "G_Sport_Blackyellow", "G_Sport_BlackWhite", "G_Sport_Checkered", "G_Sport_Blackred", "G_Sport_Greenblack", "G_Spectacles_Tinted", "G_Spectacles",
	"G_Squares_Tinted", "G_Squares",
	"G_Combat", "G_Combat_Goggles_tna_F",
	"G_EyeProtectors_F", "G_EyeProtectors_Earpiece_F",
	"G_Balaclava_blk", "G_Balaclava_oli",
	"G_Balaclava_lowprofile", "G_Balaclava_combat",
	"G_Bandanna_aviator", "G_Bandanna_shades", "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_tan",
	"G_Respirator_white_F", "G_Respirator_yellow_F", "G_Respirator_blue_F",
	"G_Balaclava_TI_blk_F", "G_Balaclava_TI_G_blk_F", "G_Balaclava_TI_tna_F", "G_Balaclava_TI_G_tna_F",
	"G_Blindfold_01_black_F", "G_Blindfold_01_white_F"
];
_uniformTypes1 = 
[
	"U_IG_Guerilla1_1",
	"U_IG_Guerilla2_1",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla2_3",
	"U_IG_Guerilla3_1",
	"U_IG_Guerilla3_2",
	"U_IG_Guerrilla_6_1",
	"U_IG_leader",
	"U_I_C_Soldier_Para_1_F",
	"U_I_C_Soldier_Para_2_F",
	"U_I_C_Soldier_Para_3_F",
	"U_I_C_Soldier_Para_4_F",
	"U_I_C_Soldier_Para_5_F",
	"U_I_C_Soldier_Camo_F"
];
_weaponTypes1 = 
[
"hgun_PDW2000_F",                                                              //SMG PDW2000
"SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora		
"SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
"SMG_05_F",                                                                    //SMG Protector Sub Metralhadora
"SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex",   //SMG ADR-97 TR
"arifle_AKS_F",
"sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F",
"arifle_AKM_F",
"hgun_PDW2000_F",                                                              //SMG PDW2000
"SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora		
"SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
"SMG_05_F",                                                                    //SMG Protector Sub Metralhadora
"SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex",   //SMG ADR-97 TR
"arifle_AKS_F",
"sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F",
"arifle_AKM_F",
"hgun_PDW2000_F",                                                              //SMG PDW2000
"SMG_01_F",                                                                    //SMG Vermin Sub Metralhadora		
"SMG_02_F",                                                                    //SMG Sting Sub Metralhadora
"SMG_05_F",                                                                    //SMG Protector Sub Metralhadora
"SMG_03C_TR_black", "SMG_03C_TR_camo", "SMG_03C_TR_khaki", "SMG_03C_TR_hex",   //SMG ADR-97 TR
"arifle_AKS_F",
"sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F",
"arifle_AKM_F",
"arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F",        //SPAR-16
"arifle_Mk20C_plain_F", "arifle_Mk20C_F",                                      //Carabina Mk20
"arifle_TRG20_F"
];
_vestTypes1 = 
[
	"V_SmershVest_01_F", "V_SmershVest_01_radio_F",
	"V_Pocketed_black_F", "V_Pocketed_coyote_F", "V_Pocketed_olive_F",
	"V_DeckCrew_blue_F", "V_DeckCrew_green_F", "V_DeckCrew_yellow_F", "V_DeckCrew_red_F", "V_DeckCrew_brown_F", "V_DeckCrew_violet_F", "V_DeckCrew_white_F",
	"V_BandollierB_cbr", "V_BandollierB_rgr", "V_BandollierB_khk", "V_BandollierB_oli", "V_BandollierB_ghex_F",
	"V_HarnessOGL_gry", "V_HarnessOGL_ghex_F",
	"V_Chestrig_khk", "V_Chestrig_rgr", "V_Chestrig_blk", "V_Chestrig_oli",
	"V_TacChestrig_cbr_F", "V_TacChestrig_grn_F", "V_TacChestrig_oli_F",
	"V_HarnessO_brn", "V_HarnessO_gry", "V_HarnessO_ghex_F",
	"V_TacVest_blk", "V_TacVest_brn", "V_TacVest_camo", "V_TacVest_khk", "V_TacVest_oli",
	"V_Press_F",
	"V_TacVest_blk_POLICE", "V_TacVest_gen_F"
];
_moneyTypes1 = 
[
	100,100,100,100,100,100,100,100,100,100,
	200,200,200,200,200,200,200,200,200,
	300,300,300,300,300,300,300,300,
	400,400,400,400,400,400,400,
	500,500,500,500,500,500,
	600,600,600,600,600,
	700,700,700,700,
	800,800,800,
	900,900,
	1000
];
_mkr1 = _LZ17;
_pos1 = getMarkerpos _mkr1;
_rad1 = 10;
_spawnPos1 = [_pos1, 1, _rad1, 2, 0, 30, 0, [],[_pos1],[]] call BIS_fnc_findSafePos;
_enemygrp1 = [_spawnPos1, west, 1] call BIS_fnc_spawnGroup;
_soldier1 = (units _enemygrp1) select 0;
removeAllAssignedItems _soldier1;
sleep 0.1;
_soldier1 removeWeapon "hgun_P07_F";
_soldier1 forceAddUniform (_uniformTypes1 call BIS_fnc_selectRandom);//uniforme
_soldier1 linkItem (_nvsTypes1 call BIS_fnc_selectRandom);//nvs
_soldier1 addVest (_vestTypes1 call BIS_fnc_selectRandom);//colete 
_soldier1 addHeadgear (_headgearTypes1 call BIS_fnc_selectRandom);//capacete
_soldier1 addGoggles (_GogglesTypes1 call BIS_fnc_selectRandom);//rosto

[_soldier1, _weaponTypes1 call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;//arma
nul = [_enemygrp1, _spawnPos1, 50] call bis_fnc_taskPatrol;
_enemygrp1 setCombatMode "RED";
_enemygrp1 setBehaviour "Stealth";
waitUntil {({alive _x} count units _enemygrp1) < 1;};
_botpos = getPos _soldier1;
_cash = createVehicle ["Land_Money_F", _botpos, [], 5, "None"];
_cash setPos ([_botpos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
_cash setDir random 360;
_cash setVariable["cmoney",(_moneyTypes1 call BIS_fnc_selectRandom),true];
_cash setVariable["owner","world",true];
sleep 900;
};

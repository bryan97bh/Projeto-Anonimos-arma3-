// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: RespawnAI1.sqf
//	@file Author: Mazureik
//	@file Created: 17/01/2021 17:19

while {true} do {
private _LZ18 = selectRandom [
"respawnair1","respawnair2"
];
_mkr18 = _LZ18;
_uniformTypes18 = [
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_I_G_resistanceLeader_F","U_I_G_Story_Protagonist_F",
"U_I_CombatUniform_shortsleeve"
];
_weaponTypes18 = [
"SMG_05_F","LMG_Mk200_F","arifle_MXC_F","Katiba Carbine",
"SMG_05_F","SMG_05_F","Katiba Carbine",
"arifle_TRG20_F","SMG_05_F","Katiba Carbine",
"arifle_TRG20_F","arifle_MXC_F","Katiba Carbine",
"arifle_TRG20_F","arifle_MXC_F","arifle_MX_GL_F",
"arifle_TRG20_F","arifle_MXM_F","arifle_MX_GL_F"
];
_pos18 = getMarkerpos _mkr18;
_rad18 = 10;
_spawnPos18 = [_pos18, 1, _rad18, 2, 0, 30, 0, [],[_pos18],[]] call BIS_fnc_findSafePos;
_enemygrp18 = [_spawnPos18, west, 1] call BIS_fnc_spawnGroup;
_soldier18 = (units _enemygrp18) select 0;
removeVest _soldier18;
_soldier18 addVest "V_I_G_resistanceLeader_F";
_soldier18 forceAddUniform (_uniformTypes18 call BIS_fnc_selectRandom);
[_soldier18, _weaponTypes18 call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;
nul = [_enemygrp18, _spawnPos18, 50] call bis_fnc_taskPatrol;
_enemygrp18 setCombatMode "RED";
_enemygrp18 setBehaviour "Stealth";
waitUntil {({alive _x} count units _enemygrp18) < 1;};
sleep 900;
};
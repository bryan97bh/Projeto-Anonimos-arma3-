// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: RespawnAI1.sqf
//	@file Author: Mazureik
//	@file Created: 17/01/2021 17:19

while {true} do {
private _LZ19 = selectRandom [
"respawnair3","respawnair4","respawnair5"
];
_mkr19 = _LZ19;
_uniformTypes19 = [
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_I_G_resistanceLeader_F","U_I_G_Story_Protagonist_F",
"U_I_CombatUniform_shortsleeve"
];
_weaponTypes19 = [
"SMG_05_F","LMG_Mk200_F","arifle_MXC_F","Katiba Carbine",
"SMG_05_F","SMG_05_F","Katiba Carbine",
"arifle_TRG20_F","SMG_05_F","Katiba Carbine",
"arifle_TRG20_F","arifle_MXC_F","Katiba Carbine",
"arifle_TRG20_F","arifle_MXC_F","arifle_MX_GL_F",
"arifle_TRG20_F","arifle_MXM_F","arifle_MX_GL_F"
];
_pos19 = getMarkerpos _mkr19;
_rad19 = 10;
_spawnPos19 = [_pos19, 1, _rad19, 2, 0, 30, 0, [],[_pos19],[]] call BIS_fnc_findSafePos;
_enemygrp19 = [_spawnPos19, west, 1] call BIS_fnc_spawnGroup;
_soldier19 = (units _enemygrp19) select 0;
removeVest _soldier19;
_soldier19 addVest "V_I_G_resistanceLeader_F";
_soldier19 forceAddUniform (_uniformTypes19 call BIS_fnc_selectRandom);
[_soldier19, _weaponTypes19 call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;
nul = [_enemygrp19, _spawnPos19, 50] call bis_fnc_taskPatrol;
_enemygrp19 setCombatMode "RED";
_enemygrp19 setBehaviour "Stealth";
waitUntil {({alive _x} count units _enemygrp19) < 1;};
sleep 900;
};
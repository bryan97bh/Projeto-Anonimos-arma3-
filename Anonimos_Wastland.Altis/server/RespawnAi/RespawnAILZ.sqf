// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: RespawnAI1.sqf
//	@file Author: Mazureik
//	@file Created: 17/01/2021 17:19

while {true} do {
private _LZ17 = selectRandom [
"respawnaiLZ1","respawnaiLZ2" //cidade de respawn 
];
_mkr17 = _LZ17;
_uniformTypes17 = [
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_IG_Guerilla1_1", "U_IG_Guerilla1_1" ,"U_IG_Guerilla2_1",
"U_I_G_resistanceLeader_F","U_I_G_Story_Protagonist_F",
"U_I_CombatUniform_shortsleeve"
];
_weaponTypes17 = [
"SMG_05_F","LMG_Mk200_F","arifle_MXC_F","Katiba Carbine",
"SMG_05_F","SMG_05_F","Katiba Carbine",
"arifle_TRG20_F","SMG_05_F","Katiba Carbine",
"arifle_TRG20_F","arifle_MXC_F","Katiba Carbine",
"arifle_TRG20_F","arifle_MXC_F","arifle_MX_GL_F",
"arifle_TRG20_F","arifle_MXM_F","arifle_MX_GL_F"
];
_pos17 = getMarkerpos _mkr17;
_rad17 = 10;
_spawnPos17 = [_pos17, 1, _rad17, 2, 0, 30, 0, [],[_pos17],[]] call BIS_fnc_findSafePos;
_enemygrp17 = [_spawnPos17, west, 1] call BIS_fnc_spawnGroup;
_soldier17 = (units _enemygrp17) select 0;
removeVest _soldier17;
_soldier17 addVest "V_I_G_resistanceLeader_F";
_soldier17 forceAddUniform (_uniformTypes17 call BIS_fnc_selectRandom);
[_soldier17, _weaponTypes17 call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;
nul = [_enemygrp17, _spawnPos17, 50] call bis_fnc_taskPatrol;
_enemygrp17 setCombatMode "RED";
_enemygrp17 setBehaviour "Stealth";
waitUntil {({alive _x} count units _enemygrp17) < 1;};
sleep 900;
};
// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createRandomSoldier.sqf
/*
 * Creates a random civilian soldier.
 *
 * Arguments: [ position, group, init, skill, rank]: Array
 *    position: Position - Location unit is created at.
 *    group: Group - Existing group new unit will join.
 *    init: String - (optional, default "") Command to be executed upon creation of unit. Parameter this is set to the created unit and passed to the code.
 *    skill: Number - (optional, default 0.5)
 *    rank: String - (optional, default "PRIVATE")
 */

if (!isServer) exitWith {};

private ["_soldierTypes", "_uniformTypes", "_vestTypes", "_weaponTypes", "_group", "_position", "_rank", "_soldier"];

_soldierTypes = ["C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F"];
_uniformTypes = ["U_I_CombatUniform_tshirt", "U_I_CombatUniform_shortsleeve" ,"U_B_CombatUniform_mcam_tshirt", "U_C_WorkerCoveralls"];
_vestTypes = ["V_PlateCarrier1_rgr", "V_HarnessOGL_gry", "V_TacVestIR_blk", "V_Chestrig_oli", "V_HarnessO_brn", "V_TacVest_brn", "V_Chestrig_khk", "V_TacVest_camo"];
_weaponTypes = ["arifle_Katiba_F","arifle_CTARS_blk_F","srifle_DMR_07_blk_F","arifle_Katiba_GL_F"];

_group = _this select 0;
_position = _this select 1;
_rank = param [2, "", [""]];

_soldier = _group createUnit [_soldierTypes call BIS_fnc_selectRandom, _position, [], 0, "NONE"];
_soldier addUniform (_uniformTypes call BIS_fnc_selectRandom);
_soldier addVest (_vestTypes call BIS_fnc_selectRandom);
_soldier addPrimaryWeaponItem "acc_flashlight";
_soldier addMagazines ["SmokeShell", 2]; 

[_soldier, _weaponTypes call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;

if (_rank != "") then
{
	_soldier setRank _rank;
};

_soldier spawn refillPrimaryAmmo;
_soldier spawn addMilCap;
_soldier call setMissionSkill;

_soldier addEventHandler ["Killed", server_playerDied];

// Give AI a new magazine (same type as old one) on reload if only 2 clips left
_soldier addeventhandler ["Reloaded", {
     if (count (magazines  (_this select 0) ) < 3 ) then {
     (_this select 0) addMagazine ((_this select 4) select 0)
     }
}];

_soldier

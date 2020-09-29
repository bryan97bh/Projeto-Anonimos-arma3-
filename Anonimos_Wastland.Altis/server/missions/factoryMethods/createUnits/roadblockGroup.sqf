// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev
//  @modified by wiking.at [AJ]

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;	
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit addVest "V_TacVest_gen_F";
	_unit addGoggles "G_Balaclava_blk";
	_unit addMagazines ["SmokeShell", 2];
	_unit addMagazine "30Rnd_556x45_Stanag";
	_unit addMagazine "30Rnd_556x45_Stanag";
	_unit addMagazine "30Rnd_556x45_Stanag";

	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit addUniform "U_B_GEN_Commander_F";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addWeapon "arifle_SPAR_01_GL_blk_F";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
		};
		// AT every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addUniform "U_B_GEN_Commander_F";
			_unit addBackpack "B_ViperLightHarness_blk_F";
			_unit addWeapon "arifle_SPAR_01_blk_F";
			_unit addPrimaryWeaponItem "muzzle_snds_M";
			_unit addMagazine "NLAW_F";
			_unit addWeapon "launch_NLAW_F";
			_unit addMagazine "NLAW_F";
			_unit addMagazine "NLAW_F";
		};
		// AA every 6 units
		case (_i % 7 == 0):
		{
			_unit addUniform "U_B_GEN_Commander_F";
			_unit addBackpack "B_ViperLightHarness_blk_F";
			_unit addWeapon "arifle_SPAR_01_blk_F";
			_unit addPrimaryWeaponItem "muzzle_snds_M";
			_unit addMagazine "Titan_AA";
			_unit addWeapon "launch_I_Titan_olive_F";
			_unit addMagazine "Titan_AA";
			_unit addMagazine "Titan_AA";
		};
		// Rifleman
		default
		{
			_unit addUniform "U_B_GEN_Commander_F";

			if (_unit == leader _group) then
			{
				
				_unit addWeapon "arifle_SPAR_01_blk_F";
				_unit setRank "SERGEANT";
				_unit addMagazines ["SmokeShellYellow", 1];
			}
			else
			{
				_unit addHeadgear "H_Helmet_Skate";
				_unit addWeapon "arifle_SPAR_01_blk_F";
			};
		};
	};
	_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
	_unit linkItem "NVGogglesB_blk_F";
	_unit addPrimaryWeaponItem "acc_pointer_IR";
	_unit enablegunlights "forceOn";

			if (_unit == leader _group) then
			{
				_unit addHeadgear "H_Beret_gen_F";
			}
			else
			{
				_unit addHeadgear "H_Helmet_Skate";
			};
	
	

	_unit addRating 1e11;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
    
    // Give AI a new magazine (same type as old one) on reload if only 2 clips left
    _unit addeventhandler ["Reloaded", {
         if (count (magazines  (_this select 0) ) < 3 ) then {
         (_this select 0) addMagazine ((_this select 4) select 0)
         }
    }];
};


[_group, _pos] call defendArea;
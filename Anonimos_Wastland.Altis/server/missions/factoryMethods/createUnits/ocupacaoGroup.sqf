// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: terrorGroup1.sqf
//  @modified by wiking.at [AJ]

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_Man_casual_1_F_tanoan", 
	"C_Man_casual_2_F_tanoan", 
	"C_Man_casual_3_F_tanoan", 
	"C_Man_casual_4_F_tanoan", 
	"C_Man_casual_5_F_tanoan", 
	"C_Man_casual_6_F_tanoan" 
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

	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit addVest "V_PlateCarrierGL_blk";
			_unit forceAddUniform "U_O_R_Gorka_01_black_F";
			_unit addMagazines ["SmokeShell", 2];
			for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag_Tracer";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag_Tracer";};
			_unit addItemToVest "HandGrenade";
			_unit addHeadgear "H_PASGT_basic_black_F";
			_unit addGoggles "G_Bandanna_sport";
			_unit addMagazine "3Rnd_HE_Grenade_shell";
			_unit addWeapon "arifle_MX_GL_Black_F";
			_unit addPrimaryWeaponItem "optic_MRCO";
			_unit addMagazine "3Rnd_HE_Grenade_shell";
			_unit addMagazine "3Rnd_HE_Grenade_shell";
		};
		// RPG-7 every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addVest "V_PlateCarrier1_blk";
			_unit forceAddUniform "U_O_R_Gorka_01_black_F";
			_unit addBackpack "B_ViperHarness_blk_F";
			for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag_Tracer";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag_Tracer";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "NLAW_F";};
			_unit addMagazines ["SmokeShell", 2];
			_unit addHeadgear "H_Beret_Colonel";
			_unit addGoggles "G_Bandanna_beast";
			_unit addWeapon "arifle_MXM_Black_F";
			_unit addPrimaryWeaponItem "optic_AMS";
			_unit addPrimaryWeaponItem "bipod_02_F_blk";
			_unit addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
			_unit addWeapon "launch_NLAW_F";
		};
		// AA every 6 units
		case (_i % 7 == 0):
		{
			_unit addVest "V_PlateCarrier1_blk";
			_unit forceAddUniform "U_O_R_Gorka_01_black_F";
			_unit addBackpack "B_ViperHarness_blk_F";
			for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag_Tracer";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag_Tracer";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AA";};
			_unit addMagazines ["SmokeShell", 2];
			_unit addHeadgear "H_Beret_Colonel";
			_unit addGoggles "G_Bandanna_beast";
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
			_unit addPrimaryWeaponItem "muzzle_snds_65_TI_blk_F";
			_unit addWeapon "launch_B_Titan_F";
		};
		// Rifleman
		default
		{

			if (_unit == leader _group) then
			{			
			_unit addVest "V_PlateCarrier2_blk";
			_unit forceAddUniform "U_O_R_Gorka_01_black_F";
			for "_i" from 1 to 2 do {_unit addItemToUniform "150Rnd_762x54_Box_Tracer";};
			for "_i" from 1 to 3 do {_unit addItemToVest "150Rnd_762x54_Box_Tracer";};
			_unit addMagazines ["SmokeShellYellow", 1];
			_unit addGoggles "G_Balaclava_TI_G_blk_F";
			_unit addWeapon "LMG_Zafir_F";
			_unit addPrimaryWeaponItem "optic_Aco";

			}
			else
			{
			_unit addVest "V_TacVestIR_blk";
			_unit forceAddUniform "U_O_R_Gorka_01_black_F";
			for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_black_mag_Tracer";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag_Tracer";};
			_unit addMagazines ["SmokeShell", 1];
			_unit addHeadgear "H_Watchcap_blk";
			_unit addGoggles "G_Bandanna_blk";
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
			};
		};
	};
	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit  linkItem "ItemRadio";

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


//[_group, _pos] call defendArea;
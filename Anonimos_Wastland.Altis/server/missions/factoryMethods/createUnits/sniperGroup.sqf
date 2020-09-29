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
			_unit addVest "V_TacVest_brn";
			_unit forceAddUniform "U_I_GhillieSuit";
			_unit addMagazines ["SmokeShell", 2];
			for "_i" from 1 to 3 do {_unit addItemToUniform "5Rnd_127x108_APDS_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "5Rnd_127x108_Mag";};
			_unit addItemToVest "HandGrenade";
			_unit addHeadgear "H_HelmetSpecB_sand";
			_unit addGoggles "G_Bandanna_tan";
			_unit addWeapon "srifle_GM6_camo_F";
			_unit addPrimaryWeaponItem "optic_KHS_old";
		};
		// RPG-7 every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addVest "V_TacVest_brn";
			_unit forceAddUniform "U_I_FullGhillie_ard";
			_unit addBackpack "B_FieldPack_cbr";
			for "_i" from 1 to 2 do {_unit addItemToUniform "10Rnd_338_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "10Rnd_338_Mag";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "Titan_AT";};
			_unit addMagazines ["SmokeShell", 2];
			_unit addHeadgear "H_HelmetB_sand";
			_unit addGoggles "G_Bandanna_khk";
			_unit addWeapon "srifle_DMR_02_sniper_F";
			_unit addPrimaryWeaponItem "optic_KHS_old";
			_unit addPrimaryWeaponItem "muzzle_snds_338_sand";
			_unit addWeapon "launch_B_Titan_short_F";
		};
		// AA every 6 units
		case (_i % 7 == 0):
		{
			_unit addVest "V_TacVest_brn";
			_unit forceAddUniform "U_B_FullGhillie_ard";
			_unit addBackpack "B_FieldPack_cbr";
			for "_i" from 1 to 2 do {_unit addItemToUniform "10Rnd_93x64_DMR_05_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "10Rnd_93x64_DMR_05_Mag";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AA";};
			_unit addMagazines ["SmokeShell", 2];
			_unit addHeadgear "H_HelmetB_sand";
			_unit addGoggles "G_Bandanna_khk";
			_unit addWeapon "srifle_DMR_05_hex_F";
			_unit addPrimaryWeaponItem "optic_KHS_old";
			_unit addPrimaryWeaponItem "muzzle_snds_93mmg_tan";
			_unit addWeapon "launch_B_Titan_F";
		};
		// Rifleman
		default
		{

			if (_unit == leader _group) then
			{			
			_unit addVest "V_TacVest_khk";
			_unit forceAddUniform "U_I_FullGhillie_ard";
			for "_i" from 1 to 2 do {_unit addItemToUniform "10Rnd_Mk14_762x51_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "10Rnd_Mk14_762x51_Mag";};
			_unit addMagazines ["SmokeShellYellow", 1];
			_unit addHeadgear "H_HelmetB_sand";
			_unit addGoggles "G_Bandanna_khk";
			_unit addWeapon "srifle_DMR_03_tan_F";
			_unit addPrimaryWeaponItem "optic_NVS";

			}
			else
			{
			_unit addVest "V_TacVest_khk";
			_unit forceAddUniform "U_B_GhillieSuit";
			for "_i" from 1 to 2 do {_unit addItemToUniform "10Rnd_762x54_Mag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "10Rnd_762x54_Mag";};
			_unit addMagazines ["SmokeShell", 1];
			_unit addHeadgear "H_HelmetB_sand";
			_unit addGoggles "G_Bandanna_khk";
			_unit addWeapon "srifle_DMR_01_F";
			_unit addPrimaryWeaponItem "optic_MRCO";
			};
		};
	};
	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";
	_unit linkItem "NVGoggles";

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
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
			_unit forceAddUniform "U_I_C_Soldier_Bandit_3_F";
			_unit addMagazines ["SmokeShell", 2];
			for "_i" from 1 to 3 do {_unit addItemToUniform "30rnd_762x39_AK12_Arid_Mag_F";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30rnd_762x39_AK12_Arid_Mag_F";};
			_unit addItemToVest "HandGrenade";
			_unit addHeadgear "H_HelmetB_black";
			_unit addGoggles "G_Bandanna_tan";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addWeapon "arifle_AK12_GL_arid_F";
			_unit addPrimaryWeaponItem "muzzle_snds_B_snd_F";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
		};
		// RPG-7 every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addVest "V_TacVest_brn";
			_unit forceAddUniform "U_I_C_Soldier_Para_4_F";
			_unit addBackpack "B_FieldPack_cbr";
			for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_762x39_Mag_Green_F";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_762x39_Mag_Green_F";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "RPG7_F";};
			_unit addMagazines ["SmokeShell", 2];
			_unit addHeadgear "H_ShemagOpen_khk";
			//_unit addGoggles "G_Bandanna_tan";
			_unit addWeapon "arifle_AKM_F";
			_unit addWeapon "launch_RPG7_F";
		};
		// AA every 6 units
		case (_i % 7 == 0):
		{
			_unit addVest "V_TacChestrig_cbr_F";
			_unit forceAddUniform "U_I_C_Soldier_Para_1_F";
			_unit addBackpack "B_Kitbag_tan";
			for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_762x39_Mag_Green_F";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_762x39_Mag_Green_F";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AA";};
			_unit addMagazines ["SmokeShell", 2];
			_unit addHeadgear "H_Booniehat_khk";
			_unit addGoggles "G_Aviator";
			_unit addWeapon "arifle_AKM_F";
			_unit addWeapon "launch_B_Titan_F";
		};
		// Rifleman
		default
		{

			if (_unit == leader _group) then
			{			
			_unit addVest "V_Chestrig_khk";
			_unit forceAddUniform "U_I_C_Soldier_Para_3_F";
			_unit addBackpack "B_LegStrapBag_coyote_F";
			for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_762x39_Mag_Green_F";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_762x39_Mag_Green_F";};
			_unit addMagazines ["SmokeShellYellow", 1];
			_unit addHeadgear "H_HelmetB";
			_unit addGoggles "G_Bandanna_tan";
			_unit addWeapon "arifle_AKM_F";

			}
			else
			{
			_unit addVest "V_BandollierB_cbr";
			_unit forceAddUniform "U_I_C_Soldier_Para_5_F";
			for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_545x39_Mag_F";};
			for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_545x39_Mag_F";};
			_unit addMagazines ["SmokeShell", 1];
			//_unit addHeadgear "H_HelmetB";
			_unit addGoggles "G_Balaclava_oli";
			_unit addWeapon "arifle_AKS_F";
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
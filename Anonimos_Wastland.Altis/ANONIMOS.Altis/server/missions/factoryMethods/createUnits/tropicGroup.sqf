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


	_unit addVest "V_TacVest_oli";
	_unit addHeadgear "H_HelmetB_Enh_tna_F";
	_unit addGoggles "G_Combat";



	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit forceAddUniform "U_B_T_Soldier_F";
			_unit addWeapon "arifle_MX_GL_khk_F";
			for "_i" from 1 to 3 do {_unit addItem "30Rnd_65x39_caseless_mag_Tracer";};
			for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
			for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
			_unit addPrimaryWeaponItem "optic_Holosight_khk_F";

		};
		// AT every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit forceAddUniform "U_B_T_Soldier_F";
			_unit addBackpack "B_AssaultPack_tna_F";
			_unit addWeapon "arifle_MXC_khk_F";
			_unit addPrimaryWeaponItem "optic_Holosight_khk_F";
			_unit addMagazine "Titan_AT";
			_unit addWeapon "launch_B_Titan_short_tna_F";
			_unit addMagazine "Titan_AT";
			_unit addMagazine "Titan_AT";
			for "_i" from 1 to 3 do {_unit addItem "30Rnd_65x39_caseless_mag_Tracer";};
		};
		// AA every 6 units
		case (_i % 7 == 0):
		{
			_unit forceAddUniform "U_B_T_Soldier_F";
			_unit addBackpack "B_AssaultPack_tna_F";
			_unit addWeapon "arifle_MXC_khk_F";
			_unit addPrimaryWeaponItem "optic_Holosight_khk_F";
			_unit addMagazine "Titan_AA";
			_unit addWeapon "launch_B_Titan_tna_F";
			_unit addMagazine "Titan_AA";
			_unit addMagazine "Titan_AA";
			for "_i" from 1 to 3 do {_unit addItem "30Rnd_65x39_caseless_mag_Tracer";};
		};
		// Rifleman
		default
		{

			if (_unit == leader _group) then
			{
				_unit setRank "SERGEANT";
				_unit forceAddUniform "U_B_CTRG_Soldier_F";
				_unit addWeapon "Rangefinder";
				_unit addWeapon "arifle_MX_SW_khk_F";
				_unit addPrimaryWeaponItem "bipod_01_F_khk";
				_unit addPrimaryWeaponItem "optic_Hamr_khk_F";
				_unit addHeadgear "H_HelmetB_TI_tna_F";
				_unit addGoggles "G_Combat_Goggles_tna_F";
				for "_i" from 1 to 3 do {_unit addItem "100Rnd_65x39_caseless_mag_Tracer";};
			}
			else
			{
				_unit forceAddUniform "U_B_T_Soldier_F";
				_unit addWeapon "arifle_MX_khk_F";
				_unit addPrimaryWeaponItem "optic_Holosight_khk_F";
				_unit addWeapon "Binocular";
				for "_i" from 1 to 3 do {_unit addItem "30Rnd_65x39_caseless_mag_Tracer";};
			};
		};
	};

	_unit linkItem "NVGoggles_tna_F";
	_unit addPrimaryWeaponItem "acc_pointer_IR";
	_unit enablegunlights "forceOn";
	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";

	_unit addRating 1e11;
	_unit spawn refillPrimaryAmmo; //fills up ammo to 3 magazines if less then 3 carried
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
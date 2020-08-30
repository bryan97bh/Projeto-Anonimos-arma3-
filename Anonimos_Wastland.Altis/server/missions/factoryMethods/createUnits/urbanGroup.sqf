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

	_unit forceAddUniform "U_O_CombatUniform_oucamo";
	_unit addVest "V_HarnessO_gry";
	_unit addGoggles "G_Bandanna_tan";
	_unit addHeadgear "H_HelmetLeaderO_oucamo";
	_unit addWeapon "srifle_DMR_04_Tan_F";
	_unit addMagazines ["SmokeShell", 2];
	_unit addItemToVest "10Rnd_127x54_Mag";
	for "_i" from 1 to 3 do {_unit addItem "10Rnd_127x54_Mag";};
	


	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			
			for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};

		};
		// AT every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addBackpack "B_FieldPack_oucamo";
			_unit addMagazine "Titan_AT";
			_unit addWeapon "launch_O_Titan_short_F";
			_unit addMagazine "Titan_AT";
			_unit addMagazine "Titan_AT";
		};
		// AA every 6 units
		case (_i % 7 == 0):
		{
			_unit addBackpack "B_FieldPack_oucamo";
			_unit addMagazine "Titan_AA";
			_unit addWeapon "launch_O_Titan_F";
			_unit addMagazine "Titan_AA";
			_unit addMagazine "Titan_AA";
		};
		// Rifleman
		default
		{

			if (_unit == leader _group) then
			{
				_unit setRank "SERGEANT";
				_unit addWeapon "Rangefinder";
				_unit addMagazines ["SmokeShellYellow", 1];
			}
			else
			{
				_unit addWeapon "Binocular";
			};
		};
	};
	_unit addPrimaryWeaponItem "optic_Holosight";
	_unit linkItem "O_NVGoggles_urb_F";
	_unit addPrimaryWeaponItem "acc_pointer_IR";
	_unit addPrimaryWeaponItem "bipod_02_F_tan";
	_unit enablegunlights "forceOn";
	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";

	_unit addRating 1e11;
//	_unit spawn refillPrimaryAmmo; //fills up ammo to 3 magazines if less then 3 carried
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
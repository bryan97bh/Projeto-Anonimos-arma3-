// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createRandomPilot.sqf


if (!isServer) exitWith {};

private ["_soldierTypes", "_weaponTypes", "_group", "_position", "_soldier"];

_soldierTypes = ["C_man_1_3_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F"];
_uniformTypes = ["U_B_HeliPilotCoveralls", "U_I_HeliPilotCoveralls"];
_headgearTypes = ["H_PilotHelmetHeli_B", "H_PilotHelmetHeli_O", "H_PilotHelmetHeli_I", "H_HelmetCrew_B", "H_HelmetCrew_O", "H_HelmetCrew_I"];
_weaponTypes = ["SMG_01_Holo_F","SMG_01_Holo_pointer_snds_F","SMG_01_F","SMG_02_ACO_F", "SMG_02_ARCO_pointg_F", "hgun_PDW2000_F", "hgun_PDW2000_snds_F", "hgun_PDW2000_Holo_F", "hgun_PDW2000_Holo_snds_F"];
_group = _this select 0;
_position = _this select 1;

_soldier = _group createUnit [_soldierTypes call BIS_fnc_selectRandom, _position, [], 0, "NONE"];
_soldier addUniform (_uniformTypes call BIS_fnc_selectRandom);
_soldier addBackpack "B_Parachute";
[_soldier, _weaponTypes call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;
_soldier addPrimaryWeaponItem "acc_flashlight";
_soldier addMagazines ["SmokeShell", 2];
_soldier addHeadgear (_headgearTypes call BIS_fnc_selectRandom);

_soldier spawn refillPrimaryAmmo;
_soldier call setMissionSkill;

_soldier addEventHandler ["Killed", server_playerDied];

// Give AI a new magazine (same type as old one) on reload if only 2 clips left
_soldier addeventhandler ["Reloaded", {
     if (count (magazines  (_this select 0) ) < 3 ) then {
     (_this select 0) addMagazine ((_this select 4) select 0)
     }
}];

_soldier
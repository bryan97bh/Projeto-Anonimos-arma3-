// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_CivHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass = [
                    "C_Heli_Light_01_civil_F",
                    "B_Heli_Light_01_F",
                    "O_Heli_Light_02_unarmed_F",
                    "I_Heli_light_03_unarmed_F",
                    "I_Heli_Transport_02_F", 
                    "O_Heli_Transport_04_F",
                    "O_Heli_Transport_04_box_F",
                    "O_Heli_Transport_04_fuel_F",
                    "O_Heli_Transport_04_bench_F",
                    "O_Heli_Transport_04_covered_F",
                    "O_Heli_Transport_04_medevac_F",
                    "B_Heli_Transport_03_unarmed_F"
                    ] call BIS_fnc_selectRandom;

	_missionType = "HELICÓPTERO DE SUPORTE";
	_locationsArray = spawn_VMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

private _customVehicleSetup =
{
	_vehicle call fn_refilltruck;
};

_this call mission_VehicleCapture_v2;

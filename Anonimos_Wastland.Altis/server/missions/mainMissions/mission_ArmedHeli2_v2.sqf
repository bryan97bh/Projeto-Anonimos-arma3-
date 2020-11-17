// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_ArmedHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass = selectRandom
	[	        
		"B_Heli_Attack_01_dynamicLoadout_F",                        //AH-99 Blackfoot
        "O_Heli_Attack_02_dynamicLoadout_F"                         //Mi-48 Kajman
	];

	_missionType = "HELICÓPTERO DE ATAQUE GUARNECIDO";
	_locationsArray = spawn_VMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture_v2;

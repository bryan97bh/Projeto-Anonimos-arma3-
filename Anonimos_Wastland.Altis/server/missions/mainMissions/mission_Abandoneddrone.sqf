// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_AbandonedJet.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev, Staynex
//	@file Author: Bryan matar e destruir vencer pelo brasil 

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
        "B_T_UAV_03_F",
		"B_T_UAV_03_F",
		"B_T_UAV_03_F",
        "O_T_UAV_04_CAS_F",
		["B_UAV_02_dynamicLoadout_F", "variant_greyhawkMissile"],
        ["I_UAV_02_dynamicLoadout_F", "variant_greyhawkMissile"],
        ["B_UAV_05_F", "variant_sentinelMissile"],
        ["B_UAV_02_dynamicLoadout_F", "variant_greyhawkBomber"],
        ["I_UAV_02_dynamicLoadout_F", "variant_greyhawkBomber"],
        ["B_UAV_05_F", "variant_sentinelBomber"]
	] call BIS_fnc_selectRandom;

	_missionType = "DRONE ABANDONADO";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;

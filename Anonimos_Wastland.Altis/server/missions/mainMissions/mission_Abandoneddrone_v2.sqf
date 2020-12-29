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
        "I_UGV_01_rcws_F",
        ["I_UAV_02_dynamicLoadout_F", "variant_greyhawkMissile"],
		["I_UAV_02_dynamicLoadout_F", "variant_greyhawkMissile6"],
		["I_UAV_02_dynamicLoadout_F", "variant_greyhawkBomber"],
		["I_UAV_02_dynamicLoadout_F", "variant_greyhawkBomber4"],
		["I_UAV_02_dynamicLoadout_F", "variant_greyhawkCluster"],
		["I_UAV_02_dynamicLoadout_F", "variant_greyhawkDAGR"],
		["B_UAV_05_F", "variant_sentinelMissile"],
		["B_UAV_05_F", "variant_sentinelMissile2"],
		["B_UAV_05_F", "variant_sentinelBomber2"],
		["B_UAV_05_F", "variant_sentinelBomber4"],
		["B_UAV_05_F", "variant_sentinelBomber8"],
        ["B_UAV_05_F", "variant_sentinelCluster"]
	] call BIS_fnc_selectRandom;

	_missionType = "DRONE ABANDONADO";
	_locationsArray = spawn_VMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture_v2;

// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_AbandonedJet.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev, Staynex

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"I_Plane_Fighter_03_dynamicLoadout_F", "buzzardAA"],
        ["I_Plane_Fighter_03_dynamicLoadout_F", "buzzardCAS"],
        "I_Plane_Fighter_04_F",
        "B_Plane_Fighter_01_F",
        "O_Plane_Fighter_02_F",
        "B_Plane_CAS_01_dynamicLoadout_F",
        "O_Plane_CAS_02_dynamicLoadout_F",
        "B_T_VTOL_01_infantry_F",
        "B_T_VTOL_01_armed_F"
	] call BIS_fnc_selectRandom;

	_missionType = "AERONAVE ABANDONADA";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;

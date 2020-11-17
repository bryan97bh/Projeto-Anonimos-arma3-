//	@file Author: Bryan /  matar e destruir vencer pelo brasil 
//	@file Created: 19/07/2020

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass = // to specify a vehicleLoadouts variant, simply write "class/variant", e.g. "O_Heli_Light_02_dynamicLoadout_F/orcaDAR"
	[
		["I_C_Offroad_02_AT_F", "I_G_Offroad_01_AT_F"],
		["B_T_LSV_01_AT_F", "B_T_LSV_01_armed_F"],
		["I_LT_01_cannon_F", "I_LT_01_AT_F", "I_LT_01_AA_F"]
	];

	while {_vehicleClass isEqualType []} do { _vehicleClass = selectRandom _vehicleClass };
	if (_vehicleClass find "/" != -1) then { _vehicleClass = _vehicleClass splitString "/" };

	_missionType = "VIATURAS DE COMBATE";
	_locationsArray = spawn_VMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture_v2;

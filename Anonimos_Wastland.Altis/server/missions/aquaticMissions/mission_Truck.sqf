// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_Truck.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "aquaticMissionDefines.sqf"

private ["_nbUnits", "_vehicleClass", "_vehicle"];

_setupVars =
{
	_missionType = "CAMINHÃO DE SUPRIMENTO";
	_locationsArray = MissionSpawnMarkers;
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_vehicleClass =
	[
		"B_Truck_01_covered_F",
		"B_Truck_01_fuel_F",
		"B_Truck_01_medical_F",
		"B_Truck_01_Repair_F",
		"O_Truck_03_covered_F",
		"O_Truck_03_fuel_F",
		"O_Truck_03_medical_F",
		"O_Truck_03_repair_F",
		"I_Truck_02_covered_F",
		"I_Truck_02_fuel_F",
		"I_Truck_02_medical_F",
		"I_Truck_02_box_F"
	] call BIS_fnc_selectRandom;

	// Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle;
	_vehicle call fn_refilltruck;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;
	_aiGroup setCombatMode "Red";

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");

	_missionHintText = format ["Um <t color='%2'>%1</t> foi danificado. Vá pegar para seu time", _vehicleName, sideMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _vehicle};

_failedExec =
{
	// Mission failed
	deleteVehicle _vehicle;
};

_successExec =
{
	// Mission completed
	[_vehicle, 1] call A3W_fnc_setLockState; // Unlock

	_successHintMessage = "O caminhão de suprimentos foi capturado, bom trabalho.";
};

_this call aquaticMissionsProcessor;

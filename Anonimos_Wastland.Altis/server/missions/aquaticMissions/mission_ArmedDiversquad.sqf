// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_ArmedDiversquad.sqf
//	@file Author: JoSchaap, AgentRev

if (!isServer) exitwith {};
#include "aquaticMissionDefines.sqf";

private ["_box1", "_box2", "_boxPos", "_vehicleClass", "_vehicle", "_randomBox", "_randomBox2"];

_setupVars =
{
	_missionType = "EXPEDIÇÃO GRUMEC";
	_locationsArray = SunkenMissionMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	_box1 = createVehicle ["Box_East_Wps_F", _missionPos, [], 5, "None"];
	[_box1, ["RU", "MILITIA"] call BIS_fnc_selectRandom] call fn_refillbox;

	_box2 = createVehicle ["Box_East_Wps_F", _missionPos, [], 5, "None"];
	[_box2, ["RU", "MILITIA"] call BIS_fnc_selectRandom] call fn_refillbox;

	{
		_boxPos = getPosASL _x;
		_boxPos set [2, getTerrainHeightASL _boxPos + 1];
		_x setPos _boxPos;
		_x setVariable ["R3F_LOG_disabled", true, true];
	} forEach [_box1, _box2];

	_vehicleClass = ["B_Boat_Armed_01_minigun_F", "O_Boat_Armed_01_hmg_F", "I_Boat_Armed_01_minigun_F"] call BIS_fnc_selectRandom;

	// Vehicle Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle2;
	_vehicle setPosASL _missionPos;
	_vehicle lockDriver true;

	[_vehicle, [
		["itm", "U_B_Wetsuit", 2],
		["itm", "U_O_Wetsuit", 2],
		["itm", "U_I_Wetsuit", 2],
		["itm", "V_RebreatherB", 2],
		["itm", "G_Diving", 2],
		["wep", "arifle_SDAR_F", 2],
		["mag", "20Rnd_556x45_UW_mag", 8]
	]] call processItems;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos] call createsmallDivers;

	[_vehicle, _aiGroup] spawn checkMissionVehicleLock;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_missionHintText = "Uma expedição do Grupo de Mergulhadores de Combate, está tentando recuperar caixas de munições afundadas.<br/>Você precisará de equipamento de mergulho e arma de propósito duplo (SDAR) para completar a missão.";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2];
};

// _vehicle is automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission complete
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];
	_vehicle lockDriver false;

	_successHintMessage = "As caixas foram capturadas, missão completa!";
};

_this call aquaticMissionsProcessor;

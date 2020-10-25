// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_VehicleCapture.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, JoSchaap, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicle", "_vehicleName", "_vehDeterminer", "_variant", "_soldier", "_vehicle2", "_waypoint", "_calcMarkers"];

// setupVars must be defined in the top mission file

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	_variant = _vehicleClass param [1,"",[""]];	

	if (_vehicleClass isEqualType []) then
	{
		_vehicleClass = _vehicleClass select 0;
	};

	// Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle;
	
	if (_variant != "") then
	{
		_vehicle setVariable ["A3W_vehicleVariant", _variant, true];
	};	
	
	[_vehicle] call vehicleSetup;
	
	_vehicle setVectorUp [0,0,1];	
	
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createcustomGroup;
	
	// a separate group to not show in map
	_aiGroup2 = createGroup CIVILIAN;
	_aiGroup2 setCombatMode "RED";
	_aiGroup2 setBehaviour "COMBAT";	
	
	_vehicle2 = createVehicle ["B_Heli_Light_01_dynamicLoadout_F", _missionPos, [], 0, "FLY"];
	_vehicle2 setVariable ["R3F_LOG_disabled", false, true];		
		
	// heli waypoints
	_calcMarkers =
	[ 
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0) - 500, (_missionPos select 1) - 750],
		[(_missionPos select 0) - 1000, (_missionPos select 1) + 1500],
		[(_missionPos select 0), (_missionPos select 1)]
	];

	[_vehicle2] call vehicleSetup;

	_aiGroup addVehicle _vehicle2;
		
	_soldier = [_aiGroup, _missionPos] call createRandomPilot;
	_soldier moveInDriver _vehicle2;
	
	// behaviour on heli waypoints 
	{
		_waypoint = _aiGroup addWaypoint [_x, 0];
		_waypoint setWaypointType "SAD";
		_waypoint setWaypointCompletionRadius 25;
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointBehaviour "SAFE"; 
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed "Normal";
	} forEach _calcMarkers;	

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");

	_missionHintText = format ["%1 <t color='%3'>%2</t> foi imobilizado, vá buscá-lo para sua equipe!", _vehicleName];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _vehicle};

_failedExec =
{
	// Missão Falhou
	deleteVehicle _vehicle, _vehicle2;
};

_successExec =
{
	// Missão Cumprida
	[_vehicle, 1] call A3W_fnc_setLockState; // Unlock

	_successHintMessage = format ["O %1 foi capturado.", _vehicleName];
};

_this call mainMissionProcessor;

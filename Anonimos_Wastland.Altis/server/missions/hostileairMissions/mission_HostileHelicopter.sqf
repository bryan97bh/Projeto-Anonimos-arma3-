// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HostileHelicopter.sqf
//	@file Author: JoSchaap, AgentRev

if (!isServer) exitwith {};
#include "hostileairMissionDefines.sqf"

private ["_vehicleClass", "_vehicle", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_box1", "_box2"];

_setupVars =
{
	_missionType = "HELICÓPTERO HOSTIL";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);

	_vehicleClass = [["B_Heli_Light_01_dynamicLoadout_F", "pawneeNormal"], ["O_Heli_Light_02_dynamicLoadout_F", "orcaDAR"], "I_Heli_light_03_dynamicLoadout_F", "B_Heli_Attack_01_dynamicLoadout_F", "O_Heli_Attack_02_dynamicLoadout_F"] call BIS_fnc_selectRandom;

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_variant", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;
		_variant = _type param [1,"",[""]];

		if (_type isEqualType []) then
		{
			_type = _type select 0;
		};

		_vehicle = createVehicle [_type, _position, [], 0, "FLY"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];

		if (_variant != "") then
		{
			_vehicle setVariable ["A3W_vehicleVariant", _variant, true];
		};

		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		// add a driver/pilot/captain to the vehicle
		// the little bird, orca, and hellcat do not require gunners and should not have any passengers
		_soldier = [_aiGroup, _position] call createRandomPilot;
		_soldier moveInDriver _vehicle;

		switch (true) do
		{
			case (_type isKindOf "Heli_Transport_01_base_F"):
			{
				// these choppers have 2 turrets so we need 2 gunners
				_soldier = [_aiGroup, _position] call createRandomPilot;
				_soldier moveInTurret [_vehicle, [1]];

				_soldier = [_aiGroup, _position] call createRandomPilot;
				_soldier moveInTurret [_vehicle, [2]];
			};

			case (_type isKindOf "Heli_Attack_01_base_F" || _type isKindOf "Heli_Attack_02_base_F"):
			{
				// these choppers need 1 gunner
				_soldier = [_aiGroup, _position] call createRandomPilot;
				_soldier moveInGunner _vehicle;
			};
		};

		// remove flares because it overpowers AI choppers
		if (_type isKindOf "Air") then
		{
			{
				if (["CMFlare", _x] call fn_findString != -1) then
				{
					_vehicle removeMagazinesTurret [_x, [-1]];
				};
			} forEach getArray (configFile >> "CfgVehicles" >> _type >> "magazines");
		};

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicle = [_vehicleClass, _missionPos, 0] call _createVehicle;

	_leader = effectiveCommander _vehicle;
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "WHITE"; // Defensive behaviour
	_aiGroup setBehaviour "AWARE";
	_aiGroup setFormation "STAG COLUMN";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	// behaviour on waypoints
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "WHITE";
		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> (_vehicleClass param [0,""]) >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> (_vehicleClass param [0,""]) >> "displayName");

	_missionHintText = format ["Um <t color='%2'>%1</t> armado está patrulhando a ilha. Intercepte-o e recupere sua carga!", _vehicleName, sideMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicle is automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed

	// wait until heli is down to spawn crates
	_vehicle spawn
	{
		_veh = _this;

		waitUntil
		{
			sleep 0.1;
			_pos = getPos _veh;
			(isTouchingGround _veh || _pos select 2 < 5) && {vectorMagnitude velocity _veh < [1,5] select surfaceIsWater _pos}
		};

		_box1 = createVehicle ["Box_NATO_Wps_F", (getPosATL _veh) vectorAdd ([[_veh call fn_vehSafeDistance, 0, 0], random 360] call BIS_fnc_rotateVector2D), [], 5, "None"];
		_box1 setDir random 360;
		[_box1, ["US", "OTHER"] call BIS_fnc_selectRandom] call fn_refillbox;

		_box2 = createVehicle ["Box_East_Wps_F", (getPosATL _veh) vectorAdd ([[_veh call fn_vehSafeDistance, 0, 0], random 360] call BIS_fnc_rotateVector2D), [], 5, "None"];
		_box2 setDir random 360;
		[_box2, ["RU", "OTHER"] call BIS_fnc_selectRandom] call fn_refillbox;
		
		{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];
	};

	_successHintMessage = "O céu está limpo novamente, a patrulha inimiga foi retirada! Caixas de munição caíram perto dos destroços.";
};

_this call hostileairMissionsProcessor;

// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_FalconPatrol.sqf
//	@file Author: Firewall-BR - Apr 2017

if (!isServer) exitwith {};
#include "hostileairMissionDefines.sqf";

private ["_planeChoices", "_convoyVeh", "_veh1", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints",
 	"_box1", "_smoke1", "_boxesArray", "_cashpile", "_cashamount", "_cash"];

_textureDir = "client\images\vehicleTextures\";
_vehTexture = ["drylands.paa","drylands.paaa","drylands.paa","drylands.paa"] call BIS_fnc_selectRandom;
_changeTexture = [true, false] call BIS_fnc_selectRandom;
_altitude = [100, 200] call BIS_fnc_selectRandom;

_setupVars =
{
	_missionType = "PATRULHA AÉREA FALCON";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);
	
	_planeChoices =
	[
		["B_T_UAV_03_F"]				
	];

	_convoyVeh = _planeChoices call BIS_fnc_selectRandom;

	_veh1 = _convoyVeh select 0;

	_createVehicle =
	{
		private ["_type","_position","_direction","_vehicle","_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "FLY"]; // Added to make it fly
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		_vel = [velocity _vehicle, -(_direction)] call BIS_fnc_rotateVector2D; // Added to make it fly
		
		if _changeTexture then
			{
				[_vehicle, _textureDir + _vehTexture, [0,1]] call applyVehicleTexture;		
			};
		
		_vehicle setDir _direction;
		_vehicle setVelocity _vel; // Added to make it fly
		_vehicle flyInHeight _altitude;				
		
		_vehicle setVariable [call vChecksum, true, false];
				
		_aiGroup addVehicle _vehicle;
		
		// add pilot
		_soldier = _aiGroup createUnit ["B_soldier_UAV_F", _position, [], 0, "NONE"];
		_soldier setUnitPos "Down";
		_soldier setBehaviour "COMBAT";	
		_soldier setCombatMode "RED";		

		_aiGroup = [_vehicle, CIVILIAN] call fn_createCrewUAV;
		
		_soldier moveInTurret [_vehicle, [0]];				
	
		// lock the vehicle untill the mission is finished and initialize cleanup on it
		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		
		_vehicle addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine", [-1]];				
		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles = [];
	
	_vehicles set [0, [_veh1, _missionPos , 14, _aiGroup] call _createVehicle]; // static value update when porting to different maps
	
	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;
	_leader setRank "LIEUTENANT";

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "AWARE";
	_aiGroup setFormation "STAG COLUMN";

	// behaviour on waypoints
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];	
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed "NORMAL";
		_waypoint setWaypointType "SAD";
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh1 >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _veh1 >> "displayName");
	_missionHintText = format ["Um <t color='%2'>%1</t> não tripulado está sobrevoando a ilha. Destrua-o e recupere sua carga!", _vehicleName, hostileairMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

	// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Missão Cumprida
	
	_cashpile = selectRandom [2,3,5];	
	// $$$
	_cashamount = A3W_SmallMoney;

	for "_i" from 1 to _cashpile do
	{
		_cash = createVehicle ["Land_Money_F",[(_lastPos select 0), (_lastPos select 1) - 5,0],[], 0, "NONE"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _cashamount / _cashpile, true];
		_cash setVariable ["owner", "world", true];
	};
		_box1 = createVehicle ["Box_NATO_Wps_F", (getPosATL _veh) vectorAdd ([[_veh call fn_vehSafeDistance, 0, 0], random 360] call BIS_fnc_rotateVector2D), [], 5, "None"];
		_box1 setDir random 360;
		[_box1, ["US", "OTHER"] call BIS_fnc_selectRandom] call fn_refillbox;

	
	// Unlock
	{ _x setVariable ["allowDamage", true, true] } forEach _boxesArray;			
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach _boxesArray;	
	{ _x setVariable ["A3W_inventoryLockR3F", false, true] } forEach _boxesArray;	
	
	sleep 2;
	_smoke1 = "SmokeShellYellow" createVehicle getPos _box1;
	_smoke1 attachto [_box1,[0,0,-0.5]];

	_successHintMessage = "Você interceptou o DRONE! Pegue o dinheiro e as caixas";
};

_this call hostileairMissionsProcessor;

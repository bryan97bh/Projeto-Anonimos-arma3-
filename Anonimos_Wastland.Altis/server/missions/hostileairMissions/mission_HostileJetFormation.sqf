// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HostileJetFormation.sqf
//	@file Author: Staynex, Wiking.at
//	@file modified : Bryan /  matar e destruir vencer pelo brasil 
//	@file Created: 19/07/2020
if (!isServer) exitwith {};
#include "hostileairMissionDefines.sqf"

private ["_planeChoices", "_convoyVeh", "_veh1", "_veh2", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_vehicleName2", "_numWaypoints", "_cash", "_boxes1", "_currBox1", "_boxes2", "_currBox2", "_box1", "_box2"];

_setupVars =
{
	_missionType = "JATOS HOSTIS";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);

	_planeChoices =
	[
		[
            "B_Plane_Fighter_01_F",                 // F/A-181 Black Wasp
            "B_Plane_Fighter_01_F"                  // F/A-181 Black Wasp
		],
        [
            "B_Plane_Fighter_01_Stealth_F",         // F/A-181 Black Wasp Stealth
            "B_Plane_Fighter_01_Stealth_F"          // F/A-181 Black Wasp Stealth
		],
		[
            "O_Plane_Fighter_02_F",                 // To-201 Shikra
            "O_Plane_Fighter_02_F"                  // To-201 Shikra
		],
        [
            "O_Plane_Fighter_02_Stealth_F",         // To-201 Shikra Stealth
            "O_Plane_Fighter_02_Stealth_F"          // To-201 Shikra Stealth
		],
        [
            "B_Plane_CAS_01_dynamicLoadout_F",      // A-164 Wipeout CAS
            "B_Plane_CAS_01_dynamicLoadout_F"       // A-164 Wipeout CAS
		],
        [
            "O_Plane_CAS_02_dynamicLoadout_F",      // To-199 Neophron CAS
            "O_Plane_CAS_02_dynamicLoadout_F"       // To-199 Neophron CAS
		],
        [
            "I_Plane_Fighter_04_F",     // A-149 Gryphon
            "I_Plane_Fighter_04_F"      // A-149 Gryphon
		]
	];

	_convoyVeh = _planeChoices call BIS_fnc_selectRandom;

	_veh1 = _convoyVeh select 0;
	_veh2 = _convoyVeh select 1;

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
        
		_vel = [velocity _vehicle, -(_direction)] call BIS_fnc_rotateVector2D; // Added to make it fly
		_vehicle setVelocity _vel; // Added to make it fly

		// add pilot
		_soldier = [_aiGroup, _position] call createRandomPilot;
		_soldier moveInDriver _vehicle;
        

        // lock the vehicle until the mission is finished and initialize cleanup on it	
		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		_vehicle
    };

	_aiGroup = createGroup CIVILIAN;

	_vehicles =
	[
		[_veh1, _missionPos vectorAdd ([[random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D), 0] call _createVehicle,
		[_veh2, _missionPos vectorAdd ([[random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D), 0] call _createVehicle
	];

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;
	_leader setRank "LIEUTENANT";
	
	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";
	_aiGroup setFormation "LINE";

	_speedMode = if (missionDifficultyHard) then { "LIMITED" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	// behaviour on waypoints
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointBehaviour "COMBAT";
		_waypoint setWaypointFormation "LINE";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh1 >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _veh1 >> "displayName");
	_vehicleName2 = getText (configFile >> "CfgVehicles" >> _veh2 >> "displayName");

	_missionHintText = format ["Uma formação de jatos contendo dois <t color='%3'>%1</t> estão patrulhando a ilha. Destrua-os e recupere sua carga!", _vehicleName, _vehicleName2, mainMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed

	_Boxes1 = ["Box_IND_Wps_F","Box_NATO_Wps_F","Box_NATO_AmmoOrd_F","Box_NATO_Grenades_F","Box_NATO_WpsLaunch_F","Box_NATO_WpsSpecial_F"];    
	_currBox1 = _Boxes1 call BIS_fnc_selectRandom;
	_box1 = createVehicle [_currBox1, _lastPos, [], 2, "None"];
	_box1 setDir random 360;
    [_box1, ["US", "OTHER"] call BIS_fnc_selectRandom] call fn_refillbox;
	_box1 allowDamage false;

	_Boxes2 = ["Box_East_Wps_F","Box_East_WpsLaunch_F","Box_East_WpsSpecial_F"];    
	_currBox2 = _Boxes2 call BIS_fnc_selectRandom;
	_box2 = createVehicle [_currBox2, _lastPos, [], 2, "None"];
	_box2 setDir random 360;
    [_box2, "RU"] call fn_refillbox;
	_box2 allowDamage false;
	
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];

	_successHintMessage = "O céu está limpo novamente, a patrulha do jato inimigo foi abatida! As caixas de suprimento caíram perto dos destroços.";
};

_this call hostileairMissionsProcessor;
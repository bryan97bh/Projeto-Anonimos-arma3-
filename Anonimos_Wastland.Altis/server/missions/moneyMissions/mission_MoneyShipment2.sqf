// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2.1
//	@file Name: mission_MoneyShipment.sqf
//	@file Author: JoSchaap / routes by Del1te - (original idea by Sanjo), AgentRev
//	@file Created: 31/08/2013 18:19

if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private ["_MoneyShipment", "_moneyAmount", "_convoys", "_vehChoices", "_moneyText", "_vehClasses", "_createVehicle", "_vehicles", "_veh2", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_cash"];

_setupVars =
{
	_locationsArray = LandConvoyPaths;

	// Money Shipments settings
	// Difficulties : Min = 1, Max = infinite
	// Convoys per difficulty : Min = 1, Max = infinite
	// Vehicles per convoy : Min = 1, Max = infinite
	// Choices per vehicle : Min = 1, Max = infinite
	_MoneyShipment =
	[
		// Easy
		[
			"ESCOLTA DE DINHEIRO", // Marker text
			10000, // Money
			[
				[ // NATO convoy
					["B_T_LSV_01_armed_F"], // Veh 1
					["B_T_LSV_01_armed_F"], // Veh 2
					["B_T_LSV_01_AT_F"], // Veh 3
					["B_T_LSV_01_AT_F"] // Veh 4
					, [["B_Heli_Light_01_dynamicLoadout_F", "pawnee20mm"]] // Veh 4 - Heli
				],
				[ // CSAT convoy
					["O_T_LSV_02_armed_F"], // Veh 1
					["O_T_LSV_02_armed_F"], // Veh 2
					["O_T_LSV_02_AT_F"], // Veh 3
					["O_T_LSV_02_AT_F"]  // Veh 4
					, [["O_Heli_Light_02_dynamicLoadout_F", "Hell20mm"]] // Veh 4 - Heli
				],
				[ // AAF convoy
					["I_LT_01_cannon_F"], // Veh 1
					["I_LT_01_AT_F"], // Veh 2
					["I_G_Offroad_01_armed_F"], // Veh 3
					["I_G_Offroad_01_AT_F"] // Veh 4
					, [["I_Heli_light_03_dynamicLoadout_F", "Hell20mm"]] // Veh 4 - Heli
				]
			]
		],
		// Medium
		[
			"ESCOLTA DE DINHEIRO", // Marker text
			15000, // Money
			[
				[ // NATO convoy
					["B_MRAP_01_hmg_F"], // Veh 1
					["B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F"], // Veh 2
					["B_MRAP_01_gmg_F"], // Veh 3
					["I_LT_01_scout_F"], // Veh 4
					["I_LT_01_AA_F"] // Veh 5
					, [["I_Heli_light_03_dynamicLoadout_F", "Hell20mm"]] // Veh 4 - Heli
				],
				[ // CSAT convoy
					["O_MRAP_02_hmg_F"], // Veh 1
					["O_APC_Wheeled_02_rcws_v2_F", "O_APC_Tracked_02_cannon_F"], // Veh 2
					["O_MRAP_02_gmg_F"], // Veh 3
					["I_LT_01_scout_F"], // Veh 4
					["I_LT_01_AA_F"] // Veh 5
					, [["I_Heli_light_03_dynamicLoadout_F", "Hell20mm"]] // Veh 4 - Heli
				],
				[ // AAF convoy
					["I_MRAP_03_hmg_F"], // Veh 1
					["I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"], // Veh 2
					["I_MRAP_03_gmg_F"], // Veh 3
					["I_LT_01_scout_F"], // Veh 4
					["I_LT_01_AA_F"] // Veh 5
					, [["I_Heli_light_03_dynamicLoadout_F", "Hell20mm"]] // Veh 6 - Heli
				]
			]
		],
		// Hard
		[
			"ESCOLTA DE DINHEIRO", // Marker text
			20000, // Money
			[
				[ // NATO convoy
					["B_APC_Tracked_01_rcws_F"], // Veh 1
					["B_AFV_Wheeled_01_cannon_F", "B_AFV_Wheeled_01_up_cannon_F"], // Veh 2
					["B_APC_Wheeled_01_cannon_F"], // Veh 3
					["B_APC_Tracked_01_AA_F"] // Veh 4
					, [["O_Heli_Attack_02_dynamicLoadout_F", "missile"]] // Veh 4 - Heli					
				],
				[ // CSAT convoy
					["O_APC_Wheeled_02_rcws_v2_F"], // Veh 1
					["O_APC_Tracked_02_cannon_F"], // Veh 2
					["O_APC_Tracked_02_AA_F"] // Veh 3
					, [["O_Heli_Attack_02_dynamicLoadout_F", "missile"]] // Veh 4 - Heli					
				],
				[ // AAF convoy
					["I_APC_Wheeled_03_cannon_F"], // Veh 1
					["I_APC_tracked_03_cannon_F"], // Veh 2
					["B_APC_Tracked_01_AA_F"] // Veh 3
					, [["O_Heli_Attack_02_dynamicLoadout_F", "missile"]] // Veh 4 - Heli					
				]
			]
		],
		// Extreme
		[
			"ESCOLTA DE DINHEIRO", // Marker text
			30000, // Money
			[
				[ // NATO convoy
					["B_APC_Tracked_01_rcws_F"], // Veh 1
					["B_AFV_Wheeled_01_cannon_F", "B_AFV_Wheeled_01_up_cannon_F"], // Veh 2
					["B_APC_Wheeled_01_cannon_F"], // Veh 3
					["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"], // Veh 4
					["B_APC_Tracked_01_AA_F"] // Veh 5
					, [["O_Heli_Attack_02_dynamicLoadout_F", "missile"]] // Veh 6 - Heli					
				],
				[ // CSAT convoy
					["O_APC_Wheeled_02_rcws_v2_F"], // Veh 1
				    ["O_APC_Tracked_02_cannon_F"], // Veh 2
					["O_MBT_04_cannon_F", "O_MBT_04_command_F"], // Veh 3
					["O_MBT_02_cannon_F"], // Veh 4
				    ["O_APC_Tracked_02_AA_F"] // Veh 5
					, [["O_Heli_Attack_02_dynamicLoadout_F", "missile"]] // Veh 6 - Heli					
				],
				[ // AAF convoy
					["I_APC_Wheeled_03_cannon_F"], // Veh 1
					["I_APC_tracked_03_cannon_F"], // Veh 2
					["I_MBT_03_cannon_F"], // Veh 3
					["I_MBT_03_cannon_F"], // Veh 4
					["B_APC_Tracked_01_AA_F"] // Veh 5
					, [["O_Heli_Attack_02_dynamicLoadout_F", "missile"]] // Veh 6 - Heli					
				]
			]
		]
	]
	call BIS_fnc_selectRandom;

	_missionType = _MoneyShipment select 0;
	_moneyAmount = _MoneyShipment select 1;
	_convoys = _MoneyShipment select 2;
	_vehChoices = _convoys call BIS_fnc_selectRandom;

	_moneyText = format ["$%1", [_moneyAmount] call fn_numbersText];

	_vehClasses = [];
	{ _vehClasses pushBack (_x call BIS_fnc_selectRandom) } forEach _vehChoices;
};

_setupObjects =
{
	private ["_starts", "_startDirs", "_waypoints"];
	call compile preprocessFileLineNumbers format ["mapConfig\convoys\%1.sqf", _missionLocation];

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_vehicle", "_soldier", "_altitude", "_variant"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;
		_variant = _type param [1,"",[""]];

		if (_type isEqualType []) then
		{
			_type = _type select 0;
		};		

		_vehicle = createVehicle [_type, _position, [], 0, "Fly"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		// Force locked 
		_vehicle setVariable ["objectLocked", true, true];			
		_vehicle setVariable ["A3W_skipAutoSave", true, true];		
		
		if (_variant != "") then
		{
			_vehicle setVariable ["A3W_vehicleVariant", _variant, true];
		};		
		
		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInDriver _vehicle;

		// Helis with Gunner only
		if (_type isKindOf "Helicopter") then
		{	
			_altitude = [300, 400, 500] call BIS_fnc_selectRandom; 			
			_vehicle setPosASL [(_position select 0), (_position select 1), _altitude];				
			_vehicle flyInHeight _altitude;			
		
			// Gunner only for Blackfoot and Kajman
			if (_type isKindOf "Heli_Attack_01_base_F" || _type isKindOf "Heli_Attack_02_base_F") then
			{
				_soldier = [_aiGroup, _position] call createRandomSoldier;
				_soldier moveInGunner _vehicle;
			};
		}
		else
		{
			_soldier = [_aiGroup, _position] call createRandomSoldier;
			_soldier moveInCargo [_vehicle, 0];

			if !(_type isKindOf "Truck_F") then
			{
				_soldier = [_aiGroup, _position] call createRandomSoldier;
				_soldier moveInGunner _vehicle;

				_soldier = [_aiGroup, _position] call createRandomSoldier;

				if (_vehicle emptyPositions "commander" > 0) then
				{
					_soldier moveInCommander _vehicle;
				}
				else
				{
					_soldier moveInCargo [_vehicle, 1];
				};
			};
		};
		
		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;

		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles = [];
	{
		_vehicles pushBack ([_x, _starts select 0, _startdirs select 0, _aiGroup] call _createVehicle);
	} forEach _vehClasses;

	_veh2 = _vehClasses select (1 min (count _vehClasses - 1));

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "RED"; // units will defend themselves
	_aiGroup setBehaviour "SAFE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup setFormation "STAG COLUMN";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	{
		_waypoint = _aiGroup addWaypoint [_x, 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 25;
		_waypoint setWaypointCombatMode "RED";
		_waypoint setWaypointBehaviour "SAFE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach _waypoints;

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh2 >> "picture");
	_vehicleName = getText (configFile >> "cfgVehicles" >> _veh2 >> "displayName");

	_missionHintText = format ["Um comboio transportando <t color='%1'>%2</t> escoltado por <t color='%1'>%3</t> tem rota desconhecida.<br/>Pare eles!", moneyMissionColor, _moneyText, _vehicleName];

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

	// Force unlocked 
	{ _x setVariable ["objectLocked", false, true]; } forEach _vehicles;		
	
	for "_i" from 1 to 10 do
	{
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _moneyAmount / 10, true];
		_cash setVariable ["owner", "world", true];
	};

	_successHintMessage = "O comboio foi parado. O dinheiro e os veículos estão nas proximidades.";
};

_this call moneyMissionProcessor;

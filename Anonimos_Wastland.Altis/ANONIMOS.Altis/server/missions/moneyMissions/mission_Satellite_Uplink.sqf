// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: Satellite_Uplink.sqf
//	@file Author: wiking.at
//  Mission makes only sense for Servers with the AJ Base improvements
//  Allows to locate baselockers on the map and shows vehicles.

if (!isServer) exitwith {};


#include "moneyMissionDefines.sqf";

private ["_positions", "_bunker", "_laptop", "_table", "_bunkerPos", "_connectedLaptop","_randomGroup", "_vehicleName", "_cash", "_aiPos", "_radius"];

_setupVars =
{
	_missionType = "SATÉLITE DE RECONHECIMENTO";
	_locationsArray = SatelliteMissionMarkers
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	_baseToDelete = nearestObjects [_missionPos, ["CamoNet_INDP_big_F","Land_WoodenTable_small_F","Land_Laptop_unfolded_F"], 50];
	{ deleteVehicle _x } forEach _baseToDelete; 
	

	_bunker = createVehicle ["CamoNet_INDP_big_F", [_missionPos select 0, _missionPos select 1], [], 0, "CAN_COLLIDE"];
	_bunker allowdamage false;
	_bunker setDir random 360;
	_bunker setVariable ["R3F_LOG_disabled", true, true];
	
	_bunkerPos = getPosASL _bunker;

	_table = createVehicle ["Land_WoodenTable_small_F", _bunkerPos, [], 0, "CAN_COLLIDE"];
	_table allowdamage false;
	_table setPosASL [_bunkerPos select 0, (_bunkerPos select 1) - 0.25, _bunkerPos select 2];
	
	if (isDedicated) then {_table enableSimulation false;};
	
	_laptop = createVehicle ["Land_Laptop_unfolded_F", _bunkerPos, [], 0, "CAN_COLLIDE"];
	_laptop allowdamage false;
	_laptop attachTo [_table,[0,0,0.60]];
	if (isDedicated) then {_laptop enableSimulation false;};
	
	_connectedLaptop = _laptop ;
	AddSatLaptopHandler = _connectedLaptop;
	publicVariable "AddSatLaptopHandler";

	_connectedLaptop setVariable [ "Done", false, true ];
	
	_vehicleName = "Laptop";
	_missionHintText = format ["Um <t color='%2'>satélite de reconhecimento</t> foi encomendado sobre a área por causa dos recentes combates pesados. Localizamos um terminal que você pode usar para invadir o satélite e usá-lo.", _vehicleName, moneyMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec =
{
	AddSatLaptopHandler = _connectedLaptop;
	publicVariable "AddSatLaptopHandler";
};
_waitUntilCondition = nil;
_waitUntilSuccessCondition = { _connectedLaptop getVariable ["Done", false] };
_ignoreAiDeaths = true;

_failedExec =
{
	// Mission failed
	RemoveSatLaptopHandler = _connectedLaptop;
	publicVariable "RemoveSatLaptopHandler";
	{ deleteVehicle _x } forEach [_bunker,  _laptop, _table];
};

_successExec =
{
	// Mission completed
	RemoveLaptopHandler = _connectedLaptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_bunker,  _laptop, _table];
	_successHintMessage = format ["O satélite de reconhecimento está hackeado, muito bem!"];
};

_this call moneyMissionProcessor;
// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_geoCache.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev, edit by CRE4MPIE & LouD
//	@file Created: 08/12/2012 15:19
//	@file modified : Bryan /  matar e destruir vencer pelo brasil 
//	@file Created: 19/07/2020

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

private ["_geoPos", "_geoCache", "_randomBox", "_box", "_para"];

_setupVars =
{
	_missionType = "ANÁLISE GEOGRÁFICA";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_geoPos = _missionPos vectorAdd ([[25 + random 20, 0, 0], random 360] call BIS_fnc_rotateVector2D);	
	_geoCache = createVehicle ["Land_SurvivalRadio_F",[(_geoPos select 0), (_geoPos select 1),0],[], 0, "NONE"];

	_missionHintText = "Uma análise geográfica foi marcada no mapa, encontre um objeto pequeno e uma recompensa será entregue por via aérea!";
};

_ignoreAiDeaths = true;
_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;
_waitUntilSuccessCondition = {{isPlayer _x && _x distance _geoPos < 5} count playableUnits > 0};

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_GeoCache];
};

_successExec =
{
	// Mission completed
	{ deleteVehicle _x } forEach [_GeoCache];
	
	_randomBox = selectRandom ["mission_USLaunchers","mission_USRifles","mission_USMachineguns","mission_USSniper","mission_RULaunchers","mission_RURifles","mission_RUMachineguns","mission_Diving","mission_Gear"];
	
	_box = createVehicle ["B_supplyCrate_F",[(_geoPos select 0), (_geoPos select 1),200],[], 0, "NONE"];
	_box setDir random 360;
	[_box, _randomBox] call fn_refillbox;
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box];

	playSound3D ["A3\data_f_curator\sound\cfgsounds\air_raid.wss", _box, false, _box, 15, 1, 1500];
	
	_para = createVehicle [format ["I_parachute_02_F"], [0,0,999999], [], 0, ""];

	_para setDir getDir _box;
	_para setPosATL getPosATL _box;

	_para attachTo [_box, [0, 0, 0]];
	uiSleep 2;

	detach _para;
	_box attachTo [_para, [0, 0, 0]];

	while {(getPos _box) select 2 > 3 && attachedTo _box == _para} do
	{
		_para setVectorUp [0,0,1];
		_para setVelocity [0, 0, (velocity _para) select 2];
		uiSleep 0.1;
	};
	
	_successHintMessage = "A Força Aérea trará sua recompensa! Aguarde!";
};

_this call sideMissionProcessor;
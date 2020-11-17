// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: misssion_WepCache.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

private ["_nbUnits", "_box1", "_box2", "_box3", "_tent1", "_chair1", "_chair2", "_cFire1", "_tent2"];

_setupVars =
{
	_missionType = "ACAMPAMENTO MILITAR";
	_locationsArray = ForestMissionMarkers;
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_box1 = createVehicle ["Box_NATO_Wps_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, ["US", "OTHER"] call BIS_fnc_selectRandom] call fn_refillbox;

	_box2 = createVehicle ["Box_East_Wps_F", _missionPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, ["US", "OTHER"] call BIS_fnc_selectRandom] call fn_refillbox;

	_box3 = createVehicle ["Box_East_Wps_F", _missionPos, [], 5, "None"];
	_box3 setDir random 360;
	[_box3, ["mission_suply"] call BIS_fnc_selectRandom] call fn_refillbox;

	// create some atmosphere around the crates 8)
	_tent1 = createVehicle ["Land_cargo_addon02_V2_F", _missionPos, [], 3, "None"];
	_tent1 setDir random 360;
	_tent2 = createVehicle ["Land_TentA_F", _missionPos, [], 5, "None"];
	_tent2 setDir random 360;
	_chair1 = createVehicle ["Land_CampingChair_V1_F", _missionPos, [], 2, "None"];
	_chair1 setDir random 90;
	_chair2 = createVehicle ["Land_CampingChair_V2_F", _missionPos, [], 2, "None"];
	_chair2 setDir random 180;
	_cFire1	= createVehicle ["Campfire_burning_F", _missionPos, [], 2, "None"];

	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2];

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;
	_aiGroup setCombatMode "Red";

	_missionHintText = "Um grupo militar está acampando com algum suprimentos";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2, _box3, _tent1, _tent2, _chair1, _chair2, _cFire1];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2, _box3, _tent1, _tent2, _chair1, _chair2, _cFire1];

	_successHintMessage = "Os militares foram mortos";
	{ deleteVehicle _x } forEach [_tent1, _tent2, _chair1, _chair2, _cFire1];
};

_this call sideMissionProcessor;

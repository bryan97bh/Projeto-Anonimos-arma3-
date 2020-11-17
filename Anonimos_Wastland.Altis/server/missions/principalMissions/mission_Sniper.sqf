// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_AirWreck.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "principalMissionsDefines.sqf"

private ["_nbUnits", "_wreckPos", "_wreck", "_box1", "_box2"];

_setupVars =
{
	_missionType = "ACAMPAMENTO DE CAÇADORES";
	_locationsArray = ForestMissionMarkers;
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_wreckPos = _missionPos vectorAdd ([[25 + random 20, 0, 0], random 360] call BIS_fnc_rotateVector2D);

	// Class, Position, Fuel, Ammo, Damage, Special
	//_wreck = ["O_Heli_Light_02_unarmed_F", _wreckPos, 0, 0, 1] call createMissionVehicle;

	_box1 = createVehicle ["Box_NATO_WpsSpecial_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, ["US", "OTHER"] call BIS_fnc_selectRandom] call fn_refillbox;

	_box2 = createVehicle ["Box_East_WpsSpecial_F", _missionPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, ["RU", "MILITIA"] call BIS_fnc_selectRandom] call fn_refillbox;

	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2];

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createsniperGroup;
	
	_aiGroup setCombatMode "Red";

	//_missionPicture = getText (configFile >> "CfgVehicles" >> typeOf _wreck >> "picture");
	_missionHintText = "Um grupo de caçadores foi visto. Vá para a área marcada e acabe com eles. Tenha cuidado, eles sâo os melhores em matar!";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2, _wreck];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];
	deleteVehicle _wreck;

	_successHintMessage = "Os caçadores estão mortos FO+!";
};

_this call principalMissionProcessor;

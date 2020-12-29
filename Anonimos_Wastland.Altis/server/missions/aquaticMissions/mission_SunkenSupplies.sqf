// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_SunkenSupplies.sqf
//	@file Author: JoSchaap, AgentRev

if (!isServer) exitwith {};
#include "aquaticMissionDefines.sqf"

private ["_box1", "_box2", "_box3", "_box4", "_boxPos"];

_setupVars =
{
	_missionType = "SUPRIMENTOS AFUNDADO";
	_locationsArray = SunkenMissionMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_randomBox = ["O_CargoNet_01_ammo_F","mission_Uniform","mission_HVSniper"] call BIS_fnc_selectRandom;
	_randomBox2 = ["mission_USSpecial","B_supplyCrate_F","mission_HVLaunchers"] call BIS_fnc_selectRandom;
	_box1 = createVehicle ["O_CargoNet_01_ammo_F", _missionPos, [], 5, "None"];
	[_box1, ["RU", "MILITIA"] call BIS_fnc_selectRandom] call fn_refillbox;

	_box2 = createVehicle ["I_CargoNet_01_ammo_F", _missionPos, [], 5, "None"];
	[_box2, ["RU", "MILITIA"] call BIS_fnc_selectRandom] call fn_refillbox;

	_box3 = createVehicle ["I_E_CargoNet_01_ammo_F", _missionPos, [], 5, "None"];
	[_box3, ["RU", "MILITIA"] call BIS_fnc_selectRandom] call fn_refillbox;

	_box4 = createVehicle ["B_CargoNet_01_ammo_F", _missionPos, [], 5, "None"];
	[_box4, ["RU", "MILITIA"] call BIS_fnc_selectRandom] call fn_refillbox;

	{
		_boxPos = getPosASL _x;
		_boxPos set [2, getTerrainHeightASL _boxPos + 1];
		_x setPos _boxPos;
		_x setDir random 360;
		_x setVariable ["R3F_LOG_disabled", true, true];
	} forEach [_box1, _box2, _box3, _box4];

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos] call createLargeDivers;

	_missionHintText = "Suprimentos afundados foram vistos no oceano perto da marcação e estao fortemente protegidos. Recomenda-se equipamento de mergulho e arma de propósito duplo...";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2, _box3, _box4];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2, _box3, _box4];

	_successHintMessage = "Suprimentos afundados foram recolhidos.";
};

_this call aquaticMissionsProcessor;

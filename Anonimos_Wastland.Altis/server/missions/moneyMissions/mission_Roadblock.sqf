// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Roadblock.sqf
//	@file Author: Staynex

if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private [ "_box1", "_barGate", "_bunker1", "_bunker2", "_obj1", "_obj2", "_drop_item", "_drugpilerandomizer", "_drugpile", "_cash1", "_soldier"];

_setupVars =
{
	_missionType = "BLOQUEIO NA ESTRADA";
	_locationsArray = RoadblockMissionMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_markerDir = markerDir _missionLocation;
	
	//delete existing base parts and vehicles at location
	_baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	{ deleteVehicle _x } forEach _baseToDelete; 	
	
	_bargate = createVehicle ["Land_BarGate_F", _missionPos, [], 0, "NONE"];
	_bargate setDir _markerDir;
	_bunker1 = createVehicle ["Land_BagBunker_Small_F", _bargate modelToWorld [6.5,-2,-4.1], [], 0, "NONE"];
	_obj1 = createVehicle ["I_GMG_01_high_F", _bargate modelToWorld [6.5,-2,-4.1], [], 0, "NONE"];
	_bunker1 setDir _markerDir;
	_bunker2 = createVehicle ["Land_BagBunker_Small_F", _bargate modelToWorld [-8,-2,-4.1], [], 0, "NONE"];
	_obj2 = createVehicle ["I_HMG_01_high_F", _bargate modelToWorld [-8,-2,-4.1], [], 0, "NONE"];
	_bunker2 setDir _markerDir;

	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_obj1, _obj2, _barGate, _bunker1, _bunker2];  
	{ _x setVariable ["allowDamage", false, true] } forEach [_obj1, _obj2, _barGate, _bunker1, _bunker2];

//    _soldier1 = [_aiGroup, _missionPos] call createRandomSoldier;
//	_soldier1 moveInGunner _obj1;
    
//    _soldier2 = [_aiGroup, _missionPos] call createRandomSoldier;
//	_soldier2 moveInGunner _obj2;
    
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,6,2] call createroadblockGroup;
	
	_aiGroup setCombatMode "Red";
    	
	_missionHintText = format ["A polícia fez um <t color='%1'>bloqueio na estrada</t> eles estao parando todos os veiculos!", moneyMissionColor]
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	
	{ deleteVehicle _x } forEach [_barGate, _bunker1, _bunker2, _obj1, _obj2];
	
};

_successExec =
{
	// Mission completed
	//_randomBox = ["US"] call BIS_fnc_selectRandom;
	//_box1 = createVehicle ["Box_NATO_Wps_F", _missionPos, [], 5, "None"];
	//_box1 setDir random 360;
	//[_box1, _randomBox] call fn_refillbox;
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_obj1, _obj2, _barGate, _bunker1, _bunker2];
	{ deleteVehicle _x } forEach [_barGate, _bunker1, _bunker2];
	{ _x setVariable ["allowDamage", true, true] } forEach [_obj1, _obj2, _barGate, _bunker1, _bunker2];
	
	_moneypilerandomizer = [4,8];
	_moneypile = _moneypilerandomizer call BIS_fnc_SelectRandom;
	

	
	for "_i" from 1 to _moneypile do
	{
		_cash1 = createVehicle ["Land_Money_F",[(_lastPos select 0), (_lastPos select 1) - 5,0],[], 0, "NONE"];
		_cash1 setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash1 setDir random 360;
		_cash1 setVariable ["cmoney",900,true];
		_cash1 setVariable ["owner", "world", true];
	};
  
	_successHintMessage = format ["Estrada livre novamente!Bom trabalho!"];
};

_this call moneyMissionProcessor;
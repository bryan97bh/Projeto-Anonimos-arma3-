// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Smugglers.sqf
//	@file Author: soulkobk, Staynex

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf";

private ["_positions", "_smugglerVeh", "_vehicle1", "_vehicle2", "_boxes1", "_currBox1", "_randomBox", "_box1", "_boxes2", "_currBox2", "_box2", "_cash", "_drop_item", "_drugpilerandomizer", "_drugpile"];

_setupVars =
{
	_missionType = "CONTRABANDO DE ARMAS";

	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_smugglerVeh = ["O_T_LSV_02_armed_F","B_T_LSV_01_armed_F","B_MRAP_01_hmg_F","B_Truck_01_covered_F","B_G_Offroad_01_armed_F","C_Offroad_02_unarmed_F","O_Truck_03_covered_F","I_Truck_02_covered_F","B_MRAP_01_F","O_T_LSV_02_unarmed_F","B_T_LSV_01_unarmed_F"] call BIS_fnc_selectRandom; 

    _vehicle1 = [_smugglerVeh,[(_missionPos select 0) - 5, (_missionPos select 1) + 10,0],0.5,0.5,0,"NONE"] call createMissionVehicle;
	_vehicle1 setVariable [call vChecksum, true, false];
	
	_vehicle2 = [_smugglerVeh,[(_missionPos select 0) - 5, (_missionPos select 1) - 10,0],0.5,1,0,"NONE"] call createMissionVehicle;
	_vehicle2 setVariable [call vChecksum, true, false];
	
	_boxes1 = ["Box_FIA_Support_F","Box_FIA_Wps_F","Box_FIA_Ammo_F"];
	_currBox1 = _boxes1 call BIS_fnc_selectRandom;
	_randomBox = ["RU", "MILITIA"] call BIS_fnc_selectRandom;
	_box1 = createVehicle [_currBox1,[(_missionPos select 0), (_missionPos select 1),0],[], 0, "NONE"];
	[_box1, _randomBox] call fn_refillbox;
	
    //One box and the vehicles should be enough!
    /*
	_boxes2 = ["Box_FIA_Support_F","Box_FIA_Wps_F","Box_FIA_Ammo_F"];
	_currBox2 = _boxes2 call BIS_fnc_selectRandom;
	_box2 = createVehicle [_currBox2,[(_missionPos select 0) - 5, (_missionPos select 1) - 8,0],[], 0, "NONE"];
	_box2 allowDamage false;
	_box2 setVariable ["R3F_LOG_disabled", true, true];
    */
	
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,7] spawn createsmugglersGroup;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";
	
	_missionPicture = getText (configFile >> "CfgVehicles" >> _smugglerVeh >> "picture");
	
	_missionHintText = format ["um grupo de contrabandistas foi avistado nessa posição marcada no mapa!", sideMissionColor];
};
	
_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	//{ deleteVehicle _x } forEach [_box1, _box2, _vehicle1, _vehicle2];
    { deleteVehicle _x } forEach [_box1, _vehicle1, _vehicle2];
};

_drop_item = 
{
	private["_item", "_pos"];
	_item = _this select 0;
	_pos = _this select 1;

	if (isNil "_item" || {typeName _item != typeName [] || {count(_item) != 2}}) exitWith {};
	if (isNil "_pos" || {typeName _pos != typeName [] || {count(_pos) != 3}}) exitWith {};

	private["_id", "_class"];
	_id = _item select 0;
	_class = _item select 1;

	private["_obj"];
	_obj = createVehicle [_class, _pos, [], 5, "None"];
	_obj setPos ([_pos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
	_obj setVariable ["mf_item_id", _id, true];
};

_successExec =
{
	// Mission completed
	//{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];
    { _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1];
	{ _x setVariable ["A3W_missionVehicle", true, true] } forEach [_vehicle1, _vehicle2];
    [_vehicle1, 1] call A3W_fnc_setLockState; // Unlock
    [_vehicle2, 1] call A3W_fnc_setLockState; // Unlock
	
    //No more money... Loot must be enough!
    /* 
	for "_i" from 1 to 10 do
	{
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", 30000 / 10, true];
		_cash setVariable ["owner", "world", true];
	};
    */
	
    //Staynex hates drugs!
    /*
	_drugpilerandomizer = [6,7,8];
	_drugpile = _drugpilerandomizer call BIS_fnc_SelectRandom;
	
	for "_i" from 1 to _drugpile do 
	{
	  private["_item"];
	  _item = [
	          ["lsd", "Land_WaterPurificationTablets_F"],
	          ["marijuana", "Land_VitaminBottle_F"],
	          ["cocaine","Land_PowderedMilk_F"],
	          ["heroin", "Land_PainKillers_F"]
	        ] call BIS_fnc_selectRandom;
	  [_item, _lastPos] call _drop_item;
	};
    */
	
	_successHintMessage = format ["O grupo contrabandistas foi morto!!"];
};

_this call sideMissionProcessor;

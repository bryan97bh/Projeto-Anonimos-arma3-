// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: spawnOnBeacons.sqf
//	@file Author: [404] Costlyy, [GoT] JoSchaap, MercyfulFate, AgentRev
//	@file Created: 08/12/2012 18:30
//	@file Args:
call compile preprocessFileLineNumbers "client\functions\functions.sqf";

private ["_data", "_beacon", "_pos", "_owner", "_preload", "_height", "_playerPos"];
_data = _this select 0;
_beacon = objectFromNetId (_data select 0);
_pos = _data select 1;
_owner = _data select 2;
_preload = param [1, false, [false]];
_height = (["A3W_spawnBeaconSpawnHeight", 0] call getPublicVar) max 0;

_beacon setVariable ["spawnBeacon_lastUse", diag_tickTime];
player setVariable ["spawnBeacon_lastUse", diag_tickTime]; // Spaawn beacon bug
[player, _beacon] remoteExecCall ["A3W_fnc_updateSpawnTimestamp", 2];

if (_height < 25) then
{
	_pos set [2, 0];
	_playerPos = [_pos,1,25,1,0,0,0] call findSafePos;
}
else
{
	_playerPos = [_pos select 0, _pos select 1, _height];
};

if (_preload) then { waitUntil {preloadCamera _playerPos} };

waitUntil {!isNil "bis_fnc_init" && {bis_fnc_init}};

player setPos _playerPos;

//player addBackpack "B_Parachute";
respawnDialogActive = false;
closeDialog 0;

_target = player;
_loadout=[_target] call Getloadout;
0=[_target] call Frontpack;

Private _ItemsBack = backpackItems player;

removeBackpack _target;
sleep 0.5;
_target addBackpack "B_Parachute";
while {(getPos _target select 2) > 2} do {
    sleep 1;
};
deletevehicle (_target getvariable "frontpack");
_target setvariable ["frontpack",nil,true];
0=[_target,_loadout] call Setloadout;

{
	player addItemToBackpack _X;
} ForEach _ItemsBack;

_owner spawn
{
	_owner = _this;
	_ownerArr = toArray _owner;
	_letter = if (toString [_ownerArr select (count _ownerArr - 1)] == "s") then { "" } else { "s" };
	sleep 1;

	_hour = date select 3;
	_mins = date select 4;
	["Wasteland", format ["%1'%2 beacon", _owner, _letter], format ["%1:%3%2", _hour, _mins, if (_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;
};

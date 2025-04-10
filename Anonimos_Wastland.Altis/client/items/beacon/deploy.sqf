// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: deploy.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Deploy a Spawn Beacon
//@file Argument: [player, player, _action, []] the standard "called by an action" values

#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_CANCELLED "Ação Cancelada"
#define ERR_IN_VEHICLE "Ação falhou! Você não pode fazer isso em um veículo"
#define MAX_BEACONS format ["Você não pode montar mais de %1 spawnbeacons", [_MaxSpawnbeacons]]
_MaxSpawnbeacons = ceil (["A3W_maxSpawnBeacons", 5] call getPublicVar);

private ["_hasFailed", "_success","_pos","_uid","_beacon","_beacons","_ownedBeacons"];

_beacons = []; 
{ 
	if (_x getVariable ["ownerUID",""] == getPlayerUID player) then 
	{ 
		_beacons pushBack _x; 
	}; 
} forEach pvar_spawn_beacons; 

_ownedBeacons = count _beacons;


_hasFailed = {
	private ["_progress", "_failed", "_text"];
	_progress = _this select 0;
	_failed = true;
	switch (true) do {
		case (!alive player): {};
		case (doCancelAction) :{doCancelAction = false; _text = ERR_CANCELLED;};
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (_ownedBeacons >= _MaxSpawnbeacons): {_text = MAX_BEACONS; player spawn deleteBeacon};
		default {
			_text = format["Spawn Beacon %1%2 Montado", round(_progress*100), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};
_success = [MF_ITEMS_SPAWN_BEACON_DURATION, ANIM, _hasFailed, []] call a3w_actions_start;

if (_success) then {
	_uid = getPlayerUID player;
	// Spawn 2m in front of the player
	_beacon = createVehicle [MF_ITEMS_SPAWN_BEACON_DEPLOYED_TYPE, [player, [0,2,0]] call relativePos, [], 0, "CAN_COLLIDE"];
	_beacon setDir (getDir player + 270);
	_beacon setVariable ["allowDamage", true, true];
	_beacon setVariable ["a3w_spawnBeacon", true, true];
	_beacon setVariable ["R3F_LOG_disabled", true];
	_beacon setVariable ["side", playerSide, true];
	_beacon setVariable ["ownerName", name player, true];
	_beacon setVariable ["ownerUID", _uid, true];
	_beacon setVariable ["packing", false, true];
	_beacon setVariable ["groupOnly", (playerSide == INDEPENDENT), true];
	/*{
		if (_x getVariable ["ownerUID",""] == _uid) then {
			pvar_spawn_beacons = pvar_spawn_beacons - [_x];
		};
	} forEach pvar_spawn_beacons;*/

	pvar_spawn_beacons pushBack _beacon;
	publicVariable "pvar_spawn_beacons";

  trackObject = _beacon;
  publicVariableServer "trackObject";

	["Você colocou o Spawn Beacon com sucesso!", 5] call mf_notify_client;
};
_success;


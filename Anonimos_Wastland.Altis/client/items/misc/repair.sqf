// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: repair.sqf
//@file Author: MercyfulFate
//@file Created: 23/7/2013 16:00
//@file Description: Repair the nearest Vehicle

#define DURATION 20
#define REPAIR_RANGE 6;
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_NO_VEHICLE "Você não está perto o suficiente de um veículo que precise de reparos"
#define ERR_IN_VEHICLE "Falha na reparação! Você não pode fazer isso em um veículo"
#define ERR_FULL_HEALTH "Falha na reparação! O veículo já está reparado"
#define ERR_DESTROYED "O veículo está muito danificado para reparar"
#define ERR_TOO_FAR_AWAY "Falha no reparo! Você se afastou muito do veículo"
#define ERR_CANCELLED "Reparação cancelada!"

private ["_vehicle", "_hitPoints", "_checks", "_success"];
_vehicle = call mf_repair_nearest_vehicle;
_hitPoints = (typeOf _vehicle) call getHitPoints;

_checks = {
	private ["_progress","_failed", "_text"];
	_progress = _this select 0;
	_vehicle = _this select 1;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player): {}; // player is dead, no need for a notification
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (player distance _vehicle > (sizeOf typeOf _vehicle / 3) max 2): {_text = ERR_TOO_FAR_AWAY};
		case (!alive _vehicle): {_text = ERR_DESTROYED};
		case (damage _vehicle < 0.05 && {{_vehicle getHitPointDamage (configName _x) > 0.05} count _hitPoints == 0}): {_text = ERR_FULL_HEALTH}; // 0.2 is the threshold at which wheel damage causes slower movement
		case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
		default {
			_text = format["Reparação %1%2 Completo", round(100 * _progress), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};

_success = [DURATION, ANIMATION, _checks, [_vehicle]] call a3w_actions_start;

if (_success) then {
	[netId _vehicle] remoteExec ["mf_remote_repair", _vehicle];
	["Reparação completada!", 5] call mf_notify_client;
};
_success;

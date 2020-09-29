// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: applypin.sqf
//@file Author: LouD (based on refuel.sqf by MercyfulFate)
//@file Description: Apply pinlock to nearest vehicle
//@file Argument: [player, player, _actionid, []] the standard "called by an action" values

#define DURATION 5 // seconds
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_IN_VEHICLE "Aplicação faihou! Você não pode fazer isso dentro de um veículo."
#define ERR_TOO_FAR_AWAY "Aplicação faihou! Você se moveu para longe do veículo."
#define ERR_NOT_OWNER "Você não pode fazer isso se não for o proprietário do veículo."
#define ERR_LOCKED "Esse veículo precisa estar destravado primeiro!"
#define ERR_PIN "Esse veículo já tem um TravaCarro."
#define ERR_NO_PINLOCK "Você não tem a propriedade de um dispositivo TravaCarro."
#define ERR_CANCELLED "Aplicação Cancelada!"

private ["_vehicle", "_error"];
_vehicle = call mf_pinlock_nearest_vehicle;
_error = [_vehicle] call mf_can_applypin;
if (_error != "") exitWith {[_error, 5] call mf_notify_client; false;};

_checks = 
{
	private ["_progress","_vehicle","_failed", "_text"];
	_progress = _this select 0;
	_vehicle = _this select 1;
	_text = "";
	_failed = true;
	switch (true) do 
	{
		case (!alive player): {}; //player is dead, no need for a notification
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (player distance _vehicle > (sizeOf typeOf _vehicle / 3) max 2): {_text = ERR_TOO_FAR_AWAY};
		case (_vehicle getVariable ["ownerUID",""] != getPlayerUID player): {_error = ERR_NOT_OWNER};
		case (locked _vehicle == 2): {_error = ERR_LOCKED};
		case (_vehicle getVariable ["vPin", false]): {_error = ERR_PIN};
		case ((MF_ITEMS_PINLOCK call mf_inventory_count) <= 0): {_error = ERR_NO_PINLOCK};
		case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
		default 
		{
			_text = format["Aplicando o TravaCarro %1%2 Completo", round(100 * _progress), "%"];
			_failed = false;
	    };
	};
	[_failed, _text];
};
_success = [DURATION, ANIMATION, _checks, [_vehicle]] call a3w_actions_start;
if (_success) then {
	_vehicle setVariable ["vPin", true, true];
	_rNumber = format ["%1", ceil (random 9999)];
	_vehicle setVariable ["password", _rNumber, true];
	[format ["Seu código é %1",_rNumber], 5] call mf_notify_client;	
};
_success;
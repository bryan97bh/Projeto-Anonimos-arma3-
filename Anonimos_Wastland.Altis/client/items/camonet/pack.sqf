// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: pack.sqf
//@file Author: MercyfulFate
//@file Created: 23/7/2013 16:00
//@file Description: Pack the nearest Camouflage Netting
//@file Argument: [player, player, _action, []] the standard "called by an action" values

#include "mutex.sqf"
#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define DURATION 15
#define ERR_TOO_FAR_AWAY "Falha na embalagem da rede de camuflagem. Você se afastou muito longe"
#define ERR_ALREADY_TAKEN "Falha na embalagem da rede de camuflagem. Alguém fez isso primeiro."
#define ERR_IN_VEHICLE "Falha na embalagem da rede de camuflagem. Você não pode fazer isso em um veículo."
#define ERR_CANCELLED "Embalagem da Rede de Camuflagem cancelado"

private ["_beacon", "_error", "_hasFailed", "_success"];
_netting = [] call mf_items_camo_net_nearest;
_error = [_netting] call mf_items_camo_net_can_pack;
if (_error != "") exitWith {[_error, 5] call mf_notify_client};

_hasFailed = {
	private ["_progress", "_netting", "_caller", "_failed", "_text"];
	_progress = _this select 0;
	_netting = _this select 1;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player): {}; // player dead, no error msg needed
		case (isNull _netting): {_text = ERR_ALREADY_TAKEN}; //someone has already taken it.
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (player distance _netting > 5): {_text = ERR_TOO_FAR_AWAY};
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED};
		default {
			_text = format["Rede de Camuflagem %1%2 empacotada", round(_progress*100), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};

MUTEX_LOCK_OR_FAIL;
_success =  [DURATION, ANIM, _hasFailed, [_netting]] call a3w_actions_start;
MUTEX_UNLOCK;

if (_success) then {
	pvar_manualObjectDelete = [netId _netting, _netting getVariable "A3W_objectID"];
	publicVariableServer "pvar_manualObjectDelete";
	deleteVehicle _netting;
	[MF_ITEMS_CAMO_NET, 1] call mf_inventory_add;
	["Você emcapotou a Rede de Camuflagem com sucesso", 5] call mf_notify_client;
};

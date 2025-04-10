// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: unpack.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Unpack a Camouflage Netting from your inventory

#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define DURATION 15
#define ERR_NO_NETS "Falha na descompactação da rede de camuflagem. Você não tem Rede de Camuflagem para descompactar"
#define ERR_IN_VEHICLE "Falha na descompactação da rede de camuflagem.Você não pode fazer isso em um veículo."
#define ERR_CANCELLED "Desembalagem da rede de camuflagem cancelada"

private ["_netting", "_error", "_hasFailed", "_success", "_pos"];

if (MF_ITEMS_CAMO_NET call mf_inventory_count <= 0) exitWith {
	[ERR_NO_NETS,5] call mf_notify_client;
	false;
};

_hasFailed = {
	private ["_progress", "_failed", "_text"];
	_progress = _this select 0;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player): {}; // player dead, no error msg needed
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (MF_ITEMS_CAMO_NET call mf_inventory_count <= 0): {_text = ERR_NO_NETS};
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED};
		default {
			_text = format["Rede de Camuflagem %1%2 desembalada", round(_progress*100), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};

_success =  [DURATION, ANIM, _hasFailed, []] call a3w_actions_start;

if (_success) then {
	_netting = createVehicle [MF_ITEMS_CAMO_NET_TYPE, getPosATL player, [], 0, "CAN_COLLIDE"];
	_netting setDir getDir player;
	_netting setVariable ["ownerUID", getPlayerUID player, true];
	_netting setVariable ["objectLocked", true, true];
	_netting setVariable ["allowDamage", true, true];
	pvar_manualObjectSave = netId _netting;
	publicVariableServer "pvar_manualObjectSave";
	["Você desembalou com sucesso a Rede de Camuflagem", 5] call mf_notify_client;
};
_success

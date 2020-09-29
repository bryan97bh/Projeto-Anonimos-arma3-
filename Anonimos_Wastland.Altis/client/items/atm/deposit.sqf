// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: deposit.sqf
//	@file Author: AgentRev
//	@file Function: mf_items_atm_deposit

#include "gui_defines.hpp"

#define ERR_NOT_ENOUGH_FUNDS "Você não tem dinheiro suficiente."
#define ERR_MAX_BALANCE "Sua conta atingiu o saldo máximo."
#define ERR_MAX_BALANCE_BLUFOR_OPFOR "O saldo máximo do caixa eletrônico é de 300.000 para BLUFOR e (5.000.000 para o INDEP)."

disableSerialization;
private ["_dialog", "_input", "_amount", "_balance", "_maxBalance"];

_dialog = findDisplay AtmGUI_IDD;

if (isNull _dialog) exitWith {};

_input = _dialog displayCtrl AtmAmountInput_IDC;
_amount = _input call mf_verify_money_input;

if (_amount < 1) exitWith {};

if (player getVariable ["cmoney", 0] < _amount) exitWith
{
	[ERR_NOT_ENOUGH_FUNDS, 5] call mf_notify_client;
	playSound "FD_CP_Not_Clear_F";
};

_balance = player getVariable ["bmoney", 0];
_maxBalance = ["A3W_atmMaxBalance", 1000000] call getPublicVar;

// Limit BLUFOR/OPFOR deposits
if (playerSide in [BLUFOR,OPFOR]) then
	{
		_maxBalance = ["A3W_atmMaxBalance_BLUFOR_OPFOR", 200000] call getPublicVar;
	};

if (_balance + _amount > _maxBalance) then
{
	_amount = 0 max (_maxBalance - _balance);
};

if (_amount < 1) exitWith
{
	[ERR_MAX_BALANCE, 5] call mf_notify_client;
	
	if (playerSide in [BLUFOR,OPFOR]) then
	{
		[ERR_MAX_BALANCE_BLUFOR_OPFOR, 5] call mf_notify_client;;
	};
	playSound "FD_CP_Not_Clear_F";
};

_input ctrlSetText (_amount call fn_numToStr);

if (!isServer) then { player setVariable ["cmoney", (player getVariable ["cmoney", 0]) - _amount, false] }; // temp client-side update, do not set to true

// pvar_processTransaction = ["atm", player, _amount];
// publicVariableServer "pvar_processTransaction";
["atm", player, _amount] call A3W_fnc_processTransaction;

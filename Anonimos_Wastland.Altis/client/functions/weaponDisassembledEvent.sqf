// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: weaponDisassembledEvent.sqf
//	@file Author: AgentRev

_unit = _this select 0;
_bag1 = _this select 1;
_bag2 = _this select 2;

if ([["_UAV_","_Designator_"], typeOf _bag1] call fn_findString != -1) exitWith {};

_currBag = unitBackpack _unit;

if (_unit == player) then
{
	[format ["Você não tem permissão para desmontar armas.<br/>Use a opção 'Mover'.", ["STR_R3F_LOG_action_deplacer_objet", "Move"] call getPublicVar]] spawn BIS_fnc_guiMessage;
};

// Optional hiding of dropped bags
_this spawn
{
	_unit = _this select 0;
	_bag1 = _this select 1;
	_bag2 = _this select 2;

	_bag1Cont = objNull;
	_bag2Cont = objNull;

	{
		if (_bag1 in everyBackpack _x) then { _bag1Cont = _x };
		if (_bag2 in everyBackpack _x) then { _bag2Cont = _x };
		if (!isNull _bag1Cont && !isNull _bag2Cont) exitWith {};
	} forEach (_unit nearEntities ["GroundWeaponHolder", 25]);

	[_bag1Cont, true] call fn_hideObjectGlobal;
	[_bag2Cont, true] call fn_hideObjectGlobal;
};

_unit action ["TakeBag", _bag1];

// We have to wait until the bag shows as worn by the unit from the server's perspective, otherwise the assembly fails and everything disappears
pvar_waitUntilBagTaken = [_unit, _bag1];
publicVariableServer "pvar_waitUntilBagTaken";

_time = serverTime;
waitUntil {_unit getVariable ["waitUntilBagTaken", objNull] == _bag1 || serverTime - _time > 3};

if (unitBackpack _unit == _bag1 && _unit getVariable ["waitUntilBagTaken", objNull] == _bag1) then
{
	_unit setVariable ["waitUntilBagTaken", nil, true];
	_unit action ["Assemble", if (!isNull _bag2) then { _bag2 } else { _bag1 }];
};

if (!isNull _currBag) then { _unit action ["TakeBag", _currBag] };

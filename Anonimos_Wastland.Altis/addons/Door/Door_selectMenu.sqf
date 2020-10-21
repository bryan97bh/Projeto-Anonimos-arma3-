// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: Door_selectMenu.sqf
//	@file Author: LouD / Cael817 for original script
//	@file Description: Door script

#define PLAYER_CONDITION "(vehicle player == player && {!isNull cursorTarget})"
#define ITEM_CONDITION "{cursortarget iskindof 'Land_TripodScreen_01_dual_v1_F'} && {(player distance cursortarget) < 8}"
#define OBJECT_CONDITION "{cursorTarget getVariable ['objectLocked', false]}"

Door_open = 
{
	private ["_unit","_uid,", "_owner"];

	_unit = _this select 0;
	_uid = getPlayerUID _unit;
	_owner = cursorTarget getvariable "ownerUID";

	if (!isNull (uiNamespace getVariable ["Door_Menu", displayNull]) && !(player call A3W_fnc_isUnconscious)) exitWith {};

	switch (true) do
	{
		case (_uid == _owner || _uid != _owner):
		{
			_authUIDs = cursorTarget getvariable ["authUIDs", ["error_query_authUID"]];
			
			if (_uid in _authUIDS) then
			{
			execVM "addons\Door\Door_ownerMenu.sqf";
			} else {
			execVM "addons\Door\password_enter.sqf";
			hint "Welcome";
			};
		};
		case (isNil _uid || isNull _uid):
		{
			hint "Você precisa bloquear o objeto primeiro!";
		};
		default
		{
		hint "Ocorreu um erro desconhecido. Isso pode ser porque sua porta não está trancada."
		};

	};
};

Door_Actions = 
{
	{ [player, _x] call fn_addManagedAction } forEach
	[
		["<t color='#FFE496'><img image='client\icons\keypad.paa'/> Open door menu</t>", Door_open, [cursorTarget], -97, false, false, "", PLAYER_CONDITION + " && " + ITEM_CONDITION + " && " + OBJECT_CONDITION]
	];
};

DoorScriptInitialized = true;
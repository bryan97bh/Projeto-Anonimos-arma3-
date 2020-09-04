// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: BoS_selectMenu.sqf
//	@file Author: LouD / Cael817 for original script
//	@file Description: Baselocker script

#define PLAYER_CONDITION "(vehicle player == player && {!isNull cursorTarget})"
#define ITEM_CONDITION "{cursortarget iskindof 'Land_Device_assembled_F'} && {alive cursorTarget} && {(player distance cursortarget) < 5}"
#define OBJECT_CONDITION "{cursorTarget getVariable ['objectLocked', false]}"
#define NONOWNED_CONDITION "{'ToolKit' in (items player)} && {cursorTarget getVariable ['ownerUID',''] != getPlayerUID player}"

BoS_open = 
{
	private ["_ownersuid","_coownersuid,","_owner"];
	_uid = getPlayerUID player;
	_objects = nearestObjects [player, ["Land_Device_assembled_F"], 5];
	_owner = cursorTarget getvariable "ownerUID";

	if (!isNull (uiNamespace getVariable ["BoS_Menu", displayNull]) && !(player call A3W_fnc_isUnconscious)) exitWith {};

	switch (true) do
	{
		case (_uid == _owner):
		{
			execVM "addons\BoS\BoS_ownerMenu.sqf";
			hint "Bem-vindo Proprietário";
		};
		case (_uid != _owner):
		{
			execVM "addons\BoS\password_enter.sqf";
			hint "Bem vindo";
		};
	/*	case (isNil _uid || isNull _uid):
		{
			hint "Você precisa travar esse objeto primeiro!";
		};*/
		default
		{
		hint "Ocorreu um erro desconhecido. Isso pode ocorrer porque o seu TravaBase não está bloqueado."
		};
	};
};

BoS_Actions =
{
	{ [player, _x] call fn_addManagedAction } forEach
	[
		["<t color='#FFE496'><img image='client\icons\keypad.paa'/> Abrir Menu TravaBase</t>", BoS_open, [cursorTarget], -97, false, false, "", PLAYER_CONDITION + " && " + ITEM_CONDITION + " && " + OBJECT_CONDITION],
		["<t color='#FFE496'><img image='client\icons\take.paa'/> Roubar Base</t>", "addons\BoS\BoS_hackBase.sqf", [cursorTarget], -97, false, false, "", PLAYER_CONDITION + " && " + ITEM_CONDITION + " && " + OBJECT_CONDITION + " && " + NONOWNED_CONDITION]
	];
};

BoS_Initialized = true;
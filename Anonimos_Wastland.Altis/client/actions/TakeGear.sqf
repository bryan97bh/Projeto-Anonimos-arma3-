/***************************
File Name: TakeGear.sqf
File Author: BIB_Monkey
File Created: 18 MAR 2017
File Description: Removes Gear from corpse and adds it to player
***************************/
_text = format ["O uniforme irá substituir (DELETAR) o uniforme que você está usando. Deseja continuar com a ação?"];
_confirmResult = [parseText _text, "Confirm", "Pegar", true] call BIS_fnc_guiMessage;
if (!_confirmResult) exitWith{};

// Check if mutex lock is active.
if (mutexScriptInProgress) exitWith
{
	["You are already performing another action.", 5] call mf_notify_client;
};

private ["_vehicle", "_vehClass", "_checks", "_firstCheck", "_time", "_money", "_success", "_loudout"];

_vehicle = cursorTarget;
_vehClass = typeOf _vehicle;
_uniform =  uniform _vehicle;
_backpack = backpack _vehicle;
_vest = vest _vehicle;
_headgear = headgear _vehicle;
_goggles = goggles _vehicle;
_items = assigneditems _vehicle;
_mags = magazines _vehicle;




if (isNull _vehicle) exitWith {};

_checks =
{
	private ["_progress", "_object", "_failed", "_text"];
	_progress = _this select 0;
	_object = _this select 1;
	_failed = true;

	switch (true) do
	{
		case (!alive player): { _text = "" };
		case (vehicle player != player): { _text = "Action failed! You can't do this in a vehicle" };
		case (player distance _object > (sizeOf typeOf _object / 3) max 2): { _text = "Action failed! You are too far away from the body" };
		case (isNull _object): { _text = "The body no longer exists" };
		case (alive _object || {alive _x} count crew _object > 0): { _text = "You Can't do that" };
		case (doCancelAction): { doCancelAction = false; _text = "Takig gear cancelled" };
		default
		{
			_failed = false;
			_text = format ["Taking gear %1%2 complete", floor (_progress * 100), "%"];
		};
	};

	[_failed, _text];
};

_firstCheck = [0, _vehicle] call _checks;

if (_firstCheck select 0) exitWith
{
	[_firstCheck select 1, 5] call mf_notify_client;
};

mutexScriptInProgress = true;

// Salvage time and default money reward according to vehicle type
switch (true) do
{
	case (_vehClass isKindOf "Man"):
	{
		_time = 1;
		player forceAddUniform _uniform;
		/*player addBackpack _backpack;
		player addvest _vest;
		player addHeadgear _headgear;
		player addGoggles _goggles;
		player addMagazines _mags;
		player assignItem _items;*/
	};
	default	{}; // Everything else
};

mutexScriptInProgress = true;

_success = [_time, format ["AinvPknlMstpSlayW%1Dnon_medic", [player, true] call getMoveWeapon], _checks, [_vehicle]] call a3w_actions_start;

mutexScriptInProgress = false;

if (_success) then
{
	// deleteVehicle _vehicle;
	/*removeAllWeapons _vehicle;
	removeAllAssignedItems _vehicle;*/
	removeUniform _vehicle;
	/*removeVest _vehicle;
	removeBackpack _vehicle;
	removeGoggles _vehicle;
	removeHeadgear _vehicle;*/
	/*[format ["Finished Taking Gear"]] call mf_notify_client;*/
};
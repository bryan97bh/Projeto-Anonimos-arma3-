// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: drink.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Drink, and replenish your thrist
//@file Argument: The amount of thirst to replenish

#define ERR_CANCELLED "Beber cancelado";
#define ANIMATION "Acts_CivilHiding_2"
private ["_checks", "_hasFailed"];
_hasFailed = {
	private ["_progress","_failed", "_text"];
	_progress = _this select 0;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player) : {}; // player is dead, not need for a error message
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED;};
		default {
			_failed = false;
			_text = format["Bebendo %1%2 Completo", round(100*_progress), "%"];
		};
	};
	[_failed, _text];
};

_success = [5, ANIMATION, _hasFailed, []] call a3w_actions_start;
if (_success) then {
	thirstLevel = (thirstLevel + _this) min 100;
	["Sua sede diminuiu", 5] call mf_notify_client;
	hint "";
};
_success;

// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: toggle_spawn_permissions.sqf
# @@Author: Nick 'Bewilderbeest' Ludlam <bewilder@recoil.org>
# @@Create Date: 2013-09-11 15:11:52
# @@Modify Date: 2013-09-15 23:28:23
# @@Function: Swaps between group-only and team spawning allowed
#*********************************************************/

#include "mutex.sqf"
#define ANIM "AinvPknlMstpSlayWrflDnon_medic"
#define DURATION 5
#define ERR_CANCELLED "Alteração das permissões do Spawn canceladas"
#define ERR_TOO_FAR_AWAY "A alteração das permissões do Spawn falhou quando você se afastou demais!"
#define ERR_SOMEONE_ELSE_TAKEN "A alteração das permissões do Spawn falhou, pois outra pessoa terminou de empacotá-la antes de vocêu!"
#define ERR_NO_GROUP "Você deve estar em um grupo para habilitar restrições de Spawn de grupo"

private ["_beacon", "_error", "_hasFailed", "_success"];
_beacon = [] call mf_items_spawn_beacon_nearest;
_error = [_beacon] call mf_items_spawn_beacon_can_pack;
if (_error != "") exitWith {[_error, 5] call mf_notify_client};

_hasFailed = {
	private ["_progress", "_beacon", "_caller", "_failed", "_text"];
	_progress = _this select 0;
	_beacon = _this select 1;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player): {}; // player dead, no error msg needed
		case (vehicle player != player): {};
		case (isNull _beacon): {_text = ERR_SOMEONE_ELSE_TAKEN};
		case (player distance _beacon > 5): {_text = ERR_TOO_FAR_AWAY};
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED};
		//case (count units group player < 2): {_text = ERR_NO_GROUP};
		default {
			_text = format["O Spawn beacon %1%2 foi atualizado", round(_progress*100), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};

_currentGroupOnlyState = _beacon getVariable ["groupOnly", false];

MUTEX_LOCK_OR_FAIL;
_success = true; //[DURATION, ANIM, _hasFailed, [_beacon]] call mf_util_playUntil;
MUTEX_UNLOCK;

if (_success) then {
	if (_currentGroupOnlyState) then {
		["O Spawn Beacon está agora disponível para toda a sua equipe", 5] call mf_notify_client;
		_beacon setVariable ['groupOnly', false, true];
	} else {
		["O Spawn Beacon agora está limitado ao seu grupo", 5] call mf_notify_client;
		_beacon setVariable ['groupOnly', true, true];
	};
};


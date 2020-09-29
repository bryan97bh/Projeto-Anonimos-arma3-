// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: promotePlayer.sqf
//	@file Author: [501] His_Shadow
//	@file Created: 05/14/2013 01:54

#include "defines.hpp"

if(player != leader group player) exitWith {player globalChat format["você não é o líder e não pode promover pessoas"];};

#define groupManagementDialog 55510
#define groupManagementGroupList 55512

disableSerialization;

private ["_dialog", "_groupListBox", "_target", "_index", "_playerData", "_inCombat", "_isIndie"];

_dialog = findDisplay groupManagementDialog;
_groupListBox = _dialog displayCtrl groupManagementGroupList;

_index = lbCurSel _groupListBox;
_playerData = _groupListBox lbData _index;

//Check selected data is valid
{ if (getPlayerUID _x == _playerData) exitWith { _target = _x } } forEach allPlayers;
//diag_log "Promote to leader: Before the checks";

//Checks
if (isNil "_target") exitWith { player globalChat "Você deve selecionar alguém para promover primeiro." };

if (_target == player) exitWith { player globalChat "Você não pode se promover." };

_inCombat = false;

//if (alive _target) then
//{
	//_isIndie = !((side group _target) in [BLUFOR,OPFOR]);

	//check to see how close to the enemy the target leader is
//	{
//		if (_x distance _target < 100 && {[_x, _target] call A3W_fnc_isFriendly}) exitWith
//		{
//			_inCombat = true;
//		};
//	} forEach allUnits;
//};

if (!_inCombat) then
{
	(group player) selectLeader _target;
	["Você foi promovido a líder de grupo.", "A3W_fnc_titleTextMessage", _target] call A3W_fnc_MP;

	player globalChat format ["Você promoveu %1 para líder do grupo", name _target];
	player setVariable ["currentGroupIsLeader", false, true];
	_target setVariable ["currentGroupIsLeader", true, true];
}
else
{
	player globalChat "Este jogador está em combate. Você não pode torná-lo líder agora";
};

// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: inviteToGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

if(player != leader group player) exitWith {player globalChat format["you are not the leader and can't invite people"];};

#define groupManagementDialog 55510
#define groupManagementPlayerList 55511

disableSerialization;

private["_dialog","_playerListBox","_groupInvite","_target","_index","_playerData","_check","_unitCount","_hasInvite"];

_dialog = findDisplay groupManagementDialog;
_playerListBox = _dialog displayCtrl groupManagementPlayerList;

_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_hasInvite = false;

//Check selected data is valid
{ if (getPlayerUID _x == _playerData) exitWith { _target = _x } } forEach allPlayers;

diag_log "Convidar para o grupo: antes das verificações";


#define MAX_GROUP_COUNT 15
_groupCount = count units player;
if (_groupCount < MAX_GROUP_COUNT) then
{
	{
		_senderUID = _x select 0;
		if ({getPlayerUID _x == _senderUID} count units player > 0) then
		{
			_groupCount = _groupCount + 1;
		};
	} forEach currentInvites;
};
if (_groupCount >= MAX_GROUP_COUNT) exitWith { [format ["Você não pode ter mais de %1 membros do grupo, incluindo convites pendentes.", MAX_GROUP_COUNT]] spawn BIS_fnc_guiMessage };

//Checks
if(isNil "_target") exitWith {player globalChat "você deve selecionar alguém para convidar primeiro"};
if(_target == player) exitWith {player globalChat "você não pode se convidar"};
if((count units group _target) > 1) exitWith {player globalChat "Este jogador já está em um grupo"};

{ if (_x select 1 == getPlayerUID _target) then { _hasInvite = true } } forEach currentInvites;
if(_hasInvite) exitWith {player globalChat "Este jogador já tem um convite pendente"};

diag_log "Convidar para o grupo: após as verificações";

//currentInvites pushBack [getPlayerUID player, getPlayerUID _target];
//publicVariable "currentInvites";

pvar_processGroupInvite = ["send", player, _target];
publicVariableServer "pvar_processGroupInvite";

//[format ["You have been invited to join %1's group", name player], "A3W_fnc_titleTextMessage", _target, false] call A3W_fnc_MP;

player globalChat format["Você convidou %1 para ingressar no grupo", name _target];

player setVariable ["currentGroupRestore", group player, true];
player setVariable ["currentGroupIsLeader", true, true];

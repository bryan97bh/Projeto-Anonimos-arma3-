// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: groupNotify.sqf
//	@file Author: AgentRev

private ["_type", "_sender", "_msg"];

_type = param [0, "", [""]];

switch (_type) do
{
	case "invite":
	{
		_sender = param [1, objNull, [objNull]];

		if (isPlayer _sender) then
		{
			if (isStreamFriendlyUIEnabled) then
			{
				_msg = "Você foi convidado<br/>para entrar em um grupo";
			}
			else
			{
				_msg = ([name _sender] call fn_encodeText) + "<br/>enviou um convite para o grupo";
			};

			["GroupInvite", [_msg]] call BIS_fnc_showNotification;
		};
	};
};

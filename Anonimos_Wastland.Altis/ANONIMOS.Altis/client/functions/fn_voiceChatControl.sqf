// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_voiceChatControl.sqf
//	@file Author: AgentRev


//0 = Global, 1 = Side, 2 = Command, 3 = Group, 4 = Vehicle, 5 = Direct
#define SWITCH_DIRECT if ((currentChannel == 0 or currentChannel == 1) && !((getPlayerUID player) call isAdmin)) then { setCurrentChannel 5 }

private "_waitSpeak";
_waitSpeak = _this select 0;

if (["A3W_disableGlobalVoice"] call isConfigOn) then
{
	if (_waitSpeak) then
	{
		["A3W_voiceChatControl", "onEachFrame",
		{
			if (!isNull findDisplay 55) then
			{
				SWITCH_DIRECT;
				
				["A3W_voiceChatControl", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			};
		}] call BIS_fnc_addStackedEventHandler;
	}
	else
	{
		if (!isNull findDisplay 55) then
		{
			SWITCH_DIRECT;
		};
	};
};

// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: initServer.sqf
//	@file Author: AgentRev


//  AJ Begin - Teargas

0 = 0 spawn {
	"aj_teargas" addPublicVariableEventHandler {
		(_this select 1) spawn armajunkies_fnc_aj_s_getPlayersAndSendTriggerCommand;
	};
};
//AJ END

"BIS_fnc_MP_packet" addPublicVariableEventHandler compileFinal preprocessFileLineNumbers "server\antihack\filterExecAttempt.sqf";

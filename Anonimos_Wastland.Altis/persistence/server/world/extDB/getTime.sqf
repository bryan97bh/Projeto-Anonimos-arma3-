// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: getTime.sqf (and weather)
//	@file Author: AgentRev

[format ["getServerTime:%1:%2", call A3W_extdb_ServerID, call A3W_extdb_MapID], 2] call extdb_Database_async

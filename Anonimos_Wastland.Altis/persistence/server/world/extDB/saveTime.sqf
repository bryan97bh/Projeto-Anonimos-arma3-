// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: saveTime.sqf (and weather)
//	@file Author: AgentRev

[format ["insertOrUpdateServerTime:%1:%2:%3:%4:%5:%6:%7", call A3W_extdb_ServerID, call A3W_extdb_MapID, dayTime, fog, overcast, rain, wind]] call extdb_Database_async;

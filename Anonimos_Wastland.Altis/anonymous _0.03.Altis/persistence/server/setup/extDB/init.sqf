// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: init.sqf
//	@file Author: Torndeco, AgentRev

#define MIN_DB_VERSION 2.07

private ["_lock", "_return", "_result", "_setupDir", "_serverID", "_env", "_mapID"];
_lock = (["A3W_extdb_Lock", 1] call getPublicVar != 0);

// uiNamespace is persistent across mission restarts (but not game restarts)

private _dbError = { diag_log _this; [_this, "Error"] remoteExec ["BIS_fnc_guiMessage", 0, true] };

 _return = if (isNil {uiNamespace getVariable "A3W_extdb_databaseID"} || !_lock) then
{
	diag_log "[extdb3] Startup...";

	if (isNil {uiNamespace getVariable "A3W_extdb_databaseID"}) then
	{
		_result = parseSimpleArray ("extdb3" callExtension format ["9:ADD_DATABASE:%1", call A3W_extdb_ConfigName]);
		if (_result select 0 == 0) exitWith { (format ["[extdb3] ███ Database error, check @extdb3\logs -- %1", _result]) call _dbError; false };
	};

	A3W_extdb_databaseID = compileFinal str floor random 999997;
	A3W_extdb_miscID = compileFinal str (call A3W_extdb_databaseID + 1);

	_result = parseSimpleArray ("extdb3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM:%2:%3", call A3W_extdb_ConfigName, call A3W_extdb_databaseID, call A3W_extdb_IniName]);
	if (_result select 0 == 0) exitWith { (format ["[extdb3] ███ SQL_CUSTOM Protocol error, check @extdb3\logs -- %1", _result]) call _dbError; false };
	diag_log "[extdb3] Initialized SQL_CUSTOM protocol";

	if (["A3W_extdb_Misc"] call isConfigOn) then
	{
		_result = parseSimpleArray ("extdb3" callExtension format ["9:ADD_PROTOCOL:MISC:%1", call A3W_extdb_miscID]);
		if (_result select 0 == 0) exitWith { (format ["[extdb3] ███ MISC Protocol error, check @extdb3\logs -- %1", _result]) call _dbError; false };
		diag_log "[extdb3] Initialized MISC protocol";
	};

	uiNamespace setVariable ["A3W_extdb_databaseID", call A3W_extdb_databaseID];
	uiNamespace setVariable ["A3W_extdb_miscID", call A3W_extdb_miscID];
	true
}
else
{
	A3W_extdb_databaseID = compileFinal str (uiNamespace getVariable "A3W_extdb_databaseID");
	A3W_extdb_miscID = compileFinal str (uiNamespace getVariable "A3W_extdb_miscID");
	diag_log "[extdb3] Connection and protocols already initialized!";
	true
};

if (_return) then
{
	scopeName "extdb_envSetup";
	diag_log "[extdb3] Environment setup...";

	_setupDir = "persistence\server\setup\extdb";

	if (_lock) then
	{
		"extdb3" callExtension "9:LOCK";
		diag_log "[extdb3] Locked";
	};

	extdb_pairsToSQL = [_setupDir, "fn_pairsToSQL.sqf"] call mf_compile;
	extdb_Database_async = [_setupDir, "async_database.sqf"] call mf_compile;

	if (["A3W_extdb_Misc"] call isConfigOn) then
	{
		extdb_Misc_async = [_setupDir, "async_misc.sqf"] call mf_compile;
	};

	_result = (["getDBVersion", 2] call extdb_Database_async) select 0;
	if (_result < MIN_DB_VERSION) exitWith { (format ["[extdb3] ███ Outdated A3Wasteland DB v%1 - minimum: v%2 - Check <a href='https://github.com/A3Wasteland/Release_Files/tree/master/extdb'>Release_Files</a> on GitHub to get the latest version", _result, MIN_DB_VERSION]) call _dbError; _return = false };

	_serverID = ["A3W_extdb_ServerID", 1] call getPublicVar;
	A3W_extdb_ServerID = compileFinal str _serverID;
	publicVariable "A3W_extdb_ServerID";

	_result = ([format ["checkServerInstance:%1", _serverID], 2] call extdb_Database_async) select 0;
	if (!_result) then
	{
		[format ["insertServerInstance:%1", _serverID], 2] call extdb_Database_async;

		_result = ([format ["checkServerInstance:%1", _serverID], 2] call extdb_Database_async) select 0;
		if (!_result) then
		{
			(format ["[extdb3] ███ Unable to create ServerInstance with ServerID %1, check @extdb3\logs", _serverID]) call _dbError;
			_return = false;
			breakOut "extdb_envSetup";
		};
	};

	_env = ["A3W_extdb_Environment", "normal"] call getPublicVar;
	_mapID = ([format ["getServerMapID:%1:%2", worldName, _env], 2] call extdb_Database_async) select 0;
	if (_mapID == 0) then
	{
		[format ["insertServerMap:%1:%2", worldName, _env], 2] call extdb_Database_async;
		_mapID = ([format ["getServerMapID:%1:%2", worldName, _env], 2] call extdb_Database_async) select 0;
		if (_mapID == 0) then
		{
			(format ["[extdb3] ███ Unable to create ServerMap with WorldName '%1', check @extdb3\logs", worldName]) call _dbError;
			_return = false;
			breakOut "extdb_envSetup";
		};
	};

	A3W_extdb_MapID = compileFinal str _mapID;
	_return = true;
};

if (!_return) exitWith
{
	diag_log "[extdb3] ███ ERROR - Startup aborted";
	false
};

diag_log "[extdb3] Startup complete!";
true

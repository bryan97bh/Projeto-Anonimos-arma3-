/*
	File: async_database.sqf
	Function: extdb_Database_async
	Author: Bryan "Tonic" Boardwine

	Description:
	Commits an asynchronous call to extdb
	Gets result via extdb  4:x + uses 5:x if message is Multi-Part

	Parameters:
		0: STRING (Query to be ran).
		1: INTEGER (1 = ASYNC + not return for update/insert, 2 = ASYNC + return for query's).
		3: BOOL (False to return a single array, True to return multiple entries mainly for garage).
*/

private["_queryStmt","_queryResult","_key","_mode","_return","_loop"];

_tickTime = diag_tickTime;

_queryStmt = param [0,"",[""]];
_mode = param [1,1,[0]];
_multiarr = param [2,false,[false]];

_key = "extdb3" callExtension format["%1:%2:%3",_mode, (call A3W_extdb_miscID), _queryStmt];

if(_mode == 1) exitWith {true};

_key = parseSimpleArray _key;
_key = _key select 1;

sleep 0.01;

_queryResult = "";
_loop = true;
while{_loop} do
{
	_queryResult = "extdb3" callExtension format["4:%1", _key];
	if (_queryResult == "[5]") then {
		// extdb3 returned that result is Multi-Part Message
		_queryResult = "";
		while{true} do {
			_pipe = "extdb3" callExtension format["5:%1", _key];
			if(_pipe == "") exitWith {_loop = false};
			_queryResult = _queryResult + _pipe;
		};
	}
	else
	{
		if (_queryResult == "[3]") then
		{
			diag_log format ["[extdb3] Sleep [4]: %1", diag_tickTime]; // Helps highlight if someone SQL Queries are running slow
			sleep 0.1;
		} else {
			_loop = false;
		};
	};
};


_queryResult = parseSimpleArray _queryResult;

// Not needed, its SQF Code incase extdb ever returns error message i.e Database Died
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["[extdb3] ███ Protocol Error: %1", _queryResult]; []};
_return = (_queryResult select 1);

if(!_multiarr) then {
	_return = if (count _return > 0) then { _return select 0 } else { [] };
};

_return;

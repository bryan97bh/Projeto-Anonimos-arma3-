scriptName "fnc_aj_s_saveMoneyToDB";
/*--------------------------------------------------------------------
	-------------------- Anônimos Wasteland -----------------------
	------------------------------------------------------------------

	- This Wasteland Version is a completely new code build. -
	- Please do not just copy and paste this code, there could be server dependencies -

	Modified by: Anônimos Wasteland 
	Description: Saves Player Money to DB
	Parameter(s):
	Returns:
--------------------------------------------------------------------*/
#define __filename "fnc_aj_s_saveMoneyToDB.sqf"

_playerUID = [_this, 0, "", [""]] call bis_fnc_param;
_data = [_this, 1, [], [[]]] call bis_fnc_param;

//diag_log ["playerMoneyTransactions", _this];
{
	[format ["addMoneyLog:%1:%2:%3", _playerUID, _x select 0, _x select 1]] call extdb_Database_async;
} forEach _data;


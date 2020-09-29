// @file Name: refreshZeus.sqf
// @file Author:  Anônimos Brasil


_uid = getPlayerUID player;

if(_uid in (call zeusAdmins)) then
	{
	_zeusUID =  Format ["aj_var_moduleZeus%1",_uid];
	[_zeusUID, "A3W_fnc_aj_s_refreshZeus", true] call A3W_fnc_MP;  //trigger zeus refresh on server
	};

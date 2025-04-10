// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: saveWarchestMoney.sqf
//	@file Author: AgentRev

private ["_fundsWest", "_fundsEast"];

_fundsWest = 0;
_fundsEast = 0;

if (["A3W_warchestMoneySaving"] call isConfigOn) then
{
	_fundsWest = (["pvar_warchest_funds_west", 0] call getPublicVar) call fn_numToStr;
	_fundsEast = (["pvar_warchest_funds_east", 0] call getPublicVar) call fn_numToStr;
};

[format ["updateWarchestMoney:%1:%2:%3", call A3W_extdb_ServerID, _fundsWest, _fundsEast]] call extdb_Database_async;

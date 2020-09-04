scriptName "fn_aj_c_reloadsmokescreen";
// @file Author:  wiking.at
// @file Author: www.armajunkies.de
// Reload Smokescreen

_playerMoney = player getVariable ["cmoney", 0];
_smokeprice = 5000;

if (_playerMoney >= _smokeprice ) then
{
	if(!('SmokeLauncher' in (vehicle player weaponsTurret [-1]))) then //weaponsTurret [-1] = driver position
		{
			vehicle player addweapon 'SmokeLauncher';
		};
		
		vehicle player addMagazineTurret ['SmokeLauncherMag_boat',[-1]];
		player setVariable["cmoney",(player getVariable "cmoney")-_smokeprice,true];
 } 
else
{
	["Você não pode recarregar seu lançador de granadas defensivas.", 5] call mf_notify_client;
	playSound "FD_CP_Not_Clear_F";
};






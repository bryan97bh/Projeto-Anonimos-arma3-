scriptName "fn_firedWeapon";
/*--------------------------------------------------------------------
	-------------------- Anônimos Wasteland -----------------------
	------------------------------------------------------------------

	- This Wasteland Version is a completely new code build. -
	- Please do not just copy and paste this code, there could be server dependencies -

	Author: Anônimos Brasil
	Modified by:
	Description: This file reacts on every single shot (File eventhandler). If a player throws a SmokeShellYellow, than the player will
	- deliver the netID to the server
	- the server will spread a public variable to players within 2000 meters

	-> BE Exceptions: deleteVehicle _trigger; , createTrigger ["EmptyDetector" * false];
	Parameter(s):
	Returns:
--------------------------------------------------------------------*/
#define __filename "fn_firedWeapon.sqf"
private ["_shell"];

if (gettext (configfile >> "CfgAmmo" >> typeOf (_this select 6) >> "effectsSmoke") == "SmokeShellYellowEffect") then
{
	_shell = _this select 6;
	waitUntil {sleep 0.1; speed _shell == 0};
	aj_teargas = [netID _shell];
	publicVariableServer "aj_teargas";
};
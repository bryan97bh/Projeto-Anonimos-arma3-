// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Description: The main init.

#include "debugFlag.hpp"

#ifdef A3W_DEBUG
#define DEBUG true
#else
#define DEBUG false
#endif

enableSaving [false, false];
// Disable Artillery Computer
enableEngineArtillery false;

A3W_sessionTimeStart = diag_tickTime;

_descExtPath = str missionConfigFile;
currMissionDir = compileFinal str (_descExtPath select [0, count _descExtPath - 15]);

X_Server = false;
X_Client = false;
X_JIP = false;

CHVD_allowNoGrass = false;
CHVD_allowTerrain = false; // terrain option has been disabled out from the menu due to terrible code, this variable has currently no effect
CHVD_maxView = 4000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 4000; // Set maximimum object view distance (default: 12000)

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";

//enable weather script
[] execVM "addons\scripts\SimpleWeatherScript.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		if (hasInterface) then // Normal player
		{
			waitUntil {!isNull player};
			player setVariable ["playerSpawning", true, true];
			playerSpawning = true;

			removeAllWeapons player;
			client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

			// Reset group & side
			[player] joinSilent createGroup playerSide;
            
            //AJ-EDIT: Avoid playing if server is not ready (Baseobjects and co)
            if (isNil "A3W_AllowClientToEnterGame") then
			{
				9999 cutRsc ["loadingscreen_server_init","BLACK"]; //Loading Screen for fast users after restart
			}else
            {
                9999 cutRsc ["loadingscreen","BLACK"];      //Normal Loading Screen
            };
            
			execVM "client\init.sqf";

			if ((vehicleVarName player) select [0,17] == "BIS_fnc_objectVar") then { player setVehicleVarName "" }; // undo useless crap added by BIS
		}
		else // Headless
		{
			waitUntil {!isNull player};
			if (getText (configFile >> "CfgVehicles" >> typeOf player >> "simulation") == "headlessclient") then
			{
				execVM "client\headless\init.sqf";
			};
		};
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "ANÔNIMOS BRASIL SERVIDORES - Conheça também nosso Servidor de DAYZ";
	call compile preprocessFile "mapConfig\territories\init_external.sqf";
	[] execVM "server\init.sqf";
};

if (hasInterface || isServer) then
{
	//init 3rd Party Scripts
	[] execVM "addons\parking\functions.sqf";
	[] execVM "addons\storage\functions.sqf";
	[] execVM "addons\vactions\functions.sqf";
	[] execVM "addons\R3F_LOG\init.sqf";
    //[] execVM "addons\proving_ground\init.sqf";
	[] execVM "addons\JumpMF\init.sqf";
    //[] execVM "addons\zlt_fastrope\zlt_fastrope.sqf";
	[] execVM "addons\outlw_magRepack\MagRepack_init.sqf";
	[] execVM "addons\lsd_nvg\init.sqf";
	[] execVM "addons\stickyCharges\init.sqf";
	[] execVM "addons\APOC_Airdrop_Assistance\init.sqf";
	[] execVM "addons\laptop\init.sqf";
	[] execVM "addons\HvT\HvT.sqf";
	[] execVM "addons\HvT\HvD.sqf"; // High Value Drugrunner
	[] execVM "scarCODE\ServerInfoMenu\sqf\initLocal.sqf"; // scarCODE ServerInfoMenu
	[] execVM "scarCODE\ServerInfoMenu2\sqf\initLocal.sqf"; // scarCODE ServerInfoMenu
	[] execVM "scarCODE\ServerInfoMenu3\sqf\initLocal.sqf"; // scarCODE ServerInfoMenu
	[] execVM "scarCODE\ServerInfoMenu4\sqf\initLocal.sqf"; // scarCODE ServerInfoMenu
	[] execVM "addons\playerCustomUniforms\playerCustomUniforms.sqf";
};

// Remove line drawings from map
(createTrigger ["EmptyDetector", [0,0,0], false]) setTriggerStatements
[
	"!triggerActivated thisTrigger", 
	"thisTrigger setTriggerTimeout [30,30,30,false]",
	"{ 
	_b = _x select [(count _x -1),1];
	_bannedChannels = ['0','1','2']; 
	if (markerShape _x == 'POLYLINE' && (_b in _bannedChannels)) then
	{deleteMarker _x}
	} forEach allMapMarkers"
];
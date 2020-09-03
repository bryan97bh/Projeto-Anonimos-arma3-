// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.1
//@file Name: init.sqf
//@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev, [KoS] Bewilderbeest
//@file Created: 20/11/2012 05:19
//@file Description: The client init.

if (isDedicated) exitWith {};

if (!isServer) then
{
	waitUntil {!isNil "A3W_network_compileFuncs"};
};

//AJ-EDIT: Play awesome music <3 /S
//Disable User Input to avoid VON by stupid users
player enablesimulation false;

//Disable Environment, as I want to listen to this awesome music <3 /S
enableEnvironment false;
removeAllWeapons player;
player switchMove "";
playMusic "LeadTrack01_F";
waitUntil {!isNil "A3W_serverSetupComplete"};

[] execVM "client\functions\bannedNames.sqf";

showPlayerIcons = true;
mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = [];
doCancelAction = false;

//AJ Beacondetector
BeaconScanInProgress = false;

//Initialization Variables
playerCompiledScripts = false;
playerSetupComplete = false;

waitUntil {!isNull player && time > 0};

//disable environmental effects (ambient life + sound)
//enableEnvironment true;

removeAllWeapons player;
player switchMove "";

// initialize actions and inventory
"client\actions" call mf_init;
"client\inventory" call mf_init;
"client\items" call mf_init;

//Call client compile list.
call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";

//Stop people being civ's.
if !(playerSide in [BLUFOR,OPFOR,INDEPENDENT]) exitWith
{
	endMission "LOSER";
};

//Setup player events.
if (!isNil "client_initEH") then { player removeEventHandler ["Respawn", client_initEH] };
player addEventHandler ["Respawn", { _this spawn onRespawn }];
player addEventHandler ["Killed", onKilled];

call compile preprocessFileLineNumbers "addons\far_revive\FAR_revive_init.sqf";

A3W_scriptThreads pushBack execVM "client\functions\evalManagedActions.sqf";

[player, objNull] remoteExec ["A3W_fnc_playerRespawnServer", 2];

//Player setup
player call playerSetupStart;

// Deal with money here
_baseMoney = ["A3W_startingMoney", 100] call getPublicVar;
//player setVariable ["cmoney", _baseMoney, true];
[player, _baseMoney, true] call A3W_fnc_setCMoney;


//AJ-EDIT: Avoid playing if server is not ready (Baseobjects and co)
if (isNil "A3W_AllowClientToEnterGame") then
{
	waitUntil {!isNil "A3W_AllowClientToEnterGame"}; //With sleep at the end to avoid base objects bugusing during object positioning after restart
	//uisleep ((["A3W_ClientSpawnDelayAfterRestart", 60*1] call getPublicVar)/10); //To avoid base objects bugusing during object positioning after restart
	UiSleep 10;
	9999 cutRsc ["loadingscreen","BLACK"];    
};


// Player saving - load data
if (["A3W_playerSaving"] call isConfigOn) then
{
	call compile preprocessFileLineNumbers "persistence\client\players\setupPlayerDB.sqf";
	call fn_requestPlayerData;
	//9999 cutText ["Received Player Info", "BLACK", 0.01];

	waitUntil {!isNil "playerData_loaded"};

	A3W_scriptThreads pushBack ([] spawn
	{
		scriptName "savePlayerLoop";

		// Save player every 60s
		while {true} do
		{
			sleep 60;
			call fn_savePlayerData;
		};
	});
};

if (isNil "playerData_alive") then
{
	player call playerSetupGear;
};

player call playerSetupEnd;

diag_log format ["Player starting with $%1", (player getVariable ["cmoney", 0]) call fn_numToStr];

[] execVM "territory\client\hideDisabledTerritories.sqf";

// Territory system enabled?
if (count (["config_territory_markers", []] call getPublicVar) > 0) then
{
	A3W_fnc_territoryActivityHandler = "territory\client\territoryActivityHandler.sqf" call mf_compile;
	[] execVM "territory\client\setupCaptureTriggers.sqf";
};

//Setup player menu scroll action.
//[] execVM "client\clientEvents\onMouseWheel.sqf";

// Load custom keys from profile
call compile preprocessFileLineNumbers "client\clientEvents\customKeys.sqf";

//Setup Key Handler
waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", onKeyPress];
(findDisplay 46) displayAddEventHandler ["KeyUp", onKeyRelease];

_mouseButtonToKey = "params ['_disp','_btn']; ([_disp, _btn + 65536 + ([0,128] select (_btn isEqualTo 1))] + (_this select [4,999])) call "; // actionKeys mouse bitflag + RMB fix

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", _mouseButtonToKey + "onKeyPress"];
(findDisplay 46) displayAddEventHandler ["MouseButtonUp", _mouseButtonToKey + "onKeyRelease"];

call compile preprocessFileLineNumbers "client\functions\setupClientPVars.sqf";

//client Executes
A3W_scriptThreads pushBack execVM "client\systems\hud\playerHud.sqf";
A3W_scriptThreads pushBack execVM "client\systems\killFeed\killFeed.sqf";

if (["A3W_survivalSystem"] call isConfigOn) then
{
	execVM "client\functions\initSurvival.sqf";
};

[] spawn
{
	[] execVM "client\functions\createGunStoreMarkers.sqf";

	if (["A3W_privateParking"] call isConfigOn) then
	{
		waitUntil {!isNil "parking_functions_defined"};
	};

	if (["A3W_privateStorage"] call isConfigOn) then
	{
		waitUntil {!isNil "storage_functions_defined"};
	};

	[] execVM "client\functions\createGeneralStoreMarkers.sqf";
	[] execVM "client\functions\createVehicleStoreMarkers.sqf";
	[] execVM "client\functions\createLegendMarkers.sqf";
};

A3W_clientSetupComplete = compileFinal "true";

[] spawn playerSpawn;
[] spawn playerCustomUniform;

A3W_scriptThreads pushBack execVM "addons\fpsFix\vehicleManager.sqf";
A3W_scriptThreads pushBack execVM "addons\Lootspawner\LSclientScan.sqf";
[] execVM "client\functions\drawPlayerIcons.sqf";
[] execVM "addons\camera\functions.sqf";
[] execVM "addons\UAV_Control\functions.sqf";

// StatusBar and aj checks
if(hasInterface) then{
[] execVM "addons\statusBar\statusbar.sqf";
[] execVM "addons\aj\antiglitch\aj_c_checkloop.sqf";
};

// restart messages (thanks soulkobk)
"RM_DISPLAYTEXT_PUBVAR" addPublicVariableEventHandler {(_this select 1) spawn BIS_fnc_dynamicText;};

call compile preprocessFileLineNumbers "client\functions\generateAtmArray.sqf";
[] execVM "client\functions\drawPlayerMarkers.sqf";

inGameUISetEventHandler ["Action", "_this call A3W_fnc_inGameUIActionEvent"];

{ [_x] call fn_remotePlayerSetup } forEach allPlayers;

// update player's spawn beaoon
{
	if (_x getVariable ["ownerUID",""] == getPlayerUID player) then
	{
		_x setVariable ["ownerName", name player, true];
		_x setVariable ["side", playerSide, true];
	};
} forEach pvar_spawn_beacons;

//AJ-EDIT: Fade out the music
player enablesimulation true;
//Get current volume and set it back after fadeout
_vol = musicVolume;
5 fadeMusic 0;
uiSleep 5;
playMusic "";
//Enable Environment, as I have disabled it before.
enableEnvironment true;
0 fadeMusic _vol;

if (["A3W_fastMovementLog"] call isConfigOn) then
{
	0 spawn
	{
		private ["_distCheck", "_loopTime", "_newPos", "_oldPos", "_spawnPos"];
		_distCheck = ["A3W_fastMovementLogDist", 300] call getPublicVar;
		_loopTime = ["A3W_fastMovementLoopTime", 1] call getPublicVar;
		_spawnPos = getMarkerPos "respawn_guerrila";
		_oldPos = nil;

		while {true} do
		{		
				_newPos = getPosATL player;

				if (!isNil "_oldPos" && {_newPos distance2D _oldPos > _distCheck}) then
				{
					if (_spawnPos distance2D _oldPos > 50 && _spawnPos distance2D _newPos > 50 && !(player getVariable ["playerSpawning", true])) then
					{
						_name = name player;
						_vehicle = vehicle player;
						_speed = round speed _vehicle;
						_vehtype = typeof _vehicle;
						
						_msg1 =  format["!SCRIPT TP from %1 to %2 with %3/%4kmh", mapGridPosition _oldPos, mapGridPosition _newPos, _vehtype, _speed];
                        publicVariableServer _msg1;
					};
				};

				_oldPos = _newPos;	
				
			if (player getVariable ["playerSpawning", true]) then {_oldPos = nil};  //delete oldpos if player is spawning

			uiSleep _loopTime;
		};
	};

};
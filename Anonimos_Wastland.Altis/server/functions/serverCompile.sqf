// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

diag_log "ANÔNIMOS SERVIDORES BRASIL (ARMA 3/DAYZ SA) - Iniciando sua sessão, bom jogo!";

//Factory Compiles
_path = "server\missions\factoryMethods";
attemptCompileMissions = [_path, "attemptCompileMissions.sqf"] call mf_compile;
checkMissionVehicleLock = [_path, "checkMissionVehicleLock.sqf"] call mf_compile;
cleanLocationObjects = [_path, "cleanLocationObjects.sqf"] call mf_compile;
// custom groups
createCustomGroup = [_path, "createUnits\customGroup.sqf"] call mf_compile;
createsmugglersGroup = [_path, "createUnits\smugglersGroup.sqf"] call mf_compile;
createroadblockGroup = [_path, "createUnits\roadblockGroup.sqf"] call mf_compile;
createterrorGroup = [_path, "createUnits\terrorGroup.sqf"] call mf_compile;
createurbanGroup = [_path, "createUnits\urbanGroup.sqf"] call mf_compile;
createocupacaoGroup = [_path, "createUnits\ocupacaoGroup.sqf"] call mf_compile;
createb_tan1 = [_path, "createUnits\b_tan1.sqf"] call mf_compile;
createb_tan2 = [_path, "createUnits\b_tan2.sqf"] call mf_compile;
createb_verde1 = [_path, "createUnits\b_verde1.sqf"] call mf_compile;
createb_verde2 = [_path, "createUnits\b_verde2.sqf"] call mf_compile;
createb_floresta1 = [_path, "createUnits\b_floresta1.sqf"] call mf_compile;
createb_floresta2 = [_path, "createUnits\b_floresta2.sqf"] call mf_compile;
createb_green = [_path, "createUnits\b_green.sqf"] call mf_compile;
createo_tan1 = [_path, "createUnits\o_tan1.sqf"] call mf_compile;
createo_tan2 = [_path, "createUnits\o_tan2.sqf"] call mf_compile;
createo_car_urb = [_path, "createUnits\o_car_urb.sqf"] call mf_compile;
createo_car_verde = [_path, "createUnits\o_car_verde.sqf"] call mf_compile;
createo_car_tan = [_path, "createUnits\o_car_tan.sqf"] call mf_compile;
createo_esp = [_path, "createUnits\o_esp.sqf"] call mf_compile;
createA_aff1 = [_path, "createUnits\A_aff1.sqf"] call mf_compile;
createA_affesp = [_path, "createUnits\A_affesp.sqf"] call mf_compile;
createsniperGroup = [_path, "createUnits\sniperGroup.sqf"] call mf_compile;
createHackerGroup1= [_path, "createUnits\hackerGroup1.sqf"] call mf_compile;
createHackerGroup2= [_path, "createUnits\hackerGroup2.sqf"] call mf_compile;
createLargeDivers = [_path, "createUnits\largeDivers.sqf"] call mf_compile;
createRandomSoldier = [_path, "createUnits\createRandomSoldier.sqf"] call mf_compile;
createRandomPilot = [_path, "createUnits\createRandomPilot.sqf"] call mf_compile;
createSmallDivers = [_path, "createUnits\smallDivers.sqf"] call mf_compile;
// custum groups end
createMissionLocation = [_path, "createMissionLocation.sqf"] call mf_compile;
createMissionMarker = [_path, "createMissionMarker.sqf"] call mf_compile;
createMissionVehicle = [_path, "createMissionVehicle.sqf"] call mf_compile;
createMissionVehicle2 = [_path, "createMissionVehicle2.sqf"] call mf_compile;
createOutpost = [_path, "createOutpost.sqf"] call mf_compile;
generateMissionWeights = [_path, "generateMissionWeights.sqf"] call mf_compile;
mission_VehicleCapture = "server\missions\mainMissions\mission_VehicleCapture.sqf" call mf_compile;
mission_VehicleCapture_v2 = "server\missions\mainMissions\mission_VehicleCapture_v2.sqf" call mf_compile;
missionHint = [_path, "missionHint.sqf"] call mf_compile;
moveIntoBuildings = [_path, "moveIntoBuildings.sqf"] call mf_compile;
removeDisabledMissions = [_path, "removeDisabledMissions.sqf"] call mf_compile;
setLocationObjects = [_path, "setLocationObjects.sqf"] call mf_compile;
setLocationState = [_path, "setLocationState.sqf"] call mf_compile;
setMissionState = [_path, "setMissionState.sqf"] call mf_compile;

//Function Compiles
_path = "server\functions";
A3W_fnc_checkHackedVehicles = [_path, "checkHackedVehicles.sqf"] call mf_compile;
A3W_fnc_deleteEmptyGroup = [_path, "fn_deleteEmptyGroup.sqf"] call mf_compile;
A3W_fnc_playerRespawnServer = [_path, "playerRespawnServer.sqf"] call mf_compile;
A3W_fnc_registerKillScore = [_path, "fn_registerKillScore.sqf"] call mf_compile;
A3W_fnc_requestTickTime = [_path, "fn_requestTickTime.sqf"] call mf_compile;
A3W_fnc_setItemCleanup = [_path, "fn_setItemCleanup.sqf"] call mf_compile;
A3W_fnc_updateSpawnTimestamp = [_path, "fn_updateSpawnTimestamp.sqf"] call mf_compile;
addMilCap = [_path, "addMilCap.sqf"] call mf_compile;
basePartSetup = [_path, "basePartSetup.sqf"] call mf_compile;
cleanVehicleWreck = [_path, "cleanVehicleWreck.sqf"] call mf_compile;
convertTerritoryOwner = "territory\server\convertTerritoryOwner.sqf" call mf_compile;
defendArea = [_path, "defendArea.sqf"] call mf_compile;
dropPlayerItems = [_path, "dropPlayerItems.sqf"] call mf_compile;
findClientPlayer = [_path, "findClientPlayer.sqf"] call mf_compile;
fn_entityKilled = [_path, "fn_entityKilled.sqf"] call mf_compile;
fn_onPlayerConnected = [_path, "fn_onPlayerConnected.sqf"] call mf_compile;
fn_onPlayerDisconnected = [_path, "fn_onPlayerDisconnected.sqf"] call mf_compile;
fn_publicVariableAll = [_path, "fn_publicVariableAll.sqf"] call mf_compile;
fn_refillBox = [_path, "fn_refillbox.sqf"] call mf_compile;
fn_refillTruck = [_path, "fn_refilltruck.sqf"] call mf_compile;
fn_replaceMagazines = [_path, "fn_replaceMagazines.sqf"] call mf_compile;
fn_replaceWeapons = [_path, "fn_replaceWeapons.sqf"] call mf_compile;
fn_updatePlayerScore = [_path, "fn_updatePlayerScore.sqf"] call mf_compile;
fn_vehicleGetInOutServer = [_path, "fn_vehicleGetInOutServer.sqf"] call mf_compile;
fn_vehicleKilledServer = [_path, "fn_vehicleKilledServer.sqf"] call mf_compile;
hintBroadcast = [_path, "hintBroadcast.sqf"] call mf_compile;
parachuteLiftedVehicle = [_path, "parachuteLiftedVehicle.sqf"] call mf_compile;
processGroupInvite = [_path, "processGroupInvite.sqf"] call mf_compile;
processItems = [_path, "processItems.sqf"] call mf_compile;
punishTeamKiller = [_path, "punishTeamKiller.sqf"] call mf_compile;
refillPrimaryAmmo = [_path, "refillPrimaryAmmo.sqf"] call mf_compile;
respawnEventServer = [_path, "respawnEventServer.sqf"] call mf_compile;
setMissionSkill = [_path, "setMissionSkill.sqf"] call mf_compile;
spawnStoreObject = [_path, "spawnStoreObject.sqf"] call mf_compile;
teamKillUnlock = [_path, "teamKillUnlock.sqf"] call mf_compile;
teamSwitchLock = [_path, "teamSwitchLock.sqf"] call mf_compile;
teamSwitchUnlock = [_path, "teamSwitchUnlock.sqf"] call mf_compile;
updateConnectingClients = "territory\client\updateConnectingClients.sqf" call mf_compile;
vehicleRepair = [_path, "vehicleRepair.sqf"] call mf_compile;
vehicleSetup = [_path, "vehicleSetup.sqf"] call mf_compile;
waitUntilBagTaken = [_path, "waitUntilBagTaken.sqf"] call mf_compile;
weaponDisassembledServer = [_path, "weaponDisassembledServer.sqf"] call mf_compile;

//Player Management
server_playerDied = [_path, "serverAiDied.sqf"] call mf_compile;
A3W_fnc_serverPlayerDied = [_path, "serverPlayerDied.sqf"] call mf_compile;

//Spawning Compiles
_path = "server\spawning";
addVehicleRespawn = [_path, "addVehicleRespawn.sqf"] call mf_compile;
boatCreation = [_path, "boatCreation.sqf"] call mf_compile;
objectCreation = [_path, "objectCreation.sqf"] call mf_compile;
planeCreation = [_path, "planeCreation.sqf"] call mf_compile;
randomWeapons = [_path, "randomWeapon.sqf"] call mf_compile;
// staticGunCreation = [_path, "staticGunCreation.sqf"] call mf_compile;
staticHeliCreation = [_path, "staticHeliCreation.sqf"] call mf_compile;
vehicleCreation = [_path, "vehicleCreation.sqf"] call mf_compile;

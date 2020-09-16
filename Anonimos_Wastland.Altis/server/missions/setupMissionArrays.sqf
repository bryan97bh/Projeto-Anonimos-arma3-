// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqfss
//	@file Author: AgentRev principal -- principalMissions

if (!isServer) exitWith {};
// Mission filename, weight 
MainMissions =
[
	["mission_APC", 1],              //VEÍCULO ANTIAÉREO/VEÍCULO DE COMBATE DE INFANTARIA/VEÍCULO BLINDADO DE COMBATE/TRANSPORTADOR DE TROPA BLINDADO
	["mission_MBT", 1],              //CAVALARIA BLINDADA
	["mission_LightArmVeh", 1],      //VEÍCULO LEVE DE COMBATE
	["mission_ArmedHeli", 1],        //HELICÓPTERO GUARNECIDO
    ["mission_AbandonedJet", 1],     //AERONAVE ABANDONADA
	["mission_CivHeli", 1]           //HELICÓPTERO DE SUPORTE
];

SideMissions =
[ 
	["mission_MiniConvoy", 1],            //ESCOLTA ARMADA
    ["mission_DrugsRunners", 1],          //TRAFICANTES
    ["mission_Smugglers", 1],             //CONTRABANDO DE ARMAS
	["mission_TownInvasion", 1],         //CIDADE INVADIDA
	["mission_AirWreck", 1],              //AERONAVE CAÍDA
	["mission_WepCache", 1],              //AERONAVE CAÍDA 2
	["mission_Truck", 1]                  //CAMINHÃO DE SUPRIMENTO
];

MoneyMissions =
[
	["mission_MoneyShipment", 1],           //ESCOLTA DE DINHEIRO
    ["mission_HostageRescue", 1],           //RESGATE AO REFÉM
    ["mission_Roadblock", 1],               //BLOQUEIO NA ESTRADA
    ["mission_Terror", 1],                  //CIDADE TOMADA 
	["mission_HackLaptop", 0.1]	            //Hackers
];

PrincipalMissions =
[
	["mission_Outpost", 1],                  //POSTO AVANÇADO INIMIGO
	["mission_Convoy", 1]                    //COMBOIO SUSPEITO
];

hostileairMissions =
[
	["mission_HostileHelicopter", 0.5],                     //HELICÓPTERO HOSTIL
    ["mission_HostileHeliFormation", 0.5],                  //PATRULHA AÉREA
	["mission_HostileJetFormation", 0.5]                    //JATOS HOSTIS 
	//["mission_FalconPatrol", 1],        //sem caixa       //PATRULHA AÉREA FALCON
	//["mission_SmugglerPlane", 1]        //sem caixa       //AVIÃO CONTRABANDISTA
];

aquaticMissions =
[
	["mission_ArmedDiversquad", 1], //EXPEDIÇÃO GRUMEC
	["mission_Coastal_Convoy", 1],  //PATRULHA COSTEIRA
	["mission_Jaws", 1],            //TESOURO SUBMERSO
	["mission_SunkenSupplies", 1],  //SUPRIMENTOS AFUNDADO
	["mission_SunkenTreasure", 1]   //ESOURO À VISTA
];

MissionSpawnMarkers = (allMapMarkers select {["Mission_", _x] call fn_startsWith}) apply {[_x, false]};
ForestMissionMarkers = (allMapMarkers select {["ForestMission_", _x] call fn_startsWith}) apply {[_x, false]};
SunkenMissionMarkers = (allMapMarkers select {["SunkenMission_", _x] call fn_startsWith}) apply {[_x, false]};
HackerMissionMarkers = (allMapMarkers select {["HackerMission_", _x] call fn_startsWith}) apply {[_x, false]};
RoadblockMissionMarkers = (allMapMarkers select {["RoadblockMission_", _x] call fn_startsWith}) apply {[_x, false]};
SatelliteMissionMarkers = (allMapMarkers select {["SatelliteMission_", _x] call fn_startsWith}) apply {[_x, false]};

if !(ForestMissionMarkers isEqualTo []) then
{
	SideMissions append
	[
		["mission_AirWreck", 1],
		["mission_WepCache", 1]
	];
};

if !(SatelliteMissionMarkers isEqualTo []) then
{
	MoneyMissions append
	[
		["mission_Satellite_Uplink", 0.3]
	];
};

LandConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf") apply {[_x, false]};
CoastalConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf") apply {[_x, false]};

PrincipalMissions = [PrincipalMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;
{ _x set [2, false] } forEach PrincipalMissions;
{ _x set [2, false] } forEach hostileairMissions;
{ _x set [2, false] } forEach aquaticMissions;
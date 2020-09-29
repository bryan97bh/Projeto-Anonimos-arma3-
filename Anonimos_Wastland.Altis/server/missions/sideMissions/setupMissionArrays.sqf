// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqfss
//	@file Author: AgentRev principal -- principalMissions

if (!isServer) exitWith {};
// Mission filename, weight 
MainMissions =
[
	["mission_LightArmVeh2", 1.1],     //VIATURA DE COMBATE
	["mission_LightArmVeh", 1],        //VEÍCULO LEVE DE COMBATE
	["mission_APC", 0.7],              //VEÍCULO ANTIAÉREO/VEÍCULO DE COMBATE DE INFANTARIA/VEÍCULO BLINDADO DE COMBATE/TRANSPORTADOR DE TROPA BLINDADO
	["mission_MBT", 0.4],              //CAVALARIA BLINDADA
	["mission_CivHeli", 1.2],          //HELICÓPTERO DE SUPORTE
	["mission_ArmedHeli", 1],          //HELICÓPTERO GUARNECIDO 
	["mission_ArmedHeli2", 0.6],       //HELICÓPTERO DE ATAQUE GUARNECIDO 
	["mission_Abandoneddrone", 0.5],   //drone ABANDONADO
    ["mission_AbandonedJet", 0.5]      //AERONAVE ABANDONADA
];

SideMissions =
[ 
	["mission_GeoCache", 0.9],         //analise geografica
    ["mission_ConvoyCSATSF", 1.2],     //PATRULHA DE RECONHECIMENTO
    ["mission_DrugsRunners", 1.1],     //TRAFICANTES
    ["mission_Smugglers", 1.3],        //CONTRABANDO DE ARMAS
	["mission_AirWreck", 0.9],         //HELICÓPTERO ABATIDO
	["mission_WepCache", 0.9],         //ACAMPAMENTO MILITAR
	["mission_Truck", 1.1]             //CAMINHÃO DE SUPRIMENTO
];

MoneyMissions =
[
	//["mission_MoneyShipment", 1.5],    //ESCOLTA DE DINHEIRO
    //["mission_HostageRescue", 1],      //RESGATE AO REFÉM
    ["mission_Roadblock", 1],          //BLOQUEIO NA ESTRADA
    ["mission_Terror", 1.6]           //GRUPO TERRORISTA
	//["mission_HackLaptop", 0.3],	   //Hackers
	//["mission_Satellite_Uplink", 0.4]  //SAT
];

PrincipalMissions =
[
	//["mission_Sniper", 0.9],           //SNIPES 
	["mission_OCUPACAO", 1.4]         //OCUPACAO
    //["mission_TownInvasion", 1.5],     //CIDADE INVADIDA
	//["mission_MiniConvoy", 1],         //ESCOLTA ARMADA
	//["mission_Outpost", 1.3],          //POSTO AVANÇADO
	//["mission_Convoy", 1],             //COMBOIO SUSPEITO 
	//["mission_ConvoyART", 1]           //ARTILHARIA
];

hostileairMissions =
[
	["mission_HostileHelicopter", 1.5],   //HELICÓPTERO HOSTIL
    ["mission_FORMAÇAODEHELI", 1.2],        //HELICÓPTEROS HOSTIS
	["mission_PATRULHAAEREA", 0.6],       //PATRULHA AÉREA

	["mission_HostileJet", 1.2],          //JATO HOSTIL
	["mission_HostileJetFormation", 1],   //JATOS HOSTIS
	["mission_OPRESSAOAÉREA", 0.4],       //OPRESSÃO AÉREA

	["mission_PATRULHAVTOL", 0.5]         //PATRULHA VTOL 
];

aquaticMissions =
[
	["mission_ArmedDiversquad", 1],   //EXPEDIÇÃO GRUMEC
	["mission_Coastal_Convoy", 1.1],  //PATRULHA COSTEIRA
	["mission_Jaws", 1.2],            //TESOURO SUBMERSO
	["mission_SunkenSupplies", 1.5],  //SUPRIMENTOS AFUNDADO
	["mission_SunkenTreasure", 0.5]   //BAU DO TESOURO
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
// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqfss
//	@file Author: AgentRev principal -- principalMissions

if (!isServer) exitWith {};
// Mission filename, weight 
MainMissions =
[
	["mission_APC", 1],
	["mission_MBT", 1],
	["mission_LightArmVeh", 1],
	["mission_ArmedHeli", 1],
    ["mission_AbandonedJet", 1],
	["mission_CivHeli", 1]
];

SideMissions =
[
	//["mission_HostileHelicopter", 0.5],//manter destivado 
	["mission_MiniConvoy", 1],
    ["mission_DrugsRunners", 1],
    ["mission_Smugglers", 1],
	//["mission_SunkenSupplies", 0.2],//manter destivado 
	["mission_TownInvasion", 2],
	["mission_AirWreck", 1],
	["mission_WepCache", 1],
	["mission_Outpost", 1],
	["mission_Truck", 1]
];

MoneyMissions =
[
	["mission_MoneyShipment", 1],
    ["mission_HostageRescue", 1],
    ["mission_Roadblock", 1],
    ["mission_Terror", 1],
	//["mission_SunkenTreasure", 0.1],//manter destivado 
	["mission_HackLaptop", 1]	
];

PrincipalMissions =
[
	//["mission_ArmedDiversquad", 0.2],//manter destivado 
	//["mission_Coastal_Convoy", 0.7],//manter destivado 
	["mission_Convoy", 1]
	//["mission_HostileHeliFormation", 0.5],//manter destivado 
    //["mission_HostileJetFormation", 0.5]//manter destivado 
];

hostileairMissions =
[
	//["mission_FalconPatrol", 1], 
    ["mission_HostileHelicopter", 1],
    ["mission_HostileHeliFormation", 1],
    ["mission_HostileJet", 1],
	["mission_HostileJetFormation", 1]
	//["mission_HostileVTOL", 1],
	//["mission_SmugglerPlane", 1]
];

aquaticMissions =
[
	["mission_ArmedDiversquad", 1],
	["mission_Coastal_Convoy", 1],
	["mission_Jaws", 1],
	["mission_SunkenSupplies", 1],
	["mission_SunkenTreasure", 1]
];

MissionSpawnMarkers = (allMapMarkers select {["Mission_", _x] call fn_startsWith}) apply {[_x, false]};
ForestMissionMarkers = (allMapMarkers select {["ForestMission_", _x] call fn_startsWith}) apply {[_x, false]};
SunkenMissionMarkers = (allMapMarkers select {["SunkenMission_", _x] call fn_startsWith}) apply {[_x, false]};
HackerMissionMarkers = (allMapMarkers select {["HackerMission_", _x] call fn_startsWith}) apply {[_x, false]};
RoadblockMissionMarkers = (allMapMarkers select {["RoadblockMission_", _x] call fn_startsWith}) apply {[_x, false]};
SatelliteMissionMarkers = (allMapMarkers select {["SatelliteMission_", _x] call fn_startsWith}) apply {[_x, false]};

/*if !(ForestMissionMarkers isEqualTo []) then
{
	SideMissions append
	[
		["mission_AirWreck", 1],
		["mission_WepCache", 1]
	];
};*/

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
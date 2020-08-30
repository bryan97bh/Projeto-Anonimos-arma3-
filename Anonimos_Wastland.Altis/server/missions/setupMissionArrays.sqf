// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqfs
//	@file Author: AgentRev principal -- principalMissions

if (!isServer) exitWith {};
// Mission filename, weight 
MainMissions =
[
	["mission_APC", 0.7],
	["mission_MBT", 1],
	["mission_LightArmVeh", 1],
	["mission_ArmedHeli", 1],
    ["mission_AbandonedJet", 0.4],
	["mission_CivHeli", 1]
];

SideMissions =
[
	["mission_HostileHelicopter", 0.5],
	["mission_MiniConvoy", 1],
    ["mission_DrugsRunners", 1],
    ["mission_Smugglers", 1],
	["mission_SunkenSupplies", 0.2],
	["mission_TownInvasion", 2],
	["mission_AirWreck", 1],
	["mission_WepCache", 0.5],
	["mission_Outpost", 3],
	["mission_Truck", 1]
];

MoneyMissions =
[
	["mission_MoneyShipment", 1.5],
    ["mission_HostageRescue", 1],
    ["mission_Roadblock", 1],
    ["mission_Terror", 1],
	["mission_SunkenTreasure", 0.1],
	["mission_HackLaptop", 0.1]	
];

PrincipalMissions =
[
	["mission_ArmedDiversquad", 0.2],
	["mission_Coastal_Convoy", 0.7],
	["mission_Convoy", 1],
	["mission_HostileHeliFormation", 0.5],
    ["mission_HostileJetFormation", 0.5]
];

hostileairMissions =
[
	["mission_FalconPatrol", 0.9],
    ["mission_HostileHelicopter", 0.7],
    ["mission_HostileHeliFormation", 0.6],
    ["mission_HostileJet", 0.5],
	["mission_HostileVTOL", 0.5],
	["mission_SmugglerPlane", 0.8]
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
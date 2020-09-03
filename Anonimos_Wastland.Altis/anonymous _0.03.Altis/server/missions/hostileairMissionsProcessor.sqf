// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: hostileairMissionProcessor.sqf
//	@file Author: AgentRev

#define MISSION_PROC_TYPE_NAME "objetivos aéreo"
#define MISSION_PROC_TIMEOUT (["A3W_hostileairMissionTimeout", 10*60] call getPublicVar)
#define MISSION_PROC_COLOR_DEFINE hostileairMissionColor

#include "hostileairMissions\hostileairMissionDefines.sqf"
#include "missionProcessor.sqf";

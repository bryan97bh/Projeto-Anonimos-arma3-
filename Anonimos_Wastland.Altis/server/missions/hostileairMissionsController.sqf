// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: hostileairMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST hostileairMissions
#define MISSION_CTRL_TYPE_NAME "objetivos aéreo"
#define MISSION_CTRL_FOLDER "hostileairMissions"
#define MISSION_CTRL_DELAY (["A3W_hostileairMissionDelay", 1*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE hostileairMissionColor

#include "hostileairMissions\hostileairMissionDefines.sqf"
#include "missionController.sqf";

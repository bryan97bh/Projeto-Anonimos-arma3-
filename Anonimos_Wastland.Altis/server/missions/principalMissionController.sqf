// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mainMissionController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST PrincipalMissions
#define MISSION_CTRL_TYPE_NAME "PRINCIPAL"
#define MISSION_CTRL_FOLDER "principalMissions"
#define MISSION_CTRL_DELAY (["A3W_principalMissionsDelay", 10*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE mainMissionColor

#include "principalMissions\principalMissionsDefines.sqf"
#include "missionController.sqf";

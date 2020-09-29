// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: aquaticMissionsController.sqf
//	@file Author: AgentRev

#define MISSION_CTRL_PVAR_LIST aquaticMissions
#define MISSION_CTRL_TYPE_NAME "AQUÁTICAS"
#define MISSION_CTRL_FOLDER "aquaticMissions"
#define MISSION_CTRL_DELAY (["A3W_aquaticMissionDelay", 5*60] call getPublicVar)
#define MISSION_CTRL_COLOR_DEFINE aquaticMissionColor

#include "aquaticMissions\aquaticMissionDefines.sqf"
#include "missionController.sqf";

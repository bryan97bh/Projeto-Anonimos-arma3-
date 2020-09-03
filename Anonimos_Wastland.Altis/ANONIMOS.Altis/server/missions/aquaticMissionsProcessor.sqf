// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: aquaticMissionsProcessor.sqf
//	@file Author: AgentRev

#define MISSION_PROC_TYPE_NAME "objetivos aquáticos"
#define MISSION_PROC_TIMEOUT (["A3W_aquaticMissionTimeout", 10*60] call getPublicVar)
#define MISSION_PROC_COLOR_DEFINE aquaticMissionColor

#include "aquaticMissions\aquaticMissionDefines.sqf"
#include "missionProcessor.sqf";

// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mainMissionDefines.sqf principalMissions
//	@file Author: [404] Deadbeat, AgentRev
//	@file Created: 08/12/2012 15:19

// Main Mission Color = #52bf90 - Light blue
// Fail Mission Color = #FF1717 - Light red
// Success Mission Color = #17FF41 - Light green

#define mainMissionColor "#52bf90"
#define failMissionColor "#FF1717"
#define successMissionColor "#17FF41"
#define subTextColor "#FFFFFF"

#define AI_GROUP_SMALL 5
#define AI_GROUP_MEDIUM 10
#define AI_GROUP_LARGE 15

#define missionDifficultyHard (["A3W_missionsDifficulty", 0] call getPublicVar >= 1)

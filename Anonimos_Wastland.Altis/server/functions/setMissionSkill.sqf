// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: setMissionSkill.sqf
//	@file Author: AgentRev
//	@file Created: 21/10/2013 19:14
//	@file Args:

if (!isServer) exitWith {};

private ["_unit", "_skill", "_accuracy"];
_unit = _this;
_unit allowFleeing 0;

	//AJ Balancing for all mission AI Units
if (["A3W_AJskillOverride"] call isConfigOn) then
	{
	_unit setSkill ["aimingAccuracy", 0.35]; // Set accuracy to 35%
	_unit setSkill ["aimingShake", 0.25]; // Set weapon sway handling to 25% (effectively 75% sway)
	_unit setSkill ["aimingSpeed", 0.35]; // Set aiming speed to 35%
	_unit setSkill ["reloadSpeed", 1]; // Max out reload speed
	_unit setSkill ["spotDistance", 1]; // Set detection distance to 75%
	_unit setSkill ["spotTime", 1]; // Set detection time to 75%
	_unit setSkill ["courage", 1]; // Max out courage, never retreat
	_unit setSkill ["commanding", 1]; // Max out communication skills
	}
	//Wasteland Default AI Settings
	else
	{
			if (["A3W_missionsDifficulty"] call isConfigOn) then
			{
			_skill = 0.5; // Default skill for ARMA3 is 0.5
			_accuracy = 1; // Relative multiplier; absolute default accuracy for ARMA3 is 0.25
			}
			else
			{
			_skill = 0.33;
			_accuracy = 0.75;
		};
		
	_unit setSkill _skill;
	_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
	_unit setSkill ["courage", 1];
	};
// Available skills are explained here: http://community.bistudio.com/wiki/AI_Sub-skills
// Skill values are between 0 and 1
scriptName "teargasEffect";
/*--------------------------------------------------------------------
	-------------------- Anônimos Wasteland -----------------------
	------------------------------------------------------------------

	- This Wasteland Version is a completely new code build. -
	- Please do not just copy and paste this code, there could be server dependencies -

	Modified by: Anônimos Brasil
	Description: Creates a Teargas Effect
	Parameter(s):
	Returns:
--------------------------------------------------------------------*/
#define __filename "teargasEffect.sqf"

_masks = [
"G_AirPurifyingRespirator_02_black_F",
"G_AirPurifyingRespirator_02_olive_F",
"G_AirPurifyingRespirator_02_sand_F",
"G_AirPurifyingRespirator_01_F",
"G_RegulatorMask_F"
];

if(goggles player in _masks) exitWith {false};
//if(goggles player find "G_AirPurifyingRespirator_02_black_F" > -1 || goggles player find "G_AirPurifyingRespirator_02_olive_F" > -1 || goggles player find "G_AirPurifyingRespirator_02_sand_F" > -1 || goggles player find "G_AirPurifyingRespirator_01_F" > -1 || goggles player find "G_RegulatorMask_F" > -1) exitWith {false};

player setFatigue 1;
0 = ["WetDistortion", 500, [
	1,
	0, 1,
	4.10, 3.70, 2.50, 1.85,
	0.0054, 0.0041, 0.05, 0.0070,
	0.1, 0.1, 0.1, 0.1
]] spawn {
	params ["_name", "_priority", "_effect", "_handle"];
	7+ {
		_handle = ppEffectCreate [_name, _priority];
		_handle < 0
	} do {
		_priority = _priority + 1;
	};
	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 5;
	waitUntil {ppEffectCommitted _handle};
	_handle ppEffectAdjust [
	0,
	0, 0,
	4.10, 3.70, 2.50, 1.85,
	0, 0, 0, 0,
	0, 0, 0, 0
	];
	_handle ppEffectCommit 5;
	waitUntil {ppEffectCommitted _handle};
	//uiSleep 3;
	comment "Admire o efeito por um segundo";
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};
0 = ["ChromAberration", 499, [0.15, 0.15, true]] spawn {
	params ["_name", "_priority", "_effect", "_handle1"];
	while {
		_handle1 = ppEffectCreate [_name, _priority];
		_handle1 < 0
	} do {
		_priority = _priority + 1;
	};
	_handle1 ppEffectEnable true;
	_handle1 ppEffectAdjust _effect;
	_handle1 ppEffectCommit 7;
	waitUntil {ppEffectCommitted _handle1};
	_handle1 ppEffectAdjust [0, 0, false];
	_handle1 ppEffectCommit 11;
	waitUntil {ppEffectCommitted _handle1};
	//uiSleep 3;
	comment "Admire o efeito por um segundo";
	_handle1 ppEffectEnable false;
	ppEffectDestroy _handle1;
};

0 = ["DynamicBlur", 200, [3]] spawn {
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		_handle = ppEffectCreate [_name, _priority];
		_handle < 0
	} do {
		_priority = _priority + 1;
	};
	_handle ppEffectEnable true;
	_handle ppEffectAdjust _effect;
	_handle ppEffectCommit 3;
	waitUntil {ppEffectCommitted _handle};
	_handle ppEffectAdjust [0];
	_handle ppEffectCommit 3;
	waitUntil {ppEffectCommitted _handle};
	//uiSleep 3;
	comment "Admire o efeito por um segundo";
	_handle ppEffectEnable false;
	ppEffectDestroy _handle;
};
(vehicle player) setVehicleLock "Unlocked";
player action ["Eject",vehicle player];




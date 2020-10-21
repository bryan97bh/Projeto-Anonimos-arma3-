// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: wiking.at [aj]
//  @comment Randomize Default Groups

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_grouptype","_selectedgroup" ];
 
_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];
_grouptype = param [4, "random"];

if (_grouptype == "random") then
	{
		_selectedgroup = 
		[  
			["b_tan1", 1],
			["b_tan2", 1.5],
			["b_verde1", 1], 
			["b_verde2", 1.2], 
			["b_floresta1", 1],
			["b_floresta2", 1.3],
			["b_green", 0.9],
            ["o_tan1", 1],  
			["o_tan2", 1.5],
            ["o_car_urb", 1.4],
			["o_car_tan", 1.3],
			["o_car_verde", 1.1], 
			["o_esp", 0.8],
			["A_aff1", 1],
			["A_affesp", 0.7]
		] call fn_selectRandomWeightedPairs call fn_selectRandomNested;
	} 
	else
	{
		_selectedgroup = _grouptype;
	};
 
 
[_group, _pos, _nbUnits, _radius] call (missionnamespace getvariable format["create%1",_selectedgroup]);

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
			["defaultGroup", 0.5], //7.62-MIRA
			["hexGroup", 0.5],  // 7.62-MIRA
			["greenhexGroup", 1],  //SAA
			["tropicGroup", 1.5], //SAA
			["roadblockGroup", 1.5], //SAA 
			["ocupacaoGroup", 0.7] //MIRA 
			//["smugglersGroup", 1] 

		] call fn_selectRandomWeightedPairs call fn_selectRandomNested;
	} 
	else
	{
		_selectedgroup = _grouptype;
	};
 
 
[_group, _pos, _nbUnits, _radius] call (missionnamespace getvariable format["create%1",_selectedgroup]);

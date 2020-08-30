// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: playerCustomUniform.sqf
//	@file Author: Lodac
//	@file Created: 2/23/2015


if (isDedicated) exitWith {};

private ["_player", "_side", "_customUniformEnabled", "_uniformNumber"];

_player = getPlayerUID player;
_side = playerSide;
_uniformNumber = 0;
_customUniformEnabled = ["A3W_customUniformEnabled"] call isConfigOn;
_uniformNumber = player getVariable ["uniform", 0];

if (!(_customUniformEnabled) || _uniformNumber < 1) exitWith {};


switch (_side) do
{
	case INDEPENDENT:
	{
		[] spawn
		{
			while {true} do
			{
				_uniformNumber = player getVariable ["uniform", 0];
				_ranknumber = 0;
				waitUntil {sleep 0.4; uniform player == "U_I_CombatUniform"};
				
				// AJ - Uniforms 1-9 are reserved for AJ Ranks - Convert value to 10, use for rank image 
				
				if ((_uniformNumber > 0) && (_uniformnumber < 10)) then 
				{
				_ranknumber = _uniformnumber;
				_uniformNumber = 10; 
				// hint format ["ranknumber %1",_ranknumber ];
				
				};
				
				
				player setObjectTextureGlobal [0, format["client\images\uniformTextures\%1_I.jpg", _uniformNumber]];
				
				switch (_ranknumber) do  // Apply AJ Rankinsignia
					{
					case 9: {[player,"aj_rank_BrigGen"] call BIS_fnc_setUnitInsignia; };  // Brigardegeneral Master
					case 8: {[player,"aj_rank_OTL"] call BIS_fnc_setUnitInsignia; }; 	  // Oberstleutnant Core Mission Developer
					case 5: {[player,"aj_rank_Hptm"] call BIS_fnc_setUnitInsignia; };     // Hauptmann  - AJ Squad Leaders
					case 3: {[player,"aj_rank_HG"] call BIS_fnc_setUnitInsignia; };       // Hauptgefreiter - AJ Default
					case 1: {[player,"aj_rank_gef"] call BIS_fnc_setUnitInsignia; };      // Gefreiter - AJ Trials
					default {};
					};
			
				if ( _uniformNumber ==  10 && (headgear player) == "H_MilCap_dgtl") then // 10 = armajunkies uniform
					{
					sleep 1;
					switch (_ranknumber) do //Apply AJ Rank Headgear
					{
					case 9: { player addHeadgear "H_Beret_Colonel"; };    // Brigardegeneral Master
					case 8: { player addHeadgear "H_Beret_blk"; }; 	      // Oberstleutnant Core Mission Developer
					case 5: { player addHeadgear "H_Watchcap_camo"; };    // Hauptmann  - AJ Squad Leaders
					case 3: { player addHeadgear "H_Shemag_olive_hs"; };  // Hauptgefreiter - AJ Default
					case 1: { player addHeadgear "H_Shemag_olive"; };     // Gefreiter - AJ Trials
					default {};
					};

					};
					
				if ( _uniformNumber ==  10) then      // 10 = armajunkies - switch backpack texture
					{
					switch (backpack player) do       //Check which Backpack AJ is wearing
					{
					case "B_HuntingBackpack": { (backpackContainer player) setObjectTextureGlobal [0,'client\images\backpackTextures\tacticalpack_fleck_co.jpg'] };        // Hunting Backpack (Start-Rucksack)
					case "B_Carryall_mcamo": {(backpackContainer player) setObjectTextureGlobal [0,'client\images\backpackTextures\carryall_fleck_co.jpg']  };             // Carryall Backpack (MTP)
					case "B_AssaultPack_mcamo": { (backpackContainer player) setObjectTextureGlobal [0,'client\images\backpackTextures\assaultpack_fleck_co.jpg'] };      // Assault Backpack (MTP)
					case "B_Kitbag_mcamo": { (backpackContainer player) setObjectTextureGlobal [0,'client\images\backpackTextures\kitbag_fleck_co.jpg'] };                 // Kitback (MTP)
					case "B_TacticalPack_mcamo": {(backpackContainer player) setObjectTextureGlobal [0,'client\images\backpackTextures\tacticalpack_fleck_co.jpg']};       // Tactical Backpack (MTP)
					case "B_Bergen_mcamo": {(backpackContainer player) setObjectTextureGlobal [0,'client\images\backpackTextures\tacticalpack_fleck_co.jpg']};             // Tactical Backpack (MTP)
					case "B_FieldPack_khk": {(backpackContainer player) setObjectTextureGlobal [0,'client\images\backpackTextures\fieldpack_fleck_co.jpg']};               // Field Pack (Khaki)
					default {};     //Don't do anything for other backpacks
					};

					};
				
				waitUntil {sleep 0.4; uniform player != "U_I_CombatUniform"};
			};
		};
	};

};


// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: Door_unlockDoor.sqf
//	@file Author: LouD / Cael817, modified by wiking.at[AJ]
//	@file Description: Door script

private ["_doors"];
_doors = (nearestObjects [player, ["Land_Canal_Wall_10m_F", "Land_PillboxWall_01_6m_F", "Land_PillboxWall_01_3m_round_F"], 10]);



if (!isNil "_doors") then
{
	{
		if (cursortarget getVariable ["owneruid", "undef"] == _x getVariable ["owneruid", "undef2"]) then  //check if door and key are owned by the same player
		{
			[[_x, true], "A3W_fnc_hideObjectGlobal"] call A3W_fnc_MP;			
		}
		else
		{
		["A porta e o abridor devem ser trancados pelo mesmo jogador", 5] call mf_notify_client;
		};	
	} forEach _doors;
//cursortarget setObjectTextureGlobal [0, "\A3\Structures_F_Heli\Items\Electronics\Data\Tablet_Screen_CO.paa"];
//cursortarget setObjectTextureGlobal [1, "\A3\Structures_F\Items\Electronics\Data\Electronics_screens_laptop_CO.paa"];
} 
else 
{
	["Nenhuma porta trancada encontrada", 5] call mf_notify_client;
};
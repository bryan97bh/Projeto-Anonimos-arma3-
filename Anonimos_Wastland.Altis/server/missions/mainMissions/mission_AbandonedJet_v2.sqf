// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_AbandonedJet.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev, Staynex

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
        "C_Plane_Civil_01_racing_F",                                      //SUPER TUCANO

        ["I_Plane_Fighter_03_dynamicLoadout_F", "buzzardCAS"],            //A-143 Buzzard CAS
        //["I_Plane_Fighter_03_dynamicLoadout_F", "buzzardAA"],             //A-143 Buzzard AA
        ["I_Plane_Fighter_03_dynamicLoadout_F", "buzzardb1"],             //A-143 Buzzard b1
        ["I_Plane_Fighter_03_dynamicLoadout_F", "buzzardb1"],             //A-143 Buzzard b2

        "I_Plane_Fighter_04_F",                                          //A-149 Gryphon cas
        //["I_Plane_Fighter_04_F", "GryphonAA"],                           //A-149 Gryphon  aa

        "B_Plane_Fighter_01_F",                                           //F/A-181 Black Wasp cas
        //["B_Plane_Fighter_01_F", "F18AA"],                                //F/A-181 Black Wasp aa
        ["B_Plane_Fighter_01_F", "F18b1"],                                //F/A-181 Black Wasp b1
        "B_Plane_Fighter_01_Stealth_F",                                   //Furtivo

        "O_Plane_Fighter_02_F",                                           //To-201 Shikra cas
        //["O_Plane_Fighter_02_F", "ShikraAA"],                             //To-201 Shikra aa
        ["O_Plane_Fighter_02_F", "Shikrab1"],                             //To-201 Shikra B1
        "O_Plane_Fighter_02_Stealth_F",                                   //Furtivo

        "B_Plane_CAS_01_dynamicLoadout_F",                                //A-10 Wipeout cas
        ["B_Plane_CAS_01_dynamicLoadout_F", "A10B2"],                     //A-10 Wipeout cas2
        ["B_Plane_CAS_01_dynamicLoadout_F", "A10B3"],                     //A-10 Wipeout b3

        "O_Plane_CAS_02_dynamicLoadout_F",                                //To-199 Neophron
        ["O_Plane_CAS_02_dynamicLoadout_F", "NeophronB2"],                //To-199 Neophron cas2
        ["O_Plane_CAS_02_dynamicLoadout_F", "NeophronB1"],                //BOMBARDEIRO 3
       
        "O_T_VTOL_02_infantry_dynamicLoadout_F",                          //Y-32 Xian | Completo|Transporta Infantaria
        ["O_T_VTOL_02_infantry_dynamicLoadout_F", "variant_xianGunOnly"], //Y-32 Xian | Canhão 30mm|Transporta Infantaria
        "O_T_VTOL_02_vehicle_dynamicLoadout_F",                           //Y-32 Xian | Completo|Transporta Veículo
        ["O_T_VTOL_02_vehicle_dynamicLoadout_F", "variant_xianGunOnly"],  //Y-32 Xian | Canhão 30mm|Transporta Veículo
        
        "B_T_VTOL_01_armed_F"                                             //V-44 X Blackfish | Armado
	] call BIS_fnc_selectRandom;

	_missionType = "AERONAVE ABANDONADA";
	_locationsArray = spawn_VMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture_v2;

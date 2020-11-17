// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass = selectRandom
	[
        ["B_Heli_Light_01_dynamicLoadout_F", "pawneeNormal"],       // Pawnee Normal - Armed
        ["B_Heli_Light_01_dynamicLoadout_F", "pawneeGun"],  		// Pawnee Gun only - Armed
		["B_Heli_Light_01_dynamicLoadout_F", "pawneeDelta"],  		// cas - Armed
		//"O_Heli_Light_02_dynamicLoadout_F", "orcaDAR"],      	    // Orca DAR (unguided) - Armed
		//"O_Heli_Light_02_dynamicLoadout_F", "orcaDAGR"],          // Orca DAR (guided) - Armed
		"I_Heli_light_03_dynamicLoadout_F",                         // Hellcat - Armed	        
		"B_Heli_Transport_01_F",                                    // Ghosthawk Black - Armed
		"B_Heli_Transport_03_F"                                     // Huron Green - Armed
	];

	_missionType = "HELICÓPTERO GUARNECIDO";
	_locationsArray = spawn_VMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture_v2;

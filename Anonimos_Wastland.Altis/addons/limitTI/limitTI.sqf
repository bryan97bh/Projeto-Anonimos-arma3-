//	@file Version: 1.0
//	@file Name: limitTI.sqf
//	@file Author: wiking.at
//	Disables Flir for Drones and/or Launchers, Limits Flir Viewdistance
//  contributions from BIStudio Forums, based on script from CRE4MPIE
//  Variables: A3W_disableTIforAll, A3W_enableTILimitations, A3W_disableTIforLaunchers, A3W_disableTIforDrones, A3W_disableTIforAll


_enableTILimitations = ["A3W_enableTILimitations"] call isConfigOn;
if !(_enableTILimitations) exitWith {};

_disableTIforAll = ["A3W_disableTIforAll"] call isConfigOn;
_disableTIforLaunchers = ["A3W_disableTIforLaunchers"] call isConfigOn;
_disableTIforDrones = ["A3W_disableTIforDrones"] call isConfigOn;

_disableTIforDrones = true;

_layer = 85125; 
_launchers =["launch_I_Titan_short_F","launch_O_Titan_short_F","launch_B_Titan_short_F","launch_Titan_short_F","launch_Titan_F","launch_O_Titan_F","launch_I_Titan_F","launch_B_Titan_F"];  // launcher array


while {true} do 
{ 
	if (currentVisionMode player == 2) then																		// check for TI Mode
	{
	if (alive (getConnectedUAV player) && (_disableTIforDrones or _disableTIforAll)) then						// check if player is connected to a UAV			
		{		
			(getConnectedUAV player) disableTIEquipment true;
            _layer    cutText ["Thermal Imaging OFFLINE while connected to a UAV terminal!.","BLACK",0.001];	// Blackout screen with Text
			playSound "FD_CP_Not_Clear_F";
            waituntil {currentVisionMode player != 2};
            _layer cutText ["", "PLAIN"];
		}	
		else
        {	
            if (_disableTIforAll) then																			// DisableTI for Everything
            { 					
                playSound "FD_CP_Not_Clear_F";
                _layer    cutText ["Thermal Imaging OFFLINE!.","BLACK",0.001];
                waituntil {currentVisionMode player != 2};
                _layer cutText ["", "PLAIN"];
            };
        }; 
	};	
	
sleep 0.1; // disable loop for performance tests
};

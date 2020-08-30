/*
 =======================================================================================================================

	File:		init.sqf
	Author:		T-800a

=======================================================================================================================
*/

call compile preprocessFile "addons\laptop\downloadData.sqf";
call compile preprocessFile "addons\laptop\downloadSatData.sqf";

waitUntil {sleep 0.5; (!isNil "downloadDataDONE") && (!isNil "downloadSatDataDONE") };


/*
=======================================================================================================================
	downloadData - script to download data from a laptop and because of this complete a task (as example)
	File:		downloadData.sqf
	Author:		T-800a
	Edited: 	wiking.at
=======================================================================================================================
*/

#define SAT_varFileSize (["A3W_hackedMissionDlSize", 165072] call getPublicVar)


SAT_varTLine01 = "Hacking cancelled!";				// download aborted
SAT_varTLine02 = "Hacking already in progress by someone else!";			// download already in progress by someone else
SAT_varTLine03 = "Hacking started!";					// download started
SAT_varTLine04 = "Hacking finished! Bases are now displayed on your map";				// download finished
SAT_varTLine05 = "##  Hack Satellite Uplink  ##";				// line for the addaction

SAT_varDiagAbort = false;
SAT_varDownSucce = false;

downloadSatActionId = nil;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (isDedicated) exitWith {};

"AddSatLaptopHandler" addPublicVariableEventHandler {
	private [  "_cDT" ];
	_laptop = _this select 1;
	_cDT = _laptop getVariable [ "Done", false ];
	if ( _cDT ) exitWith {};
	if(isNil "downloadSatActionId") then {
		downloadSatActionId = _laptop addAction [ SAT_varTLine05, { call SAT_fnc_ActionLaptop; }, [], 10, true, false ];
	};
};

SAT_fnc_abortActionLaptop =
{
	if ( SAT_varDownSucce ) then 
	{
		// hint "DEBUG - DONE";
		SAT_varDiagAbort = false;
		SAT_varDownSucce = false;		
	
	} else { 
		player sideChat SAT_varTLine01; 
		SAT_varDiagAbort = true; 
		SAT_varDownSucce = false; 
	};
};

"RemoveSatLaptopHandler" addPublicVariableEventHandler
{
	_laptop = _this select 1;
	_laptop removeAction downloadSatActionId;
	downloadSatActionId = nil;
};


SAT_fnc_ActionLaptop =
{
	private [ "_laptop", "_caller", "_id", "_cIU","_totalMoney","_hackedPercent","_playerSide"];
	_laptop = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	
	player sideChat "Initializing...";
	sleep random 5;
	
	_cIU = _laptop getVariable [ "InUse", false ];
	if ( _cIU ) exitWith { player sideChat SAT_varTLine02; };
	
	player sideChat SAT_varTLine03;
	
	SAT_varDiagAbort = false;
	
	_laptop setVariable [ "InUse", true, true ];
		
	RM_DISPLAYTEXT_PUBVAR = [format["<t color='#FF0000' size='0.65'>%1</t><br/><t size='0.65'>has started to hack the reconaissence satellite.<br/><t color='#FF0000'>STOP HIM NOW!</t>",name player],0,0.7,7,0];
	publicVariable "RM_DISPLAYTEXT_PUBVAR";
		
	[ _laptop, _id] spawn 
	{
		private [ "_laptop", "_id", "_newFile", "_dlRate" ];
		
		_laptop		= _this select 0;
		_id			= _this select 1;
		
		_newFile = 0;
		
		createDialog "SAT_DataDownloadDialog";
		
		sleep 0.5;
		ctrlSetText [ 8001, "Connecting ..." ];
		sleep 0.5;
		ctrlSetText [ 8001, "Connected:" ];		
		ctrlSetText [ 8003, format [ "%1 kb", SAT_varFileSize ] ];		
		ctrlSetText [ 8004, format [ "%1 kb", _newFile ] ];		
		
		
				//aj - private abort variable due to server load.
		private "_abort";
		_abort = false;	
		
		while { !SAT_varDiagAbort && !_abort && alive player && (player getVariable ["FAR_isUnconscious", 0] == 0)} do
		{
			_dlRate = 1000 + random 400;
			_newFile = _newFile + _dlRate;

			if ( _newFile > SAT_varFileSize ) then 
			{
				_dlRate = 0;		
				_newFile = SAT_varFileSize;
				ctrlSetText [ 8001, "Hacking finished!" ];	
				SAT_varDiagAbort = true;
				SAT_varDownSucce = true;
				_abort = true;
				
				_laptop setVariable [ "Done", true, true ];
				
				//AJ - now run the sat recon
				0 spawn fnc_markBaselockers;
				
				
				systemChat "Satellite successfully hacked. Searching for bases in the area.";	
				sleep 5;
				
				
			};
					
			ctrlSetText [ 8002, format [ "%1 kb/s", _dlRate ] ];		
			ctrlSetText [ 8004, format [ "%1 kb", _newFile ] ];	

			sleep 1;
		};
		
		SAT_varDiagAbort = false;
		
		closeDialog 0;

		_laptop setVariable [ "InUse", false, true];	
	};
};

downloadSatDataDONE = true;





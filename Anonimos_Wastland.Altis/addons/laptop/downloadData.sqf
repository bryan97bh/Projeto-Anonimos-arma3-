/*
=======================================================================================================================
	downloadData - script to download data from a laptop and because of this complete a task (as example)
	File:		downloadData.sqf
	Author:		T-800a
	Edited: 	Lodac
=======================================================================================================================
*/

#define T8_varFileSize (["A3W_hackedMissionDlSize", 165072] call getPublicVar)
#define HACKED_ACCOUNT_PERCENTAGE (["A3W_hackedMissionPercentage", 0.005] call getPublicVar)
#define HACKED_EXTRA_FIXMONEY (["A3W_hackedMissionExtraFixMoney", 30000] call getPublicVar)

T8_varTLine01 = "Download cancelled!";				// download aborted
T8_varTLine02 = "Download already in progress by someone else!";			// download already in progress by someone else
T8_varTLine03 = "Download started!";					// download started
T8_varTLine04 = "Download finished";				// download finished
T8_varTLine05 = "##  Hack Player Bank Accounts  ##";				// line for the addaction

T8_varDiagAbort = false;
T8_varDownSucce = false;

downloadActionId = nil;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (isDedicated) exitWith {};

"AddLaptopHandler" addPublicVariableEventHandler {
	private [  "_cDT" ];
	_laptop = _this select 1;
	_cDT = _laptop getVariable [ "Done", false ];
	if ( _cDT ) exitWith {};
	if(isNil "downloadActionId") then {
		downloadActionId = _laptop addAction [ T8_varTLine05, { call T8_fnc_ActionLaptop; }, [], 10, true, false ];
	};
};

T8_fnc_abortActionLaptop =
{
	if ( T8_varDownSucce ) then 
	{
		// hint "DEBUG - DONE";
		T8_varDiagAbort = false;
		T8_varDownSucce = false;		
	
	} else { 
		player sideChat T8_varTLine01; 
		T8_varDiagAbort = true; 
		T8_varDownSucce = false; 
	};
};

"RemoveLaptopHandler" addPublicVariableEventHandler
{
	_laptop = _this select 1;
	_laptop removeAction downloadActionId;
	downloadActionId = nil;
};


T8_fnc_ActionLaptop =
{
	private [ "_laptop", "_caller", "_id", "_cIU","_totalMoney","_hackedPercent","_playerSide"];
	_laptop = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	
	player sideChat "Initializing...";
	sleep random 5;
	
	_cIU = _laptop getVariable [ "InUse", false ];
	if ( _cIU ) exitWith { player sideChat T8_varTLine02; };
	
	player sideChat T8_varTLine03;
	
	T8_varDiagAbort = false;
	
	_laptop setVariable [ "InUse", true, true ];
		
	[ _laptop, _id] spawn 
	{
		private [ "_laptop", "_id", "_newFile", "_dlRate" ];
		
		_laptop		= _this select 0;
		_id			= _this select 1;
		
		_newFile = 0;
		
		createDialog "T8_DataDownloadDialog";
		
		sleep 0.5;
		ctrlSetText [ 8001, "Connecting ..." ];
		sleep 0.5;
		ctrlSetText [ 8001, "Connected:" ];		
		ctrlSetText [ 8003, format [ "%1 kb", T8_varFileSize ] ];		
		ctrlSetText [ 8004, format [ "%1 kb", _newFile ] ];		
		
		
				//aj - private abort variable due to server load.
		private "_abort";
		_abort = false;	
		
		while { !T8_varDiagAbort && !_abort &&alive player && (player getVariable ["FAR_isUnconscious", 0] == 0)} do
		{
			_dlRate = 1000 + random 400;
			_newFile = _newFile + _dlRate;
			
			if (vehicle player != player) then {_abort = true};
			
			if ( _newFile > T8_varFileSize ) then 
			{
				_dlRate = 0;		
				_newFile = T8_varFileSize;
				ctrlSetText [ 8001, "Download finished!" ];	
				T8_varDiagAbort = true;
				T8_varDownSucce = true;
				_abort = true;
				
				_laptop setVariable [ "Done", true, true ];
				
				//AJ - now give the rewards to the hacker
				_totalMoney = 0;
				_playerSide = side player;
				switch (_playerSide) do 
				{		
					case BLUFOR: 
					{	
						{    
							if (isPlayer _x) then {
							if  (side _x == BLUFOR) then {}
							else {
							_bmoney = _x getVariable ["bmoney",0];
							if ( _bmoney > 0 ) then { //might as well check for zero's
							_hackedPercent = round(HACKED_ACCOUNT_PERCENTAGE*_bmoney);
							_x setVariable [ "bmoney", (_bmoney - _hackedPercent), true ];
							_totalMoney = _totalMoney + _hackedPercent;
						}
							}
								}
						} forEach playableUnits;
					}; 
					
					case OPFOR: 
					{	
						{    
							if (isPlayer _x) then {
							if  (side _x == OPFOR) then {}
							else {
							_bmoney = _x getVariable ["bmoney",0];
							if ( _bmoney > 0 ) then { //might as well check for zero's
							_hackedPercent = round(HACKED_ACCOUNT_PERCENTAGE*_bmoney);
							_x setVariable [ "bmoney", (_bmoney - _hackedPercent), true ];
							_totalMoney = _totalMoney + _hackedPercent;
						}
							}
								}	
						} forEach playableUnits;
					}; 
					
					default
					{
						{    
							if (isPlayer _x) then {
							//check here for group of player to only reduce money of people outside the group
							if  (group _x == group player) then {} 
							else {
							_bmoney = _x getVariable ["bmoney",0];
							if ( _bmoney > 0 ) then { //might as well check for zero's
							_hackedPercent = round(HACKED_ACCOUNT_PERCENTAGE*_bmoney);
							_x setVariable [ "bmoney", (_bmoney - _hackedPercent), true ];
							_totalMoney = _totalMoney + _hackedPercent;
						}
							}
								}
						} forEach playableUnits;
					
					}; 
				};
							

				_totalMoney = _totalMoney + HACKED_EXTRA_FIXMONEY;
				player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _totalMoney, true];
				systemChat format["You have hacked players bank accounts to the value of $%1",_totalMoney];	
				sleep 5;
				
				
			};
					
			ctrlSetText [ 8002, format [ "%1 kb/s", _dlRate ] ];		
			ctrlSetText [ 8004, format [ "%1 kb", _newFile ] ];	

			sleep 1;
		};
		
		T8_varDiagAbort = false;
		
		closeDialog 0;

		_laptop setVariable [ "InUse", false, true];	
	};
};

downloadDataDONE = true;





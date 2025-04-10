//	@file Author: [404] Costlyy
//	@file Name: objectLockStateMachine.sqf
//	@file Version: 1.0
//  @file Date:	21/11/2012
//	@file Description: Locks an object until the player disconnects.
//	@file Args: [object,player,int,lockState(lock = 0 / unlock = 1)]

// Check if mutex lock is active.
if(R3F_LOG_mutex_local_verrou) exitWith {
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
};

private["_locking", "_object", "_lockState", "_lockDuration", "_stringEscapePercent", "_iteration", "_unlockDuration", "_totalDuration","_poiDist", "_poiMarkers", "_checks", "_success","_IsProtected","_IsAllowed"];

_object = _this select 0;
_lockState = _this select 3;

_IsProtected = false;
_IsAllowed = false;

_baseradius = ["A3W_AJBaseRadius", 60] call getPublicVar;
						
_totalDuration = 0;
_stringEscapePercent = "%";

switch (_lockState) do
{
	case 0: // LOCK
	{
		R3F_LOG_mutex_local_verrou = true;
		_totalDuration = 5;
		//_lockDuration = _totalDuration;
		//_iteration = 0;
		// Points of interest
		_poiDist = ["A3W_poiObjLockDistance", 250] call getPublicVar;
		_poiMarkers = allMapMarkers select {markerType _x == "Empty" && {[["GenStore","GunStore","VehStore","Mission_","ForestMission_","LandConvoy_","BaseBlocker_"], _x] call fn_startsWith}};

		if ({(getPosASL player) vectorDistance (ATLtoASL getMarkerPos _x) < _poiDist} count _poiMarkers > 0) exitWith
		{
			playSound "FD_CP_Not_Clear_F";
			[format ["Você não pode travar objetos a %1m de LOJAS ou lugares onde nascem missões!", _poiDist], 5] call mf_notify_client;
			R3F_LOG_mutex_local_verrou = false;
		};
		
		if ( _object iskindof "Land_Device_assembled_F" && 
		{  //use lazy evaluation for performance reasons - see https://community.bistudio.com/wiki/a_%26%26_b
		count (nearestobjects[player,["Land_Device_assembled_F"], (_baseradius * 2)]) != 1   // count =1 -> should only be the one base locker we are using 
		}
		) exitwith {
			playSound "FD_CP_Not_Clear_F";
			[format ["Você não pode colocar um TravaBase a uma distância de %1m de outros TravaBase!", (_baseradius * 2)], 5] call mf_notify_client;
			R3F_LOG_mutex_local_verrou = false;
			
		
		};


		_checks =
		{
			private ["_progress", "_object", "_failed", "_text"];
			_progress = _this select 0;
			_object = _this select 1;
			_failed = true;
			
			switch (true) do
			{
				case (!alive player): { _text = "" };
				case (doCancelAction): { doCancelAction = false; _text = "Travamento cancelado" };
				case (vehicle player != player): { _text = "Ação falhou! Você não pode fazer isso em um veículo!" };
				case (!isNull (_object getVariable ["R3F_LOG_est_transporte_par", objNull])): { _text = "Ação falhou! Alguém moveu o objeto!" };
				case (_object getVariable ["objectLocked", false]): { _text = "Alguém travou antes de você!" };
				case ([(["A3W_AJBaseRadius", 60] call getPublicVar)*2] call fn_checkBaseLock ): { _text = "Você não pode travar objetos perto de uma Base Travada" }; // Re Locker
				default
				{
					_failed = false;
					_text = format ["Travando %1%2 completo", floor (_progress * 100), "%"];
				};
			};

			[_failed, _text];
		};

		_success = [_totalDuration, "AinvPknlMstpSlayWrflDnon_medic", _checks, [_object]] call a3w_actions_start;

		if (_success) then
		{
			_object setVariable ["objectLocked", true, true];
			_object setVariable ["ownerUID", getPlayerUID player, true];
			
			if (_object iskindof "Land_Device_assembled_F") then {
			_object setVariable ["baseName", (format["%1's Base",name player]), true];
			};

			pvar_manualObjectSave = netId _object;
			publicVariableServer "pvar_manualObjectSave";

			["Objeto travado!", 5] call mf_notify_client;
		};

		R3F_LOG_mutex_local_verrou = false;

		/*player switchMove "AinvPknlMstpSlayWrflDnon_medic";

		for "_iteration" from 1 to _lockDuration do
		{
			// If the player is too far or dies, revert state.
			if (player distance _object > 14 || !alive player) exitWith
			{
		        2 cutText ["Object lock interrupted...", "PLAIN DOWN", 1];
				R3F_LOG_mutex_local_verrou = false;
			};

			// Keep the player locked in medic animation for the full duration of the unlock.
			if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
				player switchMove "AinvPknlMstpSlayWrflDnon_medic";
			};

			_lockDuration = _lockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);

			2 cutText [format["Object lock %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;

			// Sleep a little extra to show that lock has completed.
			if (_iteration >= _totalDuration) exitWith
			{
		        sleep 1;
				_object setVariable ["objectLocked", true, true];
				_object setVariable ["ownerUID", getPlayerUID player, true];
				2 cutText ["", "PLAIN DOWN", 1];
				R3F_LOG_mutex_local_verrou = false;
		    };
		};

		player switchMove ""; */ // Redundant reset of animation state to avoid getting locked in animation.
	};
	case 1: // UNLOCK
	{
		R3F_LOG_mutex_local_verrou = true;
		_totalDuration = if (_object getVariable ["ownerUID", ""] == getPlayerUID player) then { 10 } else { 45 }; // Allow owner to unlock quickly
		//_unlockDuration = _totalDuration;
		//_iteration = 0;

		_checks =
		{
			private ["_progress", "_object", "_failed", "_text"];
			_progress = _this select 0;
			_object = _this select 1;
			_failed = true;

			
			switch (true) do
			{
				case (!alive player): {};
				case (doCancelAction): { doCancelAction = false; _text = "Destravamento cancelado" };
				case (vehicle player != player): { _text = "Ação falhou! Você não pode fazer isso em um veículo!" };
				case (!isNull (_object getVariable ["R3F_LOG_est_transporte_par", objNull])): { _text = "Ação falhou! Alguém moveu o objeto!" };
				case !(_object getVariable ["objectLocked", false]): { _text = "Alguém travou antes de você!" };
				case ([(["A3W_AJBaseRadius", 60] call getPublicVar)*2] call fn_checkBaseLock): { _text = "Você não pode travar objetos perto de uma Base Travada" }; 
				default
				{
					_failed = false;
					_text = format ["Destravamento %1%2 completo", floor (_progress * 100), "%"];
				};
			};

			[_failed, _text];
		};

		_success = [_totalDuration, "AinvPknlMstpSlayWrflDnon_medic", _checks, [_object]] call a3w_actions_start;

		if (_success) then
		{
			_object setVariable ["objectLocked", false, true];
			_object setVariable ["ownerUID", nil, true];
			_object setVariable ["baseSaving_hoursAlive", nil, true];
			_object setVariable ["baseSaving_spawningTime", nil, true];
			_object setVariable ["lockDown", nil, true];

			pvar_manualObjectSave = netId _object;
			publicVariableServer "pvar_manualObjectSave";

			["Objeto destravado!", 5] call mf_notify_client;
		};

		R3F_LOG_mutex_local_verrou = false;

		/*for "_iteration" from 1 to _unlockDuration do
		{
			// If the player is too far or dies, revert state.
			if (player distance _object > 5 || !alive player) exitWith
			{
		        2 cutText ["Object unlock interrupted...", "PLAIN DOWN", 1];
				R3F_LOG_mutex_local_verrou = false;
			};

			// Keep the player locked in medic animation for the full duration of the unlock.
			if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then {
				player switchMove "AinvPknlMstpSlayWrflDnon_medic";
			};

			_unlockDuration = _unlockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);

			2 cutText [format["Object unlock %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;

			// Sleep a little extra to show that lock has completed
			if (_iteration >= _totalDuration) exitWith
			{
		        sleep 1;
				_object setVariable ["objectLocked", false, true];
				_object setVariable ["ownerUID", nil, true];
				_object setVariable ["baseSaving_hoursAlive", nil, true];
				_object setVariable ["baseSaving_spawningTime", nil, true];
				2 cutText ["", "PLAIN DOWN", 1];
				R3F_LOG_mutex_local_verrou = false;
		    };
		};

		player switchMove ""; */ // Redundant reset of animation state to avoid getting locked in animation.
	};
	default // This should not happen...
	{
		diag_log format["WASTELAND DEBUG: Algum erro ocorreu no LockStateMachine.sqf. _lockState foi desconhecido. _lockState actual: %1", _lockState];
	};
};

if (R3F_LOG_mutex_local_verrou) then {
	R3F_LOG_mutex_local_verrou = false;
	diag_log format["WASTELAND DEBUG: Algum erro ocorreu no LockStateMachine.sqf. Mutex lock não foi reiniciado. Mutex lock estado atual: %1", R3F_LOG_mutex_local_verrou];
};

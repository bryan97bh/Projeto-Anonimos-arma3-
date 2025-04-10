// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_inGameUIActionEvent.sqf
//	@file Author: AgentRev

params ["_target", "_unit", "", "_action", "","", "_showWindow", "","", "_menuOpen"];
private _handled = false;

if (_unit == player && (_showWindow || _menuOpen)) then
{
	switch (true) do
	{
		case (_handled): {};

		case (_action == "UseMagazine" || _action == "UseContainerMagazine"): // placed explosive
		{
			_minDist = ["A3W_remoteBombStoreRadius", 100] call getPublicVar;
			if (_minDist <= 0) exitWith {};

			_nearbyStores = entities "CAManBase" select {_x getVariable ["storeNPC_setupComplete", false] && {player distance _x < _minDist}};

			if !(_nearbyStores isEqualTo []) exitWith
			{
				playSound "FD_CP_Not_Clear_F";
				[format ["Você não tem permissão para colocar explosivos a menos de %1m da Loja.", _minDist], 5] call mf_notify_client;
				_handled = true;
			};

			_nearbyMissions = allMapMarkers select {markerType _x == "Empty" && {[["Mission_","ForestMission_","LandConvoy_"], _x] call fn_startsWith && {player distance markerPos _x < _minDist}}};

			if !(_nearbyMissions isEqualTo []) exitWith
			{
				playSound "FD_CP_Not_Clear_F";
				[format ["Você não tem permissão para colocar explosivos a menos de %1m de locais onde nascem missões.", _minDist], 5] call mf_notify_client;
				_handled = true;
			};

			_nearbyParking = allMapMarkers select {markerType _x == "Empty" && {["Parking", _x] call fn_startsWith && {player distance markerPos _x < _minDist}}};

			if !(_nearbyParking isEqualTo []) exitWith
			{
				playSound "FD_CP_Not_Clear_F";
				[format ["Você não tem permissão para colocar explosivos a menos de %1m de uma garagem virtual.", _minDist], 5] call mf_notify_client;
				_handled = true;
			};

			_nearbyStorage = nearestObjects [player, ["Land_PaperBox_open_full_F", "Land_Pallet_MilBoxes_F", "Land_PaperBox_open_empty_F", "Land_PaperBox_closed_F"], _minDist] select {_x getVariable ["is_storage", false]};

			if !(_nearbyStorage isEqualTo []) exitWith
			{
				playSound "FD_CP_Not_Clear_F";
				[format ["Você não tem permissão para colocar explosivos a menos de %1m de um armário virtual.", _minDist], 5] call mf_notify_client;
				_handled = true;
			};
		};

		case (_action == "DisAssemble" && {unitIsUAV _target && !((_target getVariable ["ownerUID",""]) in ["", getPlayerUID player])}):
		{
			playSound "FD_CP_Not_Clear_F";
			["Você não tem permissão para desmontar drones de outros jogadores.", 5] call mf_notify_client;
			_handled = true;
		};

		case (_action == "ManualFire"): // use UAV AI to re-align attack heli turret with pilot crosshair when manual fire is enabled with no gunner (thx KK xoxoxo)
		{
			private _veh = vehicle player;

			if ({_veh isKindOf _x} count ["Heli_Attack_01_base_F","Heli_Attack_02_base_F","VTOL_02_base_F"] > 0 && isNull gunner _veh) then
			{
				private _class = format ["%1_UAV_AI", ["B","O","I"] select (([BLUFOR,OPFOR,INDEPENDENT] find playerSide) max 0)];
				private _bob = createAgent [_class, _veh, [], 0, "NONE"];

				_bob allowDamage false;
				_bob setVariable ["A3W_driverAssistOwner", player, true];
				_bob setName ["","",""];
				[_bob, ["","",""]] remoteExec ["A3W_fnc_setName"];
				_bob moveInGunner _veh;

				private _turretCfg = ([_veh, configNull] call BIS_fnc_getTurrets) param [1, configNull];
				private _rotH = getText (_turretCfg >> "animationSourceBody");
				private _rotV = getText (_turretCfg >> "animationSourceGun");

				[_veh, _bob, _rotH, _rotV] spawn
				{
					params ["_veh", "_bob", "_rotH", "_rotV"];
					_time = time;
					waitUntil {_bob doWatch objNull; (abs (_veh animationSourcePhase _rotH) < 0.001 && abs (_veh animationSourcePhase _rotV) < 0.001) || time - _time > 10};
					deleteVehicle _bob;
				};
			};
		};

		case (_target isKindOf "UGV_02_Base_F" && _action == "MoveToTurret"): // Block glitched "To Gunner's seat" action on Demining UGV
		{
			_handled = true;
		};

		case (_action select [0,5] == "GetIn"): // Speed up get in vehicle animation since player unit appears idle for other players
		{
			0 spawn
			{
				scopeName "getInCheck";
				_time = time;

				waitUntil
				{
					if ((toLower animationState player) find "getin" != -1) exitWith
					{
						player setAnimSpeedCoef 2;
						true
					};

					if (time - _time >= 3) then
					{
						breakOut "getInCheck";
					};

					false
				};

				_time = diag_tickTime;

				waitUntil {(toLower animationState player) find "getin" == -1 || diag_tickTime - _time >= 1};

				player setAnimSpeedCoef 1;
			};
		};
	};
};

if (!_handled && !isNil "A3W_fnc_stickyCharges_actionEvent") then
{
	_handled = _this call A3W_fnc_stickyCharges_actionEvent;
};

_handled

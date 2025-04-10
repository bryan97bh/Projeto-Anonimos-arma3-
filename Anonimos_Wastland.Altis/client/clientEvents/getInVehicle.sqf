// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: getInVehicle.sqf
//	@file Author: AgentRev

scopeName "getInVehicle";
params [["_veh",objNull,[objNull]], ["_uavConnect",false,[false]]];

player setAnimSpeedCoef 1; // Reset fast anim speed set in fn_inGameUIActionEvent.sqf
private _driver = [player, driver _veh] select _uavConnect;

/*if (isNil {_veh getVariable "A3W_hitPointSelections"}) then
{
	{
		_veh setVariable ["A3W_hitPoint_" + getText (_x >> "name"), configName _x, true];
	} forEach ((typeOf _veh) call getHitPoints);

	_veh setVariable ["A3W_hitPointSelections", true, true];
};*/

if (isNil {_veh getVariable "A3W_handleDamageEH"}) then
{
	_veh setVariable ["A3W_handleDamageEH", _veh addEventHandler ["HandleDamage", vehicleHandleDamage]];
};

if (isNil {_veh getVariable "A3W_dammagedEH"}) then
{
	_veh setVariable ["A3W_dammagedEH", _veh addEventHandler ["Dammaged", vehicleDammagedEvent]];
};

if (!_uavConnect) then
{
		// Eject from vehicle if it is already used by enemies
		{
			if (isPlayer _x && alive _x && !([_x, player] call A3W_fnc_isFriendly)) exitWith 
			{
				moveOut player;
				["Você não pode entrar em veículos sendo usados por inimigos.", 5] call mf_notify_client;

				// ejection bug workaround
				if (!alive player || lifeState player == "INCAPACITATED") then
				{
					player setPos (player modelToWorldVisual [0,0,0]);
				};

				breakOut "getInVehicle";
			};
		} forEach crew _veh;
};

if (isNil {_veh getVariable "A3W_engineEH"}) then
{
	_veh setVariable ["A3W_engineEH", _veh addEventHandler ["Engine", vehicleEngineEvent]];
};

// Missile alarm to all radarless air vehicles e.g. MH-9, Caesar BTT, etc.
if (_veh isKindOf "Air" && {isNil {_veh getVariable "A3W_incomingMissileEH"} && round getNumber (configFile >> "CfgVehicles" >> typeOf _veh >> "incomingMissileDetectionSystem") < 1}) then

// MissileAlarm for Military Hummbingbird (armed and unarmed)
if (isNil {_veh getVariable "A3W_incomingMissileEH"} && {_veh isKindOf _x} count ["Heli_Light_01_armed_base_F", "B_Heli_Light_01_F"] > 0) then
{
	_veh setVariable ["A3W_incomingMissileEH", _veh addEventHandler ["IncomingMissile", { if (vehicle player == _this select 0) then { playSound "MissileAlarm" } }]];
};

if (_veh isKindOf "Offroad_01_repair_base_F" && isNil {_veh getVariable "A3W_serviceBeaconActions"}) then
{
	_veh setVariable ["A3W_serviceBeaconActions",
	[
		_veh addAction [localize "STR_A3_CfgVehicles_beacons_on", { (_this select 0) animateSource ["Beacons", 1, true] }, [], 1.5, false, true, "", "driver _target == _this && _target animationSourcePhase 'Beacons' < 1"],
		_veh addAction [localize "STR_A3_CfgVehicles_beacons_off", { (_this select 0) animateSource ["Beacons", 0, true] }, [], 1.5, false, true, "", "driver _target == _this && _target animationSourcePhase 'Beacons' >= 1"]
	]];
};

if (unitIsUAV _veh) then
{
	if (_veh isKindOf "LandVehicle" && isNil {_veh getVariable "A3W_flipDroneAction"}) then
	{
		_veh setVariable ["A3W_flipDroneAction", [_veh, ["<img image='addons\vactions\icons\flip.paa'/> Virar drone", { [_this select 0, surfaceNormal getPosWorld (_this select 0)] call A3W_fnc_unflip }, [], 10, false, false, "", "cameraOn == _target && (uavControl _target) select 0 == player && [_target] call va_unflip_action_available"]] call fn_addManagedAction];
	};

	if (["A3W_savingMethod", "profile"] call getPublicVar == "extdb" && isNil {_veh getVariable "A3W_saveDroneActions"}) then
	{
		private _saveActions = [];

		if (_veh isKindOf "AllVehicles" && !(_veh isKindOf "StaticWeapon")) then
		{
			if (["A3W_vehicleSaving"] call isConfigOn) then
			{
				_saveActions append
				[
					[_veh, ["<img image='client\icons\save.paa'/> Habilitar salvamento de Drone", fn_forceSaveVehicle, [], -9.5, false, true, "", "cameraOn == _target && _target call canForceSaveVehicle && (_target getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction,
					[_veh, ["<img image='client\icons\save.paa'/> Forçar salvamento de Drone", fn_forceSaveVehicle, [], -9.5, false, true, "", "cameraOn == _target && _target call canForceSaveVehicle && !(_target getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction
				];
			};
		}
		else
		{
			if (["A3W_staticWeaponSaving"] call isConfigOn) then
			{
				_saveActions append
				[
					[_veh, ["<img image='client\icons\save.paa'/> Habilitar salvamento de Drone", fn_forceSaveObject, [], -9.5, false, true, "", "cameraOn == _target && _target call canForceSaveStaticWeapon && (_target getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction,
					[_veh, ["<img image='client\icons\save.paa'/> Forçar salvamento de Drone", fn_forceSaveObject, [], -9.5, false, true, "", "cameraOn == _target && _target call canForceSaveStaticWeapon && !(_target getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction
				];
			};
		};

		_veh setVariable ["A3W_saveDroneActions", _saveActions];
	};
};

if (_veh getVariable ["was_parked", false]) then
{
	if (_veh isKindOf "VTOL_Base_F") then
	{
		_driver action ["VTOLVectoring", _veh]; // vertical takeoff mode
		_driver action ["VectoringUp", _veh];
		_driver action ["VectoringUp", _veh];
	};

	_veh setVariable ["was_parked", nil];
};

if (_veh isKindOf "Plane" && !(_veh isKindOf "VTOL_Base_F")) then
{
	_driver action ["FlapsDown", _veh]; // decreases required takeoff speed
	_driver action ["FlapsDown", _veh];
};

_oldVeh = objectFromNetId (player getVariable ["lastVehicleRidden", ""]);

// reset retarded ejection seat crap
if (_veh isKindOf "Ejection_Seat_Base_F" && _oldVeh isKindOf "Plane") then
{
	_oldFuel = fuel _oldVeh;

	[_veh, _oldVeh, _oldFuel] spawn 
	{
		params ["_seat", "_plane", "_oldFuel"];

		_time = time;
		_locked = false;

		waitUntil {_locked = (locked _plane == 2); _locked || time - _time > 30}; // "locked _plane == 2" based on "_plane lock 2;" defined in BIS_fnc_PlaneEjection

		if (!alive _plane || !local _plane || !_locked) exitWith {};

		_plane setVariable ["bis_ejected", nil, true];
		{ _plane animate [_x, 0, true] } forEach ["canopy_hide", "ejection_seat_motion", "ejection_seat_hide"];
		_plane setFuel _oldFuel;
		[_plane, 1] call A3W_fnc_setLockState; // Unlock

		_time = time;
		_out = false;

		waitUntil {_out = (vehicle player != _seat); _out || time - _time > 30};

		if (!local _seat || !_out) exitWith {};

		deleteVehicle _seat;
	};
};

if ({_veh isKindOf _x} count ["ParachuteBase","Ejection_Seat_Base_F"] == 0) then
{
	player setVariable ["lastVehicleRidden", netId _veh];
};

if (!_uavConnect) then
{
	// FAR injured unit vehicle loading
	[_veh] call FAR_Drag_Load_Vehicle;
};

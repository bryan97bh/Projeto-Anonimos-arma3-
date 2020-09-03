// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: spawnStoreObject.sqf
//	@file Author: AgentRev
//	@file Created: 11/10/2013 22:17
//	@file Args:

if (!isServer) exitWith {};

scopeName "spawnStoreObject";
private ["_isGenStore", "_isGunStore", "_isVehStore", "_timeoutKey", "_objectID", "_playerSide", "_objectsArray", "_results", "_itemEntry", "_itemPrice", "_safePos", "_object"];

params [["_player",objNull,[objNull]], ["_itemEntrySent",[],[[]]], ["_npcName","",[""]], ["_key","",[""]]];

_itemEntrySent params [["_class","",[""]]];

_isGenStore = ["GenStore", _npcName] call fn_startsWith;
_isGunStore = ["GunStore", _npcName] call fn_startsWith;
_isVehStore = ["VehStore", _npcName] call fn_startsWith;

private _storeNPC = missionNamespace getVariable [_npcName, objNull];
private _marker = _npcName;

if (_key != "" && _player isKindOf "Man" && {_isGenStore || _isGunStore || _isVehStore}) then
{
	_timeoutKey = _key + "_timeout";
	_objectID = "";
	private _seaSpawn = false;
	private _playerGroup = group _player;
	_playerSide = side _playerGroup;

	if (_isGenStore || _isGunStore) then
	{
		_npcName = _npcName + "_objSpawn";

		switch (true) do
		{
			case _isGenStore: { _objectsArray = genObjectsArray };
			case _isGunStore: { _objectsArray = staticGunsArray };
		};

		if (!isNil "_objectsArray") then
		{
			_results = (call _objectsArray) select {_x select [1,999] isEqualTo _itemEntrySent};

			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
				_marker = _marker + "_objSpawn";
			};
		};
	};

	if (_isVehStore) then
	{
		// LAND VEHICLES
		{
			_results = (call _x) select {_x select [1,999] isEqualTo _itemEntrySent};

			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
					_marker = _marker + "_landSpawn";
				};
		} forEach [landArray, armoredArray, tanksArray];

		// SEA VEHICLES
		if (isNil "_itemEntry") then
		{
			_results = (call boatsArray) select {_x select [1,999] isEqualTo _itemEntrySent};

			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
				_marker = _marker + (["_seaSpawn","_landSpawn"] select (markerType (_marker + "_seaSpawn") isEqualTo "")); // allow boat on landSpawn if no seaSpawn
				_seaSpawn = true;
			};
		};

		// HELICOPTERS
		if (isNil "_itemEntry") then
		{
			_results = (call helicoptersArray) select {_x select [1,999] isEqualTo _itemEntrySent};

			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
					_marker = _marker + "_heliSpawn";
				};
		};

		// AIRPLANES
		if (isNil "_itemEntry") then
		{
			_results = (call planesArray) select {_x select [1,999] isEqualTo _itemEntrySent};

			if (count _results > 0) then
			{
				_itemEntry = _results select 0;
					_marker = _marker + "_planeSpawn";
				};
		};
	};

	if (!isNil "_itemEntry" && markerShape _marker != "") then
	{
		_itemPrice = _itemEntry select 2;
		_skipSave = "SKIPSAVE" in (_itemEntry select [3,999]);

		/*if (_class isKindOf "Box_NATO_Ammo_F") then
		{
			switch (side _player) do
			{
				case OPFOR:       { _class = "Box_East_Ammo_F" };
				case INDEPENDENT: { _class = "Box_IND_Ammo_F" };
			};
		};*/

		if (_player getVariable ["cmoney", 0] >= _itemPrice) then
		{
			private _markerPos = markerPos _marker;
			private _npcPos = getPosASL _storeNPC;
			private _canFloat = (round getNumber (configFile >> "CfgVehicles" >> _class >> "canFloat") > 0);
			private _waterNonBoat = false;
			private "_spawnPosAGL";

			// non-boat spawn over water (e.g. aircraft carrier)
			if (!isNull _storeNPC && surfaceIsWater _npcPos && !_seaSpawn) then
			{
				_markerPos set [2, _npcPos select 2];
				_spawnPosAGL = ASLtoAGL _markerPos;
				_safePos = if (_canFloat) then { _spawnPosAGL } else { ASLtoATL _markerPos };
				_waterNonBoat = true;
			}
			else // normal spawn
			{
				_safePos = _markerPos findEmptyPosition [0, 50, [_class, "B_Truck_01_transport_F"] select (!surfaceIsWater _markerPos && _seaSpawn)]; // use HEMTT in findEmptyPosition for boats on lands 
				if (count _safePos == 0) then { _safePos = _markerPos };
				_spawnPosAGL = _safePos;
				if (_seaSpawn) then { _safePos vectorAdd [0,0,0.05] };
			};

			// delete wrecks near spawn
			{
				if (!alive _x) then
				{
					deleteVehicle _x;
				};
			} forEach nearestObjects [_spawnPosAGL, ["LandVehicle","Air","Ship"], 25 max sizeOf _class];

			if (_player getVariable [_timeoutKey, true]) then { breakOut "spawnStoreObject" }; // Timeout

			_object = createVehicle [_class, _safePos, [], 0, "NONE"];

			if (_waterNonBoat) then
			{
				private _posSurf = getPos _object;
				private _posASL = getPosASL _object;

				if (_posSurf select 2 < 0) then
				{
					_object setPosASL [_posSurf select 0, _posSurf select 1, (_posASL select 2) - (_posSurf select 2) + 0.05];
				};
			};

			if (_player getVariable [_timeoutKey, true]) then // Timeout
			{
				deleteVehicle _object;
				breakOut "spawnStoreObject";
			};

			_objectID = netId _object;
			_object setVariable ["A3W_purchasedStoreObject", true];
			_object setVariable ["ownerUID", getPlayerUID _player, true];
			_object setVariable ["ownerName", name _player, true];
			_object setVariable ["R3F_LOG_Disabled", false, true];
			if (isPlayer _player) then { _object setPlateNumber name _player };

			private _variant = (_itemEntry select {_x isEqualType "" && {_x select [0,8] == "variant_"}}) param [0,""];

			if (_variant != "") then
			{
				_object setVariable ["A3W_vehicleVariant", _variant select [8], true];
			};

			private _isUAV = (round getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") > 0);

			if (_isUAV) then
			{
				createVehicleCrew _object;

				//assign AI to the vehicle so it can actually be used
				[_object, _playerSide, _playerGroup] spawn
				{
					params ["_uav", "_playerSide", "_playerGroup"];

					_grp = [_uav, _playerSide, true] call fn_createCrewUAV;

					if (isNull (_uav getVariable ["ownerGroupUAV", grpNull])) then
					{
						_uav setVariable ["ownerGroupUAV", _playerGroup, true]; // not currently used
					};
				};
			};

			if (_skipSave) then
			{
				_object setVariable ["A3W_skipAutoSave", true, true];
			};

			if !(_player getVariable [_timeoutKey, true]) then
			{
				[_player, -_itemPrice] call A3W_fnc_setCMoney;
				_player setVariable [_key, _objectID, true];
			}
			else // Timeout
			{
				if (!isNil "_object") then { deleteVehicle _object };
				breakOut "spawnStoreObject";
			};

			if (_object isKindOf "AllVehicles" && !(_object isKindOf "StaticWeapon")) then
			{
				if (!surfaceIsWater _safePos) then
				{
				_object setPosATL [_safePos select 0, _safePos select 1, 0.05];
				};

				_object setVelocity [0,0,0.01];
				// _object spawn cleanVehicleWreck;
				_object setVariable ["A3W_purchasedVehicle", true, true];
				_object setVariable ["R3F_LOG_Disabled", false, true];

				if (["A3W_vehicleLocking"] call isConfigOn && !_isUAV) then
				{
					[_object, 2] call A3W_fnc_setLockState; // Lock
                };
			};

			_object setDir (if (_object isKindOf "Plane") then { markerDir _marker } else { random 360 });

            //WHITELIST: AllowDamage FALSE for all Crates, Buildings, Walls, Shelters, Lamps(unable to shoot out as a player :/ But better as fallen lamps)... Not for cars, and other small things like a drill, monitor...
			_isDamageable = !({_object isKindOf _x} count ["Building", "Constructions_base_F", "TargetBase", "ReammoBox_F"] > 0);
            //BLACKLIST: AllowDamage TRUE for towers, generator(Base Locker), Statics(Not necessarry, as not part of "Building")... Not for Tent(Spawn Beacon), as this will not spawn, just an item in the inventory
            if ({_object isKindOf _x} count ["Cargo_Patrol_base_F", "Cargo_Tower_base_F", "Land_Device_assembled_F"] > 0) then 
            {
                _isDamageable = true;
            };

			[_object] call vehicleSetup;
			_object allowDamage _isDamageable;
			_object setVariable ["allowDamage", _isDamageable, true];
            
            //Set Simulation Global to FALSE for all Crates, Buildings, Walls, Shelters, Lamps... NOT for Pop-Up Targets!
            // if ({_object isKindOf _x} count ["Building", "Constructions_base_F", "ReammoBox_F"] > 0) then 
            // {
                // [_object, false] call fn_enableSimulationGlobal;
            // };
            //REMOVED DUE TO PROBLEMS WITH NETWORK SYNC BETWEEN CLIENTS :/
            
			clearBackpackCargoGlobal _object;

			// this switch is only there at aj mission - removed in vanilla a3w
			switch (true) do
			{				
				case (_object isKindOf "FlagPole_F"):
				{
					_object setFlagTexture "client\images\flagTextures\AJ_Logo_2016_Staynex_1024x512.jpg";
				};
                
                case (_object isKindOf "Land_Sacks_goods_F"):
				{
					_object setVariable ["food",50, true];
				};
				
                case (_object isKindOf "Land_BarrelWater_F"):
				{
					_object setVariable ["water",50, true];
				};
                
				// Add default password to baselocker, safe and doorlocks.
				case ({_object isKindOf _x} count ["Land_TripodScreen_01_dual_v1_F", "Land_Device_assembled_F", "Box_GEN_Equip_F"] > 0):
				{
					_object setVariable ["password", "0000", true];
				};
                
				// Give diving gear to RHIB, Speedboat, and SDV - Default in A3W but in AJ Switch-Case Statement implemented
				case ({_object isKindOf _x} count ["Boat_Transport_02_base_F","Boat_Armed_01_base_F","SDV_01_base_F"] > 0):
				{
					switch (side _player) do
					{
						case BLUFOR:
						{
							_object addItemCargoGlobal ["U_B_Wetsuit", 1];
							_object addItemCargoGlobal ["V_RebreatherB", 1];
						};
						case OPFOR:
						{
							_object addItemCargoGlobal ["U_O_Wetsuit", 1];
							_object addItemCargoGlobal ["V_RebreatherIR", 1];
						};
						default
						{
							_object addItemCargoGlobal ["U_I_Wetsuit", 1];
							_object addItemCargoGlobal ["V_RebreatherIA", 1];
						};
					};
					_object addItemCargoGlobal ["G_Diving", 1];
					_object addWeaponCargoGlobal ["arifle_SDAR_F", 1];
					_object addMagazineCargoGlobal ["20Rnd_556x45_UW_mag", 4];
					_object addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 2];
				};	
			};

			if (!_skipSave) then
			{
			if (_object getVariable ["A3W_purchasedVehicle", false] && !isNil "fn_manualVehicleSave") then
			{
				_object call fn_manualVehicleSave;
			};
			};

			if (_object isKindOf "AllVehicles") then
			{
				if (isNull group _object) then
				{
					_object setOwner owner _player; // tentative workaround for exploding vehicles
				}
				else
				{
					(group _object) setGroupOwner owner _player;
				};
			};
		};
	};
};

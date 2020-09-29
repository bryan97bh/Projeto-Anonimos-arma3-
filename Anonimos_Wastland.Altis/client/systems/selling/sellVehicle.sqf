// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: sellVehicle.sqf
//	@file Author: AgentRev
//  @file edited: CRE4MPIE
//  @credits to: Cael817, lodac, Wiking

#include "sellIncludesStart.sqf";

storeSellingHandle = _this spawn
{
	#define CHOPSHOP_PRICE_RELATIONSHIP 5
	#define VEHICLE_MAX_SELLING_DISTANCE 50

	_storeNPC = _this select 0;
	_vehicle = objectFromNetId (player getVariable ["lastVehicleRidden", ""]);

	if (isNull _vehicle) exitWith
	{
		playSound "FD_CP_Not_Clear_F";
		["Seu veículo anterior não foi encontrado.", "Error"] call  BIS_fnc_guiMessage;
	};

	_type = typeOf _vehicle;
	_objName = getText (configFile >> "CfgVehicles" >> _type >> "displayName");

	_checkDamage =
	{
		if (damage _vehicle > 0.99) then
		{
			playSound "FD_CP_Not_Clear_F";
			[format ['"%1" está muito danificado para ser vendido.', _objName], "Error"] call  BIS_fnc_guiMessage;
			false
		} else { true };
	};

	_checkValidDistance =
	{
		if (_vehicle distance _storeNPC > VEHICLE_MAX_SELLING_DISTANCE) then
		{
			playSound "FD_CP_Not_Clear_F";
			[format ['"%1" está mais longe do que %2m da loja.', _objName, VEHICLE_MAX_SELLING_DISTANCE], "Error"] call  BIS_fnc_guiMessage;
			false
		} else { true };
	};

	_checkValidOwnership =
	{
		if (!local _vehicle) then
		{
			playSound "FD_CP_Not_Clear_F";
			[format ['Você não é o proprietário de "%1", tente entrar no banco do motorista.', _objName], "Error"] call  BIS_fnc_guiMessage;
			false
		} else { true };
	};

	if (!call _checkDamage) exitWith {};
	if (!call _checkValidDistance) exitWith {};
	if (!call _checkValidOwnership) exitWith {};

	private _variant = _vehicle getVariable ["A3W_vehicleVariant", ""];
	if (_variant != "") then { _variant = "variant_" + _variant };

	_price = 1000;

	{
		if (_type == _x select 1 && (_variant == "" || {_variant in _x})) exitWith
		{
			_price = (ceil (((_x select 2) / CHOPSHOP_PRICE_RELATIONSHIP) / 5)) * 5;
		};
	} forEach (call allVehStoreVehicles + call staticGunsArray);

	if (!isNil "_price") then
	{
		// Add total sell value to confirm message
		_confirmMsg = format ["A venda do %1 dará a você $%2<br/>", _objName, [_price] call fn_numbersText];

		// Display confirm message
		if ([parseText _confirmMsg, "Confirmar", "Vender", true] call BIS_fnc_guiMessage) then
		{
			if (!call _checkValidDistance) exitWith {};
			if (!call _checkValidOwnership) exitWith {};

			if (_vehicle distance _storeNPC > VEHICLE_MAX_SELLING_DISTANCE) exitWith
			{
				playSound "FD_CP_Not_Clear_F";
				[format ['O %1 já foi vendido!', _objname, VEHICLE_MAX_SELLING_DISTANCE], "Error"] call  BIS_fnc_guiMessage;
			};

			_vehID = _vehicle getVariable "A3W_vehicleID";

			private _attachedObjs = attachedObjects _vehicle;
			
			deleteVehicle _vehicle;

			{ ["detach", _x] call A3W_fnc_towingHelper } forEach _attachedObjs;

			//player setVariable ["cmoney", (player getVariable ["cmoney",0]) + _price, true];
			[player, _price] call A3W_fnc_setCMoney;
			[format ['O %1 já foi vendido!', _objname, VEHICLE_MAX_SELLING_DISTANCE], "Obrigado"] call  BIS_fnc_guiMessage;

			if (["A3W_playerSaving"] call isConfigOn) then
			{
				[] spawn fn_savePlayerData;
			};
			
			//objectsave 
			if (["A3W_vehicleSaving"] call isConfigOn) then
			{
				if !(isNil "_vehID" || isNil "A3W_vehicleIDs") then
				{
				 A3W_vehicleIDs deleteAt (A3W_vehicleIDs find _vehID);
				 };
			};
		};
	}
	else
	{
		hint parseText "<t color='#FFFF00'>Algum erro desconhecido ocorreu.</t><br/>Venda de veículo cancelada.";
		playSound "FD_CP_Not_Clear_F";
	};
};

#include "sellIncludesEnd.sqf";

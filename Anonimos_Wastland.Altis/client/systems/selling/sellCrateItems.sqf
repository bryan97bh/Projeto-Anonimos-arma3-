// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: sellCrateItems.sqf
//	@file Author: AgentRev
//	@file Created: 31/12/2013 22:12

#define CONTAINER_SELL_PRICE 50 // price for the crate itself (do not price higher than "Empty Ammo Crate" from general store)

#include "sellIncludesStart.sqf";

storeSellingHandle = _this spawn
{
	_params = param [3, [], [[]]];
	_storeSellBox = _params param [0, false, [false]];
	_forceSell = _params param [1, false, [false]];
	_deleteObject = _params param [2, false, [false]];

	_crate = if (_storeSellBox) then
	{
		param [0, objNull, [objNull]]
	}
	else
	{
		missionNamespace getVariable ["R3F_LOG_joueur_deplace_objet", objNull]
	};

	_sellValue = 0;
	_originalCargo = CARGO_STRING(_crate);

	// Get all the items
	_allCrateItems = _crate call getSellPriceList;

	_objClass = typeOf _crate;
	_objName = getText (configFile >> "CfgVehicles" >> _objClass >> "displayName");

	// Include crate in item list if it's to be deleted
	if (_deleteObject) then
	{
		_allCrateItems = [[_objClass, 1, _objName, CONTAINER_SELL_PRICE]] + _allCrateItems;
	};

	if (count _allCrateItems == 0) exitWith
	{
		if (!_forceSell) then
		{
			playSound "FD_CP_Not_Clear_F";
			[format ['"%1" não contém itens válidos para vender.', _objName], "Error"] call BIS_fnc_guiMessage;
		};
	};

	// Calculate total value
	{
		if (count _x > 3) then
		{
			_sellValue = _sellValue + (_x select 3);
		};
	} forEach _allCrateItems;

	if (_forceSell) then
	{
		clearBackpackCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearItemCargoGlobal _crate;

		//player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _sellValue, true];
		[player, _sellValue] call A3W_fnc_setCMoney;
		hint format [format ['O inventário de "%1" foi vendido por $%2', _objName, _sellValue]];
		playSound "FD_Finish_F";
	}
	else
	{
		// Add total sell value to confirm message
		_confirmMsg = format ["Você irá receber $%1 por:<br/>", [_sellValue] call fn_numbersText];

		// Add item quantities and names to confirm message
		{
			_item = _x select 0;
			_itemQty = _x select 1;

			if (_itemQty > 0 && {count _x > 2}) then
			{
				_itemName = _x select 2;
				_confirmMsg = _confirmMsg + format ["<br/>%1 x  %2%3", _itemQty, _itemName, if (PRICE_DEBUGGING) then { format [" ($%1)", [_x select 3] call fn_numbersText] } else { "" }];
			};
		} forEach _allCrateItems;

		// Display confirmation
		if ([parseText _confirmMsg, "Confirmar", "Vender", true] call BIS_fnc_guiMessage) then
		{
			// Check if somebody else manipulated the cargo since the start
			if (CARGO_STRING(_crate) == _originalCargo) then
			{
				// Have to spawn clearing commands due to mysterious game crash...
				_clearing = _crate spawn
				{
					clearBackpackCargoGlobal _this;
					clearMagazineCargoGlobal _this;
					clearWeaponCargoGlobal _this;
					clearItemCargoGlobal _this;
				};

				{
					_x params ["", "_item"];
					_crate setVariable [_item, nil, true];
				} forEach call customPlayerItems;

				waitUntil {scriptDone _clearing};

				if (_deleteObject) then
				{
					if (_crate getVariable ["R3F_LOG_est_deplace_par", objNull] == player) then
					{
						[_crate, player, -1, false] execVM "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\relacher.sqf";
						waitUntil {_crate getVariable ["R3F_LOG_est_deplace_par", objNull] != player};
					};

					if (isNull (_crate getVariable ["R3F_LOG_est_deplace_par", objNull])) then
					{
						deleteVehicle _crate;
					};
				};

				//player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _sellValue, true];
				[player, _sellValue] call A3W_fnc_setCMoney;

				_hintMsg = if (_deleteObject) then { 'Você vendeu "%1" por $%2' } else { 'Você vendeu o inventário de "%1" por $%2' };
				hint format [_hintMsg, _objName, _sellValue];
				playSound "FD_Finish_F";
			}
			else
			{
				playSound "FD_CP_Not_Clear_F";
				[format ['O conteúdo de  "%1" foi alterado, por favor, reincie o processo de venda.', _objName], "Error"] call BIS_fnc_guiMessage;
			};
		};
	};
};

#include "sellIncludesEnd.sqf";

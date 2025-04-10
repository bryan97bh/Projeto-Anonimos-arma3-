// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getItemInfo.sqf
//	@file Author: AgentRev
//	@file Created: 12/10/2013 22:45
//	@file Args:

#define CEIL_PRICE(PRICE) (ceil ((PRICE) / 5) * 5)

private ["_itemText", "_itemData", "_price", "_description", "_showAmmo", "_itemEntry", "_parentCfg", "_itemType", "_weapon"];

_itemText = _this select 0;
_itemData = _this select 1;

_parentCfg = "";
_price = 0;
_description = "";
_showAmmo = false;

if (isNil "_itemEntry") then
{
	{
		if (_itemData == _x select 1) exitWith
		{
			_itemEntry = _x;
			_parentCfg = "CfgWeapons";
			_showAmmo = true;
		}
	} forEach (call allGunStoreFirearms);
};

if (isNil "_itemEntry") then
{
	{
		if (_itemData == _x select 1) exitWith
		{
			_itemEntry = _x;
			_parentCfg = "CfgMagazines";
		};
	} forEach (call throwputArray);
};

if (isNil "_itemEntry") then
{
	{
		if (!isNil "_itemEntry") exitWith {};

		{
			if (_itemData == _x select 1) exitWith
			{
				_itemEntry = _x;
				_itemType = _x select 3;

				switch (true) do
				{
					case (_itemType == "mag"):                            { _parentCfg = "CfgMagazines" };
					case (_itemType == "backpack"):                       { _parentCfg = "CfgVehicles" };
					// case (["crate", _itemType] call fn_findString != -1): { _parentCfg = "CfgVehicles" };
					default                                               { _parentCfg = "CfgWeapons" };
				};
			};
		} forEach (call _x)
	} forEach [accessoriesArray, genItemArray];
};

if (isNil "_itemEntry") then
{
	{
		if (!isNil "_itemEntry") exitWith {};

		{
			if (_itemData == _x select 1) exitWith
			{
				_itemEntry = _x;
				_parentCfg = "CfgWeapons";
			};
		} forEach (call _x);
	} forEach [headArray, goggArray, uniformArray, vestArray];
};

if (isNil "_itemEntry") then
{
	{
		if (!isNil "_itemEntry") exitWith {};

		{
			if (_itemData == _x select 1) exitWith
			{
				_itemEntry = _x;
				_parentCfg = "CfgVehicles";
			};
		} forEach (call _x);
	} forEach [backpackArray, genObjectsArray, staticGunsArray];
};

if (!isNil "_itemEntry") then
{
	_itemType = _itemEntry select 1;
	_price = _itemEntry select 2;
	_weapon = configFile >> _parentCfg >> _itemType;

	// Set custom name and/or description
	if (count _itemEntry > 3) then
	{
		switch (_itemEntry select 3) do
		{
			case "backpack":
			{
				_weapon = (configFile >> "CfgVehicles" >> _itemType);

				switch (true) do
				{
					case (_itemType isKindOf "B_Parachute"):
					{
						//_name = getText (_weapon >> "displayName");
						_description = "O companheiro perfeito para os futuros pilotos!<br/>Só funciona uma vez.";
					};
					case (_itemType isKindOf "UGV_02_Demining_backpack_base_F"):
					{
						_description = "Robo-espingarda com 24 disparos de calibre 12 e 400 tiros de 5,56mm em sua metralhadora com controle remoto.<br/>Terminal VANT vendido separadamente. Para +18 anos";
					};
					case (_itemType isKindOf "UGV_02_backpack_base_F"):
					{
						_description = "Robô com controle remoto para espionar a esposa do seu vizinho, e também para reconhecimento em zonas de guerra.<br/>Terminal VANT vendido separadamente. Para +18 anos";
					};
					case (["_UAV_06_antimine_backpack_", _itemType] call fn_findString != -1):
					{
						_description = "Hexacóptero de controle remoto para desarmar minas através de cargas explosivas, lançadas dos céus.<br/>Terminal VANT vendido separadamente. Para +18 anos";
					};
					case (_itemType isKindOf "UAV_06_medical_backpack_base_F"):
					{
						_description = "Hexacóptero com controle remoto para reviver e curar seus companheiros de equipe.<br/>Terminal VANT vendido separadamente. Para +18 anos";
					};
					case (_itemType isKindOf "UAV_06_backpack_base_F"):
					{
						_description = "Hexacóptero com controle remoto para espionar seus vizinhos, ou entrega alguma carga dentro dele.<br/>Terminal VANT vendido separadamente. Para +18 anos";
					};
					case (["_UAV_01_backpack_", _itemType] call fn_findString != -1):
					{
						_description = "Quadricóptero Militar com controle remoto para reconhecimento e radar com sensor térmico.<br/>Terminal VANT vendido separadamente. Para +18 anos";
					};
					case (["_Static_Designator_", _itemType] call fn_findString != -1):
					{
						_description = "Um Laser Designador que pode ser controlado remotamente, útil para reconhecimento e marcação de alvos com Laser. Possui Infravermelho.<br/>Terminal VANT vendido separadamente.";
					};
					default
					{
						//_name = _itemText;
						_description = [_itemType, "backpack"] call gearProperties;
					};
				};
			};
			case "uni":
			{
				switch (true) do
				{
					case (["Default Uniform", _itemText] call fn_startsWith):
					{
						//_name = _itemText;
						_description = "Caso você tenha perdido suas roupas";
					};
					case ([["Ghillie","_T_Sniper"], _itemType] call fn_findString != -1):
					{
						//_name = _itemText;
						_description = "Disfarce-se como um monstro do pântano";
					};
					case ([["_Wetsuit","_survival_uniform"], _itemType] call fn_findString != -1):
					{
						//_name = _itemText;
						_description = "Permite nadar mais rápido<br/>Necessário Fuzil SDAR para disparar debaixo d'água";
					};
					case ([["_CTRG_Soldier","_Soldier_Viper"], _itemType] call fn_findString != -1):
					{
						_description = "Roupa com isolamento térmico";
					};
					default
					{
						_description = getText (_weapon >> "descriptionShort");
					};
				};

				if (_description != "") then
				{
					_description = _description + "<br/>";
				};

				_description = _description + ([_itemType, "uniform"] call gearProperties);
			};
			case "vest":
			{
				if (["_Rebreather", _itemType] call fn_findString != -1) then
				{
					_description = "Fornecimento de oxigênio subaquático";
				};

				if (_description != "") then
				{
					_description = _description + "<br/>";
				};

				_description = _description + ([_itemType, "vest"] call gearProperties);

				if (_price < 0) then
				{
					([_itemType] call fn_getItemArmor) params ["_ballArmor", "_explArmor"];
					_price = CEIL_PRICE(([_itemType] call getCapacity) / 2 + _ballArmor*3 + _explArmor*2); // price formula also defined in buyItems.sqf
				};
			};
			case "hat":
			{
				_description = [_itemType, "headgear"] call gearProperties;
			};
			case "gogg":
			{
				_weapon = configFile >> "CfgGlasses" >> _itemType;

				if (_itemType == "G_Diving") then
				{
					_description = "Aumenta a visibilidade subaquática";
				};
				if (["G_Balaclava_TI_", _itemType] call fn_startsWith) then
				{
					_description = "Permite isolamento térmico";
				};
			};
			default
			{
				switch (true) do
				{
					case (["_UavTerminal", _itemType] call fn_findString != -1):
					{
						//_name = getText (_weapon >> "displayName");
						_description = getText (_weapon >> "descriptionShort") + "<br/>Atribuir ao slot GPS. Permite Ver e Controlar todos os Drones do Mapa Online";
					};
				};
			};
		};

		if (_itemType isKindOf "UAV_06_backpack_base_F") then
		{
			if ({_x == "Ti"} count getArray (configFile >> "CfgVehicles" >> _itemType >> "Viewoptics" >> "visionMode") == 0) then
			{
				_description = format ["%1%2%3", _description, ["<br/>",""] select (_description isEqualTo ""), "<t color='#FF8000'>IMAGEM TERMAL BLOQUEADA</t>"];
			};
		};
	};
};

if (isNil "_itemEntry") then
{
	{
		if (_itemData == _x select 1) exitWith
		{
			_itemEntry = _x;
			_description = _x select 2;
			_price = _x select 4;
		};
	} forEach (call customPlayerItems);
};

if (_description == "" && {!isNil "_weapon"} && {isClass _weapon}) then
{
	_description = getText (_weapon >> "descriptionShort");
};

// Return
[_parentCfg, _price, _description, _showAmmo]

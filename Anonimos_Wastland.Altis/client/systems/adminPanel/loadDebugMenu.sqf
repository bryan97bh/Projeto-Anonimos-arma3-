// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: loadDebugMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define debugMenu_option 50003
disableSerialization;

private ["_start","_panelOptions","_debugSelect","_displayDebug"];
_uid = getPlayerUID player;
if (_uid call isAdmin) then
{
	_start = createDialog "DebugMenu";

	_displayDebug = uiNamespace getVariable "DebugMenu";
	_debugSelect = _displayDebug displayCtrl debugMenu_option;

	_panelOptions = ["Accessar Loja de Armas",
					"Accessar Loja Geral",
					"Accessar Loja de Veículos",
					"Accessar Banco",
					"Accessar Respaw",
					"Mostrar FPS do Servidor"
	];

	{
		_debugSelect lbAdd _x;
	} forEach _panelOptions;
};

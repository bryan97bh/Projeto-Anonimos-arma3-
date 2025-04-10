// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright � 2014 	BadVolt 	*
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: password_enter.sqf
//	@file Author: BadVolt
//	@file Description: Entering password and open the doors for duration. Then closes them.

//#define DURATION 10

_object = cursorTarget;

OutputText = nil;
InputText = "";
ClearText = "Entre com Código";

createDialog "AF_Keypad";

waitUntil {!(isNil "OutputText")};

if (OutputText == _object getVariable ["password", ""]) then {
	execVM "addons\BoS\BoS_coownerMenu.sqf";	
	//[format ["Portas abertas por %1 segundos ",DURATION], 5] call mf_notify_client;	
}else{
	["Senha errada!", 5] call mf_notify_client;	
};

OutputText = nil;
// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19

{ [player, _x] call fn_addManagedAction } forEach
[


	//[format ["<t color='#FF00FF'>Abrir paraquedas de emergência (%1)</t>", (actionKeysNamesArray "GetOver") param [0,"<'Step over' keybind>"]], A3W_fnc_openParachute, [], 250, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"],

    ["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancelar Ação</t>", { doCancelAction = true }, [], 200, false, false, "", "mutexScriptInProgress"],

    //CUSTOM Scripts between +200 to -200 (R3F, Lift..., FAR Revive)
    //R3F with "11" to "-5"
	["LIGAR DRONE", "client\actions\reinitializeUAV.sqf", ["Re-Initilize"], 1, false, false, "", "{_x in ['B_UavTerminal','O_UavTerminal','I_UavTerminal']} count assignedItems player > 0 && {cursorTarget iskindof _x} count ['UAV_02_base_F', 'UAV_04_base_F', 'UAV_03_base_F', 'UGV_01_base_F', 'StaticWeapon', 'UAV_05_Base_F'] >0"],
	["DESLIGAR DRONE", "client\actions\disableUAV.sqf", [], 1, false, false, "", "{_x in ['B_UavTerminal','O_UavTerminal','I_UavTerminal']} count assignedItems player > 0 && {cursorTarget iskindof _x} count ['UAV_02_base_F', 'UAV_04_base_F', 'UAV_03_base_F', 'UGV_01_base_F', 'StaticWeapon', 'UAV_05_Base_F'] >0"],

	["<img image='client\icons\money.paa'/> Pegar Dinheiro", "client\actions\pickupMoney.sqf", [], -210, false, false, "", "{_x getVariable ['owner', ''] != 'mission'} count (player nearEntities ['Land_Money_F', 5]) > 0"],
    ["<img image='client\icons\money.paa'/> Vender destroços", "client\actions\salvage.sqf", [], -220, false, false, "", "!isNull cursorTarget && !alive cursorTarget && {cursorTarget isKindOf 'AllVehicles' && !(cursorTarget isKindOf 'Man') && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 2}"],
    ["<img image='client\icons\repair.paa'/> Remover ruínas", "addons\playercleanup\removeRuins.sqf", [], -230, false, false, "", "count nearestObjects [player, ['Ruins'], 5] > 0"],
    ["<img image='\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca.paa' color='#ff0000'/><t color='#FFFFFF'> Curar-se completamente</t>", "client\functions\healSelf.sqf", 0, -240, false, false,"","((damage player)>0.01 && (damage player)<0.25499) && (vehicle player == player) && (('FirstAidKit' in (items player)) || ('Medikit' in (items player))) "],
    //Repair Vehicle (\client\items\misc\init.sqf) with "-241"

    ["[0]"] call getPushPlaneAction,
	["Empurrar veículo", "server\functions\pushVehicle.sqf", [2.5, true], -242, false, false, "", "[2.5] call canPushVehicleOnFoot"],
	["Empurrar veículo para frente", "server\functions\pushVehicle.sqf", [2.5], -244, false, false, "", "[2.5] call canPushWatercraft"],
	["Empurrar veículo para trás", "server\functions\pushVehicle.sqf", [-2.5], -246, false, false, "", "[-2.5] call canPushWatercraft"],

	["<img image='client\icons\r3f_unlock.paa'/> Adquirir propriedade do veículo", "client\actions\takeOwnership.sqf", [],-248, false, false, "", "[] call fn_canTakeOwnership isEqualTo ''"],
	//Lock Pick (at the bottom of this file) with "-249"

    ["<img image='client\icons\gunner.paa'/> Procurar Beacons", "addons\beacondetector\beacondetector.sqf", 0, -250, false, false,"","('ToolKit' in (items player)) && !BeaconScanInProgress"],
	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/><t color='#FFFFFF'> Cancelar procura</t>", "Beaconscanstop = true", 0, -250, false, false,"","BeaconScanInProgress"],

    //Reload Flares for all
    //["Install countermeasures", "if(!('CMFlareLauncher' in (vehicle player weaponsTurret [-1]))) then {vehicle player addweapon 'CMFlareLauncher';};vehicle player addMagazineTurret ['60Rnd_CMFlareMagazine',[-1]];", [5,1], -350, false, false, "", "(vehicle player isKindOf 'Air') && ( getPos vehicle player select 2) < 1"],
	//Reload Flares for all without jets
    //["Install countermeasures", "if(!('CMFlareLauncher' in (vehicle player weaponsTurret [-1]))) then {vehicle player addweapon 'CMFlareLauncher';};vehicle player addMagazineTurret ['60Rnd_CMFlareMagazine',[-1]];", [5,1], -350, false, false, "", "(vehicle player isKindOf 'Air') && !(vehicle player isKindOf "Plane_Base_F") && ( getPos vehicle player select 2) < 1"],
    
    /*//smokescreen tank (commander)
	["Recarregar granadas fumígenas (5000R$)", "addons\aj\smokescreen\fn_aj_c_reloadsmokescreen.sqf", [5,1], -360, false, false, "", "({vehicle player isKindOf _x} count ['Tank','Wheeled_APC_F'] > 0) && ( player == commander vehicle player) && !(isengineon vehicle player)"],
	//smokescreen boat (driver)
	["Recarregar granadas fumígenas (5000R$)", "addons\aj\smokescreen\fn_aj_c_reloadsmokescreen_boat.sqf", [5,1], -360, false, false, "", "vehicle player isKindOf 'Boat_Armed_01_base_F' && ( player == driver vehicle player) && !(isengineon vehicle player)"],*/

    ["<img image='client\icons\running_man.paa' color='#FFFFFF'/><t color='#FFFFFF'>Guardar Arma</t>", { player action ["SwitchWeapon", player, player, 100] }, [], -400, false, false, "", "vehicle player == player && currentWeapon player != '' && (stance player != 'CROUCH' || currentWeapon player != handgunWeapon player)"], // A3 v1.58 bug, holstering handgun while crouched causes infinite anim loop

	//[format ["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa' color='%1'/> <t color='%1'>[</t>Suporte Aéreo<t color='%1'>]</t>", "#FF0000"],"addons\APOC_Airdrop_Assistance\APOC_cli_menu.sqf",[], -450, false, false],

    [format ["<img image='client\icons\playerMenu.paa' color='%1'/> <t color='%1'>[</t>Menu do Jogador<t color='%1'>]</t>", "#FF8000"], "client\systems\playerMenu\init.sqf", [], -500, false],

    ["<img image='client\icons\cancel.paa'/> Pegar Uniforme", "client\actions\TakeGear.sqf", [], 1.1, false, false, "", "!isNull cursorTarget && !alive cursorTarget && {cursorTarget isKindOf 'Man' && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3}"]
];


if (["A3W_vehicleLocking"] call isConfigOn) then
{
	[player, ["<img image='client\icons\r3f_unlock.paa'/>Arrombar", "addons\scripts\lockPick.sqf", [cursorTarget], -249, false, false, "", "alive cursorTarget && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3 && {{cursorTarget isKindOf _x} count ['LandVehicle','Ship','Air'] > 0 && {locked cursorTarget == 2 && !(cursorTarget getVariable ['A3W_lockpickDisabled',false]) && cursorTarget getVariable ['ownerUID','0'] != getPlayerUID player && !(damage cursorTarget == 1) && 'ToolKit' in items player}}"]] call fn_addManagedAction;
};

// Hehehe...
if !(288520 in getDLCs 1) then
{
	[player, ["<t color='#00FFFF'>Mover para Motorista/Piloto</t>", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'Kart_01_Base_F' && player distance cursorTarget < 3.4 && isNull driver cursorTarget"]] call fn_addManagedAction;
};

if (["A3W_savingMethod", "profile"] call getPublicVar == "extdb") then
{
	if (["A3W_vehicleSaving"] call isConfigOn) then
	{
		[player, ["<img image='client\icons\save.paa'/> Ligar Salvamento do Veículo", { cursorTarget call fn_forceSaveVehicle }, [], -9.5, false, true, "", "cursorTarget call canForceSaveVehicle && (cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
		[player, ["<img image='client\icons\save.paa'/> Forçar Salvamento do Veículo", { cursorTarget call fn_forceSaveVehicle }, [], -9.5, false, true, "", "cursorTarget call canForceSaveVehicle && !(cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
	};

	if (["A3W_staticWeaponSaving"] call isConfigOn) then
	{
		[player, ["<img image='client\icons\save.paa'/> Ligar Salvamento de Arma estática", { cursorTarget call fn_forceSaveObject }, [], -9.5, false, true, "", "cursorTarget call canForceSaveStaticWeapon && (cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
		[player, ["<img image='client\icons\save.paa'/> Forçar Salvamento de Arma estática", { cursorTarget call fn_forceSaveObject }, [], -9.5, false, true, "", "cursorTarget call canForceSaveStaticWeapon && !(cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
	};
};

// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19

{ [player, _x] call fn_addManagedAction } forEach
[


	[format ["<t color='#FF00FF'>Open magic parachute (%1)</t>", (actionKeysNamesArray "GetOver") param [0,"<'Step over' keybind>"]], A3W_fnc_openParachute, [], 250, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"],

    ["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancel Action</t>", { doCancelAction = true }, [], 200, false, false, "", "mutexScriptInProgress"],
	[format ["<t color='#FF0000'>Emergency eject (Ctrl+%1)</t>", (actionKeysNamesArray "GetOver") param [0,"<'Step over' keybind>"]],  { [[], fn_emergencyEject] execFSM "call.fsm" }, [],190, false, true, "", "(vehicle player) isKindOf 'Air' && !((vehicle player) isKindOf 'ParachuteBase')"],

    //CUSTOM Scripts between +200 to -200 (R3F, Lift..., FAR Revive)

    //R3F with "11" to "-5"

	["<img image='client\icons\money.paa'/> Pickup Money", "client\actions\pickupMoney.sqf", [], -210, false, false, "", "{_x getVariable ['owner', ''] != 'mission'} count (player nearEntities ['Land_Money_F', 5]) > 0"],
    ["<img image='client\icons\money.paa'/> Salvage", "client\actions\salvage.sqf", [], -220, false, false, "", "!isNull cursorTarget && !alive cursorTarget && {cursorTarget isKindOf 'AllVehicles' && !(cursorTarget isKindOf 'Man') && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 2}"],
    ["<img image='client\icons\repair.paa'/> Remove Ruins", "addons\playercleanup\removeRuins.sqf", [], -230, false, false, "", "count nearestObjects [player, ['Ruins'], 5] > 0"],
    ["<img image='\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca.paa' color='#ff0000'/><t color='#FFFFFF'> Heal self</t>", "client\functions\healSelf.sqf", 0, -240, false, false,"","((damage player)>0.01 && (damage player)<0.25499) && (vehicle player == player) && (('FirstAidKit' in (items player)) || ('Medikit' in (items player))) "],
    //Repair Vehicle (\client\items\misc\init.sqf) with "-241"

    ["[0]"] call getPushPlaneAction,
	["Push vehicle", "server\functions\pushVehicle.sqf", [2.5, true], -242, false, false, "", "[2.5] call canPushVehicleOnFoot"],
	["Push vehicle forward", "server\functions\pushVehicle.sqf", [2.5], -244, false, false, "", "[2.5] call canPushWatercraft"],
	["Push vehicle backward", "server\functions\pushVehicle.sqf", [-2.5], -246, false, false, "", "[-2.5] call canPushWatercraft"],
    
    //Removed as we dont want casual battlefield. We want ARMA! /Staynex
    //Driver Assist allows the gunner to shoot and drive together
    //["<img image='client\icons\driver.paa'/> Enable driver assist", fn_enableDriverAssist, [], -247, false, true, "", "_veh = objectParent player; alive _veh && !alive driver _veh && {effectiveCommander _veh == player && player in [gunner _veh, commander _veh] && {_veh isKindOf _x} count ['LandVehicle','Ship'] > 0 && !(_veh isKindOf 'StaticWeapon')}"],
    //["<img image='client\icons\driver.paa'/> Disable driver assist", fn_disableDriverAssist, [], -247, false, true, "", "_driver = driver objectParent player; isAgent teamMember _driver && {(_driver getVariable ['A3W_driverAssistOwner', objNull]) in [player,objNull]}"],

	["<img image='client\icons\r3f_unlock.paa'/> Acquire Vehicle Ownership", "client\actions\takeOwnership.sqf", [],-248, false, false, "", "[] call fn_canTakeOwnership isEqualTo ''"],
	//Lock Pick (at the bottom of this file) with "-249"

    ["<img image='client\icons\gunner.paa'/> Track Beacons", "addons\beacondetector\beacondetector.sqf", 0, -250, false, false,"","('ToolKit' in (items player)) && !BeaconScanInProgress"],
	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/><t color='#FFFFFF'> Cancel tracking</t>", "Beaconscanstop = true", 0, -250, false, false,"","BeaconScanInProgress"],

    //Reload Flares for all
    //["Install countermeasures", "if(!('CMFlareLauncher' in (vehicle player weaponsTurret [-1]))) then {vehicle player addweapon 'CMFlareLauncher';};vehicle player addMagazineTurret ['60Rnd_CMFlareMagazine',[-1]];", [5,1], -350, false, false, "", "(vehicle player isKindOf 'Air') && ( getPos vehicle player select 2) < 1"],
	//Reload Flares for all without jets
    //["Install countermeasures", "if(!('CMFlareLauncher' in (vehicle player weaponsTurret [-1]))) then {vehicle player addweapon 'CMFlareLauncher';};vehicle player addMagazineTurret ['60Rnd_CMFlareMagazine',[-1]];", [5,1], -350, false, false, "", "(vehicle player isKindOf 'Air') && !(vehicle player isKindOf "Plane_Base_F") && ( getPos vehicle player select 2) < 1"],
    
    //smokescreen tank (commander)
	//["Reload Smokescreen ($100)", "addons\aj\smokescreen\fn_aj_c_reloadsmokescreen.sqf", [5,1], -360, false, false, "", "({vehicle player isKindOf _x} count ['Tank','Wheeled_APC_F'] > 0) && ( player == commander vehicle player) && !(isengineon vehicle player)"],
	//smokescreen boat (driver)
	//["Reload Smokescreen ($100)", "addons\aj\smokescreen\fn_aj_c_reloadsmokescreen_boat.sqf", [5,1], -360, false, false, "", "vehicle player isKindOf 'Boat_Armed_01_base_F' && ( player == driver vehicle player) && !(isengineon vehicle player)"],

    ["<img image='client\icons\running_man.paa' color='#FFFFFF'/><t color='#FFFFFF'> Holster Weapon</t>", { player action ["SwitchWeapon", player, player, 100] }, [], -400, false, false, "", "vehicle player == player && currentWeapon player != '' && (stance player != 'CROUCH' || currentWeapon player != handgunWeapon player)"], // A3 v1.58 bug, holstering handgun while crouched causes infinite anim loop

	[format ["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa' color='%1'/> <t color='%1'>[</t>Airdrop Menu<t color='%1'>]</t>", "#FF0000"],"addons\APOC_Airdrop_Assistance\APOC_cli_menu.sqf",[], -450, false, false],

    [format ["<img image='client\icons\playerMenu.paa' color='%1'/> <t color='%1'>[</t>Player Menu<t color='%1'>]</t>", "#FF8000"], "client\systems\playerMenu\init.sqf", [], -500, false]
];

if (["A3W_vehicleLocking"] call isConfigOn) then
{
	[player, ["<img image='client\icons\r3f_unlock.paa'/> Pick Lock", "addons\scripts\lockPick.sqf", [cursorTarget], -249, false, false, "", "alive cursorTarget && player distance cursorTarget <= (sizeOf typeOf cursorTarget / 3) max 3 && {{cursorTarget isKindOf _x} count ['LandVehicle','Ship','Air'] > 0 && {locked cursorTarget == 2 && !(cursorTarget getVariable ['A3W_lockpickDisabled',false]) && cursorTarget getVariable ['ownerUID','0'] != getPlayerUID player && !(damage cursorTarget == 1) && 'ToolKit' in items player}}"]] call fn_addManagedAction;
};

// Hehehe...
if !(288520 in getDLCs 1) then
{
	[player, ["<t color='#00FFFF'>Get in as Driver</t>", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'Kart_01_Base_F' && player distance cursorTarget < 3.4 && isNull driver cursorTarget"]] call fn_addManagedAction;
};

if (["A3W_savingMethod", "profile"] call getPublicVar == "extdb") then
{
	if (["A3W_vehicleSaving"] call isConfigOn) then
	{
		[player, ["<img image='client\icons\save.paa'/> Enable Vehicle Saving", { cursorTarget call fn_forceSaveVehicle }, [], -9.5, false, true, "", "cursorTarget call canForceSaveVehicle && (cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
		[player, ["<img image='client\icons\save.paa'/> Force Save Vehicle", { cursorTarget call fn_forceSaveVehicle }, [], -9.5, false, true, "", "cursorTarget call canForceSaveVehicle && !(cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
	};

	if (["A3W_staticWeaponSaving"] call isConfigOn) then
	{
		[player, ["<img image='client\icons\save.paa'/> Enable Turret Saving", { cursorTarget call fn_forceSaveObject }, [], -9.5, false, true, "", "cursorTarget call canForceSaveStaticWeapon && (cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
		[player, ["<img image='client\icons\save.paa'/> Force Save Turret", { cursorTarget call fn_forceSaveObject }, [], -9.5, false, true, "", "cursorTarget call canForceSaveStaticWeapon && !(cursorTarget getVariable ['A3W_skipAutoSave', false])"]] call fn_addManagedAction;
	};
};

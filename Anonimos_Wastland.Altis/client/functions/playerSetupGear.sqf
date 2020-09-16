// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles", "_donatorLevel"];
_player = _this;

_donatorEnabled = ["A3W_donatorEnabled"] call isConfigOn;
_donatorLevel = player getVariable ["donator", 0];


// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_vest != "") then { _player addVest _vest };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";

// Remove radio
//_player unlinkItem "ItemRadio";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

_player addItemToVest "6Rnd_45ACP_Cylinder";
// Add NVG - Disabled AJ
// _player linkItem "NVGoggles";

switch (_donatorLevel) do
{
	default 
	{
		//_player addBackpack "B_AssaultPack_blk";
		_player addMagazine "6Rnd_45ACP_Cylinder";
		_player addWeapon "hgun_Pistol_heavy_02_F";
		_player addMagazine "6Rnd_45ACP_Cylinder";
		_player selectWeapon "hgun_Pistol_heavy_02_F";
		_player addItem "FirstAidKit";
	};
	
};

//AJ Edit - Add Pistol Flashlight to Default Loadout
_player addHandgunItem "acc_flashlight_pistol";




if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};

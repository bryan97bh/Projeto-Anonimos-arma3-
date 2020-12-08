// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: initPlayerLocal.sqf
//	@file Author: AgentRev

//AJ Event Handlers
playerMoneyTransactions = [getPlayerUID player,[]];

player addEventHandler ["Fired", {_this spawn armajunkies_fnc_aj_c_firedWeapon}];
player addEventHandler ["Take", {diag_log "Took Weapon"; _this spawn armajunkies_fnc_aj_c_evtookSomeThing}];
player addEventHandler ["InventoryClosed", {diag_log "Took Weapon"; _this spawn armajunkies_fnc_aj_c_evInventoryClosed}];
//null = [player] execVM "addons\GrassCutter\grasscutter.sqf";
//player addEventhandler["respawn","_this execVM 'addons\GrassCutter\grasscutter.sqf'"];

"ColorCorrections" ppEffectEnable true; 
"ColorCorrections" ppEffectAdjust [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]];
"ColorCorrections" ppEffectCommit 0;

0 = 0 spawn {
	"netIDToSend" addPublicVariableEventHandler {
		(_this select 1) spawn armajunkies_fnc_aj_c_createTearTrigger;
	};
};
//END 


if (!isServer) then
{
	"BIS_fnc_MP_packet" addPublicVariableEventHandler compileFinal preprocessFileLineNumbers "server\antihack\filterExecAttempt.sqf";
};


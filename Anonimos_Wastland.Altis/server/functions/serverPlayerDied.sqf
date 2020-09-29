// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: serverPlayerDied.sqf
//	@file Author: [404] Pulse, AgentRev
//	@file Created: 20/11/2012 05:19

if (!isServer) exitWith {};
//diag_log format["DEBUG _this: %1", _this];
params [
["_unit",objNull,[objNull]],
"",
"",
"",
["_deathCause",[],[[]]]
]; // _unit, _killer, _instigator, _useEffects

_unit call A3W_fnc_setItemCleanup;
_unit setVariable ["A3W_deathCause_local", _deathCause];

private _killer = (_this select [0,3]) call A3W_fnc_registerKillScore;

// Remove player save on death
if (isPlayer _unit && {["A3W_playerSaving"] call isConfigOn}) then
{
	(getPlayerUID _unit) call fn_deletePlayerSave;
};

private _backpack = unitBackpack _unit;

if (!isNull _backpack) then
{
	_backpack call A3W_fnc_setItemCleanup;
};

// Eject corpse from vehicle once stopped
if (vehicle _unit != _unit) then
{
	if (local _unit) then
	{
		_unit spawn fn_ejectCorpse;
	}
	else
	{
		_unit remoteExec ["fn_ejectCorpse", _unit];
	};
};


if (isPlayer _killer) then
{
//AJ - Reveal the killer to the AI units to make AI more responsive. 
_enableReveal = ["A3W_AjRevealPlayersOnAiKill"] call isConfigOn;

	if (_enableReveal) then
	{
		private _revealAmount = 3;
		private _shareInfoDistance = 200;  //distance between player and ai casualty for reveal.
		private _muzzle = currentMuzzle _killer;
		
		private _groupUnits = units (group _unit);
		
		if (_muzzle isEqualType "") then
		{
			private _silencer = _killer weaponAccessories _muzzle select 0;
			if (!isNil "_silencer" && {_silencer != ""}) then
			{
				_revealAmount = 1.5;
			};
		};


		{
			if ((_x distance2D _unit) <= _shareInfoDistance) then
			{
				_x reveal [_killer, _revealAmount];
			};
		} forEach _grpUnits;
	};




// - AI Explode on Roadkills
	_veh = vehicle _killer;
	if (
		!(_veh isEqualTo _killer)&&               //killer is vehicle
		!(isPlayer _unit) &&                      //only trigger explosion for ai kills
		{(driver _veh) isEqualTo _killer} &&      //killer is driver of vehicle
		{(_killer distance _unit)<10}             //killer is nearby (avoids bug with heli, ...)
		) then {
		    _playerObj = driver _veh;
			_boom = createVehicle ["SLAMDirectionalMine_Wire_Ammo", [0,0,100], [], 0, "CAN_COLLIDE"];
			_boom setPosATL (getPosATL _playerObj);
			_boom setDamage 1;
		};
	
	
};

/*// Make NPCs drop Cash
if (!isPlayer _unit) then
{
			_itemtype = ["Item","Land_Money_F"];
			_item = createVehicle [_itemtype select 1, getpos _unit, [], 5, "None"];
			_item setPos ([getPos _unit, 1, 3, 0, 0, 2000, 0] call BIS_fnc_findSafePos);
			_item setDir random 360;
			_cash = round(random 1000);
			_item setVariable ["cmoney", _cash , true];
			_item setVariable ["owner", "world", true];

};*/
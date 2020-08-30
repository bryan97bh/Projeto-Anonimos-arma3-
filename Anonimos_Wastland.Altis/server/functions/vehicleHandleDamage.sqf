// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleHandleDamage.sqf
//	@file Author: AgentRev

#define COLLISION_DMG_SCALE 0.2
#define PLANE_COLLISION_DMG_SCALE 0.5
#define WHEEL_COLLISION_DMG_SCALE 0.05
#define MRAP_MISSILE_DMG_SCALE 1.0
#define APC_MARSHALL_DMG_SCALE 0.6
#define APC_MARID_DMG_SCALE 0.5
#define APC_GORGON_DMG_SCALE 0.7
#define APC_TRACKED_DMG_SCALE 1.0
#define NYX_TRACK_DMG_SCALE 0.25
#define TANK_DMG_SCALE 1.5
#define HELI_MISSILE_DMG_SCALE 0.5
#define SMALL_HELI_MISSILE_DMG_SCALE 0.5
#define PLANE_MISSILE_DMG_SCALE 0.8
#define VTOL_MISSILE_DMG_SCALE 0.7


params ["_vehicle", "_selection", "_damage", "_source", "_ammo", "", "_instigator", "_hitPoint"];

if (_selection != "?") then
{
	_isHeli = _vehicle isKindOf "Helicopter";
	_isSmallHeli = _vehicle isKindOf "Heli_Light_01_base_F";

/* 	if (_isHeli && _selection == "fuel_hit") exitWith
	{
		_damage = 0; // Block goddamn fuel leak
	}; */

	_oldDamage = [_vehicle getHit _selection, damage _vehicle] select (_selection isEqualTo "");

	if (!isNil "_oldDamage") then
	{
		_isPlane = _vehicle isKindOf "Plane";
		_isVtol = _vehicle isKindOf "VTOL_Base_F";

		if (isNull _source && _ammo == "") exitWith // Reduce collision damage
		{
			_scale = switch (true) do
			{
				case (_selection select [0,5] == "wheel"): { WHEEL_COLLISION_DMG_SCALE };
				case (_isPlane):                           { PLANE_COLLISION_DMG_SCALE };
				default                                    { COLLISION_DMG_SCALE };
			};

			_damage = ((_damage - _oldDamage) * _scale) + _oldDamage;
		};

		_isMissile = _ammo isKindOf "MissileBase"; // ({_ammo isKindOf _x} count ["R_PG32V_F", "M_NLAW_AT_F", "M_Titan_AT", "M_Titan_AA", "M_Air_AA", "M_Scalpel_AT", "Missile_AGM_02_F", "Missile_AA_04_F"] > 0);

		switch (true) do
		{
			
			case (_isSmallHeli):
			{
				if (_isMissile) then
				{
					_damage = ((_damage - _oldDamage) * SMALL_HELI_MISSILE_DMG_SCALE) + _oldDamage;
                    [_vehicle, "HitEngine", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitHRotor", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitVRotor", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitFuel", 1] call BIS_fnc_setHitPointDamage;
				};
			};
			
			// If vehicle is heli and projectile is missile then multiply damage
			case (_isHeli):
			{
				if (_isMissile) then
				{
					_damage = ((_damage - _oldDamage) * HELI_MISSILE_DMG_SCALE) + _oldDamage;
				};
			};
			
			
			// If vehicle is VTOL and projectile is missile then multiply damage
			// If this evaluates true the next case isn't checked - so the plane damage multiplier isn't used
			case (_isVtol):
			{
				if (_isMissile) then
				{
					_damage = ((_damage - _oldDamage) * VTOL_MISSILE_DMG_SCALE) + _oldDamage;
				};
			};
			
			// If vehicle is plane and projectile is missile then multiply damage
			case (_isPlane):
			{
				if (_isMissile) then
				{
					_damage = ((_damage - _oldDamage) * PLANE_MISSILE_DMG_SCALE) + _oldDamage;
				};
			};
            
            // If vehicle is APC MARSHALL then multiply damage
			case (_vehicle isKindOf "APC_Wheeled_01_base_F"):
			{
				if (_isMissile) then
				{
                    _damage = ((_damage - _oldDamage) * APC_MARSHALL_DMG_SCALE) + _oldDamage;
                    
                    //Destroy all Wheels if a missle hit the APC to protect driveaway and repair
                    [_vehicle, "HitLFWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitLBWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitLMWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitLF2Wheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRFWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRBWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRMWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRF2Wheel", 1] call BIS_fnc_setHitPointDamage;
                    
                    //Destroy the APC if AI is the driver - avoid farming
                    if (!(isPlayer (driver _vehicle)) && !(isNull (driver _vehicle))) then
                    {
                        _damage = 1;
                    };
				};
			};
            
            // If vehicle is APC MARID then multiply damage
			case (_vehicle isKindOf "APC_Wheeled_02_base_F"):
			{
				if (_isMissile) then
				{
                    _damage = ((_damage - _oldDamage) * APC_MARID_DMG_SCALE) + _oldDamage;
                    
                    //Destroy all Wheels if a missle hit the APC to protect driveaway and repair
                    [_vehicle, "HitLFWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitLBWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitLMWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitLF2Wheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRFWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRBWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRMWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRF2Wheel", 1] call BIS_fnc_setHitPointDamage;
                    
                    //Destroy the APC if AI is the driver - avoid farming
                    if (!(isPlayer (driver _vehicle)) && !(isNull (driver _vehicle))) then
                    {
                        _damage = 1;
                    };
				};
			};
            
            // If vehicle is APC GORGON then multiply damage
			case (_vehicle isKindOf "APC_Wheeled_03_base_F"):
			{
				if (_isMissile) then
				{
                    _damage = ((_damage - _oldDamage) * APC_GORGON_DMG_SCALE) + _oldDamage;
                    
                    //Destroy all Wheels if a missle hit the APC to protect driveaway and repair
                    [_vehicle, "HitLFWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitLBWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitLMWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitLF2Wheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRFWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRBWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRMWheel", 1] call BIS_fnc_setHitPointDamage;
                    [_vehicle, "HitRF2Wheel", 1] call BIS_fnc_setHitPointDamage;
                    
                    //Destroy the APC if AI is the driver - avoid farming
                    if (!(isPlayer (driver _vehicle)) && !(isNull (driver _vehicle))) then
                    {
                        _damage = 1;
                    };
				};
			};
            
			// If vehicle is MRAP and projectile is missile then multiply damage
			case ({_vehicle isKindOf _x} count ["MRAP_01_base_F", "MRAP_02_base_F", "MRAP_03_base_F"] > 0):
			{
				if (_isMissile) then
				{
					_damage = ((_damage - _oldDamage) * MRAP_MISSILE_DMG_SCALE) + _oldDamage;
				};
			};
			
			// If vehicle is Nyx light tank then reduce track damage
            case (_vehicle isKindOf "LT_01_base_F"):
            {
                if (_hitPoint in ["hitltrack","hitrtrack"]) then
                {
                    _damage = ((_damage - _oldDamage) * NYX_TRACK_DMG_SCALE) + _oldDamage;
                };
            };
            
			// If vehicle is tank then multiply damage
			case (_vehicle isKindOf "Tank"): //&& !(_vehicle isKindOf "LT_01_base_F")):
			{
				if (_isMissile) then
				{
					_scale = if ({_vehicle isKindOf _x} count ["APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "APC_Tracked_03_base_F"] > 0) then {
						APC_TRACKED_DMG_SCALE
					} else {
						TANK_DMG_SCALE
					};

					_damage = ((_damage - _oldDamage) * _scale) + _oldDamage;
				};
			};
		};
	};

	[_vehicle, _selection, _damage, _source, _ammo, _instigator, _hitPoint] call vehicleHitTracking;
};

_damage

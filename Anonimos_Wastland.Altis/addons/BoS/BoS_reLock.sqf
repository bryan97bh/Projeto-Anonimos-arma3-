//	@file Version:
//	@file Name:
//	@file Author: Cael817, modded by Wiking[AJ]
//	@file Created:

private ["_price", "_playerMoney"];


_baseradius = ["A3W_AJBaseRadius", 60] call getPublicVar;
#define RELOCK_PRICE_RELATIONSHIP 10

_maxLifetime = ["A3W_objectLifetime", 120] call getPublicVar;
_objects = nearestObjects [position player, ["thingX", "Building", "ReammoBox_F"], _baseradius];
_ownedObjects = {typeName _x == "OBJECT" && {!(isNil {_x getVariable "ownerUID"})} && {_x getVariable "objectLocked"}} count _objects;
//_ownedObjects = {typeName _x == "OBJECT" && {_x getVariable ["ownerUID",""] == getPlayerUID player}} count _objects; // Use this if you want only owned objects to be relocked.

_price = 100;
{
_objClass = typeOf _x;


	{
		if (_objClass == _x select 1) exitWith
		{
			_price = _price + ((ceil (((_x select 2) / RELOCK_PRICE_RELATIONSHIP) / 5)) * 5);
		};
	} forEach (call allGenStoreVanillaItems);
} forEach _objects;


_playerMoney = player getVariable "cmoney";


if (isNil "reLockedObjectMapMarkers") then {
	// This is the global we use to keep track of map markers
	reLockedObjectMapMarkers = [];
};

if (count reLockedObjectMapMarkers > 0) then {
	{
		deleteMarkerLocal _x;
	} forEach reLockedObjectMapMarkers;
	reLockedObjectMapMarkers = [];
	["Mapa limpo de marcadores anteriores", 5] call mf_notify_client;
};

if (!isNil "_price") then 
{
	// Add total sell value to confirm message
	_confirmMsg = format ["Renovar trava/tempo de vida de %1 partes/objetos da Base irá custar a você $%2<br/>Em uma distância de %3 metros, todos os objetos serão salvos e marcados no mapa, após o pagamento!<br/>Se você não renovar o pagamento desses objetos, eles iram sumir em %4 horas.", _ownedObjects, _price, _baseradius, _maxLifetime];

	// Display confirm message
	if ([parseText _confirmMsg, "Confirmar", "OK", true] call BIS_fnc_guiMessage) then
	{	
		// Ensure the player has enough money

		if (_price > _playerMoney) exitWith
		{
			hint format ["Você precisa de  $%1 para renovar %2 os objetos",  _price, _ownedObjects];
			playSound "FD_CP_Not_Clear_F";
		};
		
		player setVariable["cmoney",(player getVariable "cmoney")-_price,true];
		
		reLockedObjectMapMarkers = [];
		{
		//if(_x getVariable "ownerUID" == getplayerUID player) then 
		if !(isNil {_x getVariable "ownerUID"}) then // Changed so also non owned objects are relocked
		{
		private ["_name","_objPos","_name","_marker"];
		_x setVariable ["baseSaving_hoursAlive", nil, true]; //this is only for local persistance mode - extb isn't using it
		_x setVariable ["baseSaving_spawningTime", nil, true];
		_x setVariable ["objectLocked",true,true];
		pvar_manualObjectSave = netId _x;
		publicVariableServer "pvar_manualObjectSave";   //this resets the lock timer for extdb persistance
		//trackObject = _x;
		//publicVariableServer "trackObject";
		//_x setVariable ["ownerUID", getPlayerUID player, true]; //possibly set new owner?
		//_x setVariable ["ownerN", name player, true]; // set this here if not set in R3F?
		_name = gettext(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
		_objPos = getPosATL _x;
		_marker = "reLockedObjectMapMarkers" + (str _forEachIndex);
		_marker = createMarkerLocal [_marker, _objPos];
		_marker setMarkerTypeLocal "waypoint";
		_marker setMarkerPosLocal _objPos;
		_marker setMarkerTextLocal _name;
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTextLocal _name;
	reLockedObjectMapMarkers pushBack _marker;
	};
} forEach _objects;


if (count reLockedObjectMapMarkers > 0) then {

	["Marcadores adicionados para os objetos renovados, eles serão removidos em 30 segundos", 5] call mf_notify_client;
	
	}else{
	//["No owned objects found within the set radius", 5] call mf_notify_client;
	[format ["Nenhum objeto de propriedade encontrado dentro de %1m",_baseradius], 5] call mf_notify_client;	
};
	
sleep 30;

if (count reLockedObjectMapMarkers > 0) then
{
	{
		deleteMarkerLocal _x;
	} forEach reLockedObjectMapMarkers;
	reLockedObjectMapMarkers = [];
	["Mapa limpo", 5] call mf_notify_client;
};

};
};
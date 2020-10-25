//setup vairables
_uav = cursorTarget;
_class = typeOf _uav;
_isUAV = (round getNumber (configFile >> "CfgVehicles" >> _class >> "isUav") > 0);
_playerID = getPlayerUID player;
_uavOwner = _uav getVariable "ownerUID";
_uavcrew = crew _uav;

//lets do the thing
if (_isUAV) then {
	if (_uavOwner == _playerID) then {
		{deleteVehicle _x}foreach _uavcrew
	} else {
		hint "Nenhum drone próprio no alcance";
	};
} else {
	hint "Nenhum UAV no alcance";
};

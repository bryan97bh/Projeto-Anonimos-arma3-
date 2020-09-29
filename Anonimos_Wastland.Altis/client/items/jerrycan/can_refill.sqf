// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: can_refill.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Check if you can refill an empty jerrycan
//@file Argument: [_container] the object that can be used to refill an empty jerrycan
//@file Argument: [] automatically find the nearest object that can be used to refill an empty jerrycan

#define ERR_NO_PUMP "Você não está perto de uma bomba / recipiente de combustível."
#define ERR_IN_VEHICLE "Você não pode fazer isso enquanto estiver em um veículo."
#define ERR_NO_JERRYCANS "Você não tem Galões de Gasolina vazios."
private ["_container", "_error"];
_container = objNull;
if (count _this == 0) then {
	_container = call mf_jerrycan_nearest_pump;
} else {
	_container = _this select 0;
};

_error = "";
switch (true) do {
	case (player distance _container > (sizeOf typeOf _container / 3) max 2): {_error = ERR_NO_PUMP};
	case (vehicle player != player): {_error = ERR_IN_VEHICLE};
	case ((MF_ITEMS_JERRYCAN_EMPTY call mf_inventory_count) <= 0): {_error = ERR_NO_JERRYCANS};
};
_error;

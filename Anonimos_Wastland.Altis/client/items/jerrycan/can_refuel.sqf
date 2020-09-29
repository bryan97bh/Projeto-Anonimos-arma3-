// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: can_refuel.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Check if you can refuel the nearest vehicle
//@file Argument: [_vehicle] the vehicle to test
//@file Argument: [] automatically find the nearest vehicle

#define ERR_NO_VEHICLE "Nenhum veículo dentro do alcance."
#define ERR_IN_VEHICLE "Você não pode fazer isso enquanto estiver em um veículo."
#define ERR_FULL "Este veículo já está cheio"
#define ERR_NO_FUEL "Você não tem latas cheias de combustível"
#define ITEM_COUNT(ITEMID) ITEMID call mf_inventory_count
private ["_vehicle", "_error"];
_vehicle = objNull;
if (count _this == 0) then { // if array empty
	_vehicle = call mf_jerrycan_nearest_vehicle;
} else {
	_vehicle = _this select 0;
};

_error = "";
switch (true) do {
	case (isNull _vehicle): {_error = ERR_NO_VEHICLE};
	case (vehicle player != player):{_error = ERR_IN_VEHICLE};
	case (fuel _vehicle > 0.95): {_error = ERR_FULL};
	case (ITEM_COUNT(MF_ITEMS_JERRYCAN_FULL) <= 0): {_error = ERR_NO_FUEL};
};
_error;

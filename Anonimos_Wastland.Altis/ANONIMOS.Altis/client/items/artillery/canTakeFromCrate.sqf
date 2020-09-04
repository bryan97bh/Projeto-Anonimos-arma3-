// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2018 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: canTakeFromCrate.sqf

#define ERR_IN_VEHICLE "Não é possível fazer isso enquanto estiver em um veículo"
#define ERR_TOO_FAR "Você está muito longe"

_crate = call mf_items_cratemoney_nearest;
private _error = "failed";

switch (true) do
{
	case (isNull _crate): {};
	case (!alive player): {};
	case (player distance _crate > 3): {_error = ERR_TOO_FAR};
	case (vehicle player != player): {_error = ERR_IN_VEHICLE};
	case (_crate getVariable ["A3W_inventoryLockR3F", false] && _crate getVariable ["R3F_LOG_disabled", false]): {};
	case (_crate getVariable ["artillery", 0] < 1): {};
	default {_error = ""};
};

_error

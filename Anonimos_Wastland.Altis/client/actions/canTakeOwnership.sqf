// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: canTakeOwnership.sqf
//	@file Author: MercyfulFate, AgentRev

#define CONCAT(STR1,STR2) format ["%1 %2", STR1, STR2]
#define ERR_FAILED "Falha na aquisição!"
#define ERR_IN_VEHICLE "Você não pode fazer isso em um veículo."
#define ERR_DISTANCE "Você está muito longe do veículo."
#define ERR_MOVED "Alguém moveu o veículo."
#define ERR_TOWED "Alguém rebocou ou levantou o veículo."
#define ERR_OWNED "O veículo já é seu."
#define ERR_LOCKED "O veículo está trancado."
#define ERR_NO_MISSION_STORE_VEHICLE "O veículo deve ser de uma missão ou loja."
#define ERR_CREW "Alguém está dentro do veículo."
#define ERR_CONNECTED "Alguém está conectado ao VANT."
#define ERR_DESTROYED "O veículo está destruído."
#define ERR_CANCELLED "Quebra de cadeado cancelado!"

params ["_vehicle"];

if (isNil "_vehicle") then
{
	_vehicle = ["LandVehicle", "Air", "Ship"] call mf_nearest_vehicle;
};

private _text = "";

switch (true) do
{
	case (!alive player): { _text = "dead" };
	case (vehicle player != player): { _text = CONCAT(ERR_FAILED, ERR_IN_VEHICLE) };
	case (!alive _vehicle): { _text = CONCAT(ERR_FAILED, ERR_DESTROYED) };
	case (_vehicle getVariable ["ownerUID","0"] isEqualTo getPlayerUID player && {!unitIsUAV _vehicle || side _vehicle == side group player}): { _text = CONCAT(ERR_FAILED, ERR_OWNED) };
	case (locked _vehicle > 1): { _text = CONCAT(ERR_FAILED, ERR_LOCKED) };
    case ( !(cursorTarget getVariable ['A3W_purchasedVehicle', false]) && !(cursorTarget getVariable ['A3W_missionVehicle', false]) ): { _text = CONCAT(ERR_FAILED, ERR_NO_MISSION_STORE_VEHICLE) };
	case ({alive _x && getText (configFile >> "CfgVehicles" >> typeOf _x >> "simulation") != "UAVPilot"} count crew _vehicle > 0): { _text = CONCAT(ERR_FAILED, ERR_CREW) };
	case (!isNull ((uavControl _vehicle) select 0)): { _text = CONCAT(ERR_FAILED, ERR_CONNECTED) };
	//case (!isNull (_vehicle getVariable ["R3F_LOG_est_deplace_par", objNull])): { _text = CONCAT(ERR_FAILED, ERR_MOVED) };
	//case (!isNull (_vehicle getVariable ["R3F_LOG_est_transporte_par", objNull])): { _text = CONCAT(ERR_FAILED, ERR_TOWED) };
	case (player distance _vehicle > (sizeOf typeOf _vehicle / 3) max 3): { _text = CONCAT(ERR_FAILED, ERR_DISTANCE) };
};

_text

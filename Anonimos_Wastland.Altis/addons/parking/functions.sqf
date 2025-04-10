
if (isServer) then
{
  waitUntil {missionNamespace getVariable ["A3W_savingMethod",""] isEqualType {}};
}
else
{
  waitUntil {!isNil "A3W_serverSetupComplete"};
};

if !(["A3W_privateParking"] call isConfigOn && ["A3W_vehicleSaving"] call isConfigOn) exitWith
{
  parking_functions_defined = false;
};

if !((call A3W_savingMethod) in ["extdb","sock"]) exitWith
{
  diag_log "parking only compatible with extdb and sock, aborting setup.";
  parking_functions_defined = false;
};


call compile preprocessFileLineNumbers "addons\parking\config.sqf";

{
  call compile preprocessFileLineNumbers format["addons\parking\%1_functions.sqf", _x];
} forEach ["misc", "list_simple_menu", "pp_interact", "pp_saving", "pp_actions"];

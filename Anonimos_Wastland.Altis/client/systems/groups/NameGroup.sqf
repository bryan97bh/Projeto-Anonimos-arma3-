#define groupManagementDialog 55510
#define groupManagementNameInput_IDC 55522

disableSerialization;
private ["_dialog", "_input"];

_dialog = findDisplay groupManagementDialog;

if (isNull _dialog) exitWith {};

_input = _dialog displayCtrl groupManagementNameInput_IDC;
_inputtxt = ctrlText _input;

if (_inputtxt != ""&&_inputtxt != " "&&_inputtxt != "  "&&_inputtxt != "   "&&_inputtxt != "    "&&_inputtxt != "     "&&_inputtxt != "      "&&_inputtxt != "       "&&_inputtxt != "        "&&_inputtxt != "         "&&_inputtxt != "          ") then{
    _inputtxt = [_inputtxt, 0, 25] call BIS_fnc_trimString;
    player setVariable ["group_name", _inputtxt, true];
};
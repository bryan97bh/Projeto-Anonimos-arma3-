// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: territoryPayroll.sqf
//	@file Author: AgentRev

#define SLEEP_REALTIME(SECS) if (hasInterface) then { sleep SECS } else { uiSleep SECS }

if (!isServer) exitWith {};

_timeInterval = ["A3W_payrollInterval", 30*60] call getPublicVar;
_basemoneyAmount = ["A3W_payrollAmount", 100] call getPublicVar;


_territoryCapped = false;

while {true} do
{
	if (_territoryCapped) then
	{
		SLEEP_REALTIME(_timeInterval);
	}
	else
	{
		SLEEP_REALTIME(60);
	};

	_payouts = [];

	{
		_territoryOwner = _x select 2;
		_territoryChrono = _x select 3;

		if (_territoryChrono > 0) then
		{
			_territoryCapped = true;

			if (_territoryChrono >= _timeInterval) then
			{
				_added = false;

				{
					if ((_x select 0) isEqualTo _territoryOwner) exitWith
					{
						_x set [1, (_x select 1) + 1];
						_added = true;
					};
				} forEach _payouts;

				if (!_added) then
				{
					_payouts pushBack [_territoryOwner, 1];
				};
			};
		};
	} forEach currentTerritoryDetails;

	{
		_team = _x select 0;
		_count = _x select 1;
		
		//AJ - Payroll depends on players on server now
		_moneyAmount = _basemoneyAmount * (count playableUnits);
		_countteamsize = 1;
		if (_team in [BLUFOR,OPFOR] ) then
		{
		 _countteamsize = _team	countSide allUnits;
		}
		else
		{
		 _countteamsize = count units _team;
		};
		
		//less money the bigger the group is
			switch (_countteamsize) do {
				case 1: { _moneyAmount = ceil(_moneyAmount)};
				case 2: { _moneyAmount = ceil(_moneyAmount * 0.9)};
				case 3: { _moneyAmount = ceil(_moneyAmount * 0.9)};
				case 4: { _moneyAmount = ceil(_moneyAmount * 0.8)};
				case 5: { _moneyAmount = ceil(_moneyAmount * 0.8)};
				case 6: { _moneyAmount = ceil(_moneyAmount * 0.8)};
				case 7: { _moneyAmount = ceil(_moneyAmount * 0.7)};
				case 8: { _moneyAmount = ceil(_moneyAmount * 0.7)};
				case 9: { _moneyAmount = ceil(_moneyAmount * 0.7)};
				case 10: { _moneyAmount = ceil(_moneyAmount * 0.6)};
				case 11: { _moneyAmount = ceil(_moneyAmount * 0.6)};
				case 12: { _moneyAmount = ceil(_moneyAmount * 0.6)};
				case 13: { _moneyAmount = ceil(_moneyAmount * 0.5)};
				case 14: { _moneyAmount = ceil(_moneyAmount * 0.5)};
				case 15: { _moneyAmount = ceil(_moneyAmount * 0.5)};
				default  { _moneyAmount = ceil(_moneyAmount * 0.5)};  //Bigger Groups (e.g. Blufor)
			};
		
		_money = _count * _moneyAmount;
		_message =  format ["Seu time recebeu $%1 como bônus por manter capturado %2 territórios %3 durante os últimos %4 minutos", [_money] call fn_numbersText, _count, if (_count == 1) then { "y" } else { "ies" }, ceil (_timeInterval / 60)];

		[[_message, _money], "A3W_fnc_territoryActivityHandler", _team, false] call A3W_fnc_MP;
	} forEach _payouts;
};

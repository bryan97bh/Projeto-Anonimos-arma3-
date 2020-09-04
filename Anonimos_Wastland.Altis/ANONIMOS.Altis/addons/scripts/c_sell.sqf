
_vehicle = _this;
_driver = driver _vehicle;
_eng = isengineon _vehicle;
_vehicle setVelocity [0,0,0];

if (_eng) then {
	_vehicle vehicleChat format ["Pare o motor nos 15s para vender o veículo. Você receberá 3/4 do preço da loja do veículo."];
	sleep 15;
	_eng = isengineon _vehicle;
	if (_eng) exitWith {_vehicle vehicleChat format ["Motor ainda em funcionamento. Oferta CANCELADA!"];};
};


if((player == driver _vehicle) && (!_eng))then {
	_type = typeOf _vehicle;
	_playerMoney = player getVariable "cmoney";
	_price = 500;
	//find price from vehicle store prices
	{	
	if (_type == _x select 1) then
	{	
	_price = _x select 2;
	_price = _price / PRICE_RELATIONSHIP;
	};
} forEach (call allVehStoreVehicles);

		player setVariable["cmoney",(player getVariable "cmoney")+_price,true];
		player setVariable["timesync",(player getVariable "timesync")+(_price * 3),true];
		[] call fn_savePlayerData;
		["A desmontagem levará cerca de 1 minuto.", 10] call mf_notify_client;
		
		_vehicle setFuel 0;
		_vehicle setVelocity [0,0,0];
		_text = format ["Vendendo %1 por $%2. Remoção do motor, esvaziamento de fluidos e remoção de munição.", _type, _price];
		[_text, 5] call mf_notify_client;
		sleep 5;
		["Cortar veículo.", 5] call mf_notify_client;
		_this animate ["HideBackpacks", 1];
		sleep 1;
		_this animate ["HideBumper1", 1];
		sleep 1;
		_this animate ["HideBumper2", 1];
		sleep 1;
		_this animate ["HideDoor1", 1];
		sleep 1;		
		_this animate ["HideDoor2", 1];
		sleep 1;
		_this animate ["HideDoor3", 1];
		sleep 1;
		deleteVehicle _this;

		_text = format ["%1 foi picado.", _type];
		[_text, 10] call mf_notify_client;
		if (true) exitWith {};
	};

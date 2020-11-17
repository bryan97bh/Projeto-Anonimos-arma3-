/*
	@file Version: 0.1
	@file Name: statusBar.sqf
	@file  EpochMod StatusBar Port for Wasteland by CRE4MPIE
*/

waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

ZGO_StatusEnabled = true;

[] spawn
{
	uiSleep 5;
	_uid = getPlayerUID player;
	_serverNr = call A3W_extdb_ServerID;
	_world = worldName;
	_lastDamageReading = 100;
	_staminastr = "100";
	_dirstr = "180";
	AJ_SERVERTIME_PUBVAR = "";
	
	
	if !(_serverNr > 0) then
		{
		_serverNr = 99;
		};	
	
	while {true} do
	{
		uisleep 1;
		if !(ZGO_StatusEnabled) then
		{
			_rscLayer = "RscWastelandStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutText ["","PLAIN",1,false];
		}
		else
		{
			_rscLayer = "RscWastelandStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["RscWastelandStatusBar","PLAIN",1,false];

			if(isNull ((uiNamespace getVariable "RscWastelandStatusBar")displayCtrl 55554)) then
			{
				diag_log "statusbar is null create";
				disableSerialization;
				_rscLayer = "RscWastelandStatusBar" call BIS_fnc_rscLayer;
				_rscLayer cutRsc ["RscWastelandStatusBar","PLAIN",1,false];
			};
			//initialize variables and set values
			_unit = _this select 0;
			_damage = round ((1 - (damage player)) * 100);
			_hunger = ceil (hungerLevel max 0);
			_thirst = ceil (thirstLevel max 0);
			_wallet = player getVariable ["cmoney",0] call fn_numbersText;
			_respect = player getVariable ["bmoney",0] call fn_numbersText;
			_serverFPS = round diag_fps;
			_dir = round (getDir (vehicle player));
			_stamina = 100 - ceil ((getFatigue player) * 100);
			_moneyAmount = 60 * (count playableUnits);
			
			//format stamina value to 3 chars
			switch ( count str _stamina) do
			{
			case 1: {_staminastr = format ["00%1", _stamina ]};
			case 2: {_staminastr = format ["0%1", _stamina ]};
			default {_staminastr = str _stamina};
			};

			//format compass reading to 3 chars
			switch ( count str _dir) do
			{
			case 1: {_dirstr = format ["00%1", _dir ]};
			case 2: {_dirstr = format ["0%1", _dir ]};
			default {_dirstr = str _dir};
			};
		
			//Color Gradient
			_colourDefault 	= parseText "#FBFCFE"; //Wasteland White - Defualt Color
			_colour90 		= parseText "#F5E6EC"; //
			_colour80 		= parseText "#F0D1DB"; //
			_colour70 		= parseText "#EBBBC9"; //
			_colour60 		= parseText "#E6A6B8"; //
			_colour50 		= parseText "#E191A7"; //
			_colour40 		= parseText "#DB7B95"; //
			_colour30 		= parseText "#D66684"; //
			_colour20 		= parseText "#D15072"; //
			_colour10 		= parseText "#CC3B61"; //
			_colour0 		= parseText "#C72650"; //Wasteland Red
			_colourDead 	= parseText "#000000";

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
				default  { _moneyAmount = ceil(_moneyAmount * 0.5)};
			};
		
			//Colour coding
			//Damage
			_colourDamage = _colourDefault;
			if(_damage >= 100) then{_colourDamage = _colourDefault;};
			if((_damage >= 90) && (_damage < 100)) then {_colourDamage =  _colour90;};
			if((_damage >= 80) && (_damage < 90)) then {_colourDamage =  _colour80;};
			if((_damage >= 70) && (_damage < 80)) then {_colourDamage =  _colour70;};
			if((_damage >= 60) && (_damage < 70)) then {_colourDamage =  _colour60;};
			if((_damage >= 50) && (_damage < 60)) then {_colourDamage =  _colour50;};
			if((_damage >= 40) && (_damage < 50)) then {_colourDamage =  _colour40;};
			if((_damage >= 30) && (_damage < 40)) then {_colourDamage =  _colour30;};
			if((_damage >= 20) && (_damage < 30)) then {_colourDamage =  _colour20;};
			if((_damage >= 10) && (_damage < 20)) then {_colourDamage =  _colour10;};
			if((_damage >= 1) && (_damage < 10)) then {_colourDamage =  _colour0;};
			if(_damage < 1) then{_colourDamage =  _colourDead;};
			
			if (_damage != _lastDamageReading) then
			{
			// Health change. Up or down?
				if (_damage < _lastDamageReading) then
				{
					// Gone down. Red flash
					_colourDamage = "#FF1717";
				}
				else
				{
					// Gone up. Green flash
					_colourDamage = "#17FF17";
					if (!isNil "BIS_HitCC" && {ppEffectEnabled BIS_HitCC}) then { BIS_HitCC ppEffectEnable false }; // fix for permanent red borders due to fire damage
				};
			};
			_lastDamageReading = _damage;
			
			

			//Hunger
			_colourHunger = _colourDefault;
			if(_hunger >= 100) then{_colourHunger = _colourDefault;};
			if((_hunger >= 90) && (_hunger < 100)) then {_colourHunger =  _colour90;};
			if((_hunger >= 80) && (_hunger < 90)) then {_colourHunger =  _colour80;};
			if((_hunger >= 70) && (_hunger < 80)) then {_colourHunger =  _colour70;};
			if((_hunger >= 60) && (_hunger < 70)) then {_colourHunger =  _colour60;};
			if((_hunger >= 50) && (_hunger < 60)) then {_colourHunger =  _colour50;};
			if((_hunger >= 40) && (_hunger < 50)) then {_colourHunger =  _colour40;};
			if((_hunger >= 30) && (_hunger < 40)) then {_colourHunger =  _colour30;};
			if((_hunger >= 20) && (_hunger < 30)) then {_colourHunger =  _colour20;};
			if((_hunger >= 10) && (_hunger < 20)) then {_colourHunger =  _colour10;};
			if((_hunger >= 1) && (_hunger < 10)) then {_colourHunger =  _colour0;};
			if(_hunger < 1) then{_colourHunger =  _colourDead;};


			//Thirst
			_colourThirst = _colourDefault;
			switch true do
			{
				case(_thirst >= 100) : {_colourThirst = _colourDefault;};
				case((_thirst >= 90) && (_thirst < 100)) :  {_colourThirst =  _colour90;};
				case((_thirst >= 80) && (_thirst < 90)) :  {_colourThirst =  _colour80;};
				case((_thirst >= 70) && (_thirst < 80)) :  {_colourThirst =  _colour70;};
				case((_thirst >= 60) && (_thirst < 70)) :  {_colourThirst =  _colour60;};
				case((_thirst >= 50) && (_thirst < 60)) :  {_colourThirst =  _colour50;};
				case((_thirst >= 40) && (_thirst < 50)) :  {_colourThirst =  _colour40;};
				case((_thirst >= 30) && (_thirst < 40)) :  {_colourThirst =  _colour30;};
				case((_thirst >= 20) && (_thirst < 30)) :  {_colourThirst =  _colour20;};
				case((_thirst >= 10) && (_thirst < 20)) :  {_colourThirst =  _colour10;};
				case((_thirst >= 1) && (_thirst < 10)) :  {_colourThirst =  _colour0;};
				case(_thirst < 1) : {_colourThirst =  _colourDead;};
			};
			
			//Stamina
			_colourStamina = _colourDefault;
			if(_stamina >= 100) then{_colourstamina = _colourDefault;};
			if((_stamina >= 90) && (_stamina < 100)) then {_colourstamina =  _colour90;};
			if((_stamina >= 80) && (_stamina < 90)) then {_colourstamina =  _colour80;};
			if((_stamina >= 70) && (_stamina < 80)) then {_colourstamina =  _colour70;};
			if((_stamina >= 60) && (_stamina < 70)) then {_colourstamina =  _colour60;};
			if((_stamina >= 50) && (_stamina < 60)) then {_colourstamina =  _colour50;};
			if((_stamina >= 40) && (_stamina < 50)) then {_colourstamina =  _colour40;};
			if((_stamina >= 30) && (_stamina < 40)) then {_colourstamina =  _colour30;};
			if((_stamina >= 20) && (_stamina < 30)) then {_colourstamina =  _colour20;};
			if((_stamina >= 10) && (_stamina < 20)) then {_colourstamina =  _colour10;};
			if((_stamina >= 1) && (_stamina < 10)) then {_colourstamina =  _colour0;};
			if(_stamina < 1) then{_colourstamina =  _colourDead;};
			

			/*
							<t shadow='1' shadowColor='#000000' color='%9'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\compass.paa' color='%9'/> %11</t>
				<t size='1'shadow='1' shadowColor='#000000' color='%9'>[EU]Anônimos #%17 Wasteland %10</t>
				<t shadow='1' shadowColor='#000000' color='%9'>FPS: %7</t>	
			*/
			//display the information
			((uiNamespace getVariable "RscWastelandStatusBar")displayCtrl 55554) ctrlSetStructuredText
			parseText
			format
			["
				<t shadow='1' shadowColor='#000000' color='%9'><img size='1.6'  shadowColor='#000000' image='addons\statusbar\icons\players.paa' color='%9'/> %2</t>
				<t shadow='1' shadowColor='#000000' color='%12'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\health.paa' color='%9'/> %3%1</t>
				<t shadow='1' shadowColor='#000000' color='%9'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\money.paa' color='%9'/> %4</t>
				<t shadow='1' shadowColor='#000000' color='%13'><img size='1.6'  shadowColor='#000000' image='addons\statusbar\icons\hunger.paa' color='%9'/> %5%1</t>
				<t shadow='1' shadowColor='#000000' color='%14'><img size='1.6'  shadowColor='#000000' image='addons\statusbar\icons\thirst.paa' color='%9'/> %6%1</t>
				<t shadow='1' shadowColor='#000000' color='%16'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\running_man.paa' color='%9'/> %15</t>
				<t shadow='1' shadowColor='#000000' color='%9'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\atm.paa' color='%9'/> %8</t>
				<t shadow='1' shadowColor='#000000' color='%9'><img size='1.0'  shadowColor='#000000' image='addons\statusbar\icons\clock.paa' color='%9'/> %18</t>
				",

						"%",  
						count (allPlayers - entities "HeadlessClient_F"),  
						_damage,  
						_wallet,  
						_hunger,  
						_thirst,  
						_serverFPS,  
						_respect,  
						_colourDefault,
						_world,
						_dirstr,
						_colourDamage,
						_colourHunger,
						_colourThirst,
						_staminastr,
						_colourstamina,
						_serverNr,
						AJ_SERVERTIME_PUBVAR,
						(_moneyAmount *3)					
			];
			
			
			//display the information on left side
			((uiNamespace getVariable "RscWastelandStatusBar")displayCtrl 55562) ctrlSetStructuredText
			parseText
			format
			["
				<t size='1'shadow='1' shadowColor='#000000' color='%1'>[BR] Anônimos | <img size='1.0' shadowColor='#000000' image='territory\client\icons\territory_cap_white.paa' color='%1'/>$%2</t>
				<t shadow='1' shadowColor='#000000' color='%10'>FPS: %3</t>
				",
						_colourDefault,    
                        (_moneyAmount *3),
                        _serverFPS						
			];
				
		};
	};
};

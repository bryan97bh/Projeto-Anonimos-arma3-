//	@file Version: 1.0
//	@file Name: HvD.sqf
//	@file Author: Based on HvT.sqf by Cael817, CRE4MPIE. Rewrite by LouD.
//	@file Info:

if (isDedicated) exitWith {};
waitUntil {!isNull player};
waitUntil {!isNil "playerSpawning" && {!playerSpawning}};

for "_i" from 0 to 1 step 0 do 
{
	_lsdInv = mf_inventory select 10; _lsd = _lsdInv select 1;
	_marInv = mf_inventory select 11; _mar = _marInv select 1;
	_cocInv = mf_inventory select 12; _coc = _cocInv select 1;
	_herInv = mf_inventory select 13; _her = _herInv select 1;
		
	_drugpile = _lsd + _mar + _coc + _her;
	_drugpileText = format ["%1", [_drugpile] call fn_numbersText];	
	
	//if (_lsd > 3 || _mar > 3 || _coc > 3 || _her > 3) then
	
	if (_drugpile > 2) then
		{
			_title  = "<t color='#ff0000' size='1.2' align='center'>Portando drogas! </t><br />";
			_name = format ["%1<br /> ",name player];     
			_text = "<t color='#FFFFFF' shadow='1' shadowColor='#000000' align='center'>Você foi spotado no mapa portando drogas </t><br />";     
			hint parsetext (_title +  _name +  _text); 
			playsound "Topic_Done";

			_markerName = format ["%1_drugMarker",name player];     
			_drugMarker = createMarker [_markerName, getPos (vehicle player)];
			_drugMarker setMarkerShape "ICON";
			//_drugMarker setMarkerText (format ["Portando drogas: %1", name player]);
			_drugMarker setMarkerText (format ["Portando (%1) drogas: %2", _drugpileText, name player]);
			_drugMarker setMarkerColor "ColorRed";
			_drugMarker setMarkerType "mil_dot";
			sleep 10;
			deleteMarker _markerName;
		};
}; //will run infinitely
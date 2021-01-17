disableSerialization;
_dsp = uiNamespace getVariable [ "RscDisplayserverinfomenu7", displayNull ];
if not ( isNull _dsp ) then
{
   _ctrlMenu = _dsp displayCtrl 7;
   _cn = _ctrlMenu lbData ( lbCurSel _ctrlMenu );
   _ctrlContentTitle = _dsp displayCtrl 8;
   _ctrlContentTitle ctrlSetStructuredText parseText ( getText ( missionConfigFile >> "Cfgserverinfomenu7" >> "menuItems" >> _cn >> "title" ) );
   _ctrlContent = _dsp displayCtrl 9;
   _ctrlContent ctrlSetStructuredText parseText "";
   _ca = getArray ( missionConfigFile >> "Cfgserverinfomenu7" >> "menuItems" >> _cn >> "content" );
   _cntnt = "";
   { // Build the content
      _cntnt = _cntnt + _x;
   } forEach _ca;
   _ctrlContent ctrlSetStructuredText parseText _cntnt;
   _ctrlContentPos = ctrlPosition _ctrlContent;
   _ctrlContent ctrlSetPosition [ ( _ctrlContentPos select 0 ), ( _ctrlContentPos select 1 ), ( _ctrlContentPos select 2 ), ( ctrlTextHeight _ctrlContent ) ];
   _ctrlContent ctrlCommit 0;
} else { systemChat "handleContent: isNull _dsp" };

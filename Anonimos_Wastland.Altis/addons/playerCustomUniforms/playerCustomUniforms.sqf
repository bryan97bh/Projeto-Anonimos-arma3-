if (!hasInterface) exitWith {};  // DO NOT DELETE THIS LINE!

_playerCustomUniforms =
[
	[ // RA
		[
			//"76561198092314271", //<[RA] Codigo>
			//"76561198157312258", //<[RlA] Cap  Batista>
			//"76561198027682212", //<[RA] 2°Sgt Sniperjoel>
			//"76561198087974566", //<[RA] 2ºSgt Dpaulla>
			//"76561198152823076", //<[R] Negri>
			//"76561198157040893", //<[R]755cardosopower>
			//"76561198329736745", //<[RA] Sd  Benther>
			//"76561198332507924", //<[RA] Sd D.Oliveira>
			//"76561198100776009", //<[RA] Sd Gui_bocão>
			//"76561198111387070", //<[RA] Sd Rappa>
			//"76561198252975849", //<[RA] Sd Ferreira>
			//"76561198060065964", //BRYAN 
			//"76561198330751305"  //<Funeral>
		],
		[
			["GUER","U_I_CombatUniform_shortsleeve","addons\playerCustomUniforms\textures\an_1.jpg"]
		]
	],
	[ // KOBK
		[
			//"76561196666666666", //<USERNAME>
			//"76561197777777777"  //<USERNAME>
		],
		[
			["GUER","U_I_CombatUniform","addons\playerCustomUniforms\textures\11_I.jpg"]
		]
	],
	[ // G4
		[
			//"76561198888888888", //<USERNAME>
			//"76561199999999999"  //<USERNAME>
		],
		[
			["GUER","U_I_CombatUniform","addons\playerCustomUniforms\textures\11_I.jpg"]
		]
	]
];

/*	------------------------------------------------------------------------------------------
	DO NOT EDIT BELOW HERE!
	------------------------------------------------------------------------------------------	*/

SL_customUniformCheck = {
	_hasCustomUniform = player getVariable ["U_I_CombatUniform_shortsleeve",false];
	if (_hasCustomUniform) exitWith
	{
		waitUntil {uiSleep 0.1; !(player getVariable ["playerSpawning", true]);};
		if ((uniform player == SL_customUniformClassWEST) && ((str (side player)) == "WEST")) then
		{
			player setObjectTextureGlobal [0,SL_customUniformTextureWEST];
		};
		if ((uniform player == SL_customUniformClassEAST) && ((str (side player)) == "EAST")) then
		{
			player setObjectTextureGlobal [0,SL_customUniformTextureEAST];
		};
		if ((uniform player == SL_customUniformClassGUER) && ((str (side player)) == "GUER")) then
		{
			player setObjectTextureGlobal [0,SL_customUniformTextureGUER];
		};
	};
};
	
if !(_playerCustomUniforms isEqualTo []) then
{
	{
		_groupUIDs = _x select 0;
		if ((getPlayerUID player) in _groupUIDs) exitWith
		{
			diag_log format ["[PLAYER CUSTOM UNIFORMS] -> UID %1 FOUND, APPLIED CUSTOM UNIFORM DATA TO %2.",(getPlayerUID player),(name player)];
			player setVariable ["U_I_CombatUniform_shortsleeve",true,false];
			_customUniformClassList = _x select 1;
			{
				_customUniformSide = _x select 0;
				switch (_customUniformSide) do
				{
					case "WEST": {
						SL_customUniformClassWEST = _x select 1;
						SL_customUniformTextureWEST = _x select 2;
						};
					case "EAST": {
						SL_customUniformClassEAST = _x select 1;
						SL_customUniformTextureEAST = _x select 2;
						};
					case "GUER": {
						SL_customUniformClassGUER = _x select 1;
						SL_customUniformTextureGUER = _x select 2;
						};
				};
			} forEach _customUniformClassList;
			player addEventHandler ["Take", {
				_unit = _this select 0;
				_container = _this select 1;
				_item = _this select 2;
				if ((_item == SL_customUniformClassWEST) && (uniform _unit == SL_customUniformClassWEST) && ((str (side _unit)) == "WEST")) then
				{
					_unit setObjectTextureGlobal [0,SL_customUniformTextureWEST];
				};
				if ((_item == SL_customUniformClassEAST) && (uniform _unit == SL_customUniformClassEAST) && ((str (side _unit)) == "EAST")) then
				{
					_unit setObjectTextureGlobal [0,SL_customUniformTextureEAST];
				};
				if ((_item == SL_customUniformClassGUER) && (uniform _unit == SL_customUniformClassGUER) && ((str (side _unit)) == "GUER")) then
				{
					_unit setObjectTextureGlobal [0,SL_customUniformTextureGUER];
				};
			}];
			[] spawn SL_customUniformCheck;
		};
	} forEach _playerCustomUniforms;
};
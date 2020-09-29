if (!hasInterface) exitWith {};  // DO NOT DELETE THIS LINE!

_playerCustomUniforms =
[
	[ // aleatorios 
		[
			"76561198073156695",  //guy fawkes
			"76561198157312258",  //<[RA] Cap  Batista>
			"76561198027682212",  //<[RA] 2°ten Sniperjoel>
			"76561198087974566",  //<[RA] 2ºSgt Dpaulla>
			"76561198092314271",  //<[RA] Codigo>
			//"76561198332507924", //<[RA] Sd D.Oliveira>
			"76561198100776009",  //<[RA] Sd Gui_bocão>
			"76561198111387070",  //<[RA] Sd Rappa>
			"76561198252975849",  //<[RA] Sd Ferreira>
			"76561198157040893",  //<[RA] sd 755cardosopower>
			"76561198152823076",  //<[RA] sd Negri>
			"76561198164537056",  //<[RA] Sd França SS
			"76561198319660200",  //<[RA] Sd Bomfim
			"76561198835543767",  //<[RA] Sd Mario
			"76561198279017971",  //<[RA] Sd Simo Hayha
			"76561197978867972",  //<[RA] Sd Cordeiro
			"76561198216066545",  //<[RA] Menegusso>
			"76561198057291104",  //<[RA] Martins>
			"76561198256683401",  //<[RA] Sd Souza
			"76561198425527927",  //jon
			"76561198300714399",  //Viniciuus.lcs
			"76561198825211624",  //Nascimento
			"76561198811166180", //Felipe Andreola 
			"76561198011943505"  //Tho+
		],  
		[
			["GUER","U_I_CombatUniform_shortsleeve","addons\playerCustomUniforms\textures\an_1.jpg"]
		]
	],
	[ // [CTMBR]
		[
			"76561198201844818", //[CTMBR] Dracula
			"76561198070424261", //[CTMBR] bioga
			"76561198343865767", //[CTMBR] WhiteCaT
			"76561198176174925", //[CTMBR] --BIEL--
			"76561198060065964", //[CTMBR] BRYAN
			"76561198014855920", //[CTMBR] marechal
			"76561198321878481"  //[CTMBR] xavier
		],
		[
			["GUER","U_I_CombatUniform_shortsleeve","addons\playerCustomUniforms\textures\19_U.jpg"]
		]
	],
	[ // bope
		[
			"76561198062643926", //josei
			"76561198305612921", //kowalsk
			"76561198394566682", //Raimundo
			"76561198135009641", //sr.smack
			"76561198047686023"  //delroy
		],
		[
			["GUER","U_I_CombatUniform_shortsleeve","addons\playerCustomUniforms\textures\24_O.jpg"]
		]
	],
	[ // UNICO
		[ 
			"76561198135910862"  //gtl_BR
		],
		[
			["GUER","U_I_CombatUniform_shortsleeve","addons\playerCustomUniforms\textures\18_u.jpg"]
		]
	],
	[ //UNICO
		[
			"76561198332507924" //<pororoca voadora>
		],
		[
			["GUER","U_I_CombatUniform_shortsleeve","addons\playerCustomUniforms\textures\8_I.jpg"]
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
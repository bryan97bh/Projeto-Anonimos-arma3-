if (!hasInterface) exitWith {};  

_playerCustomUniforms =
[
	[ // [RA]
		[
			"76561198157312258",  //<[RA] Cap  Batista>
			//"76561198092314271",  //<[RA] Codigo>
			"76561198157040893",  //<[RA] sd 755cardosopower>
			//"76561198319660200",  //<[RA] Sd Bomfim
			"76561198835543767",  //<[RA] Sd Mario
			"76561197978867972",  //<[RA] Sd Cordeiro
			"76561198216066545",  //<[RA] Menegusso>
			//"76561198825211624",  //Nascimento
			//"76561198027682212",  //<[RA] 2°ten Sniperjoel>
			//"76561198087974566",  //<[RA] 2ºSgt Dpaulla>
		    //"76561198332507924",  //<[RA] Sd D.Oliveira>
			"76561198100776009",  //<[RA] Sd Gui_bocão>
			"76561198111387070",  //<[RA] Sd Rappa>
			//"76561198152823076",  //<[RA] sd Negri>
			"76561198164537056",  //<[RA] Sd França SS
			//"76561198279017971",  //<[RA] Sd Simo Hayha
			//"76561198057291104",  //<[RA] Martins>
			//"76561198256683401",  //<[RA] Sd Souza
			"76561198060065964",  // BRYAN
			"76561198343865767"  // WhiteCaT
			//"76561198321878481",  // xavier
			//"76561198201844818",  // Dracula
			//"76561197964189306"   // RONALDO
		],
		[
			["GUER","U_I_CombatUniform_shortsleeve","addons\playerCustomUniforms\textures\15ra.paa"]
		]
	],
	[ // [GEIB]
		[
			//"76561198328745152",  //Mano2
			"76561197973807596"  //Kryptus 
			/*"76561199027651724",  //MenorPet 
			"76561198416892378",  //Snipernambucano 
			"76561198396851044",  //Prof.Silva
			"76561198118710990",  //Lucas 
			"76561198285532898",  //CapiBoy 
			"76561198811166180",  //Felipe Andreola
			"76561198137948469",  //Jeferson 
			"76561198089933704",  //Markezini 
		    "76561198377304999",  //Daniel 
			"76561198988502730",  //Chuck Mawhinney
			"76561198200918322",  //Gabriel 
			"76561198795837766",  //TulioMSC 
			"76561198397121225"   //CobraCriada*/ 
		],
		[
			["GUER","U_I_CombatUniform_shortsleeve","addons\playerCustomUniforms\textures\15ra.paa"]
		]
	],
	[ // skin server an 
		[
			"76561198117917952", //jb
			"76561198158853539", //trex amigo jb 
			"76561198117587693", //[-SaS-] WecTy amigo jb 
			"76561198119668279", //xBlackHalo amigo jb  
			"76561198993657162", //bruno
			"76561198321527812", //NAVARRO
			"76561198139222243", //SnowBall
			"76561198395275888"  //DANTAS
			//"76561198073156695"  //guy fawkes
		],  
		[
			["GUER","U_I_CombatUniform_shortsleeve","addons\playerCustomUniforms\textures\gratis.paa"]
		]
	]
];


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
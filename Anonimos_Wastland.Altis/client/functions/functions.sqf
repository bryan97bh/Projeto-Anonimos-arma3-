Getloadout={
_gear = [];
	_headgear = headgear player;
	_back_pack = backpack player;
	_back_pack_items = getItemCargo (unitBackpack player);
	_back_pack_weap = getWeaponCargo (unitBackpack player);
	_back_pack_maga = getMagazineCargo (unitBackpack player);


	_gear =
	[
		_headgear,
		_back_pack,
		_back_pack_items,
		_back_pack_weap,
		_back_pack_maga
	];
	_gear

};

Setloadout={
_unit = _this select 0;
    _gear = _this select 1;
    removeheadgear _unit;
    removeBackPack _unit;
    if ((_gear select 1) != "") then {
        _unit addBackPack (_gear select 1);
        if (["B_AssaultPack_", (_gear select 1)] call fn_startsWith) then
        {
            //_unit addItemToBackpack "Binocular";
            //hint format ["binocular add"];
        };
    };
    if ((_gear select 0) != "") then {_unit addHeadgear (_gear select 0);};
};

Frontpack={
	_pack = unitBackpack _target;
	_class = typeOf _pack;

	[_target,_class] spawn {
		private ["_target","_class","_packHolder"];
		_target	= _this select 0;
		_class 	= _this select 1;

		_packHolder = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"];
		_packHolder addBackpackCargo [_class, 1];
		_packHolder attachTo [_target,[0.1,0.56,-.72],"pelvis"];
		_target setvariable ["frontpack", _packHolder,true];
		_packHolder setVectorDirAndUp [[0,1,0],[0,0,-1]];

		waitUntil {animationState _target == "para_pilot"};
		_packHolder attachTo [vehicle _target,[0.1,0.72,0.52],"pelvis"];
		_packHolder setVectorDirAndUp [[0,0.1,1],[0,1,0.1]];
		};
};
/*

	Author: RobérioJr

*/

Private _Infos = GetArray(MissionConfigFile >> "RJ_Configs" >> "RJ_Doadores");

If ((Count _Infos) IsEqualTo 0) ExitWith {};

Private _Uid = GetPlayerUID Player;

Private _Index = _Infos FindIf {(_X Select 0) IsEqualTo _Uid};

If (_Index IsEqualTo -1) ExitWith {Call RJ_fnc_LoadoutPadrao}; //Não doador

RemoveHeadgear Player;

Private _RoupasArray = (_Infos Select _Index) Select 1;
Private _ArmasArray = (_Infos Select _Index) Select 2;
Private _ItemsArray = (_Infos Select _Index) Select 3;

If !((_RoupasArray Select 0) IsEqualTo "") Then {Player ForceAddUniform (_RoupasArray Select 0)};
If !((_RoupasArray Select 1) IsEqualTo "") Then {Player AddVest (_RoupasArray Select 1)};
If !((_RoupasArray Select 2) IsEqualTo "") Then {Player AddHeadGear (_RoupasArray Select 2)};
If !((_RoupasArray Select 3) IsEqualTo "") Then {Player AddGoggles (_RoupasArray Select 3)};
If !((_RoupasArray Select 4) IsEqualTo "") Then {Player addBackpack  (_RoupasArray Select 4)};

Private _QtdArmas = Count _ArmasArray;

If (_QtdArmas > 0) Then {
	For "_i" From 0 To _QtdArmas Do {
		Player AddWeapon ((_ArmasArray Select _i) Select 0);
		For "_k" From 1 To ((_ArmasArray Select _i) Select 2) Do {player AddMagazine ((_ArmasArray Select _i) Select 1)};
	};
};

Private _QtdItems = Count _ItemsArray;

Private _ClassItem = "";

If (_QtdItems > 0) Then {
	For "_i" From 0 To _QtdItems Do {
		For "_k" From 1 To ((_ItemsArray Select _i) Select 1) Do {
			_ClassItem = (_ItemsArray Select _i) Select 0;
			If (_ClassItem In ["ItemGPS","ItemCompass","ItemMap","ItemWatch"]) Then {
				Player LinkItem _ClassItem;
			} Else {
				Player AddItem _ClassItem;
			};
		};
	};
};
// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: healSelf.sqf
//	@file Author: Anônimos (initial), Lodac 
//	@file Created: unknown

switch (true) do
{
	case ("FirstAidKit" in (items player)):
	{
		player removeItem "FirstAidKit";

		if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then 
		{
			player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		};

		player setDamage 0;
	};

	case ("Medikit" in (items player)):
	{
		if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then 
		{
			player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		};

		player setDamage 0;
	};

	case (!("Medikit" in (items player)) || !("FirstAidKit" in (items player))):
	{
		[format["<t size='0.75' color='#ffff00'>Necessário Kit ou Estojo de primeiros socorros</t>"], 0,1,5,0,0,301] spawn bis_fnc_dynamicText;
	};
};
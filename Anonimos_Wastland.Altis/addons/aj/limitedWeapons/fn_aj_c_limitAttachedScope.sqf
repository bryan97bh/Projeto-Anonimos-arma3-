scriptName "fn_aj_c_limitAttachedScope";
/*--------------------------------------------------------------------
	file: limitAttachedScope.sqf
	============================
	Author: Anônimos
	Modified by: Anônimos
	Description: Verifica se um escopo limitado está sendo usado e o desanexa.
	Parameter(s):
	Returns:
--------------------------------------------------------------------*/
#define __filename "fn_aj_c_limitAttachedScope.sqf"

_limitedScopeWeaponsArray = [
"arifle_Mk20C_plain_F",
"arifle_Mk20C_F",
"arifle_Mk20_plain_F",
"arifle_Mk20_F",
"arifle_Mk20_GL_plain_F",	
"arifle_Mk20_GL_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"arifle_TRG21_GL_F",
"arifle_SPAR_01_blk_F",
"arifle_SPAR_01_khk_F",
"arifle_SPAR_01_snd_F",
"arifle_SPAR_01_GL_blk_F",
"arifle_SPAR_01_GL_khk_F",
"arifle_SPAR_01_GL_snd_F",
"arifle_CTAR_blk_F",
"arifle_CTAR_ghex_F",
"arifle_CTAR_hex_F",
"arifle_CTAR_GL_blk_F",
"arifle_CTAR_GL_ghex_F",
"arifle_CTAR_GL_hex_F",
"arifle_Katiba_C_F",
"arifle_Katiba_F",
"arifle_Katiba_GL_F",
"arifle_MXC_Black_F",
"arifle_MXC_khk_F",
"arifle_MXC_F",
"arifle_MX_Black_F",
"arifle_MX_khk_F",
"arifle_MX_F",
"arifle_MX_GL_Black_F",
"arifle_MX_GL_khk_F",
"arifle_MX_GL_F",
"arifle_MSBS65_F",
"arifle_MSBS65_black_F",
"arifle_MSBS65_camo_F",
"arifle_MSBS65_sand_F",
"arifle_MSBS65_GL_F",
"arifle_MSBS65_GL_black_F",
"arifle_MSBS65_GL_camo_F",
"arifle_MSBS65_GL_sand_F",
"arifle_MSBS65_UBS_F",
"arifle_MSBS65_UBS_black_F",
"arifle_MSBS65_UBS_camo_F",
"arifle_MSBS65_UBS_sand_F",
"arifle_AK12U_F",
"arifle_AK12U_lush_F",
"arifle_AK12U_arid_F",
"arifle_AK12_F",
"arifle_AK12_lush_F",
"arifle_AK12_arid_F",
"arifle_AK12_GL_F",
"arifle_AK12_GL_luch_F",
"arifle_AK12_GL_arid_F",
"arifle_ARX_blk_F",
"arifle_ARX_ghex_F",
"arifle_ARX_hex_F",
"LMG_Zafir_F",
"LMG_Zafir_pointer_F",
"LMG_Zafir_ARCO_F",
"LMG_Mk200_F",
"LMG_Mk200_LP_BI_F",
"LMG_Mk200_BI_F",
"LMG_Mk200_MRCO_F",
"LMG_Mk200_pointer_F",
"MMG_01_hex_F",         //Navid
"MMG_01_tan_F",         //Navid
"MMG_01_hex_ARCO_LP_F", //Navid
"MMG_02_camo_F",        //SPMG
"MMG_02_black_F",       //SPMG
"MMG_02_sand_F",        //SPMG
"MMG_02_sand_RCO_LP_F", //SPMG
"MMG_02_black_RCO_BI_F",//SPMG
"arifle_MX_SW_F",
"arifle_MX_SW_pointer_F",
"arifle_MX_SW_Hamr_pointer_F",
"arifle_MX_SW_Black_F",
"arifle_MX_SW_Black_Hamr_pointer_F",
"arifle_MX_SW_khk_F",
"arifle_SPAR_02_blk_F",
"arifle_SPAR_02_khk_F",
"arifle_SPAR_02_snd_F",
"LMG_03_F",
"arifle_CTARS_blk_F",
"arifle_CTARS_ghex_F",
"arifle_CTARS_hex_F",
"arifle_RPK12_F",
"arifle_RPK12_arid_F",
"arifle_RPK12_lush_F"
];

_disallowedScopes = [
	"optic_KHS_tan", //Kahilia
	"optic_KHS_old", //Kahilia
	"optic_KHS_hex", //Kahilia
	"optic_KHS_blk", //Kahilia
	"optic_AMS_snd", //AMS
	"optic_AMS_khk", //AMS
	"optic_AMS", //AMS
	"optic_SOS", //SOS
	"optic_SOS_khk_F",
	"optic_LRPS", //LPRS
	"optic_LRPS_ghex_F",
	"optic_LRPS_tna_F",
	"optic_DMS", //DMS
	"optic_DMS_ghex_F",
	"optic_DMS_weathered_F",
	"optic_DMS_weathered_Kir_F"
];

if(primaryWeapon player in _limitedScopeWeaponsArray) then {
	{
		if(_x in primaryWeaponItems player) then {
			player removePrimaryWeaponItem _x;
			if ([player, _x] call fn_fitsInventory) then
				{
					[player, _x] call fn_forceAddItem;
				}
		};
	} forEach _disallowedScopes;
};


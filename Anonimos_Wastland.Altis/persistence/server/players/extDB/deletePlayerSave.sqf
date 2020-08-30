// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: deletePlayerSave.sqf
//	@file Author: AgentRev

if (["A3W_extdb_playerSaveCrossMap"] call isConfigOn) then
{
	[format ["deletePlayerSaveXMap:%1:%2", _this, ["A3W_extdb_Environment", "normal"] call getPublicVar]] call extdb_Database_async;
}
else
{
	[format ["deletePlayerSave:%1:%2", _this, call A3W_extdb_MapID]] call extdb_Database_async;
};

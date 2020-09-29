scriptName "fn_aj_s_initZeus";
// @file Name: fn_aj_s_initZeus.sqf
// @file Author: Anônimos Brasil

if (isServer) then 
	{

	//load Zeus now - no variables available at pre-init - so do it from scratch
	if (loadFile ("\A3Wasteland_settings\zeus.sqf") != "") then
		{
		diag_log "A3W:Arquivo de Configuração Zeus encontrado";
		call compile preprocessFileLineNumbers ("\A3Wasteland_settings\zeus.sqf");
		}
	else
		{
		//Player UID examples :
		"76561198060065964" //bryan
		}
		// Zeus Admins
		zeusAdmins = 
		[
		// Put player UIDs here
		"76561198060065964" //bryan
		];
		diag_log "A3W:Zeus - Arquivo externo de configuração Zeus não encontrado";
		};

	if (typeName zeusAdmins == "ARRAY") then
		{ 
		zeusAdmins = compileFinal str zeusAdmins 
		};

	publicVariable "zeusAdmins";
	
	_zeusAdminList =  call zeusAdmins;
	
	    // Create Zeus Module if zeusAdmins are defined
	if (count _zeusAdminList > 0 && isNil "aj_var_centerSideLogic_Zeus") then
		{
		aj_var_centerSideLogic_Zeus = createCenter sideLogic; publicVariable "aj_var_centerSideLogic_Zeus";  //Create game side for Zeus
		aj_var_groupSideLogic_Zeus = createGroup aj_var_centerSideLogic_Zeus; publicVariable "aj_var_groupSideLogic_Zeus";  //Create group for Zeus
			
			//now create the curators for all zeusAdmins
		   {       
		   Call Compile Format ["aj_var_modulezeus%1 = aj_var_groupSideLogic_Zeus createUnit ['ModuleCurator_F',[0,0,0] , [], 0, ''];",_x];
		   Call Compile Format ["aj_var_moduleZeus%1 setVariable ['showNotification', false, true];",_x];
		   Call Compile Format ["aj_var_moduleZeus%1 setVariable ['birdType', '', true];",_x];
		   Call Compile Format ["aj_var_moduleZeus%1 setVariable ['Owner', '%1', true];",_x];
		   Call Compile Format ["aj_var_moduleZeus%1 setVariable ['Addons', 3, true];",_x];
		   Call Compile Format ["aj_var_moduleZeus%1 setVariable ['Forced', 0, true];",_x];
		   Call Compile Format ["publicVariable 'aj_var_moduleZeus%1'; ",_x];
		   }
		   forEach _zeusAdminList;
		};	
};
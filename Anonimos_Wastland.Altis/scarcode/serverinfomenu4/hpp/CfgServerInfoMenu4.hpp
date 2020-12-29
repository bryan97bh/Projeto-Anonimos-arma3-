class CfgServerInfoMenu4
{
   addAction = 0; // Enable/disable action menu item | use 0 to disable | default: 1 (enabled)
   antiHACK = "infiSTAR + BattlEye";
   hostedBy = "ANÔNIMOS";
   ipPort = "Server Altis";
   openKey = "User7"; // https://community.bistudio.com/wiki/inputAction/actions
   openAtLogin = no;
   restart = 6; // Amount of hours before server automatically restarts
   serverName = "EM BREVE";
   class menuItems
   {
      // title AND content accept formatted text ( since update Oct5.2016 )
	  class first
      {
         menuName = "EM BREVE";
         title = "Informações do server <t color='#9370DB'>ANÔNIMOS</t></t><br />";
         content[] = {
            ,
         "------------------------------------------------------------------------------------------------------------<br />", 
         "------------------------------------------------------------------------------------------------------------<br />",
         "------------------------------------------------------------------------------------------------------------<br />",
         "------------------------------------------------------------------------------------------------------------<br />",
         "------------------------------------------------------------------------------------------------------------<br />",
			"PRESSIONE ESC PARA SAIR"
         }; 
      };
   };
};
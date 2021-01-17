class CfgServerInfoMenu3
{
   addAction = 0; // Enable/disable action menu item | use 0 to disable | default: 1 (enabled)
   antiHACK = "infiSTAR + BattlEye";
   hostedBy = "ANÔNIMOS";
   ipPort = "Server Altis";
   openKey = "User7"; // https://community.bistudio.com/wiki/inputAction/actions
   openAtLogin = no;
   restart = 6; // Amount of hours before server automatically restarts
   serverName = "MODS";
   class menuItems
   {
      // title AND content accept formatted text ( since update Oct5.2016 )
	  class first
      {
         menuName = "ANÔNIMOS SERVER";
         title = "MODS <t color='#9370DB'>ANÔNIMOS</t></t><br />";
         content[] = {
            ,
         "MODS DO SERVER<br />",
         "!!!ATENÇÃO!!!<br />",
         "NOSSO SERVER POSSUI DIVERSOS MODS E ELES DÃO VANTAGENS PARA OS JOGADORES QUE FAZER O USO<br />",
         "OS MODS NÃO SÃO OBRIGATÓRIOS SÃO DE USO OPCIONAL<br />",
         "SEGUE ALGUMAS DICAS DE MODS QUE VC PODE USAR EM NOSSO SERVIDOR<br />",
         "------------------------------------------------------------------------------------------------------------<br />", 
         "EFEITO VISUAL<br />",
         "Blastcore Edited (standalone version) -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=767380317'>BAIXAR</a></t><br /><br />",
         "Enhanced Missile Smoke -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=1484261993'>BAIXAR</a></t><br /><br />",
         "ArmaFXP -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=1105511475'>BAIXAR</a></t><br /><br />",
         "Sullen Skies -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=939160383'>BAIXAR</a></t><br /><br />",
         "Reduced Haze Mod v3.1 -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=1397683809'>BAIXAR</a></t><br /><br />",
         "------------------------------------------------------------------------------------------------------------<br />",
         "EFEITO SONORO<br />",
         "DynaSound -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=588114175'>BAIXAR</a></t><br /><br />",
         "------------------------------------------------------------------------------------------------------------<br />",
         "MOVIMENTAÇAO/PULO DE MURO/ESCALADA<br />",
         "Enhanced Movement -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=333310405'>BAIXAR</a></t><br /><br />",
         "------------------------------------------------------------------------------------------------------------<br />",
         "CBA_A3 -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=450814997'>BAIXAR</a></t><br /><br />",
         "HMDs MOD -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=312724602'>BAIXAR</a></t><br /><br />",
         "------------------------------------------------------------------------------------------------------------<br />",
         //"Real Engine -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=2127693591'>BAIXAR</a></t><br /><br />",
         //"JSRS SOUNDMOD -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=861133494'>BAIXAR</a></t><br /><br />",
         //"task_force_radio -> <t color='#0091CD'><a href='https://steamcommunity.com/sharedfiles/filedetails/?id=620019431'>BAIXAR</a></t><br /><br />",
         //"Obs: task_force_radio exige mod CBA_A3 para funcionar<br />",
			
			"PRESSIONE ESC PARA SAIR"
         }; 
      };
   };
};
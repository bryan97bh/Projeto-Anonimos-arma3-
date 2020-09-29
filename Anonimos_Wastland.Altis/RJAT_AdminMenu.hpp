/*

    Author: RobérioJr

*/

class RJAT_RscBotao {
	offsetPressedX = 0.01;
	offsetPressedY = 0.01;
	offsetX = 0.01;
	offsetY = 0.01;
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
};

class RJAT_RscListBox {
	colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
	class ListScrollBar
	{
		color[] = {1,1,1,1};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class RJAT_AdminMenu
{
	idd = 1500;
	
	class ControlsBackground
	{
		class Fundo
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * -0.01855468;
			y = safeZoneY + safeZoneH * -0.03472222;
			w = safeZoneW * 1.03710938;
			h = safeZoneH * 1.078125;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.5};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Titulo
		{
			type = 0;
			idc = 1501;
			x = safeZoneX + safeZoneW * 0.00097657;
			y = safeZoneY + safeZoneH * 0.01736112;
			w = safeZoneW * 1.03710938;
			h = safeZoneH * 0.03819445;
			style = 2;
			text = "RJ AdminTools\AntiHack - Ferramentas Administrativas";
			colorBackground[] = {0,0.5,1,0.95};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 1);
		};
		class Jogadores_Titulo
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.01074219;
			y = safeZoneY + safeZoneH * 0.06944445;
			w = safeZoneW * 0.109375;
			h = safeZoneH * 0.02777778;
			style = 2;
			text = "Jogadores";
			colorBackground[] = {0,0.5,1,0.9};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.9);
		};
		class Ferramentas_Titulo
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.12792969;
			y = safeZoneY + safeZoneH * 0.06944445;
			w = safeZoneW * 0.12890625;
			h = safeZoneH * 0.02777778;
			style = 2;
			text = "Ferramentas";
			colorBackground[] = {0,0.5,1,0.9};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.9);
		};
		class Console_Titulo
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.69433594;
			y = safeZoneY + safeZoneH * 0.06944445;
			w = safeZoneW * 0.29492188;
			h = safeZoneH * 0.02777778;
			style = 2;
			text = "Console";
			colorBackground[] = {0,0.5,1,0.9};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.9);
		};
		class Barra_Inferior
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.72363282;
			y = safeZoneY + safeZoneH * 0.48611112;
			w = safeZoneW * 0.2265625;
			h = safeZoneH * 0.02777778;
			style = 2;
			text = "Controle Do Servidor";
			colorBackground[] = {0,0.5,1,0.9};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25)* 0.9);
		};
		class Spawn_Titulo
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.26464844;
			y = safeZoneY + safeZoneH * 0.06944445;
			w = safeZoneW * 0.1484375;
			h = safeZoneH * 0.02777778;
			style = 2;
			text = "Spawner";
			colorBackground[] = {0,0.5,1,0.9};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25)* 0.9);
		};
	};
	class Controls
	{
		class Player_List : RJAT_RscListBox 
		{
			type = 5;
			idc = 1502;
			x = safeZoneX + safeZoneW * 0.01074219;
			y = safeZoneY + safeZoneH * 0.10416667;
			w = safeZoneW * 0.109375;
			h = safeZoneH * 0.734375;
			style = 16;
			colorBackground[] = {0,0.5,1,0.8};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0.01;
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.72);
		};
		class Ferramentas_List : RJAT_RscListBox 
		{
			type = 5;
			idc = 1503;
			x = safeZoneX + safeZoneW * 0.12792969;
			y = safeZoneY + safeZoneH * 0.10416667;
			w = safeZoneW * 0.12890625;
			h = safeZoneH * 0.76909723;
			style = 16;
			colorBackground[] = {0,0.5,1,0.8};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0.015;
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.75);
		};
		class Edit_Console
		{
			type = 2;
			idc = 1504;
			x = safeZoneX + safeZoneW * 0.69433594;
			y = safeZoneY + safeZoneH * 0.10416667;
			w = safeZoneW * 0.29492188;
			h = safeZoneH * 0.31423612;
			style = 16;
			text = "Hint 'Isso Funciona!';";
			autocomplete = "scripting";
			colorBackground[] = {0,0.5,1,0.8};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelection[] = {1,1,1,1};
			colorText[] = {1,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.7);
		};
		class Local_Console : RJAT_RscBotao 
		{
			type = 1;
			idc = 1505;
			x = safeZoneX + safeZoneW * 0.85058594;
			y = safeZoneY + safeZoneH * 0.42534723;
			w = safeZoneW * 0.13867188;
			h = safeZoneH * 0.03645834;
			style = 0+2;
			text = "Executar Local";
			borderSize = 0;
			colorBackground[] = {0,0.5,1,0.95};
			colorBackgroundActive[] = {0,0.5,1,0.85};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.9);
		};
		class Server_Console : RJAT_RscBotao 
		{
			type = 1;
			idc = 1506;
			x = safeZoneX + safeZoneW * 0.69433594;
			y = safeZoneY + safeZoneH * 0.42534723;
			w = safeZoneW * 0.13867188;
			h = safeZoneH * 0.03645834;
			style = 0+2;
			text = "Executar Servidor";
			borderSize = 0;
			colorBackground[] = {0,0.5,1,0.95};
			colorBackgroundActive[] = {0,0.5,1,0.85};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.9);
		};
		class Trancar_Servidor : RJAT_RscBotao 
		{
			type = 1;
			idc = 1507;
			x = safeZoneX + safeZoneW * 0.72363282;
			y = safeZoneY + safeZoneH * 0.56423612;
			w = safeZoneW * 0.109375;
			h = safeZoneH * 0.03645834;
			style = 0+2;
			text = "Trancar Servidor";
			borderSize = 0;
			colorBackground[] = {0,0.5,1,0.95};
			colorBackgroundActive[] = {0,0.5,1,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.85);
		};
		class Reiniciar_Servidor : RJAT_RscBotao 
		{
			type = 1;
			idc = 1508;
			x = safeZoneX + safeZoneW * 0.84082032;
			y = safeZoneY + safeZoneH * 0.52083334;
			w = safeZoneW * 0.109375;
			h = safeZoneH * 0.03645834;
			style = 0+2;
			text = "Reiniciar Servidor";
			borderSize = 0;
			colorBackground[] = {0,0.5,1,1};
			colorBackgroundActive[] = {0,0.5,1,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.85);
		};
		class Desligar_Servidor : RJAT_RscBotao 
		{
			type = 1;
			idc = 1509;
			x = safeZoneX + safeZoneW * 0.84082032;
			y = safeZoneY + safeZoneH * 0.56423612;
			w = safeZoneW * 0.109375;
			h = safeZoneH * 0.03645834;
			style = 0+2;
			text = "Desligar Servidor";
			borderSize = 0;
			colorBackground[] = {0,0.5,1,0.95};
			colorBackgroundActive[] = {0,0.5,1,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.85);
		};
		class Destrancar_Servidor : RJAT_RscBotao 
		{
			type = 1;
			idc = 1510;
			x = safeZoneX + safeZoneW * 0.72363282;
			y = safeZoneY + safeZoneH * 0.52083334;
			w = safeZoneW * 0.109375;
			h = safeZoneH * 0.03645834;
			style = 0+2;
			text = "Destrancar Servidor";
			borderSize = 0;
			colorBackground[] = {0,0.5,1,0.95};
			colorBackgroundActive[] = {0,0.5,1,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.85);
		};
		class Atualizar_Jogadores : RJAT_RscBotao 
		{
			type = 1;
			idc = 1511;
			x = safeZoneX + safeZoneW * 0.01074219;
			y = safeZoneY + safeZoneH * 0.84201389;
			w = safeZoneW * 0.109375;
			h = safeZoneH * 0.03645834;
			style = 0+2;
			text = "Atualizar Lista";
			borderSize = 0;
			colorBackground[] = {0,0.5,1,0.95};
			colorBackgroundActive[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.9);
		};
		class Spawn_List : RJAT_RscListBox 
		{
			type = 5;
			idc = 1512;
			x = safeZoneX + safeZoneW * 0.26464844;
			y = safeZoneY + safeZoneH * 0.14756945;
			w = safeZoneW * 0.1484375;
			h = safeZoneH * 0.67361112;
			style = 16;
			colorBackground[] = {0,0.5,1,0.8};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0.015;
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.8);
		};
		class Spawn_Combo
		{
			type = 4;
			idc = 1513;
			x = safeZoneX + safeZoneW * 0.26464844;
			y = safeZoneY + safeZoneH * 0.82465278;
			w = safeZoneW * 0.1484375;
			h = safeZoneH * 0.046875;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0,0.5,1,0.8};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW/safezoneH)min 1.2)/1.2)/25) * 0.8);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
		};
		class Edit_Spawn
		{
			type = 2;
			idc = 1514;
			x = safeZoneX + safeZoneW * 0.26464844;
			y = safeZoneY + safeZoneH * 0.10416667;
			w = safeZoneW * 0.1484375;
			h = safeZoneH * 0.03645834;
			style = 0;
			text = "";
			autocomplete = "";
			colorBackground[] = {0,0.5,1,0.8};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelection[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
		};
	};
};

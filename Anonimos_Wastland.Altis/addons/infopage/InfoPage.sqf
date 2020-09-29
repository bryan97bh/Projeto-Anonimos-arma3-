// infoPage.sqf
// Based on a Script of CRE4MPIE
// Modified for AJ by wiking.at[AJ]

private _delay =  param [0, 30]; //default value 30


sleep _delay;   //delay before message is displayed 

_countteamsize = 1;
_moneyAmount = 60 * (count playableUnits);

if (side player in [BLUFOR,OPFOR] ) then
		{
		 _countteamsize = playerside countSide allUnits;
		}
		else
		{
		 _countteamsize = count units group player;
		};
		
		//less money the bigger the group is
			switch (_countteamsize) do {
				case 1: { _moneyAmount = ceil(_moneyAmount)};
				case 2: { _moneyAmount = ceil(_moneyAmount * 0.9)};
				case 3: { _moneyAmount = ceil(_moneyAmount * 0.9)};
				case 4: { _moneyAmount = ceil(_moneyAmount * 0.8)};
				case 5: { _moneyAmount = ceil(_moneyAmount * 0.8)};
				case 6: { _moneyAmount = ceil(_moneyAmount * 0.8)};
				case 7: { _moneyAmount = ceil(_moneyAmount * 0.7)};
				case 8: { _moneyAmount = ceil(_moneyAmount * 0.7)};
				case 9: { _moneyAmount = ceil(_moneyAmount * 0.7)};
				case 10: { _moneyAmount = ceil(_moneyAmount * 0.6)};
				case 11: { _moneyAmount = ceil(_moneyAmount * 0.6)};
				case 12: { _moneyAmount = ceil(_moneyAmount * 0.6)};
				case 13: { _moneyAmount = ceil(_moneyAmount * 0.5)};
				case 14: { _moneyAmount = ceil(_moneyAmount * 0.5)};
				case 15: { _moneyAmount = ceil(_moneyAmount * 0.5)};
				default  { _moneyAmount = ceil(_moneyAmount * 0.5)};
			};		
	
_text = "
<br />
<br />
<t align='left'><t size='1.2'><t shadow= 1 shadowColor='#000000'>Atalhos do Teclado:</t><br />
<br />
<t align='left'><img size='1.8' shadow = 0 image='addons\infopage\windows.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'>  Nome dos Jogadores</t><br />
<t align='left'><img size='1.8' shadow = 0 image='addons\infopage\end.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'>  Inserir/Remover Abafador</t><br />
<t align='left'><img size='1.8' shadow = 0 image='addons\infopage\v.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'>  Abrir/Cortar Paraquedas</t><br />
<t align='left'><img size='1.8' shadow = 0 image='addons\infopage\del.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'>  Ejeção de Emergência</t><br />
<br />
<br />
<t align='left'><t size='1.2'><t shadow= 1 shadowColor='#000000'>Entre em contato conosco pelo:</t><br />
<br />
<t align='left'><img size='1.7' shadow = 0 image='addons\infopage\discord.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'>   https://invite.gg/anonimos</t><br />
<t align='left'><img size='1.6' shadow = 0 image='addons\infopage\fb.paa'/></t><t align='left'><t size='1'><t shadow= 1 shadowColor='#000000'>    https://www.facebook.com/anonimosbrasil11</t><br />
<t align='center'><img size='7' shadow = 0 image='mapConfig\Loading.jpg'/></t>
<br />";

hint parseText format ["
<t align='center'>Welcome %2</t><br />
<t align='center'><t shadow= 1 shadowColor='#000000'><t size='1.2'><t color='#eda92a'>Anônimos Brasil %3</t>%1
<br /><t align='center'>Segurando 3 Territórios por 10 Mins = $%4</t>
",_text, name player, worldname,(_moneyAmount *3)];
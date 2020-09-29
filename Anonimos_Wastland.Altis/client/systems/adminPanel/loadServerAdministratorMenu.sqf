// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: loadServerAdministratorMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define adminMenu_option 50001
disableSerialization;

private ["_start","_panelOptions","_displayAdmin","_adminSelect"];
_uid = getPlayerUID player;
if ([_uid, 3] call isAdmin) then
 {
	_start = createDialog "AdminMenu";
	_displayAdmin = uiNamespace getVariable "AdminMenu";
	_adminSelect = _displayAdmin displayCtrl adminMenu_option;

	_panelOptions = 
	[				
					"Menu do Jogador para alvos (Observar/Destravar/TP/expulsar/matar/Remover dinheiro)",
					"Registro de marcação no mapa (Isso só funciona quando em jogo)",
					"Alternar Marcações de Veículos",
					"Alternar Mapa ESP",
					"Alternar ESP",
					"Ativar/desativar Modo Deus",
					"Ativar/desativar Modo Deus no veículo",
					"Ativar/desativar modo invisivel",
					"Teleportar no mapa",
	                "Destravar todos os objetos no raio de 60m de você",
	                "Deletar todos objetos destravados no raio de 60m de você",
	                "Retravar todos objetos no raio de 60m de você",
	                "Adicionar R$10 mil na mão",
	                "Gestão de Veículos (Checar/deletar veículos)",
	                "Procurar Objeto",
	                "Curar-se completamente",
	                "Deletar alvo apontado pelo cursor do mouse",
	                "Reparar alvo apontado pelo cursor do mouse",
	                "Suporte de Artilharia marcado no mapa",
	                "Ativar/desativar balas de foguetes",
	                "Carregar Menu Loja de Armas",
	                "Carregar Menu Loja Geral",
	                "Carregar Menu ATM",
	                "Alternar AI ESP",
	                "Alternar altura do terreno",
	                "Câmera Livre (Precione ESCAPE para sair!! NÃO precione F1)",
	                "Munição ilimitada"                
	];

	{
		_adminSelect lbAdd _x;
	} forEach _panelOptions;
};

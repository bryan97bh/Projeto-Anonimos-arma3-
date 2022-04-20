// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: briefing.sqf

if (!hasInterface) exitWith {};

_trimName = { _this select [1, count _this - 2] };
_aKeyName = { _arr = actionKeysNamesArray _this; if (count _arr == 0) exitWith {"<UNDEFINED>"}; _arr select 0 };

#define NKEYNAME(DIK) (keyName DIK call _trimName)
#define AKEYNAME(ACT) (ACT call _aKeyName)

waitUntil {!isNull player};

player createDiarySubject ["infos", "Informações e Ajuda"];
player createDiarySubject ["changelog", "Atualizações"];
player createDiarySubject ["credits", "Créditos"];

player createDiaryRecord ["changelog",
[
"v1.4d",
"
<br/> [Adicionado] SMD ADR-97;
<br/> [Adicionado] Opção de pintar veículos nas lojas;
<br/> [Adicionado] Filtro de armas para acessórios de armas;
<br/> [Adicionado] Ícones de aviso de captura de território no mapa;
<br/>  UAVs [fixos] Retirados da Garagem Virtual não podems ser conectados novamente;
<br/> [Corrigido] Outras pequenas alterações e correções;
"
]];

player createDiaryRecord ["changelog",
[
"v1.4c",
"
<br/> [Adicionado] DLC de tanques;
<br/> [Adicionado] Terceira coluna na loja de veículos para peças;
<br/> [Adicionado] Variantes de jato AA;
<br/> [Adicionado] Canhões HE para jatos que apenas usam armas;
<br/> [Adicionado] Lançadores de fumaça para assentos de motorista e artilheiro;
<br/> [Alterado] Todos os pinturas de veículos ocultas, agora disponíveis;
<br/> [Alterado] Caixa aprimorada e Apoio de suprimentos;
<br/> [Alterado] Alguns preços de loja;
<br/> [Corrigido] Erros de reabastecimento de Armas estáticas;
<br/> [Fixo] Venda de designadores a laser;
<br/> [Corrigido] Mais explorações de dinheiro;
<br/> [Corrigido] Outras pequenas alterações e correções;
"
]];

player createDiaryRecord ["changelog",
[
"v1.4b",
"
<br/> [Adicionado] Suporte de Artilharia nascem em caixass de missões aleatórias;
<br/> [Adicionado] Marcador do corpo do jogador;
<br/> [Adicionado] Equipamento de mergulho para o RHIB, lancha rápida, SDV comprado;
<br/> [Adicionado] Torre SDAR para atirador SDV;
<br/> [Adicionado] Capacidade de carregamento de objetos para SDV;
<br/> [Adicionado] Skins de Van e Gorgon da polícia Tac-Ops DLC;
<br/> [Adicionado] Capas de designadores a laser Apex DLC;
<br/> [Adicionado] Economia da opção 'Autônoma' para UAVs;
<br/> [Alterado] Espaço de armazenamento privado 4 vezes maior;
<br/> [Alterado] Permitir reboque de veículos pessoais bloqueados;
<br/> [Alterado] Permitir a compra de barcos em terra firme;
<br/> [Alterado] Desativação do carregamento de veículos trancados;
<br/> [Alterado] VANTs agora vendáveis;
<br/> [Alterado] Atribuição de morte aprimorada;
<br/> [Corrigido] Erro de reabastecimento para armas estáticas;
<br/> [Fixo] Ejeção de unidades feridas;
<br/> [Fixo] economia de propriedade do designador estático;
<br/> [Corrigido] Economia de conteúdo uniforme e itens de armas escondidos;
<br/> [Fixo] Desaparecendo veículos estacionados;
<br/> [Corrigido] Interruptor irritante para lançador de foguetes ao reviver;
<br/> [Fixo] Afogado em terra seca;
<br/> Redes de camuflagem [fixas] não salvando;
<br/> [Corrigido] Muitas pequenas alterações e correções;
"
]];

player createDiaryRecord ["changelog",
[
"v1.4",
"
<br/> [Adicionado] DLC de Laws of War;
<br/> [Adicionado] Killfeed HUD;
<br/> [Alterado] Sistema de recuperação aprimorado;
<br/> [Alterado] Atribuição de morte aprimorada;
<br/> [Alterado] Antihack aprimorado;
<br/> [Corrigido] Prone recarregar congelamento;
<br/> [Corrigido] Muitas pequenas alterações e correções;
"
]];

player createDiaryRecord ["changelog",
[
"v1.3c",
"
<br/> [Adicionado] DLC de jatos
<br/> [Adicionado] Porta-aviões em Stratis
<br/> [Adicionado] Reabastecer caminhões em Altis e Stratis
<br/> [Adicionado] Assistência ao motorista
<br/> [Alterado] Preços das aeronaves
<br/> [Alterado] Explosivos bloqueados perto de estacionamento e armazenamento
<br/> [Alterado] Sistema de salvamento migrado do extdb2 para o extdb3
<br/> [Corrigido] Explode rapidamente
<br/> [Corrigido] Poderia executar seu dever após ser revivido
<br/> [Corrigido] Outras pequenas alterações e correções
"
]];

player createDiaryRecord ["changelog",
[
"v1.3b",
"
<br/> [Adicionado] Garagem Virtual;
<br/> [Adicionado] Armário Virtual;
<br/> [Adicionado] Propriedade do veículo;
<br/> [Adicionado] Bloqueio de veículo;
<br/> [Adicionado] Venda de veículos;
<br/> [Adicionado] Salvamento de minas;
<br/> [Adicionado] caminhões de reabastecimento;
<br/> [Adicionado] CH Ver distância;
<br/> [Adicionado] Legenda do mapa;
<br/> [Adicionado] Persistência do lado do UAV;
<br/> [Adicionado] Limpeza sem servidor do servidor;
<br/> [Alterado] Designadores estáticos agora disponíveis para indies;
<br/> [Alterado] Alguns preços de loja;
<br/> [Corrigido] Muitas outras pequenas alterações e correções;
"
]];

player createDiaryRecord ["changelog",
[
"v1.3",
"

<br/> [Adicionado] Versão Tanoa;
<br/> [Adicionado] Conteúdo do Apex nas ramificações de desenvolvimento / visualização;
<br/> [Adicionado] Cargas explosivas pegajosas;
<br/> [Adicionado] Reboque pesado e transporte aéreo;
<br/> [Adicionado] Carga arrastada ferida amigável em veículos;
<br/> [Adicionado] Ejete carregado ferido amiga dos veículos;
<br/> [Adicionado] Estabilização automática quando carregado em veículo médico;
<br/> [Adicionado] Ação 'Finalizar' para matar inimigos feridos;
<br/> [Adicionado] Melhor detecção de unidade de feridos;
<br/> [Adicionado] Opção de persistência de placar para servidores;
<br/> [Adicionado] opção de headshots PvP fatais para servidores;
<br/> [Adicionado] Opção personalizada de mensagens de morte para servidores;
<br/> [ADded] Auto-center heli turret on fire manual;
<br/> [Adicionado] Persistência do lado do UAV;
<br/> [Adicionado] Mais texturas para alguns veículos na loja;
<br/> [Adicionado] Limpeza de quadricóptero abandonada;
<br/> [Adicionado] Mais registros do menu do administrador;
<br/> [Alterado] Dano reduzido de mísseis heli;
<br/> [Alterado] Pilha de missões aprimorada;
<br/> [Alterado] Colete valores de armadura na loja geral;
<br/> [Alterado] Maior flexibilidade de Mag Repack;
<br/> [Alterado] Desativado autônomo em designadores estáticos;
<br/> [Alterado] Chuva desativada devido à dessincronização do tempo;
<br/> [Corrigido] O engenheiro com kit de ferramentas agora pode sempre reparar;
<br/> [Corrigido] Bloqueio de mísseis aprimorado;
<br/> [Corrigido] Melhorias para eliminar o sistema de rastreamento;
<br/> [Corrigido] Itens e dinheiro não caindo no logout ferido;
<br/> [Corrigido] O cronômetro de log de combate não é redefinido na morte;
<br/> [Corrigido] O jogador nem sempre é expulso por lesão;
<br/> [Corrigido] Contagem dupla de mortes / mortes;
<br/> [Corrigido] Recargas de Spawn sendo reinicializadas;
<br/> [Fixo] Striders que aparecem sem baterias de laser;
<br/> [Corrigido] Chuva desativada devido a problemas de sincronização;
<br/> [Corrigido] Várias pequenas correções e otimizações;
"
]];

player createDiaryRecord ["changelog",
[
"v1.2b",
"
<br/>Conheça nosso DISCORD https://invite.gg/anonimos para mais informações e dicas!
"
]];


player createDiaryRecord ["credits",
[
"Créditos",
"
<br/><font size='16' color='#BBBBBB'>Modificado por Anônimos Brasil Servidores:</font>
<br/>
<br/><font size='16' color='#BBBBBB'>Desenvolvido por A3Wasteland.com:</font>
<br/>	* AgentRev (TeamPlayerGaming)
<br/>	* JoSchaap (GoT/Tweakers.net)
<br/>	* MercyfulFate
<br/>	* His_Shadow (KoS/KillonSight)
<br/>	* Bewilderbeest (KoS/KillonSight)
<br/>	* Torndeco
<br/>	* Del1te (404Games)
<br/>
<br/><font size='16' color='#BBBBBB'>Original das missões de Arma 2 Wasteland:</font>
<br/>	* Tonic
<br/>	* Sa-Matra
<br/>	* MarKeR
<br/>
<br/><font size='16' color='#BBBBBB'>Improved and ported to Arma 3 by 404Games:</font>
<br/>	* Deadbeat
<br/>	* Costlyy
<br/>	* Pulse
<br/>	* Domuk
<br/>
<br/><font size='16' color='#BBBBBB'>Outros contribuintes:</font>
<br/>	* 82ndab-Bravo17 (GitHub)
<br/>	* afroVoodo (Armaholic)
<br/>	* Austerror (GitHub)
<br/>	* AWA (OpenDayZ)
<br/>	* bodybag (Gameaholic.se)
<br/>	* Champ-1 (CHVD)
<br/>	* code34 (iniDBI)
<br/>	* Das Attorney (Jump MF)
<br/>	* Ed! (404Games forums)
<br/>	* Farooq (GitHub)
<br/>	* gtoddc (A3W forums)
<br/>	* HatchetHarry (GitHub)
<br/>	* Hub (TeamPlayerGaming)
<br/>	* k4n30 (GitHub)
<br/>	* Killzone_Kid (KillzoneKid.com)
<br/>	* Krunch (GitHub)
<br/>	* LouDnl (GitHub)
<br/>	* madbull (R3F)
<br/>	* Mainfrezzer (Magnon)
<br/>	* meat147 (GitHub)
<br/>	* micovery (GitHub)
<br/>	* Na_Palm (BIS forums)
<br/>	* Outlawled (Armaholic)
<br/>	* red281gt (GitHub)
<br/>	* RockHound (BierAG)
<br/>	* s3kShUn61 (GitHub)
<br/>	* Sa-Matra (BIS forums)
<br/>	* Sanjo (GitHub)
<br/>	* SCETheFuzz (GitHub)
<br/>	* Shockwave (A3W forums)
<br/>	* SicSemperTyrannis (iniDB)
<br/>	* SPJESTER (404Games forums)
<br/>	* spunFIN (BIS forums)
<br/>	* Tonic (BIS forums)
<br/>	* wiking.at (A3W forums)
<br/>	* xx-LSD-xx (Armaholic)
<br/>	* Zenophon (BIS Forums)
<br/>	* Batista (Resistência Armada)
<br/>	* Bryan97bh
<br/>	* RobérioJr
<br/><font size='16'>Muito obrigado a todos os envolvidos pela ajuda e inspiração!</font>
"
]];


player createDiaryRecord ["infos",
[
"Teclas de atalho do jogador",
"
<br/>Lista padrão dos atalhos dos jogadores:
<br/>
<br/>" + NKEYNAME(41) + " (abrir Menu do Jogador)
<br/>" + NKEYNAME(207) + " (inserir tampões de ouvido)
<br/>" + NKEYNAME(199) + ", " + NKEYNAME(219) + ", " + NKEYNAME(220) + " (mostra nomes dos amigos)
<br/>" + AKEYNAME("GetOver") + " (abrir paraquedas)
<br/>Shift + " + NKEYNAME(201) + " / " + NKEYNAME(209) + " (ajuste do óculos de visão noturna)

"
]];

player createDiaryRecord ["infos",
[
"Dicas e sugestões",
"
<br/><font size='16' color='#BBBBBB'>Tenha sempre ÓCULOS DE VISÃO NOTURNA no seu ARMÁRIO VIRTUAL</font>
<br/>
<br/>
<br/><font face='PuristaBold'>*</font> Bluefor joga junto como uma equipe. Não é permitido matar jogadores amigos, roubar suas coisas e/ou roubar veículos.
<br/>
<br/><font face='PuristaBold'>*</font> Usuários experientes devem jogar como independente. Você pode jogar como sozinho ou se juntar a amigos. É permitido um grupo com no máximo 15 jogadores.
<br/>
<br/><font face='PuristaBold'>*</font> Ganhe dinheiro, equipamentos e veículos fazendo missões ( cruzes ROXAS marcados no mapa) ou compre seus equipamentos/armamentos nas lojas marcadas no mapa.
<br/>
<br/><font face='PuristaBold'>*</font> Você pode recolher destroços de veículos destruídos vender veículos bons nos vendedores das lojas.
<br/>
<br/><font face='PuristaBold'>*</font> Rearme, reabasteça e repare seus veículos nos caminhões marcados no mapa com Resupply ou compre um deles na Loja de Veículos.
<br/>
<br/><font face='PuristaBold'>*</font> Os círculos azuis nas cidades são as áreas de nascimento. Você pode encontrar veículos com alguns itens e armas simples. 
<br/>
<br/><font face='PuristaBold'>*</font> Guarde e transfira dinheiro nos caixas eletrônicos (marcados em amarelo no mapa).
<br/>
<br/><font face='PuristaBold'>*</font> Seu equipamento e dinheiro serão salvos durante o reinício do servidor automaticamente.
<br/>
<br/><font face='PuristaBold'>*</font> Você precisa travar caixas de armas e elementos de base a cada 120 horas, se quiser salvá-las (role o mouse quando estiver na frente)
<br/>
<br/><font face='PuristaBold'>*</font> O TravaBase permite que outros jogadores não destravem as partes da sua Base, você pode comprar ele na Loja Geral. 
<br/>
<br/><font face='PuristaBold'>*</font> Os veículos comprados e de missões podem ser travados por padrão. Um TravaCarro pode ser encontrado na Loja Geral. 
<br/>
<br/><font face='PuristaBold'>*</font> Para construir sua Base, compre os elementos na Loja Geral na aba OBJETOS. Coloque os objetos dentro de algum veículo/container e leve até onde você quer construir sua Base.
<br/>
<br/><font face='PuristaBold'>*</font> Os territórios, também chamados de BANDEIRAS, A, B, C ,(D) mudam de local a cada restart. Capiture e mantenha elas sobre sua posse e ganhe dinheiro a cada 10 minutos.
<br/>
<br/><font face='PuristaBold'>*</font> Quanto mais jogadores no servidor, maior será a recompensa paga pelas BANDEIRAS.
<br/>
<br/><font face='PuristaBold'>*</font> Role o mouse para solicitar Suporte Aéreo se você for deixado no meio do nada.
<br/>
<br/><font face='PuristaBold'>*</font> Precione a tecla END para colocar os abafadores, tecla Windows para ver o nome dos amigos no grupo.
<br/>
<br/><font face='PuristaBold'>*</font> Kit de Primeiros Socorros irá estabilizar o jogador; Estojo de Primeiros Socorros irá reviver os aliados; Kit de Reparo irá reparar parcialmente o veículo/aéronave.
<br/>
<br/><font face='PuristaBold'>*</font> Kit de Reparos irá reparar parcialmente o veículo/aéronave; Estojo de Reparos (Maleta Branca) irá consertar completamente.
<br/>
<br/><font face='PuristaBold'>*</font> Você tem uma chance de nascer onde você quiser comprando e instalando um Spawn-Beacon. Compre ele na Loja Geral. Você pode nascer nele a cada 15 minutos.
<br/>
<br/><font face='PuristaBold'>*</font> ATENÇÃO: Nossos servidores são monitorados por administradores. Sempre ouça as instruções dos administradores e não discuta no chat. Use o DISCORD para isso.
<br/>
"
]];
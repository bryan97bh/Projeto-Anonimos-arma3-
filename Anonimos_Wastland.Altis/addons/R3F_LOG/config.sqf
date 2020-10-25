/**
 * ARQUIVO DE CONFIGURAÇÃO PRINCIPAL
 * (EN)
 * Este arquivo contém as variáveis de configuração do sistema logístico.
 * For the configuration of the creation factory, see the file "config_creation_factory.sqf".
 * IMPORTANT NOTE : when a logistics feature is given to an object/vehicle class name, all the classes which inherit
 *                  of the parent/generic class (according to the CfgVehicles) will also have this feature.
 *                  CfgVehicles tree view example : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
Exemple d'arborescence du CfgVehicles : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 */

/**
 * DISABLE LOGISTICS ON OBJECTS BY DEFAULT
 * 
 * (EN)
 * Define if objects and vehicles have logistics features by default,
 * or if it must be allowed explicitely on specific objects/vehicles.
 * 
 * If false : all objects are enabled according to the class names listed in this configuration file
 *            You can disable some objects with : object setVariable ["R3F_LOG_disabled", true];
 * If true :  all objects are disabled by default
 *            You can enable some objects with : object setVariable ["R3F_LOG_disabled", false];
 */
R3F_LOG_CFG_disabled_by_default = true;

/**
 * LOCK THE LOGISTICS FEATURES TO SIDE, FACTION OR PLAYER
 * 
 * (EN)
 * Define the lock mode of the logistics features for an object.
 * An object can be locked to the a side, faction, a player (respawn) or a unit (life).
 * If the object is locked, the player can unlock it according to the
 * value of the config variable R3F_LOG_CFG_unlock_objects_timer.
 * 
 * If "none" : no lock features, everyone can used the logistics features.
 * If "side" : the object is locked to the last side which interacts with it.
 * If "faction" : the object is locked to the last faction which interacts with it.
 * If "player" : the object is locked to the last player which interacts with it. The lock is transmitted after respawn.
 * If "unit" : the object is locked to the last player which interacts with it. The lock is lost when the unit dies.
 * 
 * Note : for military objects (not civilian), the lock is initialized to the object's side.
 */
R3F_LOG_CFG_lock_objects_mode = "none";

/**
 * COUNTDOWN TO UNLOCK AN OBJECT
 * 
 * Define the countdown duration (in seconds) to unlock a locked object.
 * Set to -1 to deny the unlock of objects.
 * See also the config variable R3F_LOG_CFG_lock_objects_mode.
 * 
 * D�fini la dur�e (en secondes) du compte-�-rebours pour d�verrouiller un objet.
 * Mettre � -1 pour qu'on ne puisse pas d�verrouiller les objets.
 * Voir aussi la variable de configiration R3F_LOG_CFG_lock_objects_mode.
 */
R3F_LOG_CFG_unlock_objects_timer = 1;

/**
 * ALLOW NO GRAVITY OVER GROUND
 * 
 * Define if movable objects with no gravity simulation can be set in height over the ground (no ground contact).
 * The no gravity objects corresponds to most of decoration and constructions items.
 * 
 * D�fini si les objets d�pla�able sans simulation de gravit� peuvent �tre position en hauteur sans �tre contact avec le sol.
 * Les objets sans gravit� correspondent � la plupart des objets de d�cors et de construction.
 */
R3F_LOG_CFG_no_gravity_objects_can_be_set_in_height_over_ground = true;

/**
 * LANGUAGE
 * 
 * Automatic language selection according to the game language.
 * New languages can be easily added (read below).
 * 
 * S�lection automatique de la langue en fonction de la langue du jeu.
 * De nouveaux langages peuvent facilement �tre ajout�s (voir ci-dessous).
 */
R3F_LOG_CFG_language = switch (language) do
{
	case "English":{"en"};
	case "French":{"fr"};
	
	// Feel free to create you own language file named "XX_strings_lang.sqf", where "XX" is the language code.
	// Make a copy of an existing language file (e.g. en_strings_lang.sqf) and translate it.
	// Then add a line with this syntax : case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};
	// For example :
	
	//case "Czech":{"cz"}; // Not supported. Need your own "cz_strings_lang.sqf"
	//case "Polish":{"pl"}; // Not supported. Need your own "pl_strings_lang.sqf"
	//case "Portuguese":{"pt"}; // Not supported. Need your own "pt_strings_lang.sqf"
	//case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};  // Need your own "LANGUAGE_CODE_strings_lang.sqf"
	
	default {"en"}; // If language is not supported, use English
};

/**
 * CONDITION TO ALLOW LOGISTICS
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny all logistics features only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow logistics only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * The condition is evaluted in real time, so it can use condition depending on the mission progress : "alive officer && taskState task1 == ""Succeeded"""
 * Or to deny logistics in a circular area defined by a marker : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/vehicle, you can use the command cursorTarget
 * To allow the logistics to everyone, just set the condition to "true".
 */
R3F_LOG_CFG_string_condition_allow_logistics_on_this_client = "true";

/**
 * CONDITION TO ALLOW CREATION FACTORY
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny the access to the creation factory only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow the creation factory only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/v�hicule, you can use the command cursorTarget
 * Note also that the condition is evaluted in real time, so it can use condition depending on the mission progress :
 * "alive officer && taskState task1 == ""Succeeded"""
 * To allow the creation factory to everyone, just set the condition to "true".
 */
R3F_LOG_CFG_string_condition_allow_creation_factory_on_this_client = "false";

/*
 ********************************************************************************************
 * BELOW IS THE CLASS NAMES CONFIGURATION / CI-DESSOUS LA CONFIGURATION DES NOMS DE CLASSES *
 ********************************************************************************************
 * 
 * (EN)
 * There are two ways to manage new objects with the logistics system. The first one is to add these objects in the
 * following appropriate lists. The second one is to create a new external file in the /addons_config/ directory,
 * based on /addons_config/TEMPLATE.sqf, and to add a #include below to.
 * The first method is better to add/fix only some various class names.
 * The second method is better to take into account an additional addon.
 * 
 * These variables are based on the inheritance principle according to the CfgVehicles tree.
 * It means that a features accorded to a class name, is also accorded to all child classes.
 * Inheritance tree view : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 */

/****** LIST OF ADDONS CONFIG TO INCLUDE / LISTE DES CONFIG D'ADDONS A INCLURE ******/
//#include "addons_config\A3_vanilla.sqf"
//#include "addons_config\All_in_Arma.sqf"
//#include "addons_config\R3F_addons.sqf"
//#include "addons_config\YOUR_ADDITIONAL_ADDON.sqf"

//TOW WITH VEHICLE 

/**
 * List of class names of ground vehicles which can tow objects.
 *Lista de nomes de classes de veículos terrestres que podem rebocar objetos
 */
R3F_LOG_CFG_can_tow = R3F_LOG_CFG_can_tow +
[
	// e.g. : "MyTowingVehicleClassName1", "MyTowingVehicleClassName2"
    "Tractor_01_base_F",
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Offroad_02_base_F",
    "LSV_01_base_F",
    "LSV_02_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	"Truck_F",
	"Wheeled_APC_F",
	"APC_Tracked_01_base_F",
	"APC_Tracked_02_base_F",
	"APC_Tracked_03_base_F",
	"B_APC_Tracked_01_CRV_F",
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F",
	"Boat_Armed_01_base_F"
];

/**
 * List of class names of objects which can be towed.
 * Lista de nomes de classes de objetos que podem ser rebocados.
 */
R3F_LOG_CFG_can_be_towed = R3F_LOG_CFG_can_be_towed +
[
	// e.g. : "MyTowableObjectClassName1", "MyTowableObjectClassName2"
    "Tractor_01_base_F",
    "Hatchback_01_base_F",
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Offroad_02_base_F",
    "LSV_01_base_F",
    "LSV_02_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	"Truck_F",
	"Quadbike_01_base_F",
	"UGV_01_base_F",
	"Helicopter_Base_F",
    "Plane",
	"I_E_Radar_System_01_F",
	"I_E_SAM_System_03_F",
	"Ship"
];


/*//LIFT WITH VEHICLE GUICHO DE VEICULO

// List of class names of helicopters which can lift objects.
// Lista de nomes de classes de helicópteros que podem levantar objetos

R3F_LOG_CFG_can_lift = R3F_LOG_CFG_can_lift +
[
	// e.g. : "MyLifterVehicleClassName1", "MyLifterVehicleClassName2"
    "Helicopter_Base_F",
    "VTOL_01_base_F",
    "VTOL_02_base_F"
];

// * List of class names of objects which can be lifted.
// * Lista de nomes de classes de objetos que podem ser levantados.

R3F_LOG_CFG_can_be_lifted = R3F_LOG_CFG_can_be_lifted +
[
	// e.g. : "MyLiftableObjectClassName1", "MyLiftableObjectClassName2"
    "Tractor_01_base_F",
	"Land_Device_assembled_F", //relocker
	"Hatchback_01_base_F",
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Offroad_02_base_F",
	"Van_01_base_F",
	"Van_02_base_F",
    "C_Scooter_Transport_01_F",
    "LSV_01_base_F",
    "LSV_02_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	//"Truck_01_base_F",
	//"Truck_02_base_F",
	//"Truck_03_base_F",
	"UGV_01_base_F",
	"SDV_01_base_F",
	"Boat_Civil_01_base_F",
	"Boat_Armed_01_base_F",
	//"Wheeled_APC_F",
	//"APC_Tracked_01_base_F",
	//"APC_Tracked_02_base_F",
	//"APC_Tracked_03_base_F",
	//"MBT_01_base_F",
	//"MBT_02_base_F",
	//"MBT_03_base_F",
	"Land_Pod_Heli_Transport_04_box_F",//Adicionado 
	"Land_Cargo20_military_green_F"
];*/


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * Esta seção usa uma quantificação numérica da capacidade e custo dos objetos.
 * Por exemplo, em um veículo com capacidade de 100, poderemos carregar 5 objetos com custo de 20 unidades de capacidade.
 * A capacidade não representa um volume ou peso real, mas uma escolha feita para a jogabilidade.*/

R3F_LOG_CFG_can_transport_cargo = R3F_LOG_CFG_can_transport_cargo +
[
	// e.g. : ["MyTransporterClassName1", itsCapacity], ["MyTransporterClassName2", itsCapacity]
    ["Tractor_01_base_F",20],
	["Quadbike_01_base_F", 5],
    ["Plane_Base_F", 5],
	["C_Scooter_Transport_01_F", 5],
    ["SDV_01_base_F", 10],
	["UGV_01_base_F", 10],
    ["UGV_02_Base_F", 3],
	["Hatchback_01_base_F", 10],
	["SUV_01_base_F", 20],
	["Offroad_01_base_F", 30],
	["Offroad_02_base_F", 20],
	["Van_01_base_F", 40],
	["Van_02_base_F", 40],
	["LSV_01_base_F", 15],
	["LSV_02_base_F", 15],
	["MRAP_01_base_F", 20],
	["MRAP_02_base_F", 20],
	["MRAP_03_base_F", 20],
	["B_Truck_01_box_F", 500],
	["Truck_F", 75],
	["Wheeled_APC_F", 30],
	["LT_01_base_F", 20],
	["Tank_F", 30],
	["Rubber_duck_base_F", 10],
	["Boat_Civil_01_base_F", 10],
	["Boat_Transport_02_base_F", 15],
	["Boat_Armed_01_base_F", 20],
	["Heli_Light_01_base_F", 10],
	["Heli_Light_02_base_F", 20],
	["Heli_light_03_base_F", 20],
	["Heli_Transport_01_base_F", 25],
	["Heli_Transport_02_base_F", 30],
	["Heli_Transport_03_base_F", 30],
	["Heli_Transport_04_base_F", 200],
	["O_Heli_Transport_04_box_F", 1500],
	["Heli_Attack_01_base_F", 10],
	["Heli_Attack_02_base_F", 20],
	["Plane_Civil_01_base_F", 5],
	["VTOL_01_base_F", 1500],
	["VTOL_02_base_F", 1500],
	["Land_Pod_Heli_Transport_04_box_F", 500],
	["Land_Cargo20_military_green_F", 100]
];

/**
 * List of class names of objects which can be loaded in transport vehicle/cargo.
 * The second element of the nested arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
  * Lista de nomes de classes de objetos que podem ser carregados no veículo de transporte / carga.
  * O segundo elemento das matrizes aninhadas é a capacidade de custo (em relação à capacidade dos veículos).
 */
R3F_LOG_CFG_can_be_transported_cargo = R3F_LOG_CFG_can_be_transported_cargo +
[
	// e.g. : ["MyTransportableObjectClassName1", itsCost], ["MyTransportableObjectClassName2", itsCost]
	["Land_Device_assembled_F", 100],           //Re Locker
    ["Box_GEN_Equip_F", 10],                    //Safe
	["Land_PillboxWall_01_3m_round_F", 10],     //Base Door (Pillbox) 3m
    ["Land_PillboxWall_01_6m_F", 15],           //Base Door (Pillbox)
    ["Land_Canal_Wall_10m_F", 20],              //Base Door (Canal Wall)
    ["Land_TripodScreen_01_dual_v1_F", 5],      //Base Door Key
	["StaticWeapon", 5],
	["Box_NATO_AmmoVeh_F", 10],
    ["Box_NATO_Uniforms_F", 10],
    ["Box_NATO_Equip_F", 10],
	["B_supplyCrate_F", 5],
	["ReammoBox_F", 3],
	["Kart_01_Base_F", 5],
	["Quadbike_01_base_F", 10],
	["C_Scooter_Transport_01_F", 10],
	["Rubber_duck_base_F", 10],
	["SDV_01_base_F", 500],
	["I_E_Radar_System_01_F", 500],
	["I_E_SAM_System_03_F", 500],
	["Land_BagBunker_Large_F", 10],
	["Land_BagBunker_Small_F", 5],
	["Land_BagBunker_Tower_F", 7],
	["Land_BagFence_Corner_F", 2],
	["Land_BagFence_End_F", 2],
	["Land_BagFence_Long_F", 3],
	["Land_BagFence_Round_F", 2],
	["Land_BagFence_Short_F", 2],
	["Land_BarGate_F", 3],
	["Land_Canal_WallSmall_10m_F", 4],
	["Land_Canal_Wall_Stairs_F", 7],
	["Land_CargoBox_V1_F", 5],
	["Land_Cargo_House_V1_F", 15],
	["Land_Cargo_Patrol_V1_F", 7],
	["Land_Cargo_Tower_V1_F", 30],
	["Land_Cargo_HQ_V1_F", 30],
	["Land_CncBarrier_F", 4],
	["Land_CncBarrierMedium_F", 4],
	["Land_CncBarrierMedium4_F", 4],
	["Land_CncShelter_F", 2],
	["Land_CncWall1_F", 3],
	["Land_CncWall4_F", 5],
	["Land_Crash_barrier_F", 5],
	["Land_HBarrierWall_corner_F", 5],
	["Land_HBarrierWall_corridor_F", 6],
	["Land_HBarrierBig_F", 5],
	["Land_HBarrierTower_F", 8],
	["Land_HBarrierWall4_F", 4],
	["Land_HBarrierWall6_F", 6],
	["Land_HBarrier_1_F", 3],
	["Land_HBarrier_3_F", 4],
	["Land_HBarrier_5_F", 5],
	["Land_LampHarbour_F", 2],
	["Land_LampShabby_F", 2],
    ["Land_LampHalogen_F", 5],
    ["Land_PortableLight_double_F", 2],
	["Land_MetalBarrel_F", 2],
	["Land_Mil_ConcreteWall_F", 5],
	["Land_Mil_WallBig_4m_F", 5],
	["Land_Obstacle_Ramp_F", 5],
	["Land_RampConcreteHigh_F", 6],
	["Land_RampConcrete_F", 5],
	["BlockConcrete_F", 6],
	["Land_Sacks_goods_F", 4],
	["Land_Scaffolding_F", 5],
    ["Land_Obstacle_Bridge_F", 4],
	["Land_Shoot_House_Wall_F", 3],
	["Land_Stone_8m_F", 5],
	["Land_BarrelWater_F", 4],
	["Land_FuelStation_Feed_F", 75],
	["Land_Shed_Small_F", 20],
	["Land_Shed_Big_F", 30],
    ["Land_GH_Platform_F", 8],
    ["Land_GH_Stairs_F", 5],
	["Flag_NATO_F", 3],
	["Flag_UNO_F", 3],
	["Flag_US_F", 3],
	["Flag_UK_F", 3],
	["FlagPole_F", 3],
    ["Land_SignM_WarningMilitaryArea_english_F", 3],
    ["Land_SignM_WarningMilitaryVehicles_english_F", 3],
    ["Land_Sign_WarningUnexplodedAmmo_F", 3],
    ["Land_SignM_forRent_F", 3],
    ["Land_SignM_forSale_F", 3],
	["TargetP_Inf_F", 3],
	["Land_New_WiredFence_5m_F", 4],
	["Land_New_WiredFence_10m_F", 8],
	["Land_ConcreteWall_01_l_4m_F", 10], 
	["Land_ConcreteWall_01_l_8m_F", 10], 
	["Land_ConcreteWall_01_l_gate_F", 10],
    ["Land_CzechHedgehog_01_F", 5],
    ["Land_Bunker_01_blocks_1_F", 3],
    ["Land_Bunker_01_blocks_3_F", 5],
    ["Land_Bunker_01_small_F", 5],
    ["Land_Bunker_01_tall_F", 13],
    ["Land_Bunker_01_big_F", 20],
    ["Land_Bunker_01_HQ_F", 20],
	["Land_HBarrier_01_line_1_green_F", 3], 
	["Land_HBarrier_01_line_3_green_F", 3],
	["Land_HBarrier_01_line_5_green_F", 3],
	["Land_HBarrier_01_big_4_green_F", 5], 
	["Land_HBarrier_01_wall_4_green_F", 5],  
	["Land_HBarrier_01_wall_6_green_F", 5], 
	["Land_HBarrier_01_wall_corner_green_F", 5], 
	["Land_HBarrier_01_wall_corridor_green_F", 5], 
	["Land_HBarrier_01_big_tower_green_F", 5], 
	["Land_HBarrier_01_wall_corner_green_F", 5], 
	["Land_BagFence_01_end_green_F", 5], 
	["Land_BagFence_01_long_green_F", 5],
	["Land_BagFence_01_round_green_F", 5],
	["Land_BagFence_01_short_green_F", 5],
    ["Land_SandbagBarricade_01_half_F", 5],
    ["Land_SandbagBarricade_01_F", 7],
    ["Land_SandbagBarricade_01_hole_F", 7],
	["Land_BagBunker_01_small_green_F", 7],
	["Land_BagBunker_01_large_green_F", 10],
	["Bag Bunker Tower (Tan)", 10],	
	["Land_Cargo_House_V1_F", 10], //Adicionado
	["Land_BC_Court_F", 10], //Adicionado
	["Land_HBarrier_01_tower_green_F", 10]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects which can be carried and moved by a player.
 * Lista de nomes de classes de objetos que podem ser carregados e movidos por um jogador.
 */
R3F_LOG_CFG_can_be_moved_by_player = R3F_LOG_CFG_can_be_moved_by_player +
[
	// e.g. : "MyMovableObjectClassName1", "MyMovableObjectClassName2"
	"Land_Device_assembled_F",          //Re Locker
    "Box_GEN_Equip_F",                  //Safe
	"Land_PillboxWall_01_3m_round_F",   //base door
    "Land_PillboxWall_01_6m_F",         //Base Door
    "Land_TripodScreen_01_dual_v1_F",   //Base Door Key
	"StaticWeapon",
	"ReammoBox_F",
    "Box_NATO_Uniforms_F",
    "Box_NATO_Equip_F",
	"Kart_01_Base_F",
	"Quadbike_01_base_F",
	"C_Scooter_Transport_01_F",
	"Rubber_duck_base_F",
	"SDV_01_base_F",
	"I_E_Radar_System_01_F",
	"I_E_SAM_System_03_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_Short_F",
	"Land_BarGate_F",
	"Land_Canal_WallSmall_10m_F",
    "Land_Canal_Wall_10m_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_CargoBox_V1_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Tower_V1_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_HQ_V1_F",
	"Land_CncBarrier_F",
	"Land_CncBarrierMedium_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncShelter_F",
	"Land_CncWall1_F",
	"Land_CncWall4_F",
	"Land_Crash_barrier_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierTower_F",
	"Land_HBarrierWall_corner_F",
	"Land_HBarrierWall_corridor_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
    "Land_LampHalogen_F",
    "Land_PortableLight_double_F",
	"Land_MetalBarrel_F",
	"Land_Mil_ConcreteWall_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Obstacle_Ramp_F",
	"Land_RampConcreteHigh_F",
	"Land_RampConcrete_F",
	"BlockConcrete_F",
	"Land_Sacks_goods_F",
	"Land_Scaffolding_F",
    "Land_Obstacle_Bridge_F",
	"Land_Shoot_House_Wall_F",
	"Land_Stone_8m_F",
	"Land_BarrelWater_F",
	"Land_HandyCam_F",
	"Land_Laptop_F",
	"Land_Cargo20_military_green_F",
	"Land_Pod_Heli_Transport_04_box_F",//Adicionado 
	"Land_FuelStation_Feed_F",
	"Land_Shed_Small_F",
	"Land_Shed_Big_F",
    "Land_GH_Platform_F",
    "Land_GH_Stairs_F",
	"Flag_NATO_F",
	"Flag_UNO_F",
	"Flag_US_F",
	"Flag_UK_F",
	"FlagPole_F",
    "Land_SignM_WarningMilitaryArea_english_F",
    "Land_SignM_WarningMilitaryVehicles_english_F",
    "Land_Sign_WarningUnexplodedAmmo_F",
    "Land_SignM_forRent_F",
    "Land_SignM_forSale_F",
	"TargetP_Inf_F",
	"Land_New_WiredFence_5m_F",
	"Land_New_WiredFence_10m_F",
	"Land_ConcreteWall_01_l_4m_F", 
	"Land_ConcreteWall_01_l_8m_F", 
	"Land_ConcreteWall_01_l_gate_F",
    "Land_CzechHedgehog_01_F",
    "Land_Bunker_01_blocks_1_F",
    "Land_Bunker_01_blocks_3_F",
    "Land_Bunker_01_small_F",
    "Land_Bunker_01_tall_F",
    "Land_Bunker_01_big_F",
    "Land_Bunker_01_HQ_F",
	"Land_HBarrier_01_line_1_green_F", 
	"Land_HBarrier_01_line_3_green_F",
	"Land_HBarrier_01_line_5_green_F",
	"Land_HBarrier_01_big_4_green_F", 
	"Land_HBarrier_01_wall_4_green_F",  
	"Land_HBarrier_01_wall_6_green_F", 
	"Land_HBarrier_01_wall_corner_green_F", 
	"Land_HBarrier_01_wall_corridor_green_F", 
	"Land_HBarrier_01_big_tower_green_F", 
	"Land_HBarrier_01_wall_corner_green_F", 
	"Land_BagFence_01_end_green_F", 
	"Land_BagFence_01_long_green_F",
	"Land_BagFence_01_round_green_F",
	"Land_BagFence_01_short_green_F",
    "Land_SandbagBarricade_01_half_F",
    "Land_SandbagBarricade_01_F",
    "Land_SandbagBarricade_01_hole_F",
	"Land_BagBunker_01_small_green_F",
	"Land_BagBunker_01_large_green_F",
	"Land_Cargo_House_V1_F", //Adicionado 
	"Land_BC_Court_F", //Adicionado 
	"Land_HBarrier_01_tower_green_F"
];
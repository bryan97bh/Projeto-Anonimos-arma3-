// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2017 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleLoadouts.sqf
//	@file Author: AgentRev

/*
	HOW TO CREATE A PYLON LOADOUT:
	 1. Create new scenario in Eden, add vehicle, adjust pylon loadout, and set Object Init to: copyToClipboard str getPylonMagazines this
	 2. Play scenario, wait until loaded, then pause game and return to Eden.
	 3. Your pylon array is now in the clipboard, which you can paste in this file, e.g. _pylons = ["PylonMissile_Missile_AA_R73_x1","","","","","","","","","","","","",""];

	Note: You can use any pylon type you want in the script, even if not shown in the editor, it should normally work! e.g. "PylonRack_12Rnd_missiles" for "B_Plane_Fighter_01_F"
*/

switch (true) do
{
	// Hummingbird (Military), Caesar and Hellcat (unarmed) Flares
	case ({_class isKindOf _x} count ["B_Heli_Light_01_F", "Plane_Civil_01_base_F", "Heli_light_03_unarmed_base_F"] > 0):
	{
        _weapons =
		[
			["CMFlareLauncher", [-1]]
		];
		_mags =
		[
			["60Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
        _customCode =
		{
			reload _veh;
		};
	};

	// AH-9 Pawnee
    case (_class isKindOf "B_Heli_Light_01_dynamicLoadout_F"):
    {
        switch (_variant) do
        {
            case "pawneeGun": { _pylons = ["",""] };
            case "pawneeDelta": { _pylons = ["PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_4Rnd_LG_scalpel","PylonRack_20Rnd_Rocket_03_HE_F"] };
            default           { _pylons = ["PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles"] };
        };
    };

	// PO-30 Orca
	case (_class isKindOf "O_Heli_Light_02_dynamicLoadout_F"):
	{
		switch (_variant) do
		{
			case "orcaDAGR": { _pylons = ["PylonWeapon_2000Rnd_65x39_belt","PylonRack_12Rnd_PG_missiles"] };
			default          { _pylons = ["PylonWeapon_2000Rnd_65x39_belt","PylonRack_12Rnd_missiles"] };
		};
	};

	// AH-99 Blackfoot
	case (_class isKindOf "Heli_Attack_01_dynamicLoadout_base_F"):
	{
		_pylons = ["PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_LG_scalpel","PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles","PylonMissile_1Rnd_LG_scalpel","PylonMissile_1Rnd_AAA_missiles"];
	};

	// Mi-48 Kajman
	case (_class isKindOf "Heli_Attack_02_dynamicLoadout_base_F"):
	{
		_pylons = ["PylonMissile_1Rnd_LG_scalpel","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_19Rnd_Rocket_Skyfire","PylonMissile_1Rnd_LG_scalpel"];
	};

	// Y-32 Xi'an
	case ({_class isKindOf _x} count ["VTOL_02_infantry_dynamicLoadout_base_F", "VTOL_02_vehicle_dynamicLoadout_base_F"] > 0):
	{
        switch (_variant) do
		{
			case "xianUnarmed": 
            {
                _weapons =
                [
                    //Set a weapon to remove/disable all other weapons
                    ["Laserdesignator_mounted", [0]],
                    ["CMFlareLauncher", [-1]]
                ];
                _mags =
                [
                    ["Laserbatteries", [0]],
                    ["120Rnd_CMFlare_Chaff_Magazine", [-1]]
                ];
                _customCode =
                {
                    reload _veh;
                    //Disable Weapons on VTOLs
                    _veh removeWeaponTurret ["missiles_SCALPEL",[0]];
                    _veh removeWeaponTurret ["rockets_Skyfire",[0]];
                    _veh removeWeaponTurret ["gatling_30mm_VTOL_02",[0]];
                };
            };
            case "xianGunOnly": { 
                _pylons = ["","","",""];
                _customCode =
                {
                    //Disable Weapons on VTOLs
                    _veh removeWeaponTurret ["missiles_SCALPEL",[0]];
                    _veh removeWeaponTurret ["rockets_Skyfire",[0]];
                };
            };
			default          { _pylons = ["PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_1Rnd_Missile_AGM_01_F"] };
		};
	};

	// A-143 Buzzard
	case (_class isKindOf "Plane_Fighter_03_dynamicLoadout_base_F"):
	{
		_weapons =
		[
			["Laserdesignator_pilotCamera", [-1]],
			["CMFlareLauncher", [-1]]
		];
		_mags =
		[
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		switch (_variant) do
		{
			case "buzzardAA": { _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_Missile_AA_04_F","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles"] };
			case "buzzardb1": { _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_LG_scalpel","PylonMissile_1Rnd_Bomb_04_F","PylonWeapon_300Rnd_20mm_shells","PylonMissile_1Rnd_Bomb_04_F","PylonRack_1Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AA_04_F"] };
			case "buzzardb2": { _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_LG_scalpel","PylonMissile_1Rnd_BombCluster_03_F","PylonWeapon_300Rnd_20mm_shells","PylonMissile_1Rnd_Bomb_04_F","PylonRack_1Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AA_04_F"] };
			default           { _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_HE_F","PylonWeapon_300Rnd_20mm_shells","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_1Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AA_04_F"] }; 
		};
		_customCode =
		{
			_veh setAmmoOnPylon [4, 500]; // 20mm gun
		};
	};

	// A-149 Gryphon
    case (_class isKindOf "Plane_Fighter_04_Base_F"):
    {
        _mags =
        [
            ["magazine_Fighter04_Gun20mm_AA_x250", [-1]], // extra gun mags (non-explosive ammo)
            ["Laserbatteries", [-1]],
            ["240Rnd_CMFlare_Chaff_Magazine", [-1]]
        ];
        
        switch (_variant) do
        {
            case "GryphonAA": { _pylons = ["PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1"] }; 
            default           { _pylons = ["PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1"] };
        };
    };

    // F/A-181 Black Wasp
	case (_class isKindOf "B_Plane_Fighter_01_F"):
	{
		_mags =
		[
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]], // extra gun mag (non-explosive ammo)
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];

		switch (_variant) do
        {
            case "F18AA": { _pylons = ["PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","","","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1"] };
			case "F18b1": { _pylons = ["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"] }; 
            default   { _pylons = ["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"] };
        };
	};

	// F/A-181 Black Wasp (Stealth)
	case (_class isKindOf "B_Plane_Fighter_01_Stealth_F"):
	{
		_mags =
		[
			["magazine_Fighter01_Gun20mm_AA_x450", [-1]], // extra gun mags to make up for lack of pylons (non-explosive ammo)
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_pylons = ["PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","","","","","","","","","",""];
	};

	// To-201 Shikra
	case (_class isKindOf "O_Plane_Fighter_02_F"):
	{
		_mags =
		[
			["magazine_Fighter02_Gun30mm_AA_x180", [-1]], // extra gun mag (non-explosive ammo)
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];

		switch (_variant) do
        {
            case "ShikraAA": { _pylons = ["PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","","",""] }; 
            case "Shikrab1": { _pylons = ["PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_1Rnd_BombCluster_02_cap_F"] };
            default   { _pylons = ["PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Bomb_KAB250_x1"] };
        };
	};

	// To-201 Shikra (Stealth)
	case (_class isKindOf "O_Plane_Fighter_02_Stealth_F"):
	{
		_mags =
		[
			["magazine_Fighter02_Gun30mm_AA_x180", [-1]], // extra gun mags to make up for lack of pylons (non-explosive ammo)
			["Laserbatteries", [-1]],
			["240Rnd_CMFlare_Chaff_Magazine", [-1]]
		];
		_pylons = ["PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R73_x1","","","","","","","","","","",""];
	};

	// A-10 Wipeout CAS
	case (_class isKindOf "Plane_CAS_01_dynamicLoadout_base_F"):
	{
		switch (_variant) do
        {
			case "A10B2": { _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_Bomb_04_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_1Rnd_Missile_AA_04_F"] };
			case "A10B3": { _pylons = ["PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F"] };
            default   { _pylons = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_1Rnd_Missile_AA_04_F"] };
        };
	};

	// To-199 Neophron CAS
	case (_class isKindOf "Plane_CAS_02_dynamicLoadout_base_F"):
	{
		switch (_variant) do
        {
            case "NeophronB1": { _pylons = ["PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F"] };
			case "NeophronB2": { _pylons = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_Bomb_03_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AA_03_F"] };
            default   { _pylons = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_Bomb_03_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AA_03_F"] };
        };
		
	};

	// Greyhawk/Ababil UAVs
	case (_class isKindOf "UAV_02_dynamicLoadout_base_F"):
	{
		switch (_variant) do
		{
			case "greyhawkBomber": { _pylons = ["PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_Bomb_04_F"] };
			case "greyhawkBomber4": { _pylons = ["PylonRack_Bomb_GBU12_x2","PylonRack_Bomb_GBU12_x2"] };
			case "greyhawkMissile6": { _pylons = ["PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel"] };
			case "greyhawkCluster": { _pylons = ["PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_BombCluster_01_F"] };
			case "greyhawkDAGR":    { _pylons = ["PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles"] };
			default
			{
				_pylons = ["PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel"];
				_customCode =
				{
					_veh setAmmoOnPylon [1, 2]; // right wing
					_veh setAmmoOnPylon [2, 2]; // left wing
				};
			};
		};
	};

	// UCAV Sentinel
	case (_class isKindOf "B_UAV_05_F"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]],
			["magazine_Fighter04_Gun20mm_AA_x250", [-1]],
			["Laserbatteries", [0]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]],
			["weapon_Fighter_Gun20mm_AA", [-1]],
			["Laserdesignator_mounted", [0]]
		];
		switch (_variant) do
		{
			case "sentinelMissile2": { _pylons = ["PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel"] };
			case "sentinelBomber2": { _pylons = ["PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"] };
			case "sentinelBomber4": { _pylons = ["PylonRack_Bomb_GBU12_x2","PylonRack_Bomb_GBU12_x2"] };
			case "sentinelBomber8": { _pylons = ["PylonRack_Bomb_SDB_x4","PylonRack_Bomb_SDB_x4"] };
			case "sentinelCluster": { _pylons = ["PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_BombCluster_01_F"] };
			default
			{
				_pylons = ["PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel"];
				_customCode =
				{
					_veh setAmmoOnPylon [1, 2]; // right wing
					_veh setAmmoOnPylon [2, 2]; // left wing
				};
			};
		};
	};

	// MQ-12 Falcon UAV (non-dynamicLoadout)
	case (_class isKindOf "B_T_UAV_03_F"):
	{
		_mags =
		[
			["120Rnd_CMFlare_Chaff_Magazine", [-1]],
			["1000Rnd_65x39_Belt_Green", [0]],
			["24Rnd_missiles", [0]],
			["2Rnd_LG_scalpel", [0]],
			["2Rnd_AAA_missiles", [0]],
			["Laserbatteries", [0]]
		];
		_weapons =
		[
			["CMFlareLauncher", [-1]],
			["LMG_M200", [0]],
			["missiles_DAR", [0]],
			["missiles_SCALPEL", [0]],
			["missiles_ASRAAM", [0]],
			["Laserdesignator_mounted", [0]]
		];
	};
	
	// ED-1D Demining UGV
	case (_class isKindOf "UGV_02_Demining_Base_F"):
	{
		_mags =
		[
			["200Rnd_556x45_Box_F", [0]],
			["15Rnd_12Gauge_Pellets", [0]],
			["15Rnd_12Gauge_Slug", [0]],
			["Laserbatteries", [0]],
			["SmokeLauncherMag", [0]]
		];
		_weapons =
		[
			["LMG_03_Vehicle_F", [0]],
			["DeminingDisruptor_01_F", [0]],
			["Laserdesignator_mounted", [0]],
			["SmokeLauncher", [0]]
		];
	};

	// SDV SDAR turret
	case (_class isKindOf "SDV_01_base_F"):
	{
		_mags =
		[
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["20Rnd_556x45_UW_mag", [0]],
			["30Rnd_556x45_Stanag", [0]],
			["30Rnd_556x45_Stanag", [0]],
			["30Rnd_556x45_Stanag", [0]],
			["Laserbatteries", [0]]
		];
		_weapons =
		[
			["arifle_SDAR_F", [0]],
			["Laserdesignator_mounted", [0]]
		];
	};
	
	// Offroad AT and MB4WD AT
	case ({_class isKindOf _x} count ["Offroad_01_AT_base_F","I_C_Offroad_02_AT_F"] > 0):
	{
		_customCode =
		{
			//Limit HEAT and HE to just 2 missles per ammo type
			{
				_x params ["_mag", "_path", "_ammo"];
				_veh setMagazineTurretAmmo [_mag, 2, _path];
			} forEach magazinesAllTurrets _veh;
		};
	};
	
	// Quilin AT
	case (_class isKindOf "O_T_LSV_02_AT_F"):
	{
		_mags =
		[
			["Vorona_HEAT", [0]],
			["Vorona_HEAT", [0]],
			["Vorona_HEAT", [0]],
			["Vorona_HEAT", [0]]
		];
		_customCode =
		{
			reload _veh;
		};
	};
	
	// Prowler AT
	case (_class isKindOf "B_T_LSV_01_AT_F"):
	{
		_mags =
		[
			["1Rnd_GAT_missiles", [0]],
			["1Rnd_GAT_missiles", [0]],
			["130Rnd_338_Mag", [1]],
			["130Rnd_338_Mag", [1]],
			["130Rnd_338_Mag", [1]]
		];
		_customCode =
		{
			reload _veh;
		};
	};

    // Rhino MGS UP and Rhino MGS
	case (_class isKindOf "AFV_Wheeled_01_base_F"):
	{
		_customCode =
		{
            //Reset LaserGuided Missles to 2 missles
            _veh removeMagazineTurret ["4Rnd_120mm_LG_cannon_missiles", [0]];
            _veh addMagazineTurret ["4Rnd_120mm_LG_cannon_missiles", [0], 2];
		};
	};

};
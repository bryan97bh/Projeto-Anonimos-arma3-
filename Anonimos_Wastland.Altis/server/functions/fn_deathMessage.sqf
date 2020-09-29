// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_deathMessage.sqf
//	@file Author: AgentRev

// this script must ONLY be called within fn_killFeedEntry.sqf

private _killerUnit = _killer;
private _victimUnit = _victim;
private _aiKiller = _killerAI;
private _friendlyFire = _killerFriendly;

params [["_killer",_killerName,[""]], ["_victim",_victimName,[""]]]; // custom names

// you have access to all _killParams variables defined at the bottom of fn_killBroadcast.sqf

	// FOR CONSISTENT USER EXPERIENCE, MESSAGES SHOULD BE LOWERCASE, INVARIABLE, AND EXPLICIT (NO PUNS OR EUPHEMISMS), JUST LIKE DEFAULT ARMA MESSAGES
	private _message = switch (_victimCause) do
	{
		case "headshot": // enemy player headshot with A3W_headshotNoRevive = 1; - feature currently disabled
		{
			if (_killer != "") then { format ["%1 matou com tiro na cabeça %2", _killer, _victim] }
			else                    { format ["%1 recebeu tiro na cabeça", _victim] } // not supposed to happen, but just in case
		};

		case "slay": // finished off by enemy while bleeding
		{
			if (_killer != "") then { format ["%1 foi finalizado por %2", _killer, _victim] }
			else                    { format ["%1 foi finalizado", _victim] } // not supposed to happen, but just in case
		};

		case "bleedout": { format ["%1 sangrou até a morte", _victim] }; // bleedout timer ran out, respawned or disconnected while bleeding

		case "suicide": { format ["%1 se suicidou", _victim] }; // respawned from pause menu, crashed vehicle, last resort, player setDamage 1

		case "drown": { format ["%1 se afagou", _victim] }; // ran out of oxygen underwater, sank while bleeding

		case "survival": { format ["%1 morreu de inanição", _victim] }; // starvation, dehydration

		case "forcekill": { format ["%1 foi morto", _victim] }; // admin slay, antihack/teamkill kick

		default
		{
			switch (true) do
			{
				case (!_victimDead): // injury
				{
					switch (true) do
					{
						case (_killer == ""):                                { format ["%1 se feriu", _victim] }; // injured by self or unknown sources
						case (_aiKiller):                                    { format ["%1 foi ferido por IA", _victim] }; // injured by AI
						case (_friendlyFire && _victimCause == "roadkill"):  { format ["%1 ferido por %2 com veículo (fogo amigo)", _killer, _victim] }; // roadkill injury by friendly
						default                                              { format ["%1 FERIU %2%3", _killer, _victim, [""," (fogo amigo)"] select _friendlyFire] }; // injured by other player
					};
				};
				case (_aiKiller):           { format ["%1 foi morto por IA", _victim] }; // vehicle destroyed by AI
				case (_killer != ""): 
				{
					if (_friendlyFire) then { format ["%1 matou o aliado %2", _killer, _victim] } // destroyed friendly vehicle, crashed vehicle with friendlies on board
					else                    { format ["%1 MATOU %2", _killer, _victim] } // destroyed enemy vehicle
				};
				default
				{
					if (_friendlyFire) then { format ["%1 foi morto por aliado", _victim] } // not supposed to happen, but just in case
					else                    { format ["%1 MORREU", _victim] } // any other cause not covered above
				};
			}
		};
	};

_message

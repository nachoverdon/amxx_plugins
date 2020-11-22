/*
	This plugin forces the command cl_smoothtime 0 on all dead
	players and back to default when alive, by setting the value
	every some time.

	The default value of cl_smoothtime is 0.1. When the value is 0.1,
	a bug can occur that allows you to see players through the walls
	when spectating a teammate and quickly iterating between players.
	When cl_smoothtime is set to 0, this bug disappears.
*/

#include <amxmodx>

#define PLUGIN "ForceSmoothtime"
#define VERSION "1.0"
#define AUTHOR "bazoo"

#define MAX_PLAYERS 32

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	// How many seconds before next check
	const Float:CHECK_INTERVAL = 1.0
	
	set_task(CHECK_INTERVAL, "force_smoothtime", 0, "", 0, "b")
}

public force_smoothtime() {
	new players[MAX_PLAYERS]
	new playerCount, i, player

	get_players(players, playerCount, "ch")

	for (i = 0; i < playerCount; i++) {
		player = players[i]

		if (is_user_alive(player)) {
			client_cmd(player, "cl_smoothtime 0.1")
		} else {
			client_cmd(player, "cl_smoothtime 0")
		}
	}
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1033\\ f0\\ fs16 \n\\ par }
*/

/*
    Killah Potatoes Cratefiller v1.1.0

    Author: Mildly Interested - https://github.com/MildlyInterested

    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This will define the array of whitelisted Steam64IDs that are able to use Cratefiller.
*/
KPCF_enable_whitelist = true; //set to "true" if you want to limit Cratefiller only to certain users (users to be defined further down)

//Whitelist based on Steam64ID, can be obtained here: https://steamid.io/
KP_cratefiller_whitelist_steam_id = [
    "76561198059979416",     //Scarle
    "76561197966186458",     //MacDonald
    "76561198269174036",     //Predo
    "76561198013396016",     //Bedford
    "76561198020770680",     //Pettersson
    "76561198013743881",     //Clayton
    "76561198042251903"      //Mueller
];

//Whitelist based on player name
KP_cratefiller_whitelist_player_name = [
];

//Whitelist based on player group/squad name (the one you see in the editor, NOT the one you see in role selection)
KP_cratefiller_whitelist_group_name = [
    "4-3",
    "4-4",
    "4 Plt HQ"
];
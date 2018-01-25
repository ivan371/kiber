import {teamNormalize, teamsNormalize} from "../normalizers/teams";
import {apiLoad} from "./load";
import {gameNormalize, gamesNormalize} from "../normalizers/games";

export const LOAD_GAMES_SUCCESS = 'LOAD_GAMES_SUCCESS';
export const LOAD_GAMES_MORE = 'LOAD_GAMES_MORE';
export const LOAD_GAMES = 'LOAD_GAMES';
export const LOAD_GAMES_ERROR = 'LOAD_GAMES_ERROR';
export const LOAD_GAME_SUCCESS = 'LOAD_GAME_SUCCESS';
export const LOAD_GAME = 'LOAD_GAME';
export const LOAD_GAME_ERROR = 'LOAD_GAME_ERROR';


export function loadGames(url) {
    const types = [LOAD_GAMES, LOAD_GAMES_SUCCESS, LOAD_GAMES_ERROR];
    return apiLoad(url, 'GET', types, null, gamesNormalize, false);
}

export function loadGamesMore(url) {
    const types = [LOAD_GAMES, LOAD_GAMES_MORE, LOAD_GAMES_ERROR];
    return apiLoad(url, 'GET', types, null, gamesNormalize, false);
}


export function loadGame(url) {
    const types = [LOAD_GAME, LOAD_GAME_SUCCESS, LOAD_GAME_ERROR];
    return apiLoad(url, 'GET', types, null, gameNormalize, true);
}

export function gameCreate(url, name) {
    const types = [LOAD_GAME, LOAD_GAME_SUCCESS, LOAD_GAME_ERROR];
    return apiLoad(url, 'POST', types, JSON.stringify({name}), gameNormalize, true);
}
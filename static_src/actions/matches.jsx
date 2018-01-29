import {teamNormalize, teamsNormalize} from "../normalizers/teams";
import {apiLoad} from "./load";
import {matchesNormalize, matchNormalize, turnNormalize, turnsNormalize} from "../normalizers/matches";

export const LOAD_MATCHES_SUCCESS = 'LOAD_MATCHES_SUCCESS';
export const LOAD_MATCHES_MORE = 'LOAD_MATCHES_MORE';
export const LOAD_MATCHES = 'LOAD_MATCHES';
export const LOAD_MATCHES_ERROR = 'LOAD_MATCHES_ERROR';
export const LOAD_MATCH_SUCCESS = 'LOAD_MATCH_SUCCESS';
export const LOAD_OWN_MATCH_SUCCESS = 'LOAD_OWN_MATCH_SUCCESS';
export const LOAD_MATCH = 'LOAD_MATCH';
export const LOAD_MATCH_ERROR = 'LOAD_MATCH_ERROR';
export const LOAD_TURNS_SUCCESS = 'LOAD_TURNS_SUCCESS';
export const LOAD_TURNS_MORE = 'LOAD_TURNS_MORE';
export const LOAD_TURNS = 'LOAD_TURNS';
export const LOAD_TURNS_ERROR = 'LOAD_TURNS_ERROR';
export const LOAD_TURN_SUCCESS = 'LOAD_TURN_SUCCESS';
export const LOAD_OWN_TURN_SUCCESS = 'LOAD_OWN_TURN_SUCCESS';
export const LOAD_TURN = 'LOAD_TURN';
export const LOAD_TURN_ERROR = 'LOAD_TURN_ERROR';
export const MATCH_UNMOUNT = 'MATCH_UNMOUNT';

export function matchUnmount() {
    return {
        type: MATCH_UNMOUNT,
    }
}


export function loadMatches(url) {
    const types = [LOAD_MATCHES, LOAD_MATCHES_SUCCESS, LOAD_MATCHES_ERROR];
    return apiLoad(url, 'GET', types, null, matchesNormalize, false);
}

export function loadMatchesMore(url) {
    const types = [LOAD_MATCHES, LOAD_MATCHES_MORE, LOAD_MATCHES_ERROR];
    return apiLoad(url, 'GET', types, null, matchesNormalize, false);
}


export function loadMatch(url) {
    const types = [LOAD_MATCH, LOAD_OWN_MATCH_SUCCESS, LOAD_MATCH_ERROR];
    return apiLoad(url, 'GET', types, null, matchNormalize, true);
}

export function matchCreate(url, name) {
    const types = [LOAD_MATCH, LOAD_MATCH_SUCCESS, LOAD_MATCH_ERROR];
    return apiLoad(url, 'POST', types, JSON.stringify({name}), matchNormalize, true);
}

export function loadTurnss(url) {
    const types = [LOAD_TURNS, LOAD_TURNS_SUCCESS, LOAD_TURNS_ERROR];
    return apiLoad(url, 'GET', types, null, turnsNormalize, false);
}

export function loadTurnsMore(url) {
    const types = [LOAD_TURNS, LOAD_TURNS_MORE, LOAD_TURNS_ERROR];
    return apiLoad(url, 'GET', types, null, turnsNormalize, false);
}


export function loadTurn(url) {
    const types = [LOAD_MATCH, LOAD_OWN_TURN_SUCCESS, LOAD_TURN_ERROR];
    return apiLoad(url, 'GET', types, null, turnNormalize, true);
}

export function turnCreate(url, name) {
    const types = [LOAD_TURN, LOAD_TURN_SUCCESS, LOAD_TURN_ERROR];
    return apiLoad(url, 'POST', types, JSON.stringify({name}), turnNormalize, true);
}

export function matchEdit(url, name) {
    const types = [LOAD_MATCH, LOAD_MATCH_SUCCESS, LOAD_MATCH_ERROR];
    return apiLoad(url, 'PUT', types, JSON.stringify({name}), matchNormalize, true);
}
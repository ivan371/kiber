import {teamNormalize, teamsNormalize} from "../normalizers/teams";
import {apiLoad} from "./load";

export const LOAD_TEAMS_SUCCESS = 'LOAD_TEAMS_SUCCESS';
export const LOAD_TEAMS_MORE = 'LOAD_TEAMS_MORE';
export const LOAD_TEAMS = 'LOAD_TEAMS';
export const LOAD_TEAMS_ERROR = 'LOAD_TEAMS_ERROR';
export const LOAD_TEAM_SUCCESS = 'LOAD_TEAM_SUCCESS';
export const LOAD_OWN_TEAM_SUCCESS = 'LOAD_TEAM_SUCCESS';
export const LOAD_TEAM = 'LOAD_TEAM';
export const LOAD_TEAM_ERROR = 'LOAD_TEAM_ERROR';



export function loadTeams(url) {
    const types = [LOAD_TEAMS, LOAD_TEAMS_SUCCESS, LOAD_TEAMS_ERROR];
    return apiLoad(url, 'GET', types, null, teamsNormalize, false);
}

export function loadTeamsMore(url) {
    const types = [LOAD_TEAMS, LOAD_TEAMS_MORE, LOAD_TEAMS_ERROR];
    return apiLoad(url, 'GET', types, null, teamsNormalize, false);
}


export function loadTeam(url) {
    const types = [LOAD_TEAM, LOAD_OWN_TEAM_SUCCESS, LOAD_TEAM_ERROR];
    return apiLoad(url, 'GET', types, null, teamNormalize, true);
}

export function teamCreate(url, name) {
    const types = [LOAD_TEAM, LOAD_TEAM_SUCCESS, LOAD_TEAM_ERROR];
    return apiLoad(url, 'POST', types, JSON.stringify({name}), teamNormalize, true);
}
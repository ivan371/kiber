import {teamNormalize, teamsNormalize, teamUserNormalize, teamUsersNormalize} from "../normalizers/teams";
import {apiLoad} from "./load";

export const LOAD_TEAMS_SUCCESS = 'LOAD_TEAMS_SUCCESS';
export const LOAD_TEAMS_MORE = 'LOAD_TEAMS_MORE';
export const LOAD_TEAMS = 'LOAD_TEAMS';
export const LOAD_TEAMS_ERROR = 'LOAD_TEAMS_ERROR';
export const LOAD_TEAM_SUCCESS = 'LOAD_TEAM_SUCCESS';
export const LOAD_OWN_TEAM_SUCCESS = 'LOAD_OWN_TEAM_SUCCESS';
export const LOAD_TEAM = 'LOAD_TEAM';
export const LOAD_TEAM_ERROR = 'LOAD_TEAM_ERROR';
export const LOAD_TEAM_USER = 'LOAD_TEAM_USER';
export const LOAD_TEAM_USER_SUCCESS = 'LOAD_TEAM_USER_SUCCESS';
export const LOAD_TEAM_USER_ERROR = 'LOAD_TEAM_USER_ERROR';
export const LOAD_TEAM_USERS = 'LOAD_TEAM_USERS';
export const LOAD_TEAM_USERS_SUCCESS = 'LOAD_TEAM_USERS_SUCCESS';
export const LOAD_TEAM_USERS_ERROR = 'LOAD_TEAM_USERS_ERROR';
export const TEAM_USER_DELETE = 'TEAM_USER_DELETE';
export const TEAM_USER_DELETE_SUCCESS = 'TEAM_USER_DELETE_SUCCESS';
export const TEAM_USER_DELETE_ERROR = 'TEAM_USER_DELETE_ERROR';
export const TEAM_UNMOUNT = 'TEAM_UNMOUNT';

export function teamUnmount() {
    return {
        type: TEAM_UNMOUNT,
    }
}

export function deleteTeamUser(url, id) {
    const types = [TEAM_USER_DELETE, TEAM_USER_DELETE_SUCCESS, TEAM_USER_DELETE_ERROR];
    return apiLoad(url, 'DELETE', types, null, () => {}, true, id);
}

export function loadTeamUser(url, user) {
    const types = [LOAD_TEAM_USER, LOAD_TEAM_USER_SUCCESS, LOAD_TEAM_USER_ERROR];
    return apiLoad(url, 'POST', types, JSON.stringify({user}), teamUserNormalize, true);
}

export function loadTeamUsers(url) {
    const types = [LOAD_TEAM_USERS, LOAD_TEAM_USERS_SUCCESS, LOAD_TEAM_USERS_ERROR];
    return apiLoad(url, 'GET', types, null, teamUsersNormalize, false);
}

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

export function teamEdit(url, name) {
    const types = [LOAD_TEAM, LOAD_TEAM_SUCCESS, LOAD_TEAM_ERROR];
    return apiLoad(url, 'PUT', types, JSON.stringify({name}), teamNormalize, true);
}
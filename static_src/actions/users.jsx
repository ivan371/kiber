import {userNormalize, usersNormalize} from "../normalizers/users";
import {apiLoad} from "./load";

export const LOAD_USERS = 'LOAD_USERS';
export const LOAD_USERS_SUCCESS = 'LOAD_USERS_SUCCESS';
export const LOAD_USERS_ERROR = 'LOAD_USERS_ERROR';
export const LOAD_USER = 'LOAD_USER';
export const LOAD_USER_SUCCESS = 'LOAD_USER_SUCCESS';
export const LOAD_USER_ERROR = 'LOAD_USER_ERROR';
export const LOGIN = 'LOGIN';
export const LOGIN_SUCCESS = 'LOGIN_SUCCESS';
export const LOGIN_ERROR = 'LOGIN_ERROR';
export const LOGOUT = 'LOGOUT';
export const REGISTRATION = 'REGISTRATION';
export const REGISTRATION_SUCCESS = 'REGISTRATION_SUCCESS';
export const REGISTRATION_ERROR = 'REGISTRATION_ERROR';

export function loadUser(url) {
    const types = [LOAD_USER, LOAD_USER_SUCCESS, LOAD_USER_ERROR];
    return apiLoad(url, 'GET', types, null, userNormalize, true);
}

export function loadUsers(url) {
    const types = [LOAD_USERS, LOAD_USERS_SUCCESS, LOAD_USERS_ERROR];
    return apiLoad(url, 'GET', types, null, usersNormalize, false);
}

export function registration(url, username, password, email, first_name, last_name) {
    const types = [REGISTRATION, REGISTRATION_SUCCESS, REGISTRATION_ERROR];
    return apiLoad(url, 'POST', types, JSON.stringify({username, password, email, first_name, last_name}), o => o, true);
}

export function login(url, username, password, client_id, client_secret, grant_type) {
    const types = [LOGIN, LOGIN_SUCCESS, LOGIN_ERROR];
    let form = new FormData();
    form.append('username',username);
    form.append('password', password);
    form.append('client_id', client_id);
    form.append('password', password);
    form.append('client_secret', client_secret);
    form.append('grant_type', grant_type);
    // return apiLoad(url, 'POST', types, JSON.stringify({username, password, client_id, client_secret, grant_type}), () => {}, true);
    return apiLoad(url, 'POST', types, form, o => o, true, null, true);
}

export function logout() {
    return {
        type: LOGOUT,
    }
}
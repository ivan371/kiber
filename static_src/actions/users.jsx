import {usersNormalize} from "../normalizers/users";
import {apiLoad} from "./load";

export const LOAD_USERS = 'LOAD_USERS';
export const LOAD_USERS_SUCCESS = 'LOAD_USERS_SUCCESS';
export const LOAD_USERS_ERROR = 'LOAD_USERS_ERROR';

export function loadUsers(url) {
    const types = [LOAD_USERS, LOAD_USERS_SUCCESS, LOAD_USERS_ERROR];
    return apiLoad(url, 'GET', types, null, usersNormalize, false);
}
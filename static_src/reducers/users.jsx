import update from 'react-addons-update';
import {LOAD_USER_SUCCESS, LOAD_USERS, LOAD_USERS_SUCCESS, LOGIN_ERROR, LOGIN_SUCCESS, LOGOUT} from "../actions/users";

const inititalStore = {
    users: {},
    userList: [],
    isLoading: false,
    isLogin: localStorage.hasOwnProperty("token"),
    isFailed: false,
};


export default function users (store = inititalStore, action) {

    if (action.hasOwnProperty('payload')) {
        if (action.payload !== undefined) {
            if (action.payload.hasOwnProperty('entities')) {
                if (action.payload.entities.hasOwnProperty('user')) {
                    store = update(store, {
                        users: {
                            $merge: action.payload.entities.user,
                        },
                    });
                }
            }
        }
    }
    switch (action.type) {
        case LOAD_USERS:
            return update(store, {
                isLoading: {
                    $set: false,
                }
            });
        case LOGOUT:
            localStorage.clear();
            return update(store, {
                isLogin: {
                    $set: false,
                }
            });
        case LOGIN_SUCCESS:
            localStorage.setItem("token", action.payload.access_token);
            return update(store, {
                isLogin: {
                    $set: true,
                },
                isFailed: {
                    $set: false,
                }
            });
        case LOGIN_ERROR:
            return update(store, {
                isFailed: {
                    $set: true,
                }
            });
        case LOAD_USERS_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true,
                },
                userList:{
                    $set: action.payload.result,
                }
            });
        case LOAD_USER_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true,
                },
                userList:{
                    $set: [action.payload.result],
                }
            });
        default:
            return store;
    }
}
import update from 'react-addons-update';
import {LOAD_USERS, LOAD_USERS_SUCCESS} from "../actions/users";

const inititalStore = {
    users: {},
    userList: [],
    isLoading: false,
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
        case LOAD_USERS_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true,
                },
                userList:{
                    $set: action.payload.result,
                }
            });
        default:
            return store;
    }
}
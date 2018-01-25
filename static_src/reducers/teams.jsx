import update from 'react-addons-update';
import {LOAD_TEAM, LOAD_TEAM_SUCCESS, LOAD_TEAMS, LOAD_TEAMS_MORE, LOAD_TEAMS_SUCCESS} from "../actions/teams";


const inititalStore = {
    isLoading: false,
    count: 0,
    page: 2,
    teams: {},
    teamList: [],
};


export default function teams (store = inititalStore, action) {

    if (action.hasOwnProperty('payload')) {
        if (action.payload !== undefined) {
            if (action.payload.hasOwnProperty('entities')) {
                if (action.payload.entities.hasOwnProperty('team')) {
                    store = update(store, {
                        teams: {
                            $merge: action.payload.entities.team,
                        },
                    });
                }
            }
        }
    }
    switch (action.type) {
        case LOAD_TEAMS:
            return update(store, {
                isLoading: {
                    $set: false
                }
            });
        case LOAD_TEAM:
            return update(store, {
                isLoading: {
                    $set: false
                }
            });
        case LOAD_TEAM_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                teamsList: {
                    $unshift: [action.payload.result]
                },
            });
        case LOAD_TEAMS_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                teamsList: {
                    $set: action.payload.result
                },
                count: {
                    $set: action.payload.count,
                },
                page: {
                    $set: 2,
                }
            });
        case LOAD_TEAMS_MORE:
            return update(store, {
                isLoading: {
                    $set: true
                },
                teamsList: {
                    $push: action.payload.result
                },
                count: {
                    $set: action.payload.count,
                },
                page: {
                    $set: store.page + 1,
                },
            });
        default:
            return store;
    }
}
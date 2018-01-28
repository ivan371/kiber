import update from 'react-addons-update';
import {
    LOAD_OWN_TEAM_SUCCESS, LOAD_TEAM, LOAD_TEAM_SUCCESS, LOAD_TEAM_USER_SUCCESS, LOAD_TEAM_USERS,
    LOAD_TEAM_USERS_SUCCESS, LOAD_TEAMS,
    LOAD_TEAMS_MORE,
    LOAD_TEAMS_SUCCESS, TEAM_USER_DELETE_SUCCESS
} from "../actions/teams";


const inititalStore = {
    isLoading: false,
    isTeamUserLoading: false,
    count: 0,
    page: 2,
    teams: {},
    teamList: [],
    teamUsers: {},
    teamUsersList: [],
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
                if (action.payload.entities.hasOwnProperty('teamuser')) {
                    store = update(store, {
                        teamUsers: {
                            $merge: action.payload.entities.teamuser,
                        },
                    });
                }
            }
        }
    }
    let index = null;
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
        case LOAD_TEAM_USER_SUCCESS:
            return update(store, {
                teamUsersList: {
                    $unshift: [action.payload.result]
                }
            });
        case TEAM_USER_DELETE_SUCCESS:
            index = store.teamUsersList.indexOf(action.id);
            return update(store, {
                teamUsersList: {
                    $splice: [[index, 1]],
                }
            });
        case LOAD_OWN_TEAM_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                teamsList: {
                    $set: [action.payload.result]
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
        case LOAD_TEAM_USERS:
            return update(store, {
                isTeamUserLoading: {
                    $set: false
                }
            });
        case LOAD_TEAM_USERS_SUCCESS:
            return update(store, {
                isTeamUserLoading: {
                    $set: true
                },
                teamUsersList: {
                    $set: action.payload.result
                },
            });
        default:
            return store;
    }
}
import update from 'react-addons-update';
import {
    LOAD_MATCH, LOAD_MATCH_SUCCESS, LOAD_MATCHES, LOAD_MATCHES_MORE, LOAD_MATCHES_SUCCESS,
    LOAD_OWN_MATCH_SUCCESS, LOAD_OWN_TURN_SUCCESS, LOAD_TURN, LOAD_TURN_SUCCESS, LOAD_TURNS, LOAD_TURNS_MORE,
    LOAD_TURNS_SUCCESS, MATCH_UNMOUNT
} from "../actions/matches";

const inititalStore = {
    isLoading: false,
    count: 0,
    page: 2,
    matches: {},
    matchList: [],
    turns: {},
    turnList: [],
};


export default function matches (store = inititalStore, action) {

    if (action.hasOwnProperty('payload')) {
        if (action.payload !== undefined) {
            if (action.payload.hasOwnProperty('entities')) {
                if (action.payload.entities.hasOwnProperty('match')) {
                    store = update(store, {
                        matches: {
                            $merge: action.payload.entities.match,
                        },
                    });
                }
                if (action.payload.entities.hasOwnProperty('turn')) {
                    store = update(store, {
                        turns: {
                            $merge: action.payload.entities.turn,
                        },
                    });
                }
            }
        }
    }
    switch (action.type) {
        case MATCH_UNMOUNT:
            return update(store, {
                isLoading: false,
            });
        case LOAD_MATCHES:
            return update(store, {
                isLoading: {
                    $set: false
                }
            });
        case LOAD_MATCH:
            return update(store, {
                isLoading: {
                    $set: false
                }
            });
        case LOAD_MATCH_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                matchList: {
                    $unshift: [action.payload.result]
                },
            });
        case LOAD_OWN_MATCH_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                matchList: {
                    $set: [action.payload.result]
                },
            });
        case LOAD_MATCHES_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                matchesList: {
                    $set: action.payload.result
                },
                count: {
                    $set: action.payload.count,
                },
                page: {
                    $set: 2,
                }
            });
        case LOAD_MATCHES_MORE:
            return update(store, {
                isLoading: {
                    $set: true
                },
                matchesList: {
                    $push: action.payload.result
                },
                count: {
                    $set: action.payload.count,
                },
                page: {
                    $set: store.page + 1,
                },
            });
        case LOAD_TURNS:
            return update(store, {
                isLoading: {
                    $set: false
                }
            });
        case LOAD_TURN:
            return update(store, {
                isLoading: {
                    $set: false
                }
            });
        case LOAD_TURN_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                turnsList: {
                    $unshift: [action.payload.result]
                },
            });
        case LOAD_OWN_TURN_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                turnList: {
                    $set: [action.payload.result]
                },
            });
        case LOAD_TURNS_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                turnList: {
                    $set: action.payload.result
                },
                count: {
                    $set: action.payload.count,
                },
                page: {
                    $set: 2,
                }
            });
        case LOAD_TURNS_MORE:
            return update(store, {
                isLoading: {
                    $set: true
                },
                turnsList: {
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
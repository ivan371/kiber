import update from 'react-addons-update';
import {LOAD_GAME, LOAD_GAME_SUCCESS, LOAD_GAMES, LOAD_GAMES_MORE, LOAD_GAMES_SUCCESS} from "../actions/games";


const inititalStore = {
    isLoading: false,
    count: 0,
    page: 2,
    games: {},
    gameList: [],
};


export default function games (store = inititalStore, action) {

    if (action.hasOwnProperty('payload')) {
        if (action.payload !== undefined) {
            if (action.payload.hasOwnProperty('entities')) {
                if (action.payload.entities.hasOwnProperty('game')) {
                    store = update(store, {
                        games: {
                            $merge: action.payload.entities.game,
                        },
                    });
                }
            }
        }
    }
    switch (action.type) {
        case LOAD_GAMES:
            return update(store, {
                isLoading: {
                    $set: false
                }
            });
        case LOAD_GAME:
            return update(store, {
                isLoading: {
                    $set: false
                }
            });
        case LOAD_GAME_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                gameList: {
                    $unshift: [action.payload.result]
                },
            });
        case LOAD_GAMES_SUCCESS:
            return update(store, {
                isLoading: {
                    $set: true
                },
                gameList: {
                    $set: action.payload.result
                },
                count: {
                    $set: action.payload.count,
                },
                page: {
                    $set: 2,
                }
            });
        case LOAD_GAMES_MORE:
            return update(store, {
                isLoading: {
                    $set: true
                },
                gamesList: {
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
import update from 'react-addons-update';
import {
    GAME_UNMOUNT,
    LOAD_GAME, LOAD_GAME_SUCCESS, LOAD_GAME_TEAM, LOAD_GAME_TEAM_SUCCESS, LOAD_GAMES, LOAD_GAMES_MORE,
    LOAD_GAMES_SUCCESS
} from "../actions/games";


const inititalStore = {
    isLoading: false,
    isGameTeamLoading: false,
    count: 0,
    page: 2,
    games: {},
    gameList: [],
    gameTeams: {},
    gameTeamList: [],
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
                if (action.payload.entities.hasOwnProperty('gameteam')) {
                    store = update(store, {
                        gameTeams: {
                            $merge: action.payload.entities.gameteam,
                        },
                    });
                }
            }
        }
    }
    switch (action.type) {
        case GAME_UNMOUNT:
            return update(store, {
                isLoading: {
                    $set: false,
                },
                gameTeamList: {
                    $set: []
                },
                gameList: {
                    $set: [],
                }
            });
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
        case LOAD_GAME_TEAM:
            return update(store, {
                isGameTeamLoading: {
                    $set: false,
                }
            });
        case LOAD_GAME_TEAM_SUCCESS:
            return update(store, {
                isGameTeamLoading: {
                    $set: true,
                },
                gameTeamList: {
                    $set: action.payload.result,
                }
            });
        default:
            return store;
    }
}
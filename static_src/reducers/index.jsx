import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';
import teams from "./teams";
import users from "./users";
import games from "./games";

export default combineReducers({
    routerReducer,
    teams,
    users,
    games,
});
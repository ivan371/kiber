import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';
import teams from "./teams";
import users from "./users";

export default combineReducers({
    routerReducer,
    teams,
    users,
});
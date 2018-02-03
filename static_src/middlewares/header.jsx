import { isRSAA, CALL_API } from 'redux-api-middleware';

export const headerMiddleware = store => next => (action) => {
    console.log('dispatching', action);
    if (isRSAA(action)){
        console.log('ds')
        // action[CALL_API]['headers'] = { 'Authorization': `Bearer ${token}` };
    }
    return next(action);
};


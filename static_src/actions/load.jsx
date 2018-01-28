import {CALL_API, getJSON} from "redux-api-middleware";
import cookie from 'react-cookies';

export function apiLoad(url, method, types, body, normalizer, isSimple, id) {
    return {
        [CALL_API]: {
            credentials: 'same-origin',
            endpoint: url,
            headers: { 'Content-Type': 'application/json', "X-CSRFToken": cookie.load('csrftoken'), },
            method: method,
            body: body,
            types: [
                types[0],
                {
                    type: types[1],
                    payload: (action, state, res) => {
                        if (method === 'DELETE') {
                            return {id}
                        }
                        return getJSON(res).then(
                            (json) => {
                                if(isSimple)
                                    return normalizer(json);
                                else
                                    return Object.assign({}, normalizer(json.results), {count: json.count});
                            },
                        );
                    },
                },
                types[2],
            ],
        },
    };
}
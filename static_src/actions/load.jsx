import {CALL_API, getJSON} from "redux-api-middleware";
import cookie from 'react-cookies';

export function apiLoad(url, method, types, body, normalizer, isSimple, id, isForm=false) {
    return {
        [CALL_API]: {
            credentials: 'same-origin',
            endpoint: url,
            headers: !isForm ? {
                'Content-Type': 'application/json',
                'Authorization': localStorage.hasOwnProperty('token') ? 'Bearer ' + localStorage.token : null,
            } : {},
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
                                // if (isForm)
                                //     return json;
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
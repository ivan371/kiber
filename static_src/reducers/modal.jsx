import update from 'react-addons-update';
import {MODAL_OPEN, MODAL_VALUE, SET_MODAL_ID} from "../actions/modal";


const initialStore = {
    isOpen: false,
    modal: null,
    id: null,
};


export default function modal (store = initialStore, action) {
    switch (action.type) {
        case MODAL_OPEN:
            return update(store, {
                isOpen: {
                    $set: !store.isOpen,
                },
            });
        case MODAL_VALUE:
            return update(store, {
                modal: {
                    $set: action.value,
                }
            });
        case SET_MODAL_ID:
            return update(store, {
                id: {
                    $set: action.id,
                }
            });
        default:
            return store;
    }
}
import update from 'react-addons-update';
import {MODAL_OPEN, MODAL_VALUE} from "../actions/modal";


const initialStore = {
    isOpen: false,
    modal: null,
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
        default:
            return store;
    }
}
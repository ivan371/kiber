export const MODAL_OPEN = 'MODAL_OPEN';
export const MODAL_VALUE = 'MODAL_VALUE';
export const SET_MODAL_ID = 'SET_MODAL_ID';

export function modalOpen() {
    return {
        type: MODAL_OPEN,
    }
}

export function modalValue(value) {
    return {
        type: MODAL_VALUE,
        value
    }
}

export function setModalId(id) {
    return {
        type: SET_MODAL_ID,
        id
    }
}
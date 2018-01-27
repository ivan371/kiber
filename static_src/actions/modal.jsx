export const MODAL_OPEN = 'MODAL_OPEN';
export const MODAL_VALUE = 'MODAL_VALUE';

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
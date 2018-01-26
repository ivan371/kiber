import { normalize, schema } from 'normalizr';

export function matchesNormalize (match) {
    const matches = new schema.Entity('match');
    return normalize(match, [matches]);
}

export function matchNormalize (match) {
    const matches = new schema.Entity('match');
    return normalize(match, matches);
}

export function turnsNormalize (turn) {
    const turns = new schema.Entity('turn');
    return normalize(turn, [turns]);
}

export function turnNormalize (turn) {
    const turns = new schema.Entity('turn');
    return normalize(turn, turns);
}
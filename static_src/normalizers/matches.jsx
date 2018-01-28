import { normalize, schema } from 'normalizr';

export function matchesNormalize (match) {
    const turn = new schema.Entity('turn');
    const matches = new schema.Entity('match', {turn});
    return normalize(match, [matches]);
}

export function matchNormalize (match) {
    const turn = new schema.Entity('turn');
    const matches = new schema.Entity('match', {turn});
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
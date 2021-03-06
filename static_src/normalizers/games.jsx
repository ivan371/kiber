import { normalize, schema } from 'normalizr';

export function gamesNormalize (game) {
    const team = new schema.Entity('team');
    const games = new schema.Entity('game', {'winner': team});
    return normalize(game, [games]);
}

export function gameNormalize (games) {
    const team = new schema.Entity('team');
    const game = new schema.Entity('game', {'winner': team});
    return normalize(games, game);
}

export function gameTeamsNormalize(gameTeams) {
    const game = new schema.Entity('game');
    const team = new schema.Entity('team');
    const gameTeam = new schema.Entity('gameteam', {game: game, team: team});
    return normalize(gameTeams, [gameTeam]);
}

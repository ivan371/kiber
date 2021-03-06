import { normalize, schema } from 'normalizr';

export function teamsNormalize (team) {
    const user = new schema.Entity('user');
    const teams = new schema.Entity('team', {'admin': user});
    return normalize(team, [teams]);
}

export function teamNormalize (teams) {
    const user = new schema.Entity('user');
    const team = new schema.Entity('team', {'admin': user});
    return normalize(teams, team);
}

export function teamUsersNormalize(teamUsers) {
    const user = new schema.Entity('user');
    const team = new schema.Entity('team');
    const teamUser = new schema.Entity('teamuser', {user: user, team: team});
    return normalize(teamUsers, [teamUser]);
}

export function teamUserNormalize(teamUsers) {
    const teamUser = new schema.Entity('teamuser');
    return normalize(teamUsers, teamUser);
}
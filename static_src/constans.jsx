export const urls = {
    team : {
        teamUrl: '/api/teams/',
        teamUserUrl: '/api/teamuser/'
    },
    game: {
        gameUrl: '/api/games/',
        gameMatch: '/api/games/?match=',
        gameTeamUrl: '/api/gameteam/'
    },
    match: {
        matchUrl: '/api/matches/'
    },
    turn: {
        turnsUrl: '/api/turns/',
    },
    user: {
        userUrl: '/api/users/',
        currentUrl: '/api/users/current/'
    },
    login: {
        loginUrl: '/o/token/',
    }
};

export const modalConst = {
    users: 'users',
    teamEdit: 'teamEdit',
    matchEdit: 'matchEdit',
    gameCreate: 'gameCreate',
};

export const secrets = {
    client_id: 'I2h4votqGuvUQwG8tJG93aI17BXlTNEF6aM2v1Nu',
    grant_type: 'password',
};
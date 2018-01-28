import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {loadTeam, loadTeamUsers} from "../../actions/teams";
import {urls} from "../../constans";
import {loadMatch} from "../../actions/matches";
import MatchPage from "./MatchPage";
import {loadGames} from "../../actions/games";
import Game from "../Game/Game";

class OwnMatchComponent extends React.Component {
    componentDidMount() {
        this.props.loadMatch(urls.match.matchUrl + this.props.match.params.id + '/');
        this.props.loadGames(urls.game.gameUrl  + '?match=' + this.props.match.params.id);
    }
    render () {
        let match = null;
        if(this.props.isLoading) {
            match = <MatchPage id={parseInt(this.props.match.params.id)}/>;
        }
        let gameList = [];
        if (this.props.isGamesLoading) {
            gameList = this.props.gameList.map(
                (gameId) => {
                    return <Game key={ gameId } id={ gameId } />
                }
            );
        }
        return(
            <div className="teams">
                {this.props.isLoading ? match : <div className="loading"/>}
                {this.props.isGamesLoading ? gameList : <div className="loading"/>}
            </div>
        );
    }
}

OwnMatchComponent.propTypes = {
};

const mapStoreToProps = (state, props) => ({
    isLoading: state.matches.isLoading,
    isGamesLoading: state.games.isLoading,
    gameList: state.games.gameList,
    count: state.games.count,
    page: state.games.page,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadMatch,
            loadGames,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(OwnMatchComponent);
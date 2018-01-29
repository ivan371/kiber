import React from 'react';
import {loadGames, loadGamesMore, loadGameTeams} from "../../actions/games";
import {urls} from "../../constans";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {connect} from "react-redux";
import Game from "../Game/Game";

class TeamGamesComponent extends React.Component {
    componentDidMount() {
        this.props.loadGameTeams(urls.game.gameTeamUrl + '?team=' + this.props.id);
    }
    onLoadMore = (e) => {
        this.props.loadGamesMore(urls.game.gameUrl + '?offset=' + (this.props.page - 1) * 10);
    };
    render () {
        let gameList = [];
        if (this.props.isLoading) {
            gameList = this.props.gameTeamList.map(
                (gameId) => {
                    return <Game key={ gameId } id={ this.props.gameTeams[gameId].game } />
                }
            );
        }
        return(
            <div className="left-menu">
                {gameList}
                { this.props.isLoading && this.props.count > (10 * (this.props.page - 1)) ? <div>
                    <button onClick={this.onLoadMore}>Показать еще</button>
                </div> : null }
            </div>
        );
    }
}

TeamGamesComponent.propTypes = {
    id: PropTypes.number.isRequired,
};

const mapStoreToProps = (state, props) => ({
    isLoading: state.games.isGameTeamLoading,
    gameTeamList: state.games.gameTeamList,
    gameTeams: state.games.gameTeams,
    count: state.games.count,
    page: state.games.page,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadGames,
            loadGamesMore,
            loadGameTeams
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(TeamGamesComponent);
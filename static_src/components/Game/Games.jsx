import React from 'react';
import {gameUnmount, loadGames, loadGamesMore} from "../../actions/games";
import {urls} from "../../constans";
import {bindActionCreators} from "redux";
import {connect} from "react-redux";
import Game from "./Game";
import GameForm from "./GameForm";

class GamesComponent extends React.Component {
    componentDidMount() {
        this.props.loadGames(urls.game.gameUrl);
    }
    componentWillUnmount() {
        this.props.gameUnmount();
    }
    onLoadMore = (e) => {
        this.props.loadGamesMore(urls.game.gameUrl + '?offset=' + (this.props.page - 1) * 10);
    };
    render () {
        let gameList = [];
        if (this.props.isLoading) {
            gameList = this.props.gameList.map(
                (gameId) => {
                    return <Game key={ gameId } id={ gameId } />
                }
            );
        }
        return(
            <div className="teams">
                {/*<GameForm/>*/}
                {gameList}
                { this.props.isLoading && this.props.count > (10 * (this.props.page - 1)) ? <div>
                    <button onClick={this.onLoadMore}>Показать еще</button>
                </div> : null }
            </div>
        );
    }
}

GamesComponent.propTypes = {
};

const mapStoreToProps = (state, props) => ({
    isLoading: state.games.isLoading,
    gameList: state.games.gameList,
    count: state.games.count,
    page: state.games.page,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadGames,
            loadGamesMore,
            gameUnmount
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(GamesComponent);
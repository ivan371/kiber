import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {urls} from "../../constans";
// import TeamPage from "./TeamPage";
import {loadGame} from "../../actions/games";
import GamePage from "./GamePage";

class OwnGameComponent extends React.Component {
    componentDidMount() {
        this.props.loadGame(urls.game.gameUrl + this.props.match.params.id + '/');
    }
    render () {
        let game = null;
        if(this.props.isLoading) {
            game = <GamePage id={parseInt(this.props.match.params.id)}/>;
        }
        return(
            <div className="teams">
                {game}
            </div>
        );
    }
}

OwnGameComponent.propTypes = {
};

const mapStoreToProps = (state, props) => ({
    isLoading: state.games.isLoading,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadGame,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(OwnGameComponent);
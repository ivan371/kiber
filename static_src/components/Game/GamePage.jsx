import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';

class GamePageComponent extends React.Component {
    render () {
        return(
            <div className="team">
                <h2>Игра {this.props.name}</h2>
                <p>Победитель{this.props.teamName}</p>
            </div>
        );
    }
}

GamePageComponent.propTypes = {
    id: PropTypes.number.isRequired
};

const mapStoreToProps = (state, props) => ({
    name: state.games.games[props.id].name,
    teamName: state.teams.teams[state.games.games[props.id].winner].name,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(GamePageComponent);
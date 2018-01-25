import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";

class GameComponent extends React.Component {
    render () {
        return(
            <div className="team">
                <h3><Link to={"/game/" + this.props.id}>{this.props.name}</Link></h3>
                <p>{this.props.teamName}</p>
            </div>
        );
    }
}

GameComponent.propTypes = {
    id: PropTypes.number.isRequired,
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
)(GameComponent);
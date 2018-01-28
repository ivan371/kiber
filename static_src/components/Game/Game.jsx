import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";

class GameComponent extends React.Component {
    render () {
        return(
            <div className="match">
                <div>
                    <h3><Link to={"/game/" + this.props.id}>{this.props.name}</Link></h3>
                </div>
                <div>
                    <p>{this.props.date}</p>
                </div>
            </div>
        );
    }
}

GameComponent.propTypes = {
    id: PropTypes.number.isRequired,
};

const mapStoreToProps = (state, props) => ({
    name: state.games.games[props.id].name,
    date: state.games.games[props.id].date,
    // teamName: state.teams.teams[state.games.games[props.id].winner].name,
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
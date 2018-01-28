import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";

class MatchComponent extends React.Component {
    render () {
        return(
            <div className="match">
                <div><img src={this.props.avatar}/>
                    <h3><Link to={"/match/" + this.props.id}>{this.props.name}</Link></h3>
                </div>
                <div>
                    <p>{this.props.games} игр</p>
                </div>
                <div>
                    <p>Турнир <Link to={"/turn/" + this.props.turnId}>{this.props.turnName}</Link></p>
                </div>
            </div>
        );
    }
}

MatchComponent.propTypes = {
    id: PropTypes.number.isRequired,
};

const mapStoreToProps = (state, props) => ({
    name: state.matches.matches[props.id].name,
    games: state.matches.matches[props.id].games,
    avatar: state.matches.matches[props.id].avatar,
    turnName: state.matches.turns[state.matches.matches[props.id].turn].name,
    turnId: state.matches.turns[state.matches.matches[props.id].turn].id,
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
)(MatchComponent);
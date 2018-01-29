import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";

class TeamComponent extends React.Component {
    render () {
        return(
            <div className="team">
                <img src={this.props.avatar}/>
                <h3><Link to={"/team/" + this.props.id}>{this.props.name}</Link></h3>
                {/*<p>{this.props.first_name} {this.props.last_name}</p>*/}
                <p>{this.props.games} игр</p>
            </div>
        );
    }
}

TeamComponent.propTypes = {
    id: PropTypes.number.isRequired,
};

const mapStoreToProps = (state, props) => ({
    name: state.teams.teams[props.id].name,
    games: state.teams.teams[props.id].games,
    avatar: state.teams.teams[props.id].avatar,
    // first_name: state.users.users[state.teams.teams[props.id].admin].first_name,
    // last_name: state.users.users[state.teams.teams[props.id].admin].last_name,
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
)(TeamComponent);
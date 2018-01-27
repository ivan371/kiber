import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';

class TeamPageComponent extends React.Component {
    render () {
        return(
            <div>
                <div className="team">
                    <img className="edit" src="/static/img/light_check.png"/>
                    <img src={this.props.avatar}/>
                    <h2>Команда {this.props.name}</h2>
                    <p>{this.props.first_name} {this.props.last_name}</p>
                    <p>{this.props.games} игр</p>
                </div>
            </div>
        );
    }
}

TeamPageComponent.propTypes = {
    id: PropTypes.number.isRequired
};

const mapStoreToProps = (state, props) => ({
    name: state.teams.teams[props.id].name,
    first_name: state.users.users[state.teams.teams[props.id].admin].first_name,
    last_name: state.users.users[state.teams.teams[props.id].admin].last_name,
    games: state.teams.teams[props.id].games,
    avatar: state.teams.teams[props.id].avatar,
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
)(TeamPageComponent);
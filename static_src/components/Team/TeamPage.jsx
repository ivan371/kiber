import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';

class OwnTeamComponent extends React.Component {
    render () {
        return(
            <div className="team">
                <h2>Команда {this.props.name}</h2>
                <p>{this.props.first_name} {this.props.last_name}</p>
            </div>
        );
    }
}

OwnTeamComponent.propTypes = {
    id: PropTypes.number.isRequired
};

const mapStoreToProps = (state, props) => ({
    name: state.teams.teams[props.id].name,
    first_name: state.users.users[state.teams.teams[props.id].admin].first_name,
    last_name: state.users.users[state.teams.teams[props.id].admin].last_name,
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
)(OwnTeamComponent);
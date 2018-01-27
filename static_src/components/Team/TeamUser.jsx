import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";

class TeamUserComponent extends React.Component {
    render () {
        return(
            <div className="team">
                <p>{this.props.first_name} {this.props.last_name}</p>
            </div>
        );
    }
}

TeamUserComponent.propTypes = {
    id: PropTypes.number.isRequired,
};

const mapStoreToProps = (state, props) => ({
    first_name: state.users.users[state.teams.teamUsers[props.id].user].first_name,
    last_name: state.users.users[state.teams.teamUsers[props.id].user].last_name,
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
)(TeamUserComponent);
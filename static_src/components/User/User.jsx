import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";
import {modalOpen} from "../../actions/modal";
import {loadTeamUser} from "../../actions/teams";
import {urls} from "../../constans";

class UserComponent extends React.Component {

    modalOpen = (e) => {
        this.props.modalOpen();
    };

    addUser = (e) => {
        this.props.modalOpen();
        this.props.loadTeamUser(urls.team.teamUserUrl + '?team=' + this.props.teamId, this.props.userId);
    };

    render () {
        return(
            <div>
                <img className="user" src="/static/img/user.png"/>
                <img onClick={this.addUser} className="left-edit" src="/static/img/add.png"/>
                <p>{this.props.first_name} {this.props.last_name}</p>
            </div>
        );
    }
}

UserComponent.propTypes = {
    id: PropTypes.number.isRequired,
};

const mapStoreToProps = (state, props) => ({
    first_name: state.users.users[props.id].first_name,
    last_name: state.users.users[props.id].last_name,
    userId: state.users.users[props.id].id,
    teamId: state.modal.id,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            modalOpen,
            loadTeamUser
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(UserComponent);
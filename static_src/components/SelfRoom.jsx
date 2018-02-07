import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import React from 'react';
import {loadUser, login, logout, registration} from "../actions/users";
import {Redirect, withRouter} from "react-router-dom";
import Modal from "./Modal";
import {modalOpen} from "../actions/modal";
import {secrets, urls} from "../constans";
class SelfRoomComponent extends React.Component {

    componentDidMount() {
        this.props.loadUser(urls.user.currentUrl);
    }

    render() {
        return (
            <div className="teams">
                <div className="team">
                    Личный кабинет
                    {this.props.isLoading ?
                        <div>
                            <p>{this.props.users[this.props.userList[0]].first_name} {this.props.users[this.props.userList[0]].last_name}</p>
                        </div>
                        : <div className="loading"/>}
                </div>
            </div>
        )
    }
}
const mapStoreToProps = (state, props) => ({
    isLoading: state.users.isLoading,
    userList: state.users.userList,
    users: state.users.users,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadUser
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(SelfRoomComponent);

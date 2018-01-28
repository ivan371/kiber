import React from 'react';
import {loadTeams, loadTeamsMore} from "../../actions/teams";
import {urls} from "../../constans";
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import {loadUsers} from "../../actions/users";
import User from "./User";

class UsersComponent extends React.Component {

    componentDidMount() {
        this.props.loadUsers(urls.user.userUrl);
    }

    render () {
        let userList = [];
        if (this.props.isLoading) {
            userList = this.props.userList.map(
                (userId) => {
                    return <User key={userId} id={userId} />
                }
            );
        }
        return (
            <div className="teams">
                {userList}
                { this.props.isLoading && this.props.count > (10 * (this.props.page - 1)) ? <div>
                    <button onClick={this.onLoadMore}>Показать еще</button>
                </div> : null }
            </div>
        );
    }
}

const mapStoreToProps = (state, props) => ({
    isLoading: state.users.isLoading,
    userList: state.users.userList,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadUsers,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(UsersComponent);
import React from 'react';
import {loadTeams, loadTeamsMore} from "../../actions/teams";
import {urls} from "../../constans";
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import Team from "./Team";
import TeamForm from "./TeamForm";
import TeamUser from "./TeamUser";
import PropTypes from 'prop-types';

class TeamUsersComponent extends React.Component {

    render () {
        let teamUserList = [];
        if (this.props.isLoading) {
            teamUserList = this.props.teamUserList.map(
                (teamUserId) => {
                    return <TeamUser key={teamUserId} id={teamUserId} teamId={this.props.id}/>
                }
            );
        }
        return (
            <div className="teams-users">
                {this.props.isLoading ? teamUserList : <div className="loading"/>}
                { this.props.isLoading && this.props.count > (10 * (this.props.page - 1)) ? <div>
                    <button onClick={this.onLoadMore}>Показать еще</button>
                </div> : null }
            </div>
        );
    }
}

const mapStoreToProps = (state, props) => ({
    isLoading: state.teams.isTeamUserLoading,
    teamUserList: state.teams.teamUsersList,
    // count: state.teams.count,
    // page: state.teams.page,
});

TeamUsersComponent.propTypes = {
    id: PropTypes.number.isRequired,
};

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(TeamUsersComponent);
import React from 'react';
import {loadTeams, loadTeamsMore, loadTeamUsers} from "../../actions/teams";
import {urls} from "../../constans";
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import Team from "./Team";
import TeamForm from "./TeamForm";

class TeamsComponent extends React.Component {

    componentDidMount() {
        this.props.loadTeamUsers(urls.team.teamUserUrl);
    }

    componentWillUpdate(nextProps, nextState) {
        if(this.state.team !== nextState.team) {
            if(nextState.team === 'my')
                this.props.loadTeamUsers(urls.team.teamUserUrl);
            else
                this.props.loadTeams(urls.team.teamUrl);
        }
    }

    onLoadMore = (e) => {
        this.props.loadTeamsMore(urls.team.teamUrl + '?offset=' + (this.props.page - 1) * 10);
    };

    state = {
        team: 'my',
    };

    switchTeam = (e) => {
        this.setState({team: e.target.name})
    };

    render () {
        let teamList = [];
        if(this.state.team === 'all') {
            if (this.props.isLoading) {
                teamList = this.props.teamList.map(
                    (teamId) => {
                        return <Team key={teamId} id={teamId}/>
                    }
                );
            }
        }
        else {
            if (this.props.isTeamUserLoading) {
                teamList = this.props.teamUsersList.map(
                    (teamId) => {
                        return <Team key={teamId} id={this.props.teamUsers[teamId].team}/>
                    }
                );
            }
        }
        return (
            <div className="teams">
                <div className="match">
                    <button name="my" onClick={this.switchTeam}>Мои команды</button>
                    <button name="all" onClick={this.switchTeam}>Все команды</button>
                </div>
                <TeamForm/>
                {this.props.isLoading || this.props.isTeamUserLoading ? teamList : <div className="loading"/>}
                { this.props.isLoading && this.props.count > (10 * (this.props.page - 1)) ? <div>
                    <button onClick={this.onLoadMore}>Показать еще</button>
                </div> : null }
            </div>
        );
    }
}

const mapStoreToProps = (state, props) => ({
    isLoading: state.teams.isLoading,
    isTeamUserLoading: state.teams.isTeamUserLoading,
    teamList: state.teams.teamsList,
    teamUsersList: state.teams.teamUsersList,
    teamUsers: state.teams.teamUsers,
    count: state.teams.count,
    page: state.teams.page,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadTeams,
            loadTeamsMore,
            loadTeamUsers,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(TeamsComponent);
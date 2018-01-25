import React from 'react';
import {loadTeams, loadTeamsMore} from "../../actions/teams";
import {urls} from "../../constans";
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import Team from "./Team";
import TeamForm from "./TeamForm";

class TeamsComponent extends React.Component {

    componentDidMount() {
        this.props.loadTeams(urls.team.teamUrl);
    }

    onLoadMore = (e) => {
        this.props.loadTeamsMore(urls.team.teamUrl + '?offset=' + (this.props.page - 1) * 10);
    };

    render () {
        let teamList = [];
        if (this.props.isLoading) {
            teamList = this.props.teamList.map(
                (teamId) => {
                    return <Team key={ teamId } id={ teamId } />
                }
            );
        }
        return (
            <div className="teams">
                <TeamForm/>
                {teamList}
                { this.props.isLoading && this.props.count > (10 * (this.props.page - 1)) ? <div>
                    <button onClick={this.onLoadMore}>Показать еще</button>
                </div> : null }
            </div>
        );
    }
}

const mapStoreToProps = (state, props) => ({
    isLoading: state.teams.isLoading,
    teamList: state.teams.teamsList,
    count: state.teams.count,
    page: state.teams.page,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadTeams,
            loadTeamsMore,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(TeamsComponent);
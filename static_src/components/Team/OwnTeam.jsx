import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {loadTeam, loadTeamUsers} from "../../actions/teams";
import {urls} from "../../constans";
import TeamPage from "./TeamPage";
import TeamUsers from "./TeamUsers";

class OwnTeamComponent extends React.Component {
    componentDidMount() {
        this.props.loadTeam(urls.team.teamUrl + this.props.match.params.id + '/');
        this.props.loadTeamUsers(urls.team.teamUserUrl  + '?team=' + this.props.match.params.id);
    }
    render () {
        let team = null;
        if(this.props.isLoading) {
            team = <TeamPage id={parseInt(this.props.match.params.id)}/>;
        }
        return(
            <div className="teams">
                {this.props.isLoading ? team : <div className="loading"/>}
                <TeamUsers/>
            </div>
        );
    }
}

OwnTeamComponent.propTypes = {
};

const mapStoreToProps = (state, props) => ({
    isLoading: state.teams.isLoading,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadTeam,
            loadTeamUsers
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(OwnTeamComponent);
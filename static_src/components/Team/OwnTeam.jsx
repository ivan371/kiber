import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {loadTeam} from "../../actions/teams";
import {urls} from "../../constans";
import TeamPage from "./TeamPage";

class OwnTeamComponent extends React.Component {
    componentDidMount() {
        this.props.loadTeam(urls.team.teamUrl + this.props.match.params.id + '/');
    }
    render () {
        let team = null;
        if(this.props.isLoading) {
            team = <TeamPage id={parseInt(this.props.match.params.id)}/>;
        }
        return(
            <div className="teams">
                {team}
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
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(OwnTeamComponent);
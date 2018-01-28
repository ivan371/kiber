import React from 'react';
import {loadTeams, loadTeamsMore} from "../../actions/teams";
import {urls} from "../../constans";
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import {loadMatches, loadMatchesMore} from "../../actions/matches";
import Match from "./Match";

class MatchesComponent extends React.Component {

    componentDidMount() {
        this.props.loadMatches(urls.match.matchUrl);
    }

    // onLoadMore = (e) => {
    //     this.props.loadTeamsMore(urls.team.teamUrl + '?offset=' + (this.props.page - 1) * 10);
    // };

    render () {
        let matchList = [];
        if (this.props.isLoading) {
            matchList = this.props.matchList.map(
                (matchId) => {
                    return <Match key={ matchId } id={ matchId } />
                }
            );
        }
        return (
            <div className="matches">
                <div className="match">
                    <div>
                        <p>Матч</p>
                    </div>
                    <div>
                        <p>Число игр</p>
                    </div>
                    <div>
                        <p>Турнир</p>
                    </div>
                </div>
                {this.props.isLoading ? matchList : <div className="loading"/>}
                { this.props.isLoading && this.props.count > (10 * (this.props.page - 1)) ? <div>
                    <button onClick={this.onLoadMore}>Показать еще</button>
                </div> : null }
            </div>
        );
    }
}

const mapStoreToProps = (state, props) => ({
    isLoading: state.matches.isLoading,
    matchList: state.matches.matchesList,
    count: state.matches.count,
    page: state.matches.page,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadMatches,
            loadMatchesMore,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(MatchesComponent);
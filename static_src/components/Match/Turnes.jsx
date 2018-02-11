import React from 'react';
import {loadTeams, loadTeamsMore} from "../../actions/teams";
import {urls} from "../../constans";
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import {loadTurns, turnUnmount} from "../../actions/matches";
import Turn from "./Turn";

class TurnesComponent extends React.Component {

    componentDidMount() {
        this.props.loadTurns(urls.turn.turnsUrl);
    }

    componentWillUnmount() {
        this.props.turnUnmount();
    }

    // onLoadMore = (e) => {
    //     this.props.loadTeamsMore(urls.team.teamUrl + '?offset=' + (this.props.page - 1) * 10);
    // };

    render () {
        let turnList = [];
        if (this.props.isLoading) {
            turnList = this.props.turnList.map(
                (turnId) => {
                    return <Turn key={ turnId } id={ turnId } />
                }
            );
        }
        return (
            <div className="teams">
                {/*<TeamForm/>*/}
                {turnList}
                {/*{ this.props.isLoading && this.props.count > (10 * (this.props.page - 1)) ? <div>*/}
                    {/*<button onClick={this.onLoadMore}>Показать еще</button>*/}
                {/*</div> : null }*/}
            </div>
        );
    }
}

const mapStoreToProps = (state, props) => ({
    isLoading: state.matches.isLoading,
    turnList: state.matches.turnList,
    count: state.matches.count,
    page: state.matches.page,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            loadTurns,
            turnUnmount,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(TurnesComponent);
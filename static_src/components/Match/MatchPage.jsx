import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {modalOpen, modalValue, setModalId} from "../../actions/modal";
import {modalConst} from "../../constans";
import {Link} from "react-router-dom";

class MatchPageComponent extends React.Component {

    gameCreate = (e) => {
        this.props.modalOpen();
        this.props.modalValue(modalConst.gameCreate);
        this.props.setModalId(this.props.id);
    };

    matchEdit = (e) => {
        this.props.modalOpen();
        this.props.modalValue(modalConst.matchEdit);
        this.props.setModalId(this.props.id);
    };

    render () {
        return(
            <div>
                <div className="team">
                    <img onClick={this.matchEdit} className="edit" src="/static/img/light_check.png"/>
                    <img src={this.props.avatar}/>
                    <h3>{this.props.name}</h3>
                    <p>{this.props.date}</p>
                    <p>{this.props.games} игр</p>
                    <b>Турнир <Link to={"/turn/" + this.props.turnId}>{this.props.turnName}</Link></b>
                    <img onClick={this.gameCreate} className="edit" src="/static/img/add.png"/>
                </div>
            </div>
        );
    }
}

MatchPageComponent.propTypes = {
    id: PropTypes.number.isRequired
};

const mapStoreToProps = (state, props) => ({
    name: state.matches.matches[props.id].name,
    games: state.matches.matches[props.id].games,
    date: state.matches.matches[props.id].date,
    avatar: state.matches.matches[props.id].avatar,
    turnName: state.matches.turns[state.matches.matches[props.id].turn].name,
    turnId: state.matches.turns[state.matches.matches[props.id].turn].id,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            modalOpen,
            modalValue,
            setModalId,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(MatchPageComponent);
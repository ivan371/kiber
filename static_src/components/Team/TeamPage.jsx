import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {modalOpen, modalValue, setModalId} from "../../actions/modal";
import {modalConst} from "../../constans";

class TeamPageComponent extends React.Component {

    addUser = (e) => {
        this.props.modalOpen();
        this.props.modalValue(modalConst.users);
        this.props.setModalId(this.props.id);
    };

    teamEdit = (e) => {
        this.props.modalOpen();
        this.props.modalValue(modalConst.teamEdit);
        this.props.setModalId(this.props.id);
    };

    render () {
        return(
            <div>
                <div className="team">
                    <img onClick={this.teamEdit} className="edit" src="/static/img/light_check.png"/>
                    <img src={this.props.avatar}/>
                    <h2>Команда {this.props.name}</h2>
                    <p>{this.props.first_name} {this.props.last_name}</p>
                    <p>{this.props.games} игр</p>
                    <img onClick={this.addUser} className="edit" src="/static/img/add.png"/>
                    <br/>
                </div>
            </div>
        );
    }
}

TeamPageComponent.propTypes = {
    id: PropTypes.number.isRequired
};

const mapStoreToProps = (state, props) => ({
    name: state.teams.teams[props.id].name,
    first_name: state.users.users[state.teams.teams[props.id].admin].first_name,
    last_name: state.users.users[state.teams.teams[props.id].admin].last_name,
    games: state.teams.teams[props.id].games,
    avatar: state.teams.teams[props.id].avatar,
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
)(TeamPageComponent);
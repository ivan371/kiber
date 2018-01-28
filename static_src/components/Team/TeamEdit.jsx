import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {teamCreate, teamEdit} from "../../actions/teams";
import {urls} from "../../constans";
import {modalOpen} from "../../actions/modal";

class TeamEditComponent extends React.Component {
    state = {
        name: this.props.name,
    };
    onChange = (e) => {
        this.setState({[e.target.name]: e.target.value});
    };
    teamEdit = (e) => {
        this.props.teamEdit(urls.team.teamUrl + this.props.teamId + '/', this.state.name);
        this.props.modalOpen();
    };
    render () {
        return(
            <div>
                <h2>Редактировать команду</h2>
                <input name="name" value={this.state.name} onChange={this.onChange}/>
                <button onClick={this.teamEdit}>Сохранить</button>
            </div>
        );
    }
}

TeamEditComponent.propTypes = {
};

const mapStoreToProps = (state, props) => ({
    name: state.teams.teams[state.modal.id].name,
    teamId: state.modal.id,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            teamEdit,
            modalOpen,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(TeamEditComponent);
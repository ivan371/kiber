import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {teamCreate, teamEdit} from "../../actions/teams";
import {urls} from "../../constans";
import {modalOpen} from "../../actions/modal";
import {matchEdit} from "../../actions/matches";

class TeamEditComponent extends React.Component {
    state = {
        name: this.props.name,
    };
    onChange = (e) => {
        this.setState({[e.target.name]: e.target.value});
    };
    matchEdit = (e) => {
        this.props.matchEdit(urls.match.matchUrl + this.props.matchId + '/', this.state.name);
        this.props.modalOpen();
    };
    render () {
        return(
            <div>
                <h2>Редактировать матч</h2>
                <input name="name" value={this.state.name} onChange={this.onChange}/>
                <button onClick={this.matchEdit}>Сохранить</button>
            </div>
        );
    }
}

TeamEditComponent.propTypes = {
};

const mapStoreToProps = (state, props) => ({
    name: state.matches.matches[state.modal.id].name,
    matchId: state.modal.id,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            matchEdit,
            modalOpen,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(TeamEditComponent);
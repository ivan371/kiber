import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {gameCreate} from "../../actions/games";
import {urls} from "../../constans";

class GameFormComponent extends React.Component {
    state = {
        name: '',
        date: '',
    };
    onChange = (e) => {
        this.setState({[e.target.name]: e.target.value});
    };
    onPress = (e) => {
        if(e.keyCode === 13) {
            this.onCreate(e);
        }
    };
    onCreate = (e) => {
        this.props.gameCreate(urls.game.gameMatch + this.props.id, this.state.name, this.state.date);
        this.setState({name: '', date: ''});
    };
    render () {
        return(
            <div>
                <h2>Создать игру</h2>
                <label>Название</label>
                <input type="text" onChange={this.onChange} value={this.state.name} name="name"/>
                <br/>
                <label>Дата</label>
                <input type="date" onChange={this.onChange} value={this.state.date} name="date"/>
                <button onClick={this.onCreate}>Создать</button>
            </div>
        );
    }
}

GameFormComponent.propTypes = {
};

const mapStoreToProps = (state, props) => ({
    id: state.modal.id,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            gameCreate,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(GameFormComponent);
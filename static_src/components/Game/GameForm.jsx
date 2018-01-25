import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {gameCreate} from "../../actions/games";
import {urls} from "../../constans";

class GameFormComponent extends React.Component {
    state = {
        name: '',
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
        this.props.gameCreate(urls.game.gameUrl, this.state.name);
        this.setState({name: ''});
    };
    render () {
        return(
            <div className="team">
                <h2>Создать игру</h2>
                <label>Название</label>
                <input type="text" onChange={this.onChange} onKeyDown={this.onPress} value={this.state.name} name="name"/>
                <button onClick={this.onCreate}>Создать</button>
            </div>
        );
    }
}

GameFormComponent.propTypes = {
};

const mapStoreToProps = (state, props) => ({
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
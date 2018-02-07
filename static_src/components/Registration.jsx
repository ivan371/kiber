import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import React from 'react';
import {login, logout, registration} from "../actions/users";
import {Redirect, withRouter} from "react-router-dom";
import Modal from "./Modal";
import {modalOpen} from "../actions/modal";
import {secrets, urls} from "../constans";
class RegistrationComponent extends React.Component {
    state = {
        login: '',
        password: '',
        first_name: '',
        last_name: '',
        email: '',
    };

    onChange = (e) => {
        this.setState({[e.target.name]: e.target.value});
    };

    onCreate = (e) => {
        this.props.registration(urls.user.userUrl, this.state.login, this.state.password, this.state.email, this.state.first_name, this.state.last_name);
    };

    render() {
        return (
            <div className="teams">
                <div className="team">
                    <h3>Регистрация</h3>
                    <p>Логин</p>
                    <input name="login" onChange={this.onChange}/>
                    <p>Пароль</p>
                    <input name="password" onChange={this.onChange} type="password"/>
                    <p>e-mail</p>
                    <input name="email" onChange={this.onChange}/>
                    <p>Имя</p>
                    <input name="first_name" onChange={this.onChange}/>
                    <p>Фамилия</p>
                    <input name="last_name" onChange={this.onChange}/>
                    <br/>
                    <button onClick={this.onCreate}>Зарегистрироваться</button>
                    {this.props.isFalied ? <p>Не правильный формат предоставленных данных!</p> : null}
                </div>
            </div>
        )
    }
}
const mapStoreToProps = (state, props) => ({
    isFalied: state.users.isFalied,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            registration
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(RegistrationComponent);

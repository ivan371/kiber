import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import React from 'react';
import {login, logout} from "../actions/users";
import {Redirect, withRouter} from "react-router-dom";
import Modal from "./Modal";
import {modalOpen} from "../actions/modal";
import {secrets, urls} from "../constans";
class LoginComponent extends React.Component {
    state = {
        login: '',
        password: '',
    };

    onChange = (e) => {
        this.setState({[e.target.name]: e.target.value});
    };

    login = () => {
        console.log(secrets.grant_type);
        this.props.login(urls.login.loginUrl, this.state.login, this.state.password, secrets.client_id, secrets.grant_type);
    };

    render() {
        const { from } = this.props.location.state || { from: { pathname: '/games' } };
        if (this.props.isLogin) {
            return (
                <Redirect to={from}/>
            )
        }
        return (
            <div className="teams">
                <div className="team">
                    <p>Логин</p>
                    <input name="login" onChange={this.onChange}/>
                    <p>Пароль</p>
                    <input name="password" onChange={this.onChange} type="password"/>
                    <br/>
                    <button onClick={this.login}>Войти</button>
                    {this.props.isFalied ? <p>Неверный логин или пароль!</p> : null}
                    <p>Еще не зарегистрированы?! <a href='/registration'>Зарегистрироваться</a></p>
                </div>
            </div>
        )
    }
}
const mapStoreToProps = (state, props) => ({
    isLogin: state.users.isLogin,
    isFailed: state.users.isFailed,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            login,
            logout,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(LoginComponent);

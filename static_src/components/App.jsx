import React from 'react';
import {Redirect, Route, Switch, withRouter} from "react-router-dom";
import Layout from "./Layout";
import Teams from "./Team/Teams";
import Games from "./Game/Games";
import OwnTeam from "./Team/OwnTeam";
import OwnGame from "./Game/OwnGame";
import Matches from "./Match/Matches";
import Turnes from "./Match/Turnes";
import Modal from "./Modal";
import OwnMatch from "./Match/OwnMatch";
import Login from "./Login";
import {connect} from "react-redux";
import {bindActionCreators} from "redux";

const PrivateRoute = ({ component: Component, isLogin, ...rest }) => (
    <Route {...rest} render={props => (
        isLogin ? (
            <Component {...props}/>
        ) : (
            <Redirect to={{
                pathname: '/login',
                state: { from: props.location }
            }}/>
        )
    )}/>
);


class AppComponent extends React.Component {
    render() {
        return (
            <div>
                <Layout/>
                <Modal/>
                <Switch>
                    <Route exact path="/login" component={Login} />
                    <PrivateRoute exact path="/teams" component={Teams} isLogin={this.props.isLogin}/>
                    <PrivateRoute exact path="/team/:id" component={OwnTeam} isLogin={this.props.isLogin}/>
                    <PrivateRoute exact path="/games" component={Games} isLogin={this.props.isLogin}/>
                    <PrivateRoute exact path="/game/:id" component={OwnGame} isLogin={this.props.isLogin}/>
                    <Route exact path="/matches" component={Matches}/>
                    <Route exact path="/turns" component={Turnes}/>
                    <Route exact path="/match/:id" component={OwnMatch}/>

                </Switch>
            </div>
        );
    }
}

const mapStoreToProps = (state, props) => ({
    isLogin: state.users.isLogin,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
        }, dispatch),
    };
};

export default withRouter(connect(
    mapStoreToProps,
    mapDispatchToProps
)(AppComponent));
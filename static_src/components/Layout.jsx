import React from 'react';
import {Link, withRouter} from "react-router-dom";
import {logout} from "../actions/users";
import {connect} from "react-redux";
import {bindActionCreators} from "redux";


class LayoutComponent extends React.Component {

    onLogout = () => {
        this.props.logout();
    };

    render() {
        return (
            <div className="menu">
                <Link to="/teams">
                    <div>
                        Команды
                    </div>
                </Link>
                <Link to="/games">
                    <div>
                        Игры
                    </div>
                </Link>
                <Link to="/matches">
                    <div>
                        Матчи
                    </div>
                </Link>
                <Link to="/turns">
                    <div>
                        Турниры
                    </div>
                </Link>
                {this.props.isLogin ?
                    <a onClick={this.onLogout}>
                        <div>
                            Выйти
                        </div>
                    </a>
                    :
                    <Link to="/login">
                        <div>
                            Войти
                        </div>
                    </Link>}
            </div>
        );
    }
}

const mapStoreToProps = (state, props) => ({
    isLogin: state.users.isLogin,
    isFailed: state.users.isFailed,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            logout,
        }, dispatch),
    };
};

export default withRouter(connect(
    mapStoreToProps,
    mapDispatchToProps
)(LayoutComponent));

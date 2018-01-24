import React from 'react';
import {Link} from "react-router-dom";


class LayoutComponent extends React.Component {
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
                <div>
                    Матчи
                </div>
                <div>
                    Турниры
                </div>
            </div>
        );
    }
}

export default LayoutComponent;
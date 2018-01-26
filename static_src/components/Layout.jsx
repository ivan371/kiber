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
            </div>
        );
    }
}

export default LayoutComponent;
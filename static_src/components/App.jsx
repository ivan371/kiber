import React from 'react';
import {Route, Switch} from "react-router-dom";
import Layout from "./Layout";
import Teams from "./Team/Teams";
import Games from "./Game/Games";
import OwnTeam from "./Team/OwnTeam";
import OwnGame from "./Game/OwnGame";


class AppComponent extends React.Component {
    render() {
        return (
            <div>
                <Layout/>
                <Switch>
                    <Route exact path="/teams" component={Teams}/>
                    <Route exact path="/team/:id" component={OwnTeam}/>
                    <Route exact path="/games" component={Games}/>
                    <Route exact path="/game/:id" component={OwnGame}/>
                </Switch>
            </div>
        );
    }
}

export default AppComponent;
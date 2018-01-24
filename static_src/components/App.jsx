import React from 'react';
import {Route, Switch} from "react-router-dom";
import Layout from "./Layout";
import Teams from "./Teams";
import Games from "./Games";


class AppComponent extends React.Component {
    render() {
        return (
            <div>
                <Layout/>
                <Switch>
                    <Route exact path="/teams" component={Teams}/>
                    <Route exact path="/games" component={Games}/>
                </Switch>
            </div>
        );
    }
}

export default AppComponent;
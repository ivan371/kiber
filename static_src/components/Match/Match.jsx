import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import PropTypes from 'prop-types';
import {Link} from "react-router-dom";

class MatchComponent extends React.Component {
    render () {
        return(
            <div className="team">
                <h3><Link to={"/match/" + this.props.id}>{this.props.name}</Link></h3>
            </div>
        );
    }
}

MatchComponent.propTypes = {
    id: PropTypes.number.isRequired,
};

const mapStoreToProps = (state, props) => ({
    name: state.matches.matches[props.id].name,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(MatchComponent);
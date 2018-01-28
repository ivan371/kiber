import React from 'react';
import {connect} from "react-redux";
import {bindActionCreators} from "redux";
import {modalOpen} from "../actions/modal";
import {modalConst} from "../constans";
import Users from "./User/Users";
import TeamEdit from "./Team/TeamEdit";

class ModalComponent extends React.Component {

    modalClose = (e) => {
        this.props.modalOpen();
    };

    render () {
        if(!this.props.isOpen) {
            return null;
        }
        let modal = null;
        switch (this.props.modal) {
            case modalConst.users:
                modal = <Users/>;
                break;
            case modalConst.teamEdit:
                modal = <TeamEdit/>;
                break;
            default:
                modal = null;
        }
        return (
            <div className="modal">
                <img onClick={this.modalClose} className="edit" src="/static/img/close.png"/>
                {modal}
            </div>
        );
    }
}

const mapStoreToProps = (state, props) => ({
    isOpen: state.modal.isOpen,
    modal: state.modal.modal,
});

const mapDispatchToProps = (dispatch) => {
    return {
        ...bindActionCreators({
            modalOpen,
        }, dispatch),
    };
};

export default connect(
    mapStoreToProps,
    mapDispatchToProps
)(ModalComponent);
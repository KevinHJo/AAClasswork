import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from "../actions/session_actions";

const SessionReducer = (state = {id: null}, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);

    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            return action.currentUser
        case LOGOUT_CURRENT_USER:
            nextState['id'] = null;
            return nextState;
        default:
            return state;
    }
} 

export default SessionReducer;
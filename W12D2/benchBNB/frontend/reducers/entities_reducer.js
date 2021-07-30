import { combineReducers } from "redux";
import UserReducer from "./users_reducer"

const entitiesReducer = combineReducers({
    users: UserReducer
})

export default entitiesReducer;
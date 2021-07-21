import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from '../actions/todo_actions';


const initialState = {
    1: {
        id: 1,
        title: 'take a shower',
        body: 'and be clean',
        done: false
    }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    let nextState = Object.assign({}, state);
    
    switch (action.type) {
        case RECEIVE_TODOS:
            nextState = {};
            action.todos.forEach((todo, i) => {
                nextState[todo.id] = todo;
            });
            return nextState;
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo;
            return nextState;
        case REMOVE_TODO:
            delete nextState[action.step.id];
            return nextState;
        default:
            return state;
    }
};


  
export default todosReducer;
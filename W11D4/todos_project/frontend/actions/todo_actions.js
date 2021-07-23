export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
import * as TodoAPIUtil from '../util/todo_api_util';

export const removeTodo = (todo) => ({
    type: REMOVE_TODO,
    todo: todo
});

export const receiveTodos = (todos) => ({
    type: RECEIVE_TODOS,
    todos: todos
});

export const receiveTodo = (todo) => ({
    type: RECEIVE_TODO,
    todo: todo
});

export const fetchTodos = () => (dispatch) => {
    TodoAPIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
} 
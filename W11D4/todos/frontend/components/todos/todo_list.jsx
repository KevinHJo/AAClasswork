import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form'

const TodoList = (props) => {
    const todos = props.todos;
    return ( 
        <div>
            <ul >
                {todos.map(todo => <TodoListItem todo={todo} removeTodo={props.removeTodo} receiveTodo={props.receiveTodo} key={todo.id}/>)}
            </ul>
            <TodoForm receiveTodo = {props.receiveTodo}/>
        </div>
    )
}

export default TodoList;
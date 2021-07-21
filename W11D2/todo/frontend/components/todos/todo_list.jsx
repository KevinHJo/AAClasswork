import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form'

const TodoList = (props) => {
    const todos = props.todos;
    return ( 
        <div>
            <ul >
                {todos.map(todo => <TodoListItem todo={todo} key={todo.id}/>)}
            </ul>
            <TodoForm receiveTodo = {props.receiveTodo}/>
        </div>
    )
}

export default TodoList;
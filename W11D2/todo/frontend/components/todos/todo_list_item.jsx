import React from 'react';

class TodoListItem extends React.Component {
    constructor(props) {
        super(props);

        this.updateStatusButton = this.updateStatusButton.bind(this);
        this.updateStatus = this.updateStatus.bind(this);
    }

    updateStatusButton(status) {
        if (status) {
            return 'Undo'
        } else {
            return 'Done'
        }
    }

    updateStatus() {
        const todo = this.props.todo

        if (todo.done) {
            todo.done = false
        } else {
            todo.done = true
        }

        this.props.receiveTodo(todo);
    }

    render () {
        const todo = this.props.todo
        return (
            <li>
                {todo.title}
                <button onClick={() => this.props.removeTodo(todo)}>Delete Todo</button>
                <button onClick={this.updateStatus}>{this.updateStatusButton(todo.done)}</button>
            </li>
        )
    }
}

export default TodoListItem;
import React from 'react';

class TodoListItem extends React.Component {
    constructor(props) {
        super(props);
        this.state = {detail: false}
        this.updateStatusButton = this.updateStatusButton.bind(this);
        this.updateStatus = this.updateStatus.bind(this);
        this.toggleDetail = this.toggleDetail.bind(this)
        this.renderDetail = this.renderDetail.bind(this)
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

    toggleDetail() {
        if (this.state.detail) {
            this.state.detail = false
        } else {
            this.state.detail = true
        }
    }

    renderDetail() {
        if (this.state.detail) {
            return (
                <TodoDetailView />
            )
        }
    }

    render () {
        const todo = this.props.todo
        return (
            <li>
                <p onClick = {this.toggleDetail}>
                    {todo.title}
                </p>
                <button onClick={this.updateStatus}>{this.updateStatusButton(todo.done)}</button>
                {this.renderDetail()}
            </li>
        )
    }
}

export default TodoListItem;
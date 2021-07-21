import React from 'react';
import { uniqueId } from '../../util'

class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            id: uniqueId(),
            title: '',
            body: '',
            done: false
        }
        this.handleSubmit = this.handleSubmit.bind(this)   
        this.updateBody = this.updateBody.bind(this)   
        this.updateTitle = this.updateTitle.bind(this)
        this.updateStatus = this.updateStatus.bind(this)   
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.receiveTodo(this.state);
        this.setState({
            id: uniqueId(),
            title: '',
            body: '',
            done: false
        })
    }

    updateBody(e) {
        this.setState({body: e.target.value})
    }

    updateTitle(e) {
        this.setState({title: e.target.value})
    }
    
    updateStatus(e) {
        this.setState({done: e.target.value})
    }

    render() {
        return(
            <form onSubmit={this.handleSubmit}>
                <label>Title:
                    <input type="text" 
                        name="title"
                        value={this.state.title}
                        onChange = {this.updateTitle}
                        />
                </label>
                <label>Body: 
                    <input type="text" 
                        name="body" 
                        value={this.state.body} 
                        onChange = {this.updateBody}
                        />
                </label>
                <label>Done:
                    <label htmlFor="true">True</label>
                    <input type="radio" name="done" value={true} id='true' onChange = {this.updateStatus}/>
                    <label htmlFor="false">False</label>
                    <input type="radio" name="done" value={false} id='false' onChange={this.updateStatus}/>
                </label>

                <input type="submit" value="Add Todo!"/>
            </form>
        )
    }
}


export default TodoForm;
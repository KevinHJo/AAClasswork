import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = { date: new Date() };

        this.tick = this.tick.bind(this);
    };
    
    render() {
        let date = this.state.date;

        return (
            <div className='clock'>
                <h1>Clock</h1>
                <div className="date">
                    <p>
                        <span>Time:</span>   
                        <span>{date.getHours()}:{date.getMinutes()}:{date.getSeconds()}</span>   
                    </p>
                    <p>
                        <span>Date:</span>
                        <span>{date.toDateString()}</span>
                    </p>
                </div>
            </div>
        );
    };
    
    tick() {
        this.setState({ date: new Date() })
    }

    componentDidMount() {
        this.intervalId = setInterval(this.tick, 1000);
        console.dir(this);
    }

    componentWillUnmount() {
        
        clearInterval(this.intervalId);
    }
}

export default Clock;
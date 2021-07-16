import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = { selectedTab: 0}
    }
    render () {
        return (
            <div className="tabs">
                <ul>
                    <li> <h1> One </h1>  </li>
                    <li> <h1> Two </h1>  </li>
                    <li> <h1> Three </h1>  </li>
                </ul>
                <article>

                </article>
            </div>
        )
    }
}

export default Tabs;
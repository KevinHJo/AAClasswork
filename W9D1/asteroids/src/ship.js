const MovingObject = require('./moving_object.js')

function Ship() {
    Ship.RADIUS = 5;
    Ship.COLOR = 'white';
    this.vel = [0, 0];

}

module.exports = Ship;
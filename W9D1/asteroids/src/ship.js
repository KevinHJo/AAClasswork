const MovingObject = require('./moving_object.js')
const Util = require('./util.js')
Util.inherits(Ship, MovingObject);

function Ship(options) {
    Ship.RADIUS = 30;
    Ship.COLOR = 'red';
    MovingObject.call(this, {velocity: [0,0], radius: Ship.RADIUS, color: Ship.COLOR, game: options['game']});
}

Ship.prototype.relocate = function() {
    this.position = this.game.randomPosition();
    this.velocity = [0,0];
};

Ship.prototype.power = function(impulse) {
    this.velocity = [this.velocity[0] + impulse[0], this.velocity[1] + impulse[1]];
}

module.exports = Ship;
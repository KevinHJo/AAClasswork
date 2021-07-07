const MovingObject = require("./moving_object.js");
const Ship = require("./ship.js");
const Util = require("./util.js");
Util.inherits(Asteroid, MovingObject);

function Asteroid(options) {
    Asteroid.COLOR = 'black';
    Asteroid.RADIUS = 20;
    MovingObject.call(this, {position: options['position'], velocity: Util.randomVec(2), radius: Asteroid.RADIUS, color: Asteroid.COLOR, game: options['game']});
};

Asteroid.prototype.collideWith = function(otherObject) {
    if ((this.isCollidedWith(otherObject)) && (otherObject instanceof Ship)) {
        this.game.ship.relocate();
    }
}

module.exports = Asteroid;
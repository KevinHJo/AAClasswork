const MovingObject = require("./moving_object.js");
const Util = require("./util.js");

function Asteroid(options) {
    Asteroid.COLOR = 'black';
    Asteroid.RADIUS = 20;
    MovingObject.call(this, {position: options['position'], velocity: Util.randomVec(2), radius: Asteroid.RADIUS, color: Asteroid.COLOR, game: options['game']});
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
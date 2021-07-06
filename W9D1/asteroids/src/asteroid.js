const MovingObject = require("./moving_object.js");
const Util = require("./util.js");

function Asteroid(position) {
    Asteroid.COLOR = 'gray';
    Asteroid.RADIUS = 20;
    MovingObject.call(this, position, Util.randomVec(1469), Asteroid.RADIUS, Asteroid.COLOR);
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
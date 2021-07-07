const Asteroid = require("./asteroid");
const Ship = require("./ship");

function Game() {
    Game.DIM_X = 1280
    Game.DIM_Y = 720
    Game.NUM_ASTEROIDS = 5;
    this.asteroids = []
    this.addAsteroids();
    this.ship = new Ship({game: this})
    this.ship.position = this.randomPosition();
};

Game.prototype.allObjects = function() {
    return this.asteroids.concat(this.ship);
}

Game.prototype.addAsteroids = function() {
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
        this.asteroids.push(new Asteroid({position: this.randomPosition(), game: this}));
    };
};

Game.prototype.randomPosition = function() {
    return [Math.floor(Math.random() * Game.DIM_X), Math.floor(Math.random() * Game.DIM_Y)]
};

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0,0,1280,720);
    this.allObjects().forEach(function(object) {object.draw(ctx)});
};

Game.prototype.moveObjects = function() {
    this.allObjects().forEach(function(object) {object.move()});
};

Game.prototype.wrap = function(pos) {
    if (pos[0] < 0) return [Game.DIM_X, pos[1]];
    if (pos[0] > Game.DIM_X) return [0, pos[1]];
    if (pos[1] < 0) return [pos[0], Game.DIM_Y];
    if (pos[1] > Game.DIM_Y) return [pos[0], 0];
    return pos
};

Game.prototype.checkCollisions = function() {
    for (let i = 0; i < this.allObjects().length - 1; i++) {
        for (let j = i + 1; j < this.allObjects().length; j++) {
            // console.log(this.allObjects()[i].isCollidedWith(this.allObjects()[j]));
            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])) {
                console.log(this.allObjects()[i])
                this.allObjects()[i].collideWith(this.allObjects()[j]);
            }
        }
    }
};

Game.prototype.remove = function(asteroid) {
    let idx = this.asteroids.indexOf(asteroid)
    delete this.asteroids[idx];
};


Game.prototype.step = function() {
    this.moveObjects();
    this.checkCollisions();
};

module.exports = Game;
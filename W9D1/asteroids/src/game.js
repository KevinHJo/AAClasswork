const Asteroid = require("./asteroid");

function Game() {
    Game.DIM_X = 1280
    Game.DIM_Y = 720
    Game.NUM_ASTEROIDS = 20
    this.asteroids = []
    this.addAsteroids();
};

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
    this.asteroids.forEach(function(asteroid) {asteroid.draw(ctx)});
};

Game.prototype.moveObjects = function() {
    this.asteroids.forEach(function(asteroid) {asteroid.move()});
};

Game.prototype.wrap = function(pos) {
    if (pos[0] < 0) return [Game.DIM_X, pos[1]];
    if (pos[0] > Game.DIM_X) return [0, pos[1]];
    if (pos[1] < 0) return [pos[0], Game.DIM_Y];
    if (pos[1] > Game.DIM_Y) return [pos[0], 0];
    return pos
};

module.exports = Game;
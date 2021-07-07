const Game = require("./game.js");
const assignKey = require("../dist/keymaster.js")

function GameView(game, ctx) {
    GameView.MOVES = 
    this.game = game;
    this.ctx = ctx;
}

GameView.prototype.start = function() {
    let that = this
    setInterval(function() {
        that.bindKeyHandlers();
        that.game.draw(that.ctx);
        that.game.step();
    }, 20);
}

GameView.prototype.bindKeyHandlers = function bindKeyHandlers() {
    const ship = this.ship;
    Object.keys(GameView.MOVES).forEach(function(k)  {
      const move = GameView.MOVES[k];
      key(k, function () { ship.power(move); });
    });
    key("space", function () { ship.fireBullet(); });
};

module.exports = GameView;
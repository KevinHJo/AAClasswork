const Game = require("./game");

function GameView(game, ctx) {
    this.game = game;
    this.ctx = ctx;
}

GameView.prototype.start = function() {
    let that = this
    setInterval(function() {
        that.game.draw(that.ctx);
        that.game.step();
    }, 20);
}

module.exports = GameView;
const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');
const GameView = require('./game_view.js');
const Game = require('./game.js');


window.MovingObject = MovingObject;

document.addEventListener("DOMContentLoaded", () => {
    // const movingObj = new MovingObject([500, 500], [-100, 100], 10, 'red');
    // console.dir(movingObj);

    // const asteroid = new Asteroid([200, 200]);
    // console.dir(asteroid);
    
    // movingObj.draw(ctx);
    
    // asteroid.draw(ctx);
    
    const canvasEl = document.getElementById("game-canvas");
    const ctx = canvasEl.getContext("2d");

    const game = new Game();
    const gameView = new GameView(game, ctx);
    gameView.start();
});
    

console.log('Webpack is working')
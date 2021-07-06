const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');


window.MovingObject = MovingObject;

document.addEventListener("DOMContentLoaded", () => {
    const movingObj = new MovingObject([500, 500], [-100, 100], 10, 'red');
    console.dir(movingObj);

    const canvasEl = document.getElementById("game-canvas");
    const ctx = canvasEl.getContext("2d");

    const asteroid = new Asteroid([200, 200]);
    console.dir(asteroid);
    
    movingObj.draw(ctx);

    asteroid.draw(ctx);

});
    

console.log('Webpack is working')
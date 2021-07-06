const MovingObject = require('./moving_object.js');

window.MovingObject = MovingObject;

document.addEventListener("DOMContentLoaded", () => {
    const movingObj = new MovingObject([500, 500], [-100, 100], 10, 'red');
    console.dir(movingObj);

    const canvasEl = document.getElementById("game-canvas")
    const ctx = canvasEl.getContext("2d");

    movingObj.draw(ctx);
    movingObj.move();
    movingObj.draw(ctx);
});
    

console.log('Webpack is working')
/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n\nfunction Asteroid(options) {\n    Asteroid.COLOR = 'black';\n    Asteroid.RADIUS = 20;\n    MovingObject.call(this, {position: options['position'], velocity: Util.randomVec(2), radius: Asteroid.RADIUS, color: Asteroid.COLOR, game: options['game']});\n};\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\nfunction Game() {\n    Game.DIM_X = 1280\n    Game.DIM_Y = 720\n    Game.NUM_ASTEROIDS = 5\n    this.asteroids = []\n    this.addAsteroids();\n    this.ship = new Ship\n    this.ship.position = this.randomPosition;\n};\n\nGame.prototype.allObjects = function() {\n    return this.asteroids.concat(this.ship);\n}\n\nGame.prototype.addAsteroids = function() {\n    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n        this.asteroids.push(new Asteroid({position: this.randomPosition(), game: this}));\n    };\n};\n\nGame.prototype.randomPosition = function() {\n    return [Math.floor(Math.random() * Game.DIM_X), Math.floor(Math.random() * Game.DIM_Y)]\n};\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0,0,1280,720);\n    this.allObjects.forEach(function(object) {object.draw(ctx)});\n};\n\nGame.prototype.moveObjects = function() {\n    this.allObjects.forEach(function(object) {object.move()});\n};\n\nGame.prototype.wrap = function(pos) {\n    if (pos[0] < 0) return [Game.DIM_X, pos[1]];\n    if (pos[0] > Game.DIM_X) return [0, pos[1]];\n    if (pos[1] < 0) return [pos[0], Game.DIM_Y];\n    if (pos[1] > Game.DIM_Y) return [pos[0], 0];\n    return pos\n};\n\nGame.prototype.checkCollisions = function() {\n    for (let i = 0; i < this.allObjects.length - 1; i++) {\n        for (let j = i + 1; j < this.allObjects.length; j++) {\n            if (this.allObjects[i].isCollidedWith(this.allObjects[j])) {\n                this.allObjects[i].collideWith(this.allObjects[j]);\n            }\n        }\n    }\n};\n\nGame.prototype.remove = function(asteroid) {\n    let idx = this.asteroids.indexOf(asteroid)\n    delete this.asteroids[idx];\n};\n\n\nGame.prototype.step = function() {\n    console.dir(this);\n    this.moveObjects();\n    this.checkCollisions();\n\n};\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(game, ctx) {\n    this.game = game;\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function() {\n    let that = this\n    setInterval(function() {\n        that.game.draw(that.ctx);\n        that.game.step();\n    }, 20);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\n\nwindow.MovingObject = MovingObject;\n\ndocument.addEventListener(\"DOMContentLoaded\", () => {\n    // const movingObj = new MovingObject([500, 500], [-100, 100], 10, 'red');\n    // console.dir(movingObj);\n\n    // const asteroid = new Asteroid([200, 200]);\n    // console.dir(asteroid);\n    \n    // movingObj.draw(ctx);\n    \n    // asteroid.draw(ctx);\n    \n    const canvasEl = document.getElementById(\"game-canvas\");\n    const ctx = canvasEl.getContext(\"2d\");\n\n    const game = new Game();\n    const gameView = new GameView(game, ctx);\n    gameView.start();\n});\n    \n\nconsole.log('Webpack is working')\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options) {\n    this.position = options['position'];\n    this.velocity = options['velocity'];\n    this.radius = options['radius'];\n    this.color = options['color'];\n    this.game = options['game'];\n};\n\nMovingObject.prototype.draw = function(ctx) {\n    ctx.beginPath();\n    ctx.arc(this.position[0], this.position[1], this.radius, 0, 2*Math.PI, true);\n    ctx.fillStyle = this.color;\n    ctx.fill();\n    ctx.lineWidth = 2;\n    ctx.strokeStyle = 'gray';\n    ctx.stroke();\n}\n\nMovingObject.prototype.move = function() {\n    this.position[0] += this.velocity[0];\n    this.position[1] += this.velocity[1];\n    console.log(this.position)\n    this.position = this.game.wrap(this.position)\n    this.position = this.game.wrap(this.position)\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n    return (Math.floor(Math.sqrt((this.position[1] - otherObject.position[1]) ** 2 + (this.position[0] - otherObject.position[0]) ** 2)) < (this.radius + otherObject.radius));\n};\n\nMovingObject.prototype.collideWith = function(otherObject) {\n    this.game.remove(otherObject);\n    this.game.remove(this);\n}\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\n\nfunction Ship() {\n    Ship.RADIUS = 5;\n    Ship.COLOR = 'white';\n    this.vel = [0, 0];\n\n}\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\n    inherits(ChildClass, ParentClass) {\n        function Surrogate() {};\n        Surrogate.prototype = ParentClass.prototype;\n        ChildClass.prototype = new Surrogate ();\n        ChildClass.prototype.constructor = ChildClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }  \n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;
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

/***/ "./dist/keymaster.js":
/*!***************************!*\
  !*** ./dist/keymaster.js ***!
  \***************************/
/***/ (function(module) {

eval("//     keymaster.js\n//     (c) 2011-2013 Thomas Fuchs\n//     keymaster.js may be freely distributed under the MIT license.\n\n;(function(global){\n  var k,\n    _handlers = {},\n    _mods = { 16: false, 18: false, 17: false, 91: false },\n    _scope = 'all',\n    // modifier keys\n    _MODIFIERS = {\n      '⇧': 16, shift: 16,\n      '⌥': 18, alt: 18, option: 18,\n      '⌃': 17, ctrl: 17, control: 17,\n      '⌘': 91, command: 91\n    },\n    // special keys\n    _MAP = {\n      backspace: 8, tab: 9, clear: 12,\n      enter: 13, 'return': 13,\n      esc: 27, escape: 27, space: 32,\n      left: 37, up: 38,\n      right: 39, down: 40,\n      del: 46, 'delete': 46,\n      home: 36, end: 35,\n      pageup: 33, pagedown: 34,\n      ',': 188, '.': 190, '/': 191,\n      '`': 192, '-': 189, '=': 187,\n      ';': 186, '\\'': 222,\n      '[': 219, ']': 221, '\\\\': 220\n    },\n    code = function(x){\n      return _MAP[x] || x.toUpperCase().charCodeAt(0);\n    },\n    _downKeys = [];\n\n  for(k=1;k<20;k++) _MAP['f'+k] = 111+k;\n\n  // IE doesn't support Array#indexOf, so have a simple replacement\n  function index(array, item){\n    var i = array.length;\n    while(i--) if(array[i]===item) return i;\n    return -1;\n  }\n\n  // for comparing mods before unassignment\n  function compareArray(a1, a2) {\n    if (a1.length != a2.length) return false;\n    for (var i = 0; i < a1.length; i++) {\n        if (a1[i] !== a2[i]) return false;\n    }\n    return true;\n  }\n\n  var modifierMap = {\n      16:'shiftKey',\n      18:'altKey',\n      17:'ctrlKey',\n      91:'metaKey'\n  };\n  function updateModifierKey(event) {\n      for(k in _mods) _mods[k] = event[modifierMap[k]];\n  };\n\n  // handle keydown event\n  function dispatch(event) {\n    var key, handler, k, i, modifiersMatch, scope;\n    key = event.keyCode;\n\n    if (index(_downKeys, key) == -1) {\n        _downKeys.push(key);\n    }\n\n    // if a modifier key, set the key.<modifierkeyname> property to true and return\n    if(key == 93 || key == 224) key = 91; // right command on webkit, command on Gecko\n    if(key in _mods) {\n      _mods[key] = true;\n      // 'assignKey' from inside this closure is exported to window.key\n      for(k in _MODIFIERS) if(_MODIFIERS[k] == key) assignKey[k] = true;\n      return;\n    }\n    updateModifierKey(event);\n\n    // see if we need to ignore the keypress (filter() can can be overridden)\n    // by default ignore key presses if a select, textarea, or input is focused\n    if(!assignKey.filter.call(this, event)) return;\n\n    // abort if no potentially matching shortcuts found\n    if (!(key in _handlers)) return;\n\n    scope = getScope();\n\n    // for each potential shortcut\n    for (i = 0; i < _handlers[key].length; i++) {\n      handler = _handlers[key][i];\n\n      // see if it's in the current scope\n      if(handler.scope == scope || handler.scope == 'all'){\n        // check if modifiers match if any\n        modifiersMatch = handler.mods.length > 0;\n        for(k in _mods)\n          if((!_mods[k] && index(handler.mods, +k) > -1) ||\n            (_mods[k] && index(handler.mods, +k) == -1)) modifiersMatch = false;\n        // call the handler and stop the event if neccessary\n        if((handler.mods.length == 0 && !_mods[16] && !_mods[18] && !_mods[17] && !_mods[91]) || modifiersMatch){\n          if(handler.method(event, handler)===false){\n            if(event.preventDefault) event.preventDefault();\n              else event.returnValue = false;\n            if(event.stopPropagation) event.stopPropagation();\n            if(event.cancelBubble) event.cancelBubble = true;\n          }\n        }\n      }\n    }\n  };\n\n  // unset modifier keys on keyup\n  function clearModifier(event){\n    var key = event.keyCode, k,\n        i = index(_downKeys, key);\n\n    // remove key from _downKeys\n    if (i >= 0) {\n        _downKeys.splice(i, 1);\n    }\n\n    if(key == 93 || key == 224) key = 91;\n    if(key in _mods) {\n      _mods[key] = false;\n      for(k in _MODIFIERS) if(_MODIFIERS[k] == key) assignKey[k] = false;\n    }\n  };\n\n  function resetModifiers() {\n    for(k in _mods) _mods[k] = false;\n    for(k in _MODIFIERS) assignKey[k] = false;\n  };\n\n  // parse and assign shortcut\n  function assignKey(key, scope, method){\n    var keys, mods;\n    keys = getKeys(key);\n    if (method === undefined) {\n      method = scope;\n      scope = 'all';\n    }\n\n    // for each shortcut\n    for (var i = 0; i < keys.length; i++) {\n      // set modifier keys if any\n      mods = [];\n      key = keys[i].split('+');\n      if (key.length > 1){\n        mods = getMods(key);\n        key = [key[key.length-1]];\n      }\n      // convert to keycode and...\n      key = key[0]\n      key = code(key);\n      // ...store handler\n      if (!(key in _handlers)) _handlers[key] = [];\n      _handlers[key].push({ shortcut: keys[i], scope: scope, method: method, key: keys[i], mods: mods });\n    }\n  };\n\n  // unbind all handlers for given key in current scope\n  function unbindKey(key, scope) {\n    var multipleKeys, keys,\n      mods = [],\n      i, j, obj;\n\n    multipleKeys = getKeys(key);\n\n    for (j = 0; j < multipleKeys.length; j++) {\n      keys = multipleKeys[j].split('+');\n\n      if (keys.length > 1) {\n        mods = getMods(keys);\n      }\n\n      key = keys[keys.length - 1];\n      key = code(key);\n\n      if (scope === undefined) {\n        scope = getScope();\n      }\n      if (!_handlers[key]) {\n        return;\n      }\n      for (i = 0; i < _handlers[key].length; i++) {\n        obj = _handlers[key][i];\n        // only clear handlers if correct scope and mods match\n        if (obj.scope === scope && compareArray(obj.mods, mods)) {\n          _handlers[key][i] = {};\n        }\n      }\n    }\n  };\n\n  // Returns true if the key with code 'keyCode' is currently down\n  // Converts strings into key codes.\n  function isPressed(keyCode) {\n      if (typeof(keyCode)=='string') {\n        keyCode = code(keyCode);\n      }\n      return index(_downKeys, keyCode) != -1;\n  }\n\n  function getPressedKeyCodes() {\n      return _downKeys.slice(0);\n  }\n\n  function filter(event){\n    var tagName = (event.target || event.srcElement).tagName;\n    // ignore keypressed in any elements that support keyboard data input\n    return !(tagName == 'INPUT' || tagName == 'SELECT' || tagName == 'TEXTAREA');\n  }\n\n  // initialize key.<modifier> to false\n  for(k in _MODIFIERS) assignKey[k] = false;\n\n  // set current scope (default 'all')\n  function setScope(scope){ _scope = scope || 'all' };\n  function getScope(){ return _scope || 'all' };\n\n  // delete all handlers for a given scope\n  function deleteScope(scope){\n    var key, handlers, i;\n\n    for (key in _handlers) {\n      handlers = _handlers[key];\n      for (i = 0; i < handlers.length; ) {\n        if (handlers[i].scope === scope) handlers.splice(i, 1);\n        else i++;\n      }\n    }\n  };\n\n  // abstract key logic for assign and unassign\n  function getKeys(key) {\n    var keys;\n    key = key.replace(/\\s/g, '');\n    keys = key.split(',');\n    if ((keys[keys.length - 1]) == '') {\n      keys[keys.length - 2] += ',';\n    }\n    return keys;\n  }\n\n  // abstract mods logic for assign and unassign\n  function getMods(key) {\n    var mods = key.slice(0, key.length - 1);\n    for (var mi = 0; mi < mods.length; mi++)\n    mods[mi] = _MODIFIERS[mods[mi]];\n    return mods;\n  }\n\n  // cross-browser events\n  function addEvent(object, event, method) {\n    if (object.addEventListener)\n      object.addEventListener(event, method, false);\n    else if(object.attachEvent)\n      object.attachEvent('on'+event, function(){ method(window.event) });\n  };\n\n  // set the handlers globally on document\n  addEvent(document, 'keydown', function(event) { dispatch(event) }); // Passing _scope to a callback to ensure it remains the same by execution. Fixes #48\n  addEvent(document, 'keyup', clearModifier);\n\n  // reset modifiers to false whenever the window is (re)focused.\n  addEvent(window, 'focus', resetModifiers);\n\n  // store previously defined key\n  var previousKey = global.key;\n\n  // restore previously defined key and return reference to our key object\n  function noConflict() {\n    var k = global.key;\n    global.key = previousKey;\n    return k;\n  }\n\n  // set window.key and window.key.set/get/deleteScope, and the default filter\n  global.key = assignKey;\n  global.key.setScope = setScope;\n  global.key.getScope = getScope;\n  global.key.deleteScope = deleteScope;\n  global.key.filter = filter;\n  global.key.isPressed = isPressed;\n  global.key.getPressedKeyCodes = getPressedKeyCodes;\n  global.key.noConflict = noConflict;\n  global.key.unbind = unbindKey;\n\n  if(true) module.exports = assignKey;\n\n})(this);\n\n//# sourceURL=webpack:///./dist/keymaster.js?");

/***/ }),

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nUtil.inherits(Asteroid, MovingObject);\n\nfunction Asteroid(options) {\n    Asteroid.COLOR = 'black';\n    Asteroid.RADIUS = 20;\n    MovingObject.call(this, {position: options['position'], velocity: Util.randomVec(2), radius: Asteroid.RADIUS, color: Asteroid.COLOR, game: options['game']});\n};\n\nAsteroid.prototype.collideWith = function(otherObject) {\n    if ((this.isCollidedWith(otherObject)) && (otherObject instanceof Ship)) {\n        this.game.ship.relocate();\n    }\n}\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\nfunction Game() {\n    Game.DIM_X = 1280\n    Game.DIM_Y = 720\n    Game.NUM_ASTEROIDS = 5;\n    this.asteroids = []\n    this.addAsteroids();\n    this.ship = new Ship({game: this})\n    this.ship.position = this.randomPosition();\n};\n\nGame.prototype.allObjects = function() {\n    return this.asteroids.concat(this.ship);\n}\n\nGame.prototype.addAsteroids = function() {\n    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n        this.asteroids.push(new Asteroid({position: this.randomPosition(), game: this}));\n    };\n};\n\nGame.prototype.randomPosition = function() {\n    return [Math.floor(Math.random() * Game.DIM_X), Math.floor(Math.random() * Game.DIM_Y)]\n};\n\nGame.prototype.draw = function(ctx) {\n    ctx.clearRect(0,0,1280,720);\n    this.allObjects().forEach(function(object) {object.draw(ctx)});\n};\n\nGame.prototype.moveObjects = function() {\n    this.allObjects().forEach(function(object) {object.move()});\n};\n\nGame.prototype.wrap = function(pos) {\n    if (pos[0] < 0) return [Game.DIM_X, pos[1]];\n    if (pos[0] > Game.DIM_X) return [0, pos[1]];\n    if (pos[1] < 0) return [pos[0], Game.DIM_Y];\n    if (pos[1] > Game.DIM_Y) return [pos[0], 0];\n    return pos\n};\n\nGame.prototype.checkCollisions = function() {\n    for (let i = 0; i < this.allObjects().length - 1; i++) {\n        for (let j = i + 1; j < this.allObjects().length; j++) {\n            // console.log(this.allObjects()[i].isCollidedWith(this.allObjects()[j]));\n            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])) {\n                console.log(this.allObjects()[i])\n                this.allObjects()[i].collideWith(this.allObjects()[j]);\n            }\n        }\n    }\n};\n\nGame.prototype.remove = function(asteroid) {\n    let idx = this.asteroids.indexOf(asteroid)\n    delete this.asteroids[idx];\n};\n\n\nGame.prototype.step = function() {\n    this.moveObjects();\n    this.checkCollisions();\n};\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst assignKey = __webpack_require__(/*! ../dist/keymaster.js */ \"./dist/keymaster.js\")\n\nfunction GameView(game, ctx) {\n    GameView.MOVES = \n    this.game = game;\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function() {\n    let that = this\n    setInterval(function() {\n        that.bindKeyHandlers();\n        that.game.draw(that.ctx);\n        that.game.step();\n    }, 20);\n}\n\nGameView.prototype.bindKeyHandlers = function bindKeyHandlers() {\n    const ship = this.ship;\n    Object.keys(GameView.MOVES).forEach(function(k)  {\n      const move = GameView.MOVES[k];\n      key(k, function () { ship.power(move); });\n    });\n    key(\"space\", function () { ship.fireBullet(); });\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

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

eval("function MovingObject(options) {\n    this.position = options['position'];\n    this.velocity = options['velocity'];\n    this.radius = options['radius'];\n    this.color = options['color'];\n    this.game = options['game'];\n};\n\nMovingObject.prototype.draw = function(ctx) {\n    ctx.beginPath();\n    ctx.arc(this.position[0], this.position[1], this.radius, 0, 2*Math.PI, true);\n    ctx.fillStyle = this.color;\n    ctx.fill();\n    ctx.lineWidth = 2;\n    ctx.strokeStyle = 'gray';\n    ctx.stroke();\n}\n\nMovingObject.prototype.move = function() {\n    this.position[0] += this.velocity[0];\n    this.position[1] += this.velocity[1];\n    this.position = this.game.wrap(this.position)\n    this.position = this.game.wrap(this.position)\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n    return (Math.floor(Math.sqrt((this.position[1] - otherObject.position[1]) ** 2 + (this.position[0] - otherObject.position[0]) ** 2)) < (this.radius + otherObject.radius));\n};\n\nMovingObject.prototype.collideWith = function(otherObject) {\n    \n}\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\nUtil.inherits(Ship, MovingObject);\n\nfunction Ship(options) {\n    Ship.RADIUS = 30;\n    Ship.COLOR = 'red';\n    MovingObject.call(this, {velocity: [0,0], radius: Ship.RADIUS, color: Ship.COLOR, game: options['game']});\n}\n\nShip.prototype.relocate = function() {\n    this.position = this.game.randomPosition();\n    this.velocity = [0,0];\n};\n\nShip.prototype.power = function(impulse) {\n    this.velocity = [this.velocity[0] + impulse[0], this.velocity[1] + impulse[1]];\n}\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

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
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
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
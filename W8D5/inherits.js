// Function.prototype.inherits = function(parent) {
//   function Surrogate() {};
//   Surrogate.prototype = parent.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
// }

Function.prototype.inherits = function(parent) {
  this.prototype = Object.create(parent.prototype);
}

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

MovingObject.prototype.move = function() {
  console.log('object moves');
}

Ship.prototype.fly = function() {
  console.log('ship flies');
}

Asteroid.prototype.zoom = function() {
  console.log('asteroid zooms');
}

const movingObj = new MovingObject();
const ship = new Ship();
const asteroid = new Asteroid();

console.dir(movingObj.__proto__)
console.dir(ship.__proto__)
console.dir(asteroid.__proto__)
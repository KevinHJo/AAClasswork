function MovingObject() {
    this.position = arguments[0];
    this.velocity = arguments[1];
    this.radius = arguments[2];
    this.color = arguments[3];
};

MovingObject.prototype.draw = function(ctx) {
    ctx.beginPath();
    ctx.arc(this.position[0], this.position[1], this.radius, 0, 2*Math.PI, true);
    ctx.fillStyle = this.color;
    ctx.fill();
}

MovingObject.prototype.move = function() {
    this.position[0] += this.velocity[0];
    this.position[1] += this.velocity[1];
}

module.exports = MovingObject;
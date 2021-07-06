function MovingObject(options) {
    this.position = options['position'];
    this.velocity = options['velocity'];
    this.radius = options['radius'];
    this.color = options['color'];
    this.game = options['game'];
};

MovingObject.prototype.draw = function(ctx) {
    ctx.beginPath();
    ctx.arc(this.position[0], this.position[1], this.radius, 0, 2*Math.PI, true);
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.lineWidth = 2;
    ctx.strokeStyle = 'gray';
    ctx.stroke();
}

MovingObject.prototype.move = function() {
    this.position[0] += this.velocity[0];
    this.position[1] += this.velocity[1];
    console.log(this.position)
    this.position = this.game.wrap(this.position)
    this.position = this.game.wrap(this.position)
}

module.exports = MovingObject;
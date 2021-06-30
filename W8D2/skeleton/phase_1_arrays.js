Array.prototype.uniq = function() {
    const new_arr = []

    for (let i = 0; i < this.length; i++) {
        if (!new_arr.includes(this[i])) {
            new_arr.push(this[i]);
        }
    }

    return new_arr;
}

Array.prototype.twoSum = function() {
    let pairs = []

    for (let i = 0; i < this.length - 1; i++) {
        for (let j = i + 1; j < this.length; j ++) {
            if (this[i] + this[j] === 0) {
                pairs.push([i, j]);
            }
        }
    }

    return pairs;
}

Array.prototype.transpose = function() {
    const transposed = Array.from({length: this[0].length}, () => Array.from({length: this.length}));

    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this[i].length; j++) {
            transposed[j][i] = this[i][j];
        }
    }
    
    return transposed
}
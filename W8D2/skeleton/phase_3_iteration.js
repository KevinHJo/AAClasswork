Array.prototype.bubbleSort = function() {
    let sorted = false;

    while (sorted === false) {
        sorted = true;

        this.forEach((ele, i) => {
            if (ele > this[i+1]) {
                let temp = this[i+1];
                this[i+1] = ele;
                this[i] = temp;
                sorted = false
            };
        })
    }

    return this;
}

String.prototype.substrings = function() {
    let subs = [];

    for (let i=0; i < (this.length); i++) {
        for(let j=i; j < this.length; j++) {
            subs.push([this.slice(i, j+1)]);
        };
    };

    return subs;
};
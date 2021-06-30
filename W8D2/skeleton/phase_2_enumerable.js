const arr = [1, 2, 3, 4, 5]

Array.prototype.myEach = function(callback) {
    this.forEach(callback);
}

arr.myEach((num) => {
    return num * 2
});

Array.prototype.myMap = function(callback) {
    const new_arr = [];
    this.myEach((ele) => new_arr.push(callback(ele)));
    return new_arr;
}

Array.prototype.myReduce = function(callback, initialValue) {
    let arr = this
    
    if (initialValue === undefined) {
        initialValue = arr[0];
        arr.shift();
    }
    
    let accumulator = initialValue;

    arr.myEach((ele) => {
        accumulator = callback(accumulator, ele)
    });

    return accumulator
}
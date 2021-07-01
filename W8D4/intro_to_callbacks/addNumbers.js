const readline = require('readline');
let rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
  
rl.question('Input in a number as a start number', function(num1){
    rl.question('Input rest of numbers ', function(nums2) {  // '1,2,3'
        const sum = parseInt(num1)
        const numsLeft = nums2.split(',');
        console.log(addNumbers(sum, numsLeft, sum => console.log(`Total Sum: ${sum}`)));
        rl.close();
    });
});

// const startNum = rl.question.parseInt(sum);

const addNumbers = function(sum, numsLeft, completionCallback) {
    let arr = Array.from(numsLeft);
    
    if (numsLeft.length === 0) {
        return completionCallback(sum);
    }

    if (numsLeft.length) {
        sum += parseInt(numsLeft.shift());
    }

    console.log(sum);
    addNumbers(sum, numsLeft, completionCallback);
}


        


// const readline = require('readline');

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// function addTwoNumbers(callback) {
//   // Notice how nowhere do I return anything here! You never return in
//   // async code. Since the caller will not wait for the result, you
//   // can't return anything to them.

//   reader.question("Enter #1: ", function (numString1) {
//     reader.question("Enter #2: ", function (numString2) {
//       const num1 = parseInt(numString1);
//       const num2 = parseInt(numString2);

//       callback(num1 + num2);
//     });
//   });
// }

// addTwoNumbers(function (result) {
//   console.log(`The result is: ${result}`);
//   reader.close();
// });
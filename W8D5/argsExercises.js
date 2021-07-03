function sum1() {
  let args = Array.from(arguments);
  let sum = 0;
  args.forEach(num => {
    sum += num;
  });
  return sum;
};

function sum2() {
  let args = [...arguments];
  let sum = 0;
  args.forEach(num => {
    sum += num;
  });
  return sum;
};

// console.log(sum1(1, 2, 3, 4));
// console.log(sum2(1, 2, 3, 4));

// Function.prototype.myBind = function(ctx, ...bindArgs) {
//   return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
// };

// Function.prototype.myBind = function(ctx) {
//   let args1 = Array.from(arguments);
//   args1.shift();
//   let that = this;
//   return function() {
//     args2 = Array.from(arguments);
//     return that.apply(ctx, args1.concat(args2));
//   };
// };

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }

  woofs() {
    let words = Array.from(arguments);
    // console.log(`${this.name}`);
    console.log(...words);
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says.myBind(pavlov, "meow", "Kush")();

// markov.says.myBind(pavlov)("meow", "a tree");

// markov.says.myBind(pavlov, "meow")("Markov");

// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");

// function curriedSum(numArgs) {
//   let numbers = [];
//   return function _curriedSum(num) {
//     numbers.push(num);
//     if (numbers.length === numArgs) {
//       let result = numbers.reduce((acc, el) => acc + el);
//       numbers = [];
//       return result;
//     } else {
//       // return _curriedSum;
//     };
//   };
// };

// const calculator4 = curriedSum(4);
// console.log(calculator4(1));
// console.log(calculator4(2));
// console.log(calculator4(3));
// console.log(calculator4(4));
// console.log('hi');
// console.log(calculator4(5));
// console.log(calculator4(5));
// console.log(calculator4(5));
// console.log(calculator4(5));

Function.prototype.curry = function(numArgs) {
  let args = [];
  let that = this;
  return function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that(...args);
    };
  };
};

// Function.prototype.curry = function(numArgs) {
//   let args = [];
//   let that = this;
//   return function _curry(arg) {
//     args.push(arg);
//     if (args.length === numArgs) {
//       return that.apply(null, args);
//     };
//   };
// };


const curriedWoof = pavlov.woofs.curry(3);
curriedWoof('blah');
curriedWoof('blah');
curriedWoof('blah');

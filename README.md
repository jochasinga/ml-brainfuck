# ml-brainfuck
When you feel your tinker-tooth aching, interpret Brainfuck in an ML.

## Usage
Right now it doesn't do much apart from reading a text file and incrementing/decrementing
value in specified cells and move between cells. Looping is to be implemented.

## Goal
+ Looping
+ Read from command line and file
+ Include Bucklescript backend 
+ Embed in Javascript
+ Spit out [dad jokes](1)

[1]: https://www.buzzfeed.com/mikespohr/29-dad-jokes-that-are-so-bad-their-actually-good?utm_term=.ebNRlqoAQ#.dwdxgb3Xa
Include Brainfuck expression in JavaScript:

**Some idea from Flow**: 

Embed in JS

```javascript

// @bf
let helloworld = () => {
  let bfgreet = <<<<++++>>>.;
  console.log(bfgreet);
};

```


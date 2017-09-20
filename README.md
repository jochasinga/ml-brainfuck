# BrainfuckJS
When you feel your tinker-tooth aching, write some BF in your JS.

# Usage

Include Brainfuck expression in JavaScript:

```javascript

// @bf
let helloworld = () => {
  let bfgreet = <<<<++++>>>.;
  console.log(bfgreet);
};

```

then 

```bash

$ bf run helloworld.js

```


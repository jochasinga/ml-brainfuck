# brainfuck
Read a Brainfuck text file or stdin and prints out the byte value (ASCII characters to be implemented).

## Setup
+ Install Ocaml and OPAM
+ Compile to use in another Ocaml project:

```bash

$ ocamlc -c brainfuck.mli; ocamlopt -c brainfuck.ml

```

## Usage

sample.bf:

```brainfuck

Below calculates  100

+++++ [ > +++++ +++++ < - ] > .

```

run as a command line tool:

```bash

$ ocaml brainfuck.ml sample.bf
$ echo '++++ [> +++++ +++++ < - ] > .' | ocaml brainfuck.ml

```

In another project:

```ocaml

Brainfuck.interpret("++++ [ > +++++ +++++ < - ] > .")

```

## Future Goals
+ Switch between byte value and ASCII
+ Include Bucklescript backend / Embed in Javascript
+ Spit out [dad jokes](1) when in distress

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

would be really cool.

[1]: https://www.buzzfeed.com/mikespohr/29-dad-jokes-that-are-so-bad-their-actually-good?utm_term=.ebNRlqoAQ#.dwdxgb3Xa

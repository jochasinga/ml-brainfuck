# ml-brainfuck
Simple Brainfuck parser that reads text file or stdin and prints out the byte value or ASCII character.

## Setup
+ Install Ocaml and OPAM
+ Compile to use in another Ocaml project:

```bash

$ ocamlc -c brainfuck.mli; ocamlopt -c brainfuck.ml

```

## Usage

sample.bf:

```brainfuck

Below calculates 50

+++++ [ > +++++ +++++ < - ] > .

```

run as a command line tool:

```bash

# Prints '50'.
$ ocaml brainfuck.ml sample.bf -fmt integer
# Prints '40'
$ echo '++++ [> +++++ +++++ < - ] > .' | ocaml brainfuck.ml -fmt integer

```

Leave out `-fmt` option to print out ASCII characters as a default.

hello.bf:

```brainfuck

> +++++++ [ > +++++ +++++ < - ] > ++ .
> +++++ +++++ [ > +++++ +++++ < - ] > + .
> +++++ +++++ [ > +++++ +++++ + < - ] > -- .
> +++++ +++++ [ > +++++ +++++ + < - ] > -- .
> +++++ +++++ [ > +++++ +++++ + < - ] > + .

```

```bash

# Prints 'Hello'.
$ ocaml brainfuck.ml hello.txt

```


To use in another Ocaml project:

```ocaml

Brainfuck.interpret "++++ [ > +++++ +++++ < - ] > ."

```



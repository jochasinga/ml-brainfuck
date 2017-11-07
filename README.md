# brainfuck
Simple Brainfuck parser that reads text file or stdin and prints out the byte value (ASCII characters to be implemented).

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



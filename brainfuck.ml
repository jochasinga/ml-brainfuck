open Printf

let inc tape pos = 
  let v = tape.(pos) + 1 in 
  tape.(pos) <- v
;;

let dec tape pos = 
  let v = tape.(pos) - 1 in 
  tape.(pos) <- v
;;

let interpret code = 
  let tape = Array.make 300 0 in
  let tape_pos = ref 0 in
  let result = ref "" in 
  let rec scan code_pos = 
    let current_char = code.[code_pos] in
    printf "code_pos: %d | char: %d\n" code_pos tape.(!tape_pos);
    match current_char with
    | '+' -> inc tape !tape_pos
    | '-' -> dec tape !tape_pos
    | '>' -> tape_pos := !tape_pos + 1
    | '<' -> tape_pos := !tape_pos - 1
    | '.' -> printf "%s" (!result ^ String.make 1 (Char.chr tape.(!tape_pos))) 
    | a -> printf "%s" (!result ^ String.make 1 (Char.chr tape.(!tape_pos)));
    if code_pos >= String.length code then printf "%s" (!result ^ String.make 1 (Char.chr tape.(!tape_pos)))
    else scan (code_pos + 1)
  in scan 0
;;

let () =
  if Array.length Sys.argv <= 1 then
    let line = read_line () in print_string line; print_newline ()
;;
let () =
  if Array.length Sys.argv == 2 then
    let filename = Sys.argv.(1) in 
    let chan = open_in filename in
    try 
      while true; do
        let line = input_line chan in
        (* print_endline line *)
        interpret line
      done;
      flush stdout;
      close_in chan
    with End_of_file -> 
      close_in_noerr chan
;;
let () =
  if Array.length Sys.argv > 2 then
    print_string "You're too greedy! One at a time!"; print_newline ()
;;

let explode s = 
  let rec exp i l =
    if i < 0 then l 
    else exp (i - 1) (s.[i] :: l) 
  in exp (String.length s - 1) []
;;


open Printf
open Char

let inc tape pos = 
  let v = tape.(pos) + 1 in tape.(pos) <- v
;;

let dec tape pos = 
  let v = tape.(pos) - 1 in tape.(pos) <- v
;;

let print_current_char tape tape_pos = 
  print_char (Char.chr tape.(tape_pos))
;;

let interpret code = 
  let tape = Array.make 30000 0 in
(*   let tape_pos = ref 0 in *)
  (* let result = ref "" in *)
  let rec scan code_pos tape_pos result = 
    if code_pos >= String.length code then print_string result
    else
    let cc = code.[code_pos] in
      printf "code_pos: %d | char: %c\n" code_pos cc;
      if cc = '+' then inc tape tape_pos
      else if cc = '-' then dec tape tape_pos
      else if cc = '>' then scan (code_pos+1) (tape_pos+1) result
      else if cc = '<' then scan (code_pos+1) (tape_pos+1) result
      else if cc = '.' then 
        print_string (result ^ String.make 1 (Char.chr tape.(tape_pos)))
      else 
        printf "%c not expected\n" cc;
        scan (code_pos + 1) tape_pos result 

     (*  match current_char with
      | '+' -> inc tape !tape_pos; scan (code_pos+1)
      | '-' -> dec tape !tape_pos; scan (code_pos+1)
      | '>' -> tape_pos := !tape_pos + 1; scan (code_pos+1)
      | '<' -> tape_pos := !tape_pos - 1; scan (code_pos+1)
      | '.' -> 
        result := !result ^ String.make 1 (Char.chr tape.(!tape_pos));
        print_string !result; 
        scan (code_pos+1)
      | a -> 
        print_string "not expected";
        scan (code_pos + 1) *)
  in scan 0 0 ""
;;

let () =
  if Array.length Sys.argv <= 1 then
    let line = read_line () in print_string line; print_newline ()
;;
let () =
  if Array.length Sys.argv == 2 then
    let filename = Sys.argv.(1) in 
    let chan = open_in filename in
    let code = ref "" in 
    try 
      while true; do
        code := !code ^ input_line chan;
        (* let line = input_line chan in *)
        (* print_endline line *)
      done;
      flush stdout;
      close_in chan
    with End_of_file -> close_in_noerr chan;
    interpret !code
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


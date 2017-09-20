open Printf

let inc tape pos = 
  let value = tape.(pos) + 1 in tape.(pos) <- value; tape

let dec tape pos = 
  let value = tape.(pos) - 1 in tape.(pos) <- value; tape

(* interpret accepts an optional argument to set the tape size *)
let interpret ?(tape_size = 30000) code = 
  let tape = Array.make tape_size 0 in
  let rec scan code_pos tape_pos tape result = 
    if code_pos >= String.length code then print_string result
    else
      let cc = code.[code_pos] in
      (* printf "code_pos: %d | char: %c\n" code_pos cc; *)
      if cc = '+' then 
        let tp = inc tape tape_pos in scan (code_pos+1) tape_pos tp result
      else if cc = '-' then 
        let tp = dec tape tape_pos in scan (code_pos+1) tape_pos tp result
      else if cc = '>' then 
        let tp_pos = tape_pos + 1 in scan (code_pos+1) tp_pos tape result
      else if cc = '<' then 
        let tp_pos = tape_pos - 1 in scan (code_pos+1) tp_pos tape result
      else if cc = '.' then 
        let tp_pos = tape_pos in 
        print_int tape.(tp_pos);
        scan (code_pos+1) tp_pos tape result
      else
        scan (code_pos+1) tape_pos tape result 
  in scan 0 0 tape ""

let () =
  if Array.length Sys.argv <= 1 then
    let line = read_line () in print_string line; print_newline ()

let () =
  if Array.length Sys.argv == 2 then
    let filename = Sys.argv.(1) in 
    let chan = open_in filename in
    let code = ref "" in 
    try 
      while true; do
        code := !code ^ input_line chan;
      done;
      flush stdout;
      close_in chan
    with End_of_file -> close_in_noerr chan;
      interpret !code

let () =
  if Array.length Sys.argv > 2 then
    print_string "You're too greedy! One at a time!"; print_newline ()

(* Not used, but may be useful later 
  (* 
    let explode s = 
      let rec exp i l =
        if i < 0 then l 
        else exp (i - 1) (s.[i] :: l) 
      in exp (String.length s - 1) []
  *)
*)



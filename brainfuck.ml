open Printf

(* `inc` increment tape value *)
let inc tape pos =
  let value = tape.(pos) + 1 in tape.(pos) <- value; tape

(* `dec` decrements tape value *)
let dec tape pos =
  let value = tape.(pos) - 1 in tape.(pos) <- value; tape

(* `eat_to_next` eat up tokens until the next_char *)
let rec eat_to_next code code_pos next_char =
  let token = code.[code_pos] in
  if token = next_char then code_pos else eat_to_next code (code_pos+1) next_char

(* `interpret` accepts an optional argument to set the tape size *)
let interpret ?(tape_size = 30000) ?(format = "ascii") code =
  let tape = Array.make tape_size 0 in
  let right_sqbrack_pos = ref 0 in
  let rec scan code_pos tape_pos tape result =
    if code_pos >= String.length code then print_string result else
      let cc = code.[code_pos] in

      (* printf "code_pos: %d | char: %c\n" code_pos cc; *)
      if cc = '[' then (
        right_sqbrack_pos := code_pos;
        if tape.(tape_pos) <> 0 then scan (code_pos+1) tape_pos tape result else
          let new_pos = eat_to_next code code_pos ']' in
          scan (new_pos) tape_pos tape result )

      else if cc = ']' then
        if tape.(tape_pos) <> 0 then scan !right_sqbrack_pos tape_pos tape result else
          scan (code_pos+1) tape_pos tape result

      else if cc = '+' then
        let tp = inc tape tape_pos in scan (code_pos+1) tape_pos tp result

      else if cc = '-' then
        let tp = dec tape tape_pos in scan (code_pos+1) tape_pos tp result

      else if cc = '>' then
        let tp_pos = tape_pos + 1 in scan (code_pos+1) tp_pos tape result

      else if cc = '<' then
        let tp_pos = tape_pos - 1 in scan (code_pos+1) tp_pos tape result

      else if cc = '.' then
        let tp_pos = tape_pos in
        if format = "ascii"
        then printf "%c" (Char.chr tape.(tp_pos))
        else
          print_int tape.(tp_pos);
          scan (code_pos+1) tp_pos tape result
      else
        scan (code_pos+1) tape_pos tape result
  in scan 0 0 tape ""

let main () =
  let args = Sys.argv in
  if Array.length args = 1 then
    let line = read_line () in
    let code = line in
    interpret code; print_newline ()

  else if Array.length args = 2 then
    let filename = args.(1) in
    let chan = open_in filename
    and code = ref "" in
    try
      while true do code := !code ^ input_line chan done;
      flush stdout;
      close_in chan
    with End_of_file ->
      close_in_noerr chan; interpret !code

  else if Array.length args >= 3 then
    let format =
      let rec loop i =
        if i < 0 then "" else
          match args.(i) with
          | "-fmt" -> args.(i+1)
          | a -> loop (i-1)
      in loop (Array.length args - 1)
    in
    if (Array.length args = 3) then
      let line = read_line () in
      let code = line in
      begin
        interpret ~format:format code;
        print_newline ()
      end

    else if (Array.length args = 4) then
      let filename = args.(1) in
      let chan = open_in filename
      and code = ref "" in
      try
        while true do code := !code ^ input_line chan done;
        flush stdout;
        close_in chan
      with End_of_file ->
        close_in_noerr chan; interpret ~format:format !code

let () = main ()

open Mylib.Lib

exception OtherBad

let[@raises OtherBad] troce () = raise OtherBad

let () =
  let _ = trace () in
  let _ = troce () in
  print_endline "adieu!"

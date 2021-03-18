exception Bad

let[@raises Bad] trace () = raise Bad

let foo () = trace ()

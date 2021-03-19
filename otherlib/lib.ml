exception OtherBad

let[@raises OtherBad] other_trace () = raise OtherBad

let other_foo () = other_trace ()

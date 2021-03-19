# rexample

```shell
$ dune build bin/hello_world.exe
$ reanalyze.exe -exception-cmt _build/ -debug
  Scanning _build/default/lib/.mylib.objs/byte/mylib__Lib.cmt Source:lib/lib.ml
  Scanning _build/default/bin/.hello_world.eobjs/byte/dune__exe__Hello_world.cmt Source:bin/hello_world.ml
  Scanning _build/default/otherlib/.myotherlib.objs/byte/myotherlib__Lib.cmt Source:otherlib/lib.ml
  
  Events combine: #events 1
  lib.ml:3:28 raises  Bad

  
  Events combine: #events 1
  lib.ml:5:13 Call(trace, modulePath:) 

  
  Events combine: #events 3
  hello_world.ml:7:2 Call(Stdlib.print_endline, modulePath:) 

  hello_world.ml:6:10 Call(Myotherlib.Lib.other_trace, modulePath:) 

  hello_world.ml:5:10 Call(Mylib.Lib.trace, modulePath:) 


  Exception Analysis
  File "./bin/hello_world.ml", line 4, characters 4-6
  () might raise OtherBad (hello_world.ml:6:10) and is not annotated with @raises OtherBad
  
  Events combine: #events 1
  lib.ml:3:39 raises  OtherBad

  
  Events combine: #events 1
  lib.ml:5:19 Call(other_trace, modulePath:) 


  Exception Analysis
  File "./otherlib/lib.ml", line 5, characters 4-13
  other_foo might raise OtherBad (lib.ml:5:19) and is not annotated with @raises OtherBad
  
  Analysis reported 2 issues (Exception Analysis:2)
$ dune exec bin/hello_world.exe
Fatal error: exception Mylib.Lib.Bad
```

# rexample

```shell
$ dune build bin/hello_world.exe
$ reanalyze.exe -exception-cmt _build/ -debug
  Scanning _build/default/lib/.mylib.objs/byte/mylib__Lib.cmt Source:lib/lib.ml
  Scanning _build/default/bin/.hello_world.eobjs/byte/dune__exe__Hello_world.cmt Source:bin/hello_world.ml
  
  Events combine: #events 1
  lib.ml:3:28 raises  Bad

  
  Events combine: #events 1
  lib.ml:5:13 Call(trace, modulePath:) 


  Exception Analysis
  File "./lib/lib.ml", line 5, characters 4-7
  foo might raise Bad (lib.ml:5:13) and is not annotated with @raises Bad
  
  Events combine: #events 1
  hello_world.ml:5:33 raises  OtherBad

  
  Events combine: #events 3
  hello_world.ml:10:2 Call(Stdlib.print_endline, modulePath:) 

  hello_world.ml:9:10 Call(troce, modulePath:) 

  hello_world.ml:8:10 Call(Mylib.Lib.trace, modulePath:) 


  Exception Analysis
  File "./bin/hello_world.ml", line 7, characters 4-6
  () might raise OtherBad (hello_world.ml:9:10) and is not annotated with @raises OtherBad
  
  Analysis reported 2 issues (Exception Analysis:2)
```

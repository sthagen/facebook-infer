(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd
module F = Format
module L = Logging

let%expect_test _ =
  let source =
    {|
x = 42
print(x)
builtin_print = print
print = 0
builtin_print(print, None, "hello world", True, False)
|}
  in
  PyIR.test source ;
  F.printf "Running interpreter:@\n" ;
  PyIR.test ~run:PyIRExec.run source ;
  [%expect
    {|
    module dummy:

      function toplevel():
        b0:
          TOPLEVEL[x] <- 42
          n0 <- TOPLEVEL[print]
          n1 <- TOPLEVEL[x]
          n2 <- $Call(n0, n1, None)
          n3 <- TOPLEVEL[print]
          TOPLEVEL[builtin_print] <- n3
          TOPLEVEL[print] <- 0
          n4 <- TOPLEVEL[builtin_print]
          n5 <- TOPLEVEL[print]
          n6 <- $Call(n4, n5, None, "hello world", true, false, None)
          return None



    Running interpreter:
    42
    0 None hello world True False |}]


let%expect_test _ =
  let source = {|
def fst(y, x):
    return y

x = 'x'
y = 'y'
print("fst(x, y) =", fst(x, y))
|} in
  PyIR.test source ;
  F.printf "Running interpreter:@\n" ;
  PyIR.test ~run:PyIRExec.run source ;
  [%expect
    {|
    module dummy:

      function toplevel():
        b0:
          n0 <- $MakeFunction["fst", "dummy.fst"](None, None, None, None, None)
          TOPLEVEL[fst] <- n0
          TOPLEVEL[x] <- "x"
          TOPLEVEL[y] <- "y"
          n1 <- TOPLEVEL[print]
          n2 <- TOPLEVEL[fst]
          n3 <- TOPLEVEL[x]
          n4 <- TOPLEVEL[y]
          n5 <- $Call(n2, n3, n4, None)
          n6 <- $Call(n1, "fst(x, y) =", n5, None)
          return None


      function dummy.fst(y, x):
        b0:
          n0 <- LOCAL[y]
          return n0



    Running interpreter:
    fst(x, y) = x |}]


let%expect_test _ =
  let source =
    {|
def incr(k):
    global n
    n += k

def no_effect(k):
    n = k

n = 0
incr(3)
incr(2)
no_effect(-1)
print('n =', n)
|}
  in
  PyIR.test source ;
  F.printf "Running interpreter:@\n" ;
  PyIR.test ~run:PyIRExec.run source ;
  [%expect
    {|
    module dummy:

      function toplevel():
        b0:
          n0 <- $MakeFunction["incr", "dummy.incr"](None, None, None, None, None)
          TOPLEVEL[incr] <- n0
          n1 <- $MakeFunction["no_effect", "dummy.no_effect"](None, None, None, None, None)
          TOPLEVEL[no_effect] <- n1
          GLOBAL[n] <- 0
          n2 <- TOPLEVEL[incr]
          n3 <- $Call(n2, 3, None)
          n4 <- TOPLEVEL[incr]
          n5 <- $Call(n4, 2, None)
          n6 <- TOPLEVEL[no_effect]
          n7 <- $Call(n6, -1, None)
          n8 <- TOPLEVEL[print]
          n9 <- GLOBAL[n]
          n10 <- $Call(n8, "n =", n9, None)
          return None


      function dummy.incr(k):
        b0:
          n0 <- GLOBAL[n]
          n1 <- LOCAL[k]
          n2 <- $Inplace.Add(n0, n1, None)
          GLOBAL[n] <- n2
          return None


      function dummy.no_effect(k):
        b0:
          n0 <- LOCAL[k]
          LOCAL[n] <- n0
          return None



    Running interpreter:
    n = 5 |}]


let%expect_test _ =
  let source =
    {|
def fact(n):
    if n<=0:
        return 1
    else:
        return n * fact(n-1)

print('fact(5) =', fact(5))
|}
  in
  PyIR.test source ;
  F.printf "Running interpreter:@\n" ;
  PyIR.test ~run:PyIRExec.run source ;
  [%expect
    {|
    module dummy:

      function toplevel():
        b0:
          n0 <- $MakeFunction["fact", "dummy.fact"](None, None, None, None, None)
          TOPLEVEL[fact] <- n0
          n1 <- TOPLEVEL[print]
          n2 <- TOPLEVEL[fact]
          n3 <- $Call(n2, 5, None)
          n4 <- $Call(n1, "fact(5) =", n3, None)
          return None


      function dummy.fact(n):
        b0:
          n0 <- LOCAL[n]
          n1 <- $Compare.le(n0, 0, None)
          if n1 then jmp b1 else jmp b2

        b1:
          return 1

        b2:
          n2 <- LOCAL[n]
          n3 <- GLOBAL[fact]
          n4 <- LOCAL[n]
          n5 <- $Binary.Subtract(n4, 1, None)
          n6 <- $Call(n3, n5, None)
          n7 <- $Binary.Multiply(n2, n6, None)
          return n7



    Running interpreter:
    fact(5) = 120 |}]

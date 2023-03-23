(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-14: 20 points
Recall that a reference is precisely an array
of size 1. And it can be treated as a sequence.
For instance, we can define ref_foreach as follows
*)

(* ****** ****** *)

fun
ref_foreach
(r0: 'a ref, work: 'a -> unit): unit = work(!r0)

(* ****** ****** *)

(*
Please implement directly the following combinators
for for references. That is, your implementation should
not make use of any third-order functions defined in the
library for this class.
*)

(* ****** ****** *)


fun
ref_get_at
(ref: 'a ref, i: int): 'a =

fn(ref,i0) =>
let
exception Found of (i)
val foreach = ref_foreach(r0)


fun
ref_forall
(r0: 'a ref, test: 'a -> bool): bool =

let
  fun loop(arr: 'a list, test: 'a -> bool): bool =
    (
    case arr of
      nil => true
    | x1 :: xs =>
      test(x1) andalso loop(xs, test)
    )
in
loop([!r0], test)
end


(**



fun
ref_map_list
(ref: 'a ref, fopr: ('a) -> 'b): 'b list =


fun
ref_foldleft
(ref: 'a ref, res: 'r, fopr: ('r * 'a) -> 'r): 'r =


fun
ref_ifoldleft
(ref: 'a ref, res: 'r, fopr: ('r * int * 'a) -> 'r): 'r =

**)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign05-01.sml] *)

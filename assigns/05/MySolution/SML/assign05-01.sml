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

val xref1 = ref(1)

fun
ref_get_at
(r0: 'a ref, i: int): 'a =

  let
    val xs = [!r0]
  in
    (
    case xs of
    nil => raise Subscript
    | x1 :: xs =>
    if i <> 0 then raise Subscript
    else !r0
    ) 
  end

(** ref_forall working ***)
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



(** ref_map_list working ***)

fun
ref_map_list
(r0: 'a ref, fopr: ('a) -> 'b): 'b list =

let
  fun loop(arr: 'a list, fopr: ('a) -> 'b): 'b list =
    (
    case arr of
      nil => nil
    | x1 :: xs =>
      fopr(x1) :: loop(xs, fopr)
    )
in
loop([!r0], fopr)
end

(** ref_foldleft working ***)
fun
ref_foldleft
(r0: 'a ref, res: 'r, fopr: ('r * 'a) -> 'r): 'r =

let
  fun loop( xs: 'a list
  , r0: 'r, fopr: 'r * 'a -> 'r): 'r =
  (
  case xs of
    nil => r0
  | x1 :: xs =>
    loop(xs, fopr(r0, x1), fopr)
  )
in
  loop([!r0],res, fopr)
end



fun
ref_ifoldleft
(r0: 'a ref, res: 'r, fopr: ('r * int * 'a) -> 'r): 'r =

let
  fun loop( xs: 'a list
  , r0: 'r, fopr: ('r * int * 'a) -> 'r): 'r =
  (
  case xs of
    nil => r0
  | x1 :: xs =>
    loop(xs, fopr(r0, 0, x1), fopr)
  )
in
  loop([!r0],res, fopr)
end



(* ****** ****** *)

(* end of [CS320-2023-Spring-assign05-01.sml] *)

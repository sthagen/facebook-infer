(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! NS0

include module type of ContainersLabels.Array

type 'a t = 'a array [@@deriving compare, equal, sexp]

val sub : ?pos:int -> ?len:int -> 'a t -> 'a t
(** [sub a ~pos ~len] returns a fresh array of length [len], containing the elements number [pos] to
    [pos + len - 1] of array [a]. If omitted, [pos] defaults to the beginning of the array and [len]
    defaults to the rest of the array. *)

val of_ : 'a -> 'a t

val of_iter : 'a iter -> 'a t

val of_list_rev : 'a list -> 'a t

val of_list_map : 'a list -> f:('a -> 'b) -> 'b t

val map : 'a t -> f:('a -> 'b) -> 'b t

val mapi : 'a t -> f:(int -> 'a -> 'b) -> 'b t

val map_endo : 'a t -> f:('a -> 'a) -> 'a t
(** Like [map], but specialized to require [f] to be an endofunction, which enables preserving [==]
    if [f] preserves [==] of every element. *)

val reduce_adjacent : 'a t -> f:('a -> 'a -> 'a option) -> 'a t

val combine : 'a t -> 'b t -> ('a * 'b) t

val is_empty : 'a t -> bool

val mem : 'a -> 'a t -> eq:('a -> 'a -> bool) -> bool

val contains_adjacent_duplicate : eq:('a -> 'a -> bool) -> 'a t -> bool

val iter : 'a t -> f:('a -> unit) -> unit

val iter2_exn : 'a t -> 'b t -> f:('a -> 'b -> unit) -> unit

val iteri : 'a t -> f:(int -> 'a -> unit) -> unit

val exists : 'a t -> f:('a -> bool) -> bool

val for_all : 'a t -> f:('a -> bool) -> bool

val for_all2_exn : 'a t -> 'b t -> f:('a -> 'b -> bool) -> bool

val fold : 'a t -> 's -> f:('a -> 's -> 's) -> 's

val fold_right : 'a t -> 's -> f:('a -> 's -> 's) -> 's

val fold_map : 'a t -> 's -> f:('a -> 's -> 'b * 's) -> 'b t * 's

val fold_map_until :
     'a t
  -> 's
  -> f:('a -> 's -> [`Continue of 'b * 's | `Stop of 'c])
  -> finish:('b t * 's -> 'c)
  -> 'c

val fold2_exn : 'a t -> 'b t -> 's -> f:('a -> 'b -> 's -> 's) -> 's

val to_list_rev : 'a array -> 'a list

val to_list_rev_map : 'a array -> f:('a -> 'b) -> 'b list

val pp : (unit, unit) fmt -> 'a pp -> 'a array pp

(*
 * Copyright (c) 2009-2013, Monoidics ltd.
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

(** The Smallfoot Intermediate Language *)

open! IStd
module F = Format

(** {2 Programs and Types} *)

(** Kind of prune instruction *)
type if_kind =
  | Ik_bexp  (** boolean expressions, and exp ? exp : exp *)
  | Ik_compexch  (** used in atomic compare exchange expressions *)
  | Ik_dowhile
  | Ik_for
  | Ik_if
  | Ik_land_lor  (** obtained from translation of && or || *)
  | Ik_while
  | Ik_switch
[@@deriving compare, equal]

val pp_if_kind : F.formatter -> if_kind -> unit

type instr_metadata =
  | Abstract of Location.t
      (** a good place to apply abstraction, mostly used in the biabduction analysis *)
  | CatchEntry of {try_id: int; loc: Location.t}  (** entry of C++ catch blocks *)
  | ExitScope of Var.t list * Location.t  (** remove temporaries and dead program variables *)
  | Nullify of Pvar.t * Location.t  (** nullify stack variable *)
  | Skip  (** no-op *)
  | TryEntry of {try_id: int; loc: Location.t}  (** entry of C++ try block *)
  | TryExit of {try_id: int; loc: Location.t}  (** exit of C++ try block *)
  | VariableLifetimeBegins of
      {pvar: Pvar.t; typ: Typ.t; loc: Location.t; is_cpp_structured_binding: bool}
      (** stack variable declared *)
[@@deriving compare]

(** An instruction. Syntactic invariants of instructions per-frontend are documented in
    {!Checkers.SilValidation}, where Clang is the most general validator (that is, it properly
    subsumes all other validators). These invariants are enforced when --sil-validation is passed.
*)
type instr =
  | Load of {id: Ident.t; e: Exp.t; typ: Typ.t; loc: Location.t}
      (** Load a value from the heap into an identifier.

          [id = *e:typ] where

          - [e] is an expression denoting a heap address
          - [typ] is the type of [*e] and [id]. *)
  | Store of {e1: Exp.t; typ: Typ.t; e2: Exp.t; loc: Location.t}
      (** Store the value of an expression into the heap.

          [*e1:typ = e2] where

          - [e1] is an expression denoting a heap address
          - [typ] is the type of [*e1] and [e2]. *)
  | Prune of Exp.t * Location.t * bool * if_kind
      (** The semantics of [Prune (exp, loc, is_then_branch, if_kind)] is that it prunes the state
          (blocks, or diverges) if [exp] evaluates to [1]; the boolean [is_then_branch] is [true] if
          this is the [then] branch of an [if] condition, [false] otherwise (it is meaningless if
          [if_kind] is not [Ik_if], [Ik_bexp], or other [if]-like cases

          This instruction, together with the CFG structure, is used to encode control-flow with
          tests in the source program such as [if] branches and [while] loops. *)
  | Call of (Ident.t * Typ.t) * Exp.t * (Exp.t * Typ.t) list * Location.t * CallFlags.t
      (** [Call ((ret_id, ret_typ), e_fun, arg_ts, loc, call_flags)] represents an instruction
          [ret_id = e_fun(arg_ts)] *)
  | Metadata of instr_metadata
      (** hints about the program that are not strictly needed to understand its semantics, for
          instance information about its original syntactic structure *)
[@@deriving compare, equal, normalize]

val equal_structural_instr : instr -> instr -> Exp.t Exp.Map.t -> bool * Exp.t Exp.Map.t
(** Compare instructions from different procedures without considering [loc]s, [ident]s, [pvar]s, or
    [try_id]s. The [exp_map] parameter gives a mapping of names used in the first [instr] to those
    used in the second, and the returned [exp_map] includes any additional mappings inferred from
    this comparison. *)

val skip_instr : instr

val instr_is_auxiliary : instr -> bool
(** Check if an instruction is auxiliary, or if it comes from source instructions. *)

val location_of_instr : instr -> Location.t
(** Get the location of the instruction *)

val exps_of_instr : instr -> Exp.t list
(** get the expressions occurring in the instruction *)

val pp_instr_metadata : Pp.env -> F.formatter -> instr_metadata -> unit

val pp_instr : print_types:bool -> Pp.env -> F.formatter -> instr -> unit
(** Pretty print an instruction. *)

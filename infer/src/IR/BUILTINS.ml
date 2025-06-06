(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd

(** List of all builtins that are interpreted specially by the backend *)
module type S = sig
  type t

  val __assert_fail : t

  val __builtin_add_overflow : t

  val __builtin_mul_overflow : t

  val __builtin_sub_overflow : t

  val __builtin_va_arg : t

  val __builtin_va_copy : t

  val __builtin_va_end : t

  val __builtin_va_start : t

  val __builtin_offsetof : t

  val __cast : t
  (** [__cast(val,typ)] implements java's [typ(val)] *)

  val __cxx_typeid : t

  val __delete : t

  val __delete_array : t

  val __delete_locked_attribute : t

  val __exit : t

  val __objc_bridge_transfer : t

  val __get_array_length : t

  val __get_type_of : t

  val __infer_assume : t

  val __infer_fail : t

  val __infer_skip : t
  (** used to represent behavior that is not modeled in infer *)

  val __instanceof : t
  (** [__instanceof(val,typ)] implements java's [val instanceof typ] *)

  val __java_throw : t
  (** [__java_throw] implements java's throw instruction (without arg yet, but this is covered by
      the usage of the return variable during frontend translation *)

  val __hack_throw : t
  (* [__hack_throw] also doesn't take an argument as that is dealt with by the Textual translation *)

  val __method_set_ignore_attribute : t

  val __new : t

  val __new_array : t

  val __objc_alloc_no_fail : t

  val __objc_dictionary_literal : t

  val __objc_get_ref_count : t

  val __objc_set_ref_count : t

  val __placement_delete : t

  val __placement_new : t

  val __print_value : t

  val __require_allocated_array : t

  val __set_array_length : t

  val __set_file_attribute : t

  val __set_locked_attribute : t

  val __set_mem_attribute : t

  val __set_observer_attribute : t

  val __set_unsubscribed_observer_attribute : t

  val __set_wont_leak_attribute : t

  val __split_get_nth : t

  val __throw : t

  val __unwrap_exception : t

  val abort : t

  val exit : t

  val free : t

  val malloc : t

  val malloc_no_fail : t

  val objc_insert_key : t

  val objc_insert_value : t

  val objc_autorelease_pool_pop : t

  val objc_autorelease_pool_push : t

  val objc_cpp_throw : t

  val zero_initialization : t
end

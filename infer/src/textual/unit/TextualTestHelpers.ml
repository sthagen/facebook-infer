(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd
open Textual

let sourcefile = SourceFile.create "dummy.sil"

let parse_module text =
  match TextualParser.parse_string sourcefile text with
  | Ok m ->
      m
  | Error es ->
      List.iter es ~f:(fun e -> F.printf "%a@\n" (TextualParser.pp_error sourcefile) e) ;
      raise (Failure "Couldn't parse a module")


let parse_module_print_errors text =
  match TextualParser.parse_string sourcefile text with
  | Ok _ ->
      raise (Failure "Successfuly parsed a module while expected parsing to fail")
  | Error es ->
      List.iter es ~f:(fun e -> F.printf "%a" (TextualParser.pp_error sourcefile) e)


let remove_effects_in_subexprs lang module_ =
  let _, decls = TextualDecls.make_decls module_ in
  TextualTransform.remove_effects_in_subexprs lang decls module_


let type_check module_ =
  match TextualVerification.verify module_ with
  | Ok _ ->
      F.printf "verification succeeded@\n"
  | Error errs ->
      List.iter errs ~f:(F.printf "%a@\n" (TextualVerification.pp_error_with_sourcefile sourcefile))

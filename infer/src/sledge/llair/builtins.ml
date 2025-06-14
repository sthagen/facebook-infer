(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

(** Builtin instruction opcodes *)

type t =
  [ (* llvm intrinsics *)
    `memset
  | `memcpy
  | `memmove
  | `expect
  | (* cstdlib - memory management *)
    `malloc
  | `aligned_alloc
  | `calloc
  | `posix_memalign
  | `realloc
  | (* jemalloc - non-standard API *)
    `mallocx
  | `rallocx
  | `xallocx
  | `sallocx
  | `dallocx
  | `sdallocx
  | `nallocx
  | `malloc_usable_size
  | `mallctl
  | `mallctlnametomib
  | `mallctlbymib
  | `malloc_stats_print
  | (* cstring *)
    `strlen
  | (* folly *)
    `_ZN5folly13usingJEMallocEv
  | (* cct *)
    `cct_point ]
[@@deriving compare, equal, sexp_of, enumerate]

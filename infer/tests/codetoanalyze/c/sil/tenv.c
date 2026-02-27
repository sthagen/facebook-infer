/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

struct data {
  int value;
  float weight;
};

struct nested {
  struct data d;
  int count;
};

struct with_pointer {
  int* ptr;
  char c;
};

union int_or_float {
  int i;
  float f;
};

union tagged {
  int as_int;
  double as_double;
  char as_char;
};

struct has_union {
  int tag;
  union int_or_float payload;
};

/* struct is used as parameter type but no field access */
int use_struct(struct data d) { return 0; }

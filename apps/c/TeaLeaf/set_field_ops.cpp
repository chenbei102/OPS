//
// auto-generated by ops.py
//

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define OPS_2D
#include "ops_lib_cpp.h"

//
// ops_par_loop declarations
//

void ops_par_loop_set_field_kernel(char const *, ops_block, int, int *, ops_arg,
                                   ops_arg);

#include "data.h"
#include "definitions.h"

#include "set_field_kernels.h"

void set_field() {

  int x_min = field.x_min;
  int x_max = field.x_max;
  int y_min = field.y_min;
  int y_max = field.y_max;

  int rangexy_inner[] = {x_min, x_max, y_min, y_max};

  ops_par_loop_set_field_kernel(
      "set_field_kernel", tea_grid, 2, rangexy_inner,
      ops_arg_dat(energy0, 1, S2D_00, "double", OPS_READ),
      ops_arg_dat(energy1, 1, S2D_00, "double", OPS_WRITE));
}

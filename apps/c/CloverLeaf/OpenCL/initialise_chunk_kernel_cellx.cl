//
// auto-generated by ops.py on 2014-06-18 22:54
//

#pragma OPENCL EXTENSION cl_khr_fp64 : enable

#include "ops_opencl_reduction.h"
#include "user_types.h"

#ifndef MIN
#define MIN(a, b) ((a < b) ? (a) : (b))
#endif
#ifndef MAX
#define MAX(a, b) ((a > b) ? (a) : (b))
#endif
#ifndef SIGN
#define SIGN(a, b) ((b < 0.0) ? (a * (-1)) : (a))
#endif
#define OPS_READ 0
#define OPS_WRITE 1
#define OPS_RW 2
#define OPS_INC 3
#define OPS_MIN 4
#define OPS_MAX 5
#define ZERO_double 0.0;
#define INFINITY_double INFINITY;
#define ZERO_float 0.0f;
#define INFINITY_float INFINITY;
#define ZERO_int 0;
#define INFINITY_int INFINITY;
#define ZERO_uint 0;
#define INFINITY_uint INFINITY;
#define ZERO_ll 0;
#define INFINITY_ll INFINITY;
#define ZERO_ull 0;
#define INFINITY_ull INFINITY;
#define ZERO_bool 0;
#define OPS_ACC0(x, y) (x + xdim0_initialise_chunk_kernel_cellx * (y))
#define OPS_ACC1(x, y) (x + xdim1_initialise_chunk_kernel_cellx * (y))
#define OPS_ACC2(x, y) (x + xdim2_initialise_chunk_kernel_cellx * (y))

// user function
void initialise_chunk_kernel_cellx(const __global double *restrict vertexx,
                                   __global double *restrict cellx,
                                   __global double *restrict celldx,

                                   const field_type field, const grid_type grid)

{

  int x_min = field.x_min - 2;
  int x_max = field.x_max - 2;
  int y_min = field.y_min - 2;
  int y_max = field.y_max - 2;

  double min_x, min_y, d_x, d_y;

  d_x = (grid.xmax - grid.xmin) / (double)grid.x_cells;
  d_y = (grid.ymax - grid.ymin) / (double)grid.y_cells;

  min_x = grid.xmin + d_x;
  min_y = grid.ymin + d_y;

  cellx[OPS_ACC1(0, 0)] =
      0.5 * (vertexx[OPS_ACC0(0, 0)] + vertexx[OPS_ACC0(1, 0)]);
  celldx[OPS_ACC2(0, 0)] = d_x;
}

#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2

__kernel void ops_initialise_chunk_kernel_cellx(
    __global const double *restrict arg0, __global double *restrict arg1,
    __global double *restrict arg2,
    __constant const struct field_type *restrict field,
    __constant const struct grid_type *restrict grid, const int base0,
    const int base1, const int base2, const int size0, const int size1) {

  int idx_y = get_global_id(1);
  int idx_x = get_global_id(0);

  if (idx_x < size0 && idx_y < size1) {
    initialise_chunk_kernel_cellx(
        &arg0[base0 + idx_x * 1 +
              idx_y * 0 * xdim0_initialise_chunk_kernel_cellx],
        &arg1[base1 + idx_x * 1 +
              idx_y * 0 * xdim1_initialise_chunk_kernel_cellx],
        &arg2[base2 + idx_x * 1 +
              idx_y * 0 * xdim2_initialise_chunk_kernel_cellx],
        *field, *grid);
  }
}
//
// auto-generated by ops.py
//
#include "./MPI_inline/clover_leaf_common.h"

int xdim0_initialise_chunk_kernel_y;
int xdim1_initialise_chunk_kernel_y;
int xdim2_initialise_chunk_kernel_y;

#define OPS_ACC0(x, y)                                                         \
  (n_x * 0 + n_y * xdim0_initialise_chunk_kernel_y * 1 + x +                   \
   xdim0_initialise_chunk_kernel_y * (y))
#define OPS_ACC1(x, y)                                                         \
  (n_x * 0 + n_y * xdim1_initialise_chunk_kernel_y * 1 + x +                   \
   xdim1_initialise_chunk_kernel_y * (y))
#define OPS_ACC2(x, y)                                                         \
  (n_x * 0 + n_y * xdim2_initialise_chunk_kernel_y * 1 + x +                   \
   xdim2_initialise_chunk_kernel_y * (y))

// user function

void initialise_chunk_kernel_y_c_wrapper(double *restrict vertexy,
                                         const int *restrict yy,
                                         double *restrict vertexdy, int x_size,
                                         int y_size) {
#pragma omp parallel for
  for (int n_y = 0; n_y < y_size; n_y++) {
    for (int n_x = 0; n_x < x_size; n_x++) {

      int y_min = field.y_min - 2;
      double min_y, d_y;

      d_y = (grid.ymax - grid.ymin) / (double)grid.y_cells;
      min_y = grid.ymin + d_y * field.bottom;

      vertexy[OPS_ACC0(0, 0)] = min_y + d_y * (yy[OPS_ACC1(0, 0)] - y_min);
      vertexdy[OPS_ACC2(0, 0)] = (double)d_y;
    }
  }
}
#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2

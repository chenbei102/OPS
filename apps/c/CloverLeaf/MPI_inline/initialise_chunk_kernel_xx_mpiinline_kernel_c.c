//
// auto-generated by ops.py
//
#include "./MPI_inline/clover_leaf_common.h"

int xdim0_initialise_chunk_kernel_xx;

#define OPS_ACC0(x, y)                                                         \
  (n_x * 1 + n_y * xdim0_initialise_chunk_kernel_xx * 0 + x +                  \
   xdim0_initialise_chunk_kernel_xx * (y))

// user function

void initialise_chunk_kernel_xx_c_wrapper(int *restrict xx, int *restrict idx,
                                          int arg_idx0, int arg_idx1,
                                          int x_size, int y_size) {
#pragma omp parallel for
  for (int n_y = 0; n_y < y_size; n_y++) {
    for (int n_x = 0; n_x < x_size; n_x++) {
      int idx[] = {arg_idx0 + n_x, arg_idx1 + n_y};

      xx[OPS_ACC0(0, 0)] = idx[0] - 2;
    }
  }
}
#undef OPS_ACC0

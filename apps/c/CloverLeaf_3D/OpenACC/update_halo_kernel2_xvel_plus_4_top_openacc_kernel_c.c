//
// auto-generated by ops.py
//
#include "./OpenACC/clover_leaf_common.h"

#define OPS_GPU

int xdim0_update_halo_kernel2_xvel_plus_4_top;
int ydim0_update_halo_kernel2_xvel_plus_4_top;
int xdim1_update_halo_kernel2_xvel_plus_4_top;
int ydim1_update_halo_kernel2_xvel_plus_4_top;

#undef OPS_ACC0
#undef OPS_ACC1

#define OPS_ACC0(x, y, z)                                                      \
  (x + xdim0_update_halo_kernel2_xvel_plus_4_top * (y) +                       \
   xdim0_update_halo_kernel2_xvel_plus_4_top *                                 \
       ydim0_update_halo_kernel2_xvel_plus_4_top * (z))
#define OPS_ACC1(x, y, z)                                                      \
  (x + xdim1_update_halo_kernel2_xvel_plus_4_top * (y) +                       \
   xdim1_update_halo_kernel2_xvel_plus_4_top *                                 \
       ydim1_update_halo_kernel2_xvel_plus_4_top * (z))

// user function

inline void update_halo_kernel2_xvel_plus_4_top(double *xvel0, double *xvel1,
                                                const int *fields) {
  if (fields[FIELD_XVEL0] == 1)
    xvel0[OPS_ACC0(0, 0, 0)] = xvel0[OPS_ACC0(0, -4, 0)];
  if (fields[FIELD_XVEL1] == 1)
    xvel1[OPS_ACC1(0, 0, 0)] = xvel1[OPS_ACC1(0, -4, 0)];
}

#undef OPS_ACC0
#undef OPS_ACC1

void update_halo_kernel2_xvel_plus_4_top_c_wrapper(double *p_a0, double *p_a1,
                                                   int *p_a2, int x_size,
                                                   int y_size, int z_size) {
#ifdef OPS_GPU
#pragma acc parallel deviceptr(p_a0, p_a1, p_a2)
#pragma acc loop
#endif
  for (int n_z = 0; n_z < z_size; n_z++) {
#ifdef OPS_GPU
#pragma acc loop
#endif
    for (int n_y = 0; n_y < y_size; n_y++) {
#ifdef OPS_GPU
#pragma acc loop
#endif
      for (int n_x = 0; n_x < x_size; n_x++) {
        update_halo_kernel2_xvel_plus_4_top(
            p_a0 + n_x * 1 * 1 +
                n_y * xdim0_update_halo_kernel2_xvel_plus_4_top * 1 * 1 +
                n_z * xdim0_update_halo_kernel2_xvel_plus_4_top *
                    ydim0_update_halo_kernel2_xvel_plus_4_top * 1 * 1,
            p_a1 + n_x * 1 * 1 +
                n_y * xdim1_update_halo_kernel2_xvel_plus_4_top * 1 * 1 +
                n_z * xdim1_update_halo_kernel2_xvel_plus_4_top *
                    ydim1_update_halo_kernel2_xvel_plus_4_top * 1 * 1,
            p_a2);
      }
    }
  }
}

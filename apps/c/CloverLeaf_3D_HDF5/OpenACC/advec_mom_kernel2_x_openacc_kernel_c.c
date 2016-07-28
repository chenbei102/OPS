//
// auto-generated by ops.py
//
#include "./OpenACC/clover_leaf_common.h"

#define OPS_GPU

int xdim0_advec_mom_kernel2_x;
int ydim0_advec_mom_kernel2_x;
int xdim1_advec_mom_kernel2_x;
int ydim1_advec_mom_kernel2_x;
int xdim2_advec_mom_kernel2_x;
int ydim2_advec_mom_kernel2_x;
int xdim3_advec_mom_kernel2_x;
int ydim3_advec_mom_kernel2_x;

#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3

#define OPS_ACC0(x, y, z)                                                      \
  (x + xdim0_advec_mom_kernel2_x * (y) +                                       \
   xdim0_advec_mom_kernel2_x * ydim0_advec_mom_kernel2_x * (z))
#define OPS_ACC1(x, y, z)                                                      \
  (x + xdim1_advec_mom_kernel2_x * (y) +                                       \
   xdim1_advec_mom_kernel2_x * ydim1_advec_mom_kernel2_x * (z))
#define OPS_ACC2(x, y, z)                                                      \
  (x + xdim2_advec_mom_kernel2_x * (y) +                                       \
   xdim2_advec_mom_kernel2_x * ydim2_advec_mom_kernel2_x * (z))
#define OPS_ACC3(x, y, z)                                                      \
  (x + xdim3_advec_mom_kernel2_x * (y) +                                       \
   xdim3_advec_mom_kernel2_x * ydim3_advec_mom_kernel2_x * (z))

// user function

inline void advec_mom_kernel2_x(double *vel1, const double *node_mass_post,
                                const double *node_mass_pre,
                                const double *mom_flux) {

  vel1[OPS_ACC0(0, 0, 0)] =
      (vel1[OPS_ACC0(0, 0, 0)] * node_mass_pre[OPS_ACC2(0, 0, 0)] +
       mom_flux[OPS_ACC3(-1, 0, 0)] - mom_flux[OPS_ACC3(0, 0, 0)]) /
      node_mass_post[OPS_ACC1(0, 0, 0)];
}

#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3

void advec_mom_kernel2_x_c_wrapper(double *p_a0, double *p_a1, double *p_a2,
                                   double *p_a3, int x_size, int y_size,
                                   int z_size) {
#ifdef OPS_GPU
#pragma acc parallel deviceptr(p_a0, p_a1, p_a2, p_a3)
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
        advec_mom_kernel2_x(
            p_a0 + n_x * 1 * 1 + n_y * xdim0_advec_mom_kernel2_x * 1 * 1 +
                n_z * xdim0_advec_mom_kernel2_x * ydim0_advec_mom_kernel2_x * 1,
            p_a1 + n_x * 1 * 1 + n_y * xdim1_advec_mom_kernel2_x * 1 * 1 +
                n_z * xdim1_advec_mom_kernel2_x * ydim1_advec_mom_kernel2_x * 1,
            p_a2 + n_x * 1 * 1 + n_y * xdim2_advec_mom_kernel2_x * 1 * 1 +
                n_z * xdim2_advec_mom_kernel2_x * ydim2_advec_mom_kernel2_x * 1,
            p_a3 + n_x * 1 * 1 + n_y * xdim3_advec_mom_kernel2_x * 1 * 1 +
                n_z * xdim3_advec_mom_kernel2_x * ydim3_advec_mom_kernel2_x *
                    1);
      }
    }
  }
}

//
// auto-generated by ops.py
//
#include "./OpenMP4/clover_leaf_common.h"

#define OPS_GPU

extern int xdim0_ideal_gas_kernel;
extern int ydim0_ideal_gas_kernel;
extern int xdim1_ideal_gas_kernel;
extern int ydim1_ideal_gas_kernel;
extern int xdim2_ideal_gas_kernel;
extern int ydim2_ideal_gas_kernel;
extern int xdim3_ideal_gas_kernel;
extern int ydim3_ideal_gas_kernel;

#undef OPS_OPENMP40
#undef OPS_OPENMP41
#undef OPS_OPENMP42
#undef OPS_OPENMP43

#define OPS_OPENMP40(x, y, z)                                                  \
  (x + xdim0_ideal_gas_kernel * (y) +                                          \
   xdim0_ideal_gas_kernel * ydim0_ideal_gas_kernel * (z))
#define OPS_OPENMP41(x, y, z)                                                  \
  (x + xdim1_ideal_gas_kernel * (y) +                                          \
   xdim1_ideal_gas_kernel * ydim1_ideal_gas_kernel * (z))
#define OPS_OPENMP42(x, y, z)                                                  \
  (x + xdim2_ideal_gas_kernel * (y) +                                          \
   xdim2_ideal_gas_kernel * ydim2_ideal_gas_kernel * (z))
#define OPS_OPENMP43(x, y, z)                                                  \
  (x + xdim3_ideal_gas_kernel * (y) +                                          \
   xdim3_ideal_gas_kernel * ydim3_ideal_gas_kernel * (z))

// user function

void ideal_gas_kernel_c_wrapper(double *p_a0, int base0, int tot0, double *p_a1,
                                int base1, int tot1, double *p_a2, int base2,
                                int tot2, double *p_a3, int base3, int tot3,
                                int x_size, int y_size, int z_size) {
  int num_blocks = round(((double)x_size * (double)y_size) / 128);
#pragma omp target enter data map(                                             \
    to : p_a0[0 : tot0], p_a1[0 : tot1], p_a2[0 : tot2], p_a3[0 : tot3])
#ifdef OPS_GPU

#pragma omp target map(                                                        \
    to : p_a0[0 : tot0], p_a1[0 : tot1], p_a2[0 : tot2], p_a3[0 : tot3])
#pragma omp teams num_teams(num_blocks) thread_limit(128)
#pragma omp distribute parallel for simd collapse(3) schedule(static, 1)
#endif
  for (int n_z = 0; n_z < z_size; n_z++) {
#ifdef OPS_GPU
#endif
    for (int n_y = 0; n_y < y_size; n_y++) {
#ifdef OPS_GPU
#endif
      for (int n_x = 0; n_x < x_size; n_x++) {
        const double *density =
            p_a0 + base0 + n_x * 1 * 1 + n_y * xdim0_ideal_gas_kernel * 1 * 1 +
            n_z * xdim0_ideal_gas_kernel * ydim0_ideal_gas_kernel * 1;

        const double *energy =
            p_a1 + base1 + n_x * 1 * 1 + n_y * xdim1_ideal_gas_kernel * 1 * 1 +
            n_z * xdim1_ideal_gas_kernel * ydim1_ideal_gas_kernel * 1;

        double *pressure =
            p_a2 + base2 + n_x * 1 * 1 + n_y * xdim2_ideal_gas_kernel * 1 * 1 +
            n_z * xdim2_ideal_gas_kernel * ydim2_ideal_gas_kernel * 1;

        double *soundspeed =
            p_a3 + base3 + n_x * 1 * 1 + n_y * xdim3_ideal_gas_kernel * 1 * 1 +
            n_z * xdim3_ideal_gas_kernel * ydim3_ideal_gas_kernel * 1;

        double sound_speed_squared, v, pressurebyenergy, pressurebyvolume;

        v = 1.0 / density[OPS_ACC0(0, 0, 0)];
        pressure[OPS_ACC2(0, 0, 0)] = (1.4 - 1.0) * density[OPS_ACC0(0, 0, 0)] *
                                      energy[OPS_ACC1(0, 0, 0)];

        pressurebyenergy = (1.4 - 1.0) * density[OPS_ACC0(0, 0, 0)];
        pressurebyvolume =
            -1.0 * density[OPS_ACC0(0, 0, 0)] * pressure[OPS_ACC2(0, 0, 0)];
        sound_speed_squared =
            v * v *
            (pressure[OPS_ACC2(0, 0, 0)] * pressurebyenergy - pressurebyvolume);
        soundspeed[OPS_ACC3(0, 0, 0)] = sqrt(sound_speed_squared);
      }
    }
  }
}
#undef OPS_OPENMP40
#undef OPS_OPENMP41
#undef OPS_OPENMP42
#undef OPS_OPENMP43

//
// auto-generated by ops.py
//
#include "./OpenMP4/clover_leaf_common.h"

#define OPS_GPU

extern int xdim0_advec_cell_kernel3_zdir;
extern int ydim0_advec_cell_kernel3_zdir;
extern int xdim1_advec_cell_kernel3_zdir;
extern int ydim1_advec_cell_kernel3_zdir;
extern int xdim2_advec_cell_kernel3_zdir;
extern int ydim2_advec_cell_kernel3_zdir;
extern int xdim3_advec_cell_kernel3_zdir;
extern int ydim3_advec_cell_kernel3_zdir;
extern int xdim4_advec_cell_kernel3_zdir;
extern int ydim4_advec_cell_kernel3_zdir;
extern int xdim5_advec_cell_kernel3_zdir;
extern int ydim5_advec_cell_kernel3_zdir;
extern int xdim6_advec_cell_kernel3_zdir;
extern int ydim6_advec_cell_kernel3_zdir;
extern int xdim7_advec_cell_kernel3_zdir;
extern int ydim7_advec_cell_kernel3_zdir;

#undef OPS_OPENMP40
#undef OPS_OPENMP41
#undef OPS_OPENMP42
#undef OPS_OPENMP43
#undef OPS_OPENMP44
#undef OPS_OPENMP45
#undef OPS_OPENMP46
#undef OPS_OPENMP47

#define OPS_OPENMP40(x, y, z)                                                  \
  (x + xdim0_advec_cell_kernel3_zdir * (y) +                                   \
   xdim0_advec_cell_kernel3_zdir * ydim0_advec_cell_kernel3_zdir * (z))
#define OPS_OPENMP41(x, y, z)                                                  \
  (x + xdim1_advec_cell_kernel3_zdir * (y) +                                   \
   xdim1_advec_cell_kernel3_zdir * ydim1_advec_cell_kernel3_zdir * (z))
#define OPS_OPENMP42(x, y, z)                                                  \
  (x + xdim2_advec_cell_kernel3_zdir * (y) +                                   \
   xdim2_advec_cell_kernel3_zdir * ydim2_advec_cell_kernel3_zdir * (z))
#define OPS_OPENMP43(x, y, z)                                                  \
  (x + xdim3_advec_cell_kernel3_zdir * (y) +                                   \
   xdim3_advec_cell_kernel3_zdir * ydim3_advec_cell_kernel3_zdir * (z))
#define OPS_OPENMP44(x, y, z)                                                  \
  (x + xdim4_advec_cell_kernel3_zdir * (y) +                                   \
   xdim4_advec_cell_kernel3_zdir * ydim4_advec_cell_kernel3_zdir * (z))
#define OPS_OPENMP45(x, y, z)                                                  \
  (x + xdim5_advec_cell_kernel3_zdir * (y) +                                   \
   xdim5_advec_cell_kernel3_zdir * ydim5_advec_cell_kernel3_zdir * (z))
#define OPS_OPENMP46(x, y, z)                                                  \
  (x + xdim6_advec_cell_kernel3_zdir * (y) +                                   \
   xdim6_advec_cell_kernel3_zdir * ydim6_advec_cell_kernel3_zdir * (z))
#define OPS_OPENMP47(x, y, z)                                                  \
  (x + xdim7_advec_cell_kernel3_zdir * (y) +                                   \
   xdim7_advec_cell_kernel3_zdir * ydim7_advec_cell_kernel3_zdir * (z))

// user function

void advec_cell_kernel3_zdir_c_wrapper(
    double *p_a0, int base0, int tot0, double *p_a1, int base1, int tot1,
    int *p_a2, int base2, int tot2, double *p_a3, int base3, int tot3,
    double *p_a4, int base4, int tot4, double *p_a5, int base5, int tot5,
    double *p_a6, int base6, int tot6, double *p_a7, int base7, int tot7,
    int x_size, int y_size, int z_size) {
  int num_blocks = round(((double)x_size * (double)y_size) / 128);
#pragma omp target enter data map(                                             \
    to : p_a0[0 : tot0], p_a1[0 : tot1],                                       \
                              p_a2[0 : tot2],                                  \
                                   p_a3[0 : tot3],                             \
                                        p_a4[0 : tot4],                        \
                                             p_a5[0 : tot5],                   \
                                                  p_a6[0 : tot6],              \
                                                       p_a7[0 : tot7])
#ifdef OPS_GPU

#pragma omp target map(to : p_a0[0 : tot0],                                    \
                                 p_a1[0 : tot1],                               \
                                      p_a2[0 : tot2],                          \
                                           p_a3[0 : tot3],                     \
                                                p_a4[0 : tot4],                \
                                                     p_a5[0 : tot5],           \
                                                          p_a6[0 : tot6],      \
                                                               p_a7[0 : tot7])
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
        const double *vol_flux_z = p_a0 + base0 + n_x * 1 * 1 +
                                   n_y * xdim0_advec_cell_kernel3_zdir * 1 * 1 +
                                   n_z * xdim0_advec_cell_kernel3_zdir *
                                       ydim0_advec_cell_kernel3_zdir * 1;

        const double *pre_vol = p_a1 + base1 + n_x * 1 * 1 +
                                n_y * xdim1_advec_cell_kernel3_zdir * 1 * 1 +
                                n_z * xdim1_advec_cell_kernel3_zdir *
                                    ydim1_advec_cell_kernel3_zdir * 1;

        const int *zz = p_a2 + base2 + n_x * 0 * 1 +
                        n_y * xdim2_advec_cell_kernel3_zdir * 0 * 1 +
                        n_z * xdim2_advec_cell_kernel3_zdir *
                            ydim2_advec_cell_kernel3_zdir * 1;

        const double *vertexdz = p_a3 + base3 + n_x * 0 * 1 +
                                 n_y * xdim3_advec_cell_kernel3_zdir * 0 * 1 +
                                 n_z * xdim3_advec_cell_kernel3_zdir *
                                     ydim3_advec_cell_kernel3_zdir * 1;

        const double *density1 = p_a4 + base4 + n_x * 1 * 1 +
                                 n_y * xdim4_advec_cell_kernel3_zdir * 1 * 1 +
                                 n_z * xdim4_advec_cell_kernel3_zdir *
                                     ydim4_advec_cell_kernel3_zdir * 1;

        const double *energy1 = p_a5 + base5 + n_x * 1 * 1 +
                                n_y * xdim5_advec_cell_kernel3_zdir * 1 * 1 +
                                n_z * xdim5_advec_cell_kernel3_zdir *
                                    ydim5_advec_cell_kernel3_zdir * 1;

        double *mass_flux_z = p_a6 + base6 + n_x * 1 * 1 +
                              n_y * xdim6_advec_cell_kernel3_zdir * 1 * 1 +
                              n_z * xdim6_advec_cell_kernel3_zdir *
                                  ydim6_advec_cell_kernel3_zdir * 1;

        double *ener_flux = p_a7 + base7 + n_x * 1 * 1 +
                            n_y * xdim7_advec_cell_kernel3_zdir * 1 * 1 +
                            n_z * xdim7_advec_cell_kernel3_zdir *
                                ydim7_advec_cell_kernel3_zdir * 1;

        double sigmat, sigmav, sigmam, sigma3, sigma4;
        double diffuw, diffdw, limiter;
        double one_by_six = 1.0 / 6.0;

        int z_max = field.z_max;

        int upwind, donor, downwind, dif;

        if (vol_flux_z[OPS_ACC0(0, 0, 0)] > 0.0) {
          upwind = -2;
          donor = -1;
          downwind = 0;
          dif = donor;
        } else if (zz[OPS_ACC2(0, 0, 1)] < z_max + 2 - 2) {
          upwind = 1;
          donor = 0;
          downwind = -1;
          dif = upwind;
        } else {
          upwind = 0;
          donor = 0;
          downwind = -1;
          dif = upwind;
        }

        sigmat = fabs(vol_flux_z[OPS_ACC0(0, 0, 0)]) /
                 pre_vol[OPS_ACC1(0, 0, donor)];
        sigma3 = (1.0 + sigmat) *
                 (vertexdz[OPS_ACC3(0, 0, 0)] / vertexdz[OPS_ACC3(0, 0, dif)]);
        sigma4 = 2.0 - sigmat;

        sigmav = sigmat;

        diffuw =
            density1[OPS_ACC4(0, 0, donor)] - density1[OPS_ACC4(0, 0, upwind)];
        diffdw = density1[OPS_ACC4(0, 0, downwind)] -
                 density1[OPS_ACC4(0, 0, donor)];

        if ((diffuw * diffdw) > 0.0)
          limiter =
              (1.0 - sigmav) * SIGN(1.0, diffdw) *
              MIN(MIN(fabs(diffuw), fabs(diffdw)),
                  one_by_six * (sigma3 * fabs(diffuw) + sigma4 * fabs(diffdw)));
        else
          limiter = 0.0;

        mass_flux_z[OPS_ACC6(0, 0, 0)] =
            vol_flux_z[OPS_ACC0(0, 0, 0)] *
            (density1[OPS_ACC4(0, 0, donor)] + limiter);

        sigmam =
            fabs(mass_flux_z[OPS_ACC6(0, 0, 0)]) /
            (density1[OPS_ACC4(0, 0, donor)] * pre_vol[OPS_ACC1(0, 0, donor)]);
        diffuw =
            energy1[OPS_ACC5(0, 0, donor)] - energy1[OPS_ACC5(0, 0, upwind)];
        diffdw =
            energy1[OPS_ACC5(0, 0, downwind)] - energy1[OPS_ACC5(0, 0, donor)];

        if ((diffuw * diffdw) > 0.0)
          limiter =
              (1.0 - sigmam) * SIGN(1.0, diffdw) *
              MIN(MIN(fabs(diffuw), fabs(diffdw)),
                  one_by_six * (sigma3 * fabs(diffuw) + sigma4 * fabs(diffdw)));
        else
          limiter = 0.0;

        ener_flux[OPS_ACC7(0, 0, 0)] =
            mass_flux_z[OPS_ACC6(0, 0, 0)] *
            (energy1[OPS_ACC5(0, 0, donor)] + limiter);
      }
    }
  }
}
#undef OPS_OPENMP40
#undef OPS_OPENMP41
#undef OPS_OPENMP42
#undef OPS_OPENMP43
#undef OPS_OPENMP44
#undef OPS_OPENMP45
#undef OPS_OPENMP46
#undef OPS_OPENMP47

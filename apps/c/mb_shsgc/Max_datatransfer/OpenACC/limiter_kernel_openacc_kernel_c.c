//
// auto-generated by ops.py
//
#include "./OpenACC/shsgc_common.h"

#define OPS_GPU

int xdim0_limiter_kernel;
int xdim1_limiter_kernel;
int xdim2_limiter_kernel;

#undef OPS_ACC_MD0
#undef OPS_ACC_MD1
#undef OPS_ACC_MD2

#define OPS_ACC_MD0(d, x) ((x)*3 + (d))
#define OPS_ACC_MD1(d, x) ((x)*3 + (d))
#define OPS_ACC_MD2(d, x) ((x)*3 + (d))
// user function
inline void limiter_kernel(const double *al, double *tht, double *gt) {

  double aalm, aal, all, ar, gtt;
  for (int m = 0; m < 3; m++) {
    aalm = fabs(al[OPS_ACC_MD0(m, -1)]);
    aal = fabs(al[OPS_ACC_MD0(m, 0)]);
    tht[OPS_ACC_MD1(m, 0)] = fabs(aal - aalm) / (aal + aalm + del2);
    all = al[OPS_ACC_MD0(m, -1)];
    ar = al[OPS_ACC_MD0(m, 0)];
    gtt = all * (ar * ar + del2) + ar * (all * all + del2);
    gt[OPS_ACC_MD2(m, 0)] = gtt / (ar * ar + all * all + 2.00 * del2);
  }
}

#undef OPS_ACC_MD0
#undef OPS_ACC_MD1
#undef OPS_ACC_MD2

void limiter_kernel_c_wrapper(double *p_a0, double *p_a1, double *p_a2,
                              int x_size) {
#ifdef OPS_GPU
#pragma acc parallel deviceptr(p_a0, p_a1, p_a2)
#pragma acc loop
#endif
  for (int n_x = 0; n_x < x_size; n_x++) {
    limiter_kernel(p_a0 + n_x * 1 * 3, p_a1 + n_x * 1 * 3, p_a2 + n_x * 1 * 3);
  }
}

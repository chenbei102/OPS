//
// auto-generated by ops.py
//
#include "./MPI_inline/clover_leaf_common.h"

extern int xdim0_PdV_kernel_predict;
int xdim0_PdV_kernel_predict_h = -1;
extern int xdim1_PdV_kernel_predict;
int xdim1_PdV_kernel_predict_h = -1;
extern int xdim2_PdV_kernel_predict;
int xdim2_PdV_kernel_predict_h = -1;
extern int xdim3_PdV_kernel_predict;
int xdim3_PdV_kernel_predict_h = -1;
extern int xdim4_PdV_kernel_predict;
int xdim4_PdV_kernel_predict_h = -1;
extern int xdim5_PdV_kernel_predict;
int xdim5_PdV_kernel_predict_h = -1;
extern int xdim6_PdV_kernel_predict;
int xdim6_PdV_kernel_predict_h = -1;
extern int xdim7_PdV_kernel_predict;
int xdim7_PdV_kernel_predict_h = -1;
extern int xdim8_PdV_kernel_predict;
int xdim8_PdV_kernel_predict_h = -1;
extern int xdim9_PdV_kernel_predict;
int xdim9_PdV_kernel_predict_h = -1;
extern int xdim10_PdV_kernel_predict;
int xdim10_PdV_kernel_predict_h = -1;
extern int xdim11_PdV_kernel_predict;
int xdim11_PdV_kernel_predict_h = -1;

#ifdef __cplusplus
extern "C" {
#endif
void PdV_kernel_predict_c_wrapper(double *p_a0, double *p_a1, double *p_a2,
                                  double *p_a3, double *p_a4, double *p_a5,
                                  double *p_a6, double *p_a7, double *p_a8,
                                  double *p_a9, double *p_a10, double *p_a11,
                                  int x_size, int y_size);

#ifdef __cplusplus
}
#endif

// host stub function
void ops_par_loop_PdV_kernel_predict(char const *name, ops_block block, int dim,
                                     int *range, ops_arg arg0, ops_arg arg1,
                                     ops_arg arg2, ops_arg arg3, ops_arg arg4,
                                     ops_arg arg5, ops_arg arg6, ops_arg arg7,
                                     ops_arg arg8, ops_arg arg9, ops_arg arg10,
                                     ops_arg arg11) {

  ops_arg args[12] = {arg0, arg1, arg2, arg3, arg4,  arg5,
                      arg6, arg7, arg8, arg9, arg10, arg11};

#ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args, 12, range, 4))
    return;
#endif

  ops_timing_realloc(4, "PdV_kernel_predict");
  OPS_kernels[4].count++;

  // compute localy allocated range for the sub-block
  int start[2];
  int end[2];
#ifdef OPS_MPI
  sub_block_list sb = OPS_sub_block_list[block->index];
  if (!sb->owned)
    return;
  for (int n = 0; n < 2; n++) {
    start[n] = sb->decomp_disp[n];
    end[n] = sb->decomp_disp[n] + sb->decomp_size[n];
    if (start[n] >= range[2 * n]) {
      start[n] = 0;
    } else {
      start[n] = range[2 * n] - start[n];
    }
    if (sb->id_m[n] == MPI_PROC_NULL && range[2 * n] < 0)
      start[n] = range[2 * n];
    if (end[n] >= range[2 * n + 1]) {
      end[n] = range[2 * n + 1] - sb->decomp_disp[n];
    } else {
      end[n] = sb->decomp_size[n];
    }
    if (sb->id_p[n] == MPI_PROC_NULL &&
        (range[2 * n + 1] > sb->decomp_disp[n] + sb->decomp_size[n]))
      end[n] += (range[2 * n + 1] - sb->decomp_disp[n] - sb->decomp_size[n]);
  }
#else
  for (int n = 0; n < 2; n++) {
    start[n] = range[2 * n];
    end[n] = range[2 * n + 1];
  }
#endif

  int x_size = MAX(0, end[0] - start[0]);
  int y_size = MAX(0, end[1] - start[1]);

  xdim0 = args[0].dat->size[0];
  xdim1 = args[1].dat->size[0];
  xdim2 = args[2].dat->size[0];
  xdim3 = args[3].dat->size[0];
  xdim4 = args[4].dat->size[0];
  xdim5 = args[5].dat->size[0];
  xdim6 = args[6].dat->size[0];
  xdim7 = args[7].dat->size[0];
  xdim8 = args[8].dat->size[0];
  xdim9 = args[9].dat->size[0];
  xdim10 = args[10].dat->size[0];
  xdim11 = args[11].dat->size[0];

  // Timing
  double t1, t2, c1, c2;
  ops_timers_core(&c2, &t2);

  if (xdim0 != xdim0_PdV_kernel_predict_h ||
      xdim1 != xdim1_PdV_kernel_predict_h ||
      xdim2 != xdim2_PdV_kernel_predict_h ||
      xdim3 != xdim3_PdV_kernel_predict_h ||
      xdim4 != xdim4_PdV_kernel_predict_h ||
      xdim5 != xdim5_PdV_kernel_predict_h ||
      xdim6 != xdim6_PdV_kernel_predict_h ||
      xdim7 != xdim7_PdV_kernel_predict_h ||
      xdim8 != xdim8_PdV_kernel_predict_h ||
      xdim9 != xdim9_PdV_kernel_predict_h ||
      xdim10 != xdim10_PdV_kernel_predict_h ||
      xdim11 != xdim11_PdV_kernel_predict_h) {
    xdim0_PdV_kernel_predict = xdim0;
    xdim0_PdV_kernel_predict_h = xdim0;
    xdim1_PdV_kernel_predict = xdim1;
    xdim1_PdV_kernel_predict_h = xdim1;
    xdim2_PdV_kernel_predict = xdim2;
    xdim2_PdV_kernel_predict_h = xdim2;
    xdim3_PdV_kernel_predict = xdim3;
    xdim3_PdV_kernel_predict_h = xdim3;
    xdim4_PdV_kernel_predict = xdim4;
    xdim4_PdV_kernel_predict_h = xdim4;
    xdim5_PdV_kernel_predict = xdim5;
    xdim5_PdV_kernel_predict_h = xdim5;
    xdim6_PdV_kernel_predict = xdim6;
    xdim6_PdV_kernel_predict_h = xdim6;
    xdim7_PdV_kernel_predict = xdim7;
    xdim7_PdV_kernel_predict_h = xdim7;
    xdim8_PdV_kernel_predict = xdim8;
    xdim8_PdV_kernel_predict_h = xdim8;
    xdim9_PdV_kernel_predict = xdim9;
    xdim9_PdV_kernel_predict_h = xdim9;
    xdim10_PdV_kernel_predict = xdim10;
    xdim10_PdV_kernel_predict_h = xdim10;
    xdim11_PdV_kernel_predict = xdim11;
    xdim11_PdV_kernel_predict_h = xdim11;
  }

  int dat0 = args[0].dat->elem_size;
  int dat1 = args[1].dat->elem_size;
  int dat2 = args[2].dat->elem_size;
  int dat3 = args[3].dat->elem_size;
  int dat4 = args[4].dat->elem_size;
  int dat5 = args[5].dat->elem_size;
  int dat6 = args[6].dat->elem_size;
  int dat7 = args[7].dat->elem_size;
  int dat8 = args[8].dat->elem_size;
  int dat9 = args[9].dat->elem_size;
  int dat10 = args[10].dat->elem_size;
  int dat11 = args[11].dat->elem_size;

  // set up initial pointers
  int d_m[OPS_MAX_DIM];
#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[0].dat->d_m[d] + OPS_sub_dat_list[args[0].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[0].dat->d_m[d];
#endif
  int base0 = dat0 * 1 * (start[0] * args[0].stencil->stride[0] -
                          args[0].dat->base[0] - d_m[0]);
  base0 = base0 +
          dat0 * args[0].dat->size[0] * (start[1] * args[0].stencil->stride[1] -
                                         args[0].dat->base[1] - d_m[1]);
  double *p_a0 = (double *)((char *)args[0].data + base0);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[1].dat->d_m[d] + OPS_sub_dat_list[args[1].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[1].dat->d_m[d];
#endif
  int base1 = dat1 * 1 * (start[0] * args[1].stencil->stride[0] -
                          args[1].dat->base[0] - d_m[0]);
  base1 = base1 +
          dat1 * args[1].dat->size[0] * (start[1] * args[1].stencil->stride[1] -
                                         args[1].dat->base[1] - d_m[1]);
  double *p_a1 = (double *)((char *)args[1].data + base1);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[2].dat->d_m[d] + OPS_sub_dat_list[args[2].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[2].dat->d_m[d];
#endif
  int base2 = dat2 * 1 * (start[0] * args[2].stencil->stride[0] -
                          args[2].dat->base[0] - d_m[0]);
  base2 = base2 +
          dat2 * args[2].dat->size[0] * (start[1] * args[2].stencil->stride[1] -
                                         args[2].dat->base[1] - d_m[1]);
  double *p_a2 = (double *)((char *)args[2].data + base2);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[3].dat->d_m[d] + OPS_sub_dat_list[args[3].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[3].dat->d_m[d];
#endif
  int base3 = dat3 * 1 * (start[0] * args[3].stencil->stride[0] -
                          args[3].dat->base[0] - d_m[0]);
  base3 = base3 +
          dat3 * args[3].dat->size[0] * (start[1] * args[3].stencil->stride[1] -
                                         args[3].dat->base[1] - d_m[1]);
  double *p_a3 = (double *)((char *)args[3].data + base3);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[4].dat->d_m[d] + OPS_sub_dat_list[args[4].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[4].dat->d_m[d];
#endif
  int base4 = dat4 * 1 * (start[0] * args[4].stencil->stride[0] -
                          args[4].dat->base[0] - d_m[0]);
  base4 = base4 +
          dat4 * args[4].dat->size[0] * (start[1] * args[4].stencil->stride[1] -
                                         args[4].dat->base[1] - d_m[1]);
  double *p_a4 = (double *)((char *)args[4].data + base4);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[5].dat->d_m[d] + OPS_sub_dat_list[args[5].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[5].dat->d_m[d];
#endif
  int base5 = dat5 * 1 * (start[0] * args[5].stencil->stride[0] -
                          args[5].dat->base[0] - d_m[0]);
  base5 = base5 +
          dat5 * args[5].dat->size[0] * (start[1] * args[5].stencil->stride[1] -
                                         args[5].dat->base[1] - d_m[1]);
  double *p_a5 = (double *)((char *)args[5].data + base5);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[6].dat->d_m[d] + OPS_sub_dat_list[args[6].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[6].dat->d_m[d];
#endif
  int base6 = dat6 * 1 * (start[0] * args[6].stencil->stride[0] -
                          args[6].dat->base[0] - d_m[0]);
  base6 = base6 +
          dat6 * args[6].dat->size[0] * (start[1] * args[6].stencil->stride[1] -
                                         args[6].dat->base[1] - d_m[1]);
  double *p_a6 = (double *)((char *)args[6].data + base6);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[7].dat->d_m[d] + OPS_sub_dat_list[args[7].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[7].dat->d_m[d];
#endif
  int base7 = dat7 * 1 * (start[0] * args[7].stencil->stride[0] -
                          args[7].dat->base[0] - d_m[0]);
  base7 = base7 +
          dat7 * args[7].dat->size[0] * (start[1] * args[7].stencil->stride[1] -
                                         args[7].dat->base[1] - d_m[1]);
  double *p_a7 = (double *)((char *)args[7].data + base7);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[8].dat->d_m[d] + OPS_sub_dat_list[args[8].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[8].dat->d_m[d];
#endif
  int base8 = dat8 * 1 * (start[0] * args[8].stencil->stride[0] -
                          args[8].dat->base[0] - d_m[0]);
  base8 = base8 +
          dat8 * args[8].dat->size[0] * (start[1] * args[8].stencil->stride[1] -
                                         args[8].dat->base[1] - d_m[1]);
  double *p_a8 = (double *)((char *)args[8].data + base8);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[9].dat->d_m[d] + OPS_sub_dat_list[args[9].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[9].dat->d_m[d];
#endif
  int base9 = dat9 * 1 * (start[0] * args[9].stencil->stride[0] -
                          args[9].dat->base[0] - d_m[0]);
  base9 = base9 +
          dat9 * args[9].dat->size[0] * (start[1] * args[9].stencil->stride[1] -
                                         args[9].dat->base[1] - d_m[1]);
  double *p_a9 = (double *)((char *)args[9].data + base9);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[10].dat->d_m[d] + OPS_sub_dat_list[args[10].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[10].dat->d_m[d];
#endif
  int base10 = dat10 * 1 * (start[0] * args[10].stencil->stride[0] -
                            args[10].dat->base[0] - d_m[0]);
  base10 =
      base10 +
      dat10 * args[10].dat->size[0] * (start[1] * args[10].stencil->stride[1] -
                                       args[10].dat->base[1] - d_m[1]);
  double *p_a10 = (double *)((char *)args[10].data + base10);

#ifdef OPS_MPI
  for (int d = 0; d < dim; d++)
    d_m[d] =
        args[11].dat->d_m[d] + OPS_sub_dat_list[args[11].dat->index]->d_im[d];
#else
  for (int d = 0; d < dim; d++)
    d_m[d] = args[11].dat->d_m[d];
#endif
  int base11 = dat11 * 1 * (start[0] * args[11].stencil->stride[0] -
                            args[11].dat->base[0] - d_m[0]);
  base11 =
      base11 +
      dat11 * args[11].dat->size[0] * (start[1] * args[11].stencil->stride[1] -
                                       args[11].dat->base[1] - d_m[1]);
  double *p_a11 = (double *)((char *)args[11].data + base11);

  ops_H_D_exchanges_host(args, 12);
  ops_halo_exchanges(args, 12, range);

  ops_timers_core(&c1, &t1);
  OPS_kernels[4].mpi_time += t1 - t2;

  PdV_kernel_predict_c_wrapper(p_a0, p_a1, p_a2, p_a3, p_a4, p_a5, p_a6, p_a7,
                               p_a8, p_a9, p_a10, p_a11, x_size, y_size);

  ops_timers_core(&c2, &t2);
  OPS_kernels[4].time += t2 - t1;
  ops_set_dirtybit_host(args, 12);
  ops_set_halo_dirtybit3(&args[4], range);
  ops_set_halo_dirtybit3(&args[8], range);
  ops_set_halo_dirtybit3(&args[11], range);

  // Update kernel record
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg0);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg1);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg2);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg3);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg4);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg5);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg6);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg7);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg8);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg9);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg10);
  OPS_kernels[4].transfer += ops_compute_transfer(dim, start, end, &arg11);
}

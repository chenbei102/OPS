//
// auto-generated by ops.py
//
__constant__ int xdim0_drhoEpudx_kernel;
int xdim0_drhoEpudx_kernel_h = -1;
int ydim0_drhoEpudx_kernel_h = -1;
__constant__ int xdim1_drhoEpudx_kernel;
int xdim1_drhoEpudx_kernel_h = -1;
int ydim1_drhoEpudx_kernel_h = -1;
__constant__ int xdim2_drhoEpudx_kernel;
int xdim2_drhoEpudx_kernel_h = -1;
int ydim2_drhoEpudx_kernel_h = -1;
__constant__ int xdim3_drhoEpudx_kernel;
int xdim3_drhoEpudx_kernel_h = -1;
int ydim3_drhoEpudx_kernel_h = -1;

#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3

#define OPS_ACC0(x) (x)
#define OPS_ACC1(x) (x)
#define OPS_ACC2(x) (x)
#define OPS_ACC3(x) (x)

// user function
__device__

    void
    drhoEpudx_kernel(const double *rhou_new, const double *rho_new,
                     const double *rhoE_new, double *rhoE_res) {

  double fni =
      rhou_new[OPS_ACC0(0)] * rhou_new[OPS_ACC0(0)] / rho_new[OPS_ACC1(0)];
  double p = gam1 * (rhoE_new[OPS_ACC2(0)] - 0.5 * fni);
  fni = (rhoE_new[OPS_ACC2(0)] + p) * rhou_new[OPS_ACC0(0)] /
        rho_new[OPS_ACC1(0)];

  double fnim1 =
      rhou_new[OPS_ACC0(-1)] * rhou_new[OPS_ACC0(-1)] / rho_new[OPS_ACC1(-1)];
  p = gam1 * (rhoE_new[OPS_ACC2(-1)] - 0.5 * fnim1);
  fnim1 = (rhoE_new[OPS_ACC2(-1)] + p) * rhou_new[OPS_ACC0(-1)] /
          rho_new[OPS_ACC1(-1)];

  double fnim2 =
      rhou_new[OPS_ACC0(-2)] * rhou_new[OPS_ACC0(-2)] / rho_new[OPS_ACC1(-2)];
  p = gam1 * (rhoE_new[OPS_ACC2(-2)] - 0.5 * fnim2);
  fnim2 = (rhoE_new[OPS_ACC2(-2)] + p) * rhou_new[OPS_ACC0(-2)] /
          rho_new[OPS_ACC1(-2)];

  double fnip1 =
      rhou_new[OPS_ACC0(1)] * rhou_new[OPS_ACC0(1)] / rho_new[OPS_ACC1(1)];
  p = gam1 * (rhoE_new[OPS_ACC2(1)] - 0.5 * fnip1);
  fnip1 = (rhoE_new[OPS_ACC2(1)] + p) * rhou_new[OPS_ACC0(1)] /
          rho_new[OPS_ACC1(1)];

  double fnip2 =
      rhou_new[OPS_ACC0(2)] * rhou_new[OPS_ACC0(2)] / rho_new[OPS_ACC1(2)];
  p = gam1 * (rhoE_new[OPS_ACC2(2)] - 0.5 * fnip2);
  fnip2 = (rhoE_new[OPS_ACC2(2)] + p) * rhou_new[OPS_ACC0(2)] /
          rho_new[OPS_ACC1(2)];

  double deriv = (fnim2 - fnip2 + 8.0 * (fnip1 - fnim1)) / (12.00 * dx);
  rhoE_res[OPS_ACC3(0)] = deriv;
}

#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3

__global__ void ops_drhoEpudx_kernel(const double *__restrict arg0,
                                     const double *__restrict arg1,
                                     const double *__restrict arg2,
                                     double *__restrict arg3, int size0) {

  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 * 1;
  arg1 += idx_x * 1 * 1;
  arg2 += idx_x * 1 * 1;
  arg3 += idx_x * 1 * 1;

  if (idx_x < size0) {
    drhoEpudx_kernel(arg0, arg1, arg2, arg3);
  }
}

// host stub function
void ops_par_loop_drhoEpudx_kernel(char const *name, ops_block block, int dim,
                                   int *range, ops_arg arg0, ops_arg arg1,
                                   ops_arg arg2, ops_arg arg3) {

  // Timing
  double t1, t2, c1, c2;

  ops_arg args[4] = {arg0, arg1, arg2, arg3};

#ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args, 4, range, 5))
    return;
#endif

  if (OPS_diags > 1) {
    ops_timing_realloc(5, "drhoEpudx_kernel");
    OPS_kernels[5].count++;
    ops_timers_core(&c1, &t1);
  }

  // compute locally allocated range for the sub-block
  int start[1];
  int end[1];
#ifdef OPS_MPI
  sub_block_list sb = OPS_sub_block_list[block->index];
  if (!sb->owned)
    return;
  for (int n = 0; n < 1; n++) {
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
  for (int n = 0; n < 1; n++) {
    start[n] = range[2 * n];
    end[n] = range[2 * n + 1];
  }
#endif

  int x_size = MAX(0, end[0] - start[0]);

  int xdim0 = args[0].dat->size[0];
  int xdim1 = args[1].dat->size[0];
  int xdim2 = args[2].dat->size[0];
  int xdim3 = args[3].dat->size[0];

  if (xdim0 != xdim0_drhoEpudx_kernel_h || xdim1 != xdim1_drhoEpudx_kernel_h ||
      xdim2 != xdim2_drhoEpudx_kernel_h || xdim3 != xdim3_drhoEpudx_kernel_h) {
    cudaMemcpyToSymbol(xdim0_drhoEpudx_kernel, &xdim0, sizeof(int));
    xdim0_drhoEpudx_kernel_h = xdim0;
    cudaMemcpyToSymbol(xdim1_drhoEpudx_kernel, &xdim1, sizeof(int));
    xdim1_drhoEpudx_kernel_h = xdim1;
    cudaMemcpyToSymbol(xdim2_drhoEpudx_kernel, &xdim2, sizeof(int));
    xdim2_drhoEpudx_kernel_h = xdim2;
    cudaMemcpyToSymbol(xdim3_drhoEpudx_kernel, &xdim3, sizeof(int));
    xdim3_drhoEpudx_kernel_h = xdim3;
  }

  dim3 grid((x_size - 1) / OPS_block_size_x + 1, 1, 1);
  dim3 tblock(OPS_block_size_x, 1, 1);

  int dat0 = args[0].dat->elem_size;
  int dat1 = args[1].dat->elem_size;
  int dat2 = args[2].dat->elem_size;
  int dat3 = args[3].dat->elem_size;

  char *p_a[4];

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
  p_a[0] = (char *)args[0].data_d + base0;

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
  p_a[1] = (char *)args[1].data_d + base1;

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
  p_a[2] = (char *)args[2].data_d + base2;

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
  p_a[3] = (char *)args[3].data_d + base3;

  ops_H_D_exchanges_device(args, 4);
  ops_halo_exchanges(args, 4, range);

  if (OPS_diags > 1) {
    ops_timers_core(&c2, &t2);
    OPS_kernels[5].mpi_time += t2 - t1;
  }

  // call kernel wrapper function, passing in pointers to data
  ops_drhoEpudx_kernel<<<grid, tblock>>>((double *)p_a[0], (double *)p_a[1],
                                         (double *)p_a[2], (double *)p_a[3],
                                         x_size);

  if (OPS_diags > 1) {
    cutilSafeCall(cudaDeviceSynchronize());
    ops_timers_core(&c1, &t1);
    OPS_kernels[5].time += t1 - t2;
  }

  ops_set_dirtybit_device(args, 4);
  ops_set_halo_dirtybit3(&args[3], range);

  if (OPS_diags > 1) {
    // Update kernel record
    ops_timers_core(&c2, &t2);
    OPS_kernels[5].mpi_time += t2 - t1;
    OPS_kernels[5].transfer += ops_compute_transfer(dim, start, end, &arg0);
    OPS_kernels[5].transfer += ops_compute_transfer(dim, start, end, &arg1);
    OPS_kernels[5].transfer += ops_compute_transfer(dim, start, end, &arg2);
    OPS_kernels[5].transfer += ops_compute_transfer(dim, start, end, &arg3);
  }
}

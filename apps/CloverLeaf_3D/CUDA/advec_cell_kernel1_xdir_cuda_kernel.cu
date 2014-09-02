//
// auto-generated by ops.py
//
__constant__ int xdim0_advec_cell_kernel1_xdir;
__constant__ int ydim0_advec_cell_kernel1_xdir;
__constant__ int xdim1_advec_cell_kernel1_xdir;
__constant__ int ydim1_advec_cell_kernel1_xdir;
__constant__ int xdim2_advec_cell_kernel1_xdir;
__constant__ int ydim2_advec_cell_kernel1_xdir;
__constant__ int xdim3_advec_cell_kernel1_xdir;
__constant__ int ydim3_advec_cell_kernel1_xdir;
__constant__ int xdim4_advec_cell_kernel1_xdir;
__constant__ int ydim4_advec_cell_kernel1_xdir;
__constant__ int xdim5_advec_cell_kernel1_xdir;
__constant__ int ydim5_advec_cell_kernel1_xdir;

#define OPS_ACC0(x,y,z) (x+xdim0_advec_cell_kernel1_xdir*(y)+xdim0_advec_cell_kernel1_xdir*ydim0_advec_cell_kernel1_xdir*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_advec_cell_kernel1_xdir*(y)+xdim1_advec_cell_kernel1_xdir*ydim1_advec_cell_kernel1_xdir*(z))
#define OPS_ACC2(x,y,z) (x+xdim2_advec_cell_kernel1_xdir*(y)+xdim2_advec_cell_kernel1_xdir*ydim2_advec_cell_kernel1_xdir*(z))
#define OPS_ACC3(x,y,z) (x+xdim3_advec_cell_kernel1_xdir*(y)+xdim3_advec_cell_kernel1_xdir*ydim3_advec_cell_kernel1_xdir*(z))
#define OPS_ACC4(x,y,z) (x+xdim4_advec_cell_kernel1_xdir*(y)+xdim4_advec_cell_kernel1_xdir*ydim4_advec_cell_kernel1_xdir*(z))
#define OPS_ACC5(x,y,z) (x+xdim5_advec_cell_kernel1_xdir*(y)+xdim5_advec_cell_kernel1_xdir*ydim5_advec_cell_kernel1_xdir*(z))

//user function
__device__

inline void advec_cell_kernel1_xdir( double *pre_vol, double *post_vol, const double *volume,
                        const double *vol_flux_x, const double *vol_flux_y, const double *vol_flux_z) {

  pre_vol[OPS_ACC0(0,0,0)] = volume[OPS_ACC2(0,0,0)] +
                         ( vol_flux_x[OPS_ACC3(1,0,0)] - vol_flux_x[OPS_ACC3(0,0,0)] +
                           vol_flux_y[OPS_ACC4(0,1,0)] - vol_flux_y[OPS_ACC4(0,0,0)] +
                           vol_flux_z[OPS_ACC5(0,0,1)] - vol_flux_z[OPS_ACC5(0,0,0)]);
  post_vol[OPS_ACC1(0,0,0)] = pre_vol[OPS_ACC0(0,0,0)] - ( vol_flux_x[OPS_ACC3(1,0,0)] - vol_flux_x[OPS_ACC3(0,0,0)]);

}



#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3
#undef OPS_ACC4
#undef OPS_ACC5


__global__ void ops_advec_cell_kernel1_xdir(
double* __restrict arg0,
double* __restrict arg1,
const double* __restrict arg2,
const double* __restrict arg3,
const double* __restrict arg4,
const double* __restrict arg5,
int size0,
int size1,
int size2 ){


  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 + idx_y * 1 * xdim0_advec_cell_kernel1_xdir + idx_z * 1 * xdim0_advec_cell_kernel1_xdir * ydim0_advec_cell_kernel1_xdir;
  arg1 += idx_x * 1 + idx_y * 1 * xdim1_advec_cell_kernel1_xdir + idx_z * 1 * xdim1_advec_cell_kernel1_xdir * ydim1_advec_cell_kernel1_xdir;
  arg2 += idx_x * 1 + idx_y * 1 * xdim2_advec_cell_kernel1_xdir + idx_z * 1 * xdim2_advec_cell_kernel1_xdir * ydim2_advec_cell_kernel1_xdir;
  arg3 += idx_x * 1 + idx_y * 1 * xdim3_advec_cell_kernel1_xdir + idx_z * 1 * xdim3_advec_cell_kernel1_xdir * ydim3_advec_cell_kernel1_xdir;
  arg4 += idx_x * 1 + idx_y * 1 * xdim4_advec_cell_kernel1_xdir + idx_z * 1 * xdim4_advec_cell_kernel1_xdir * ydim4_advec_cell_kernel1_xdir;
  arg5 += idx_x * 1 + idx_y * 1 * xdim5_advec_cell_kernel1_xdir + idx_z * 1 * xdim5_advec_cell_kernel1_xdir * ydim5_advec_cell_kernel1_xdir;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    advec_cell_kernel1_xdir(arg0, arg1, arg2, arg3,
                   arg4, arg5);
  }

}

// host stub function
void ops_par_loop_advec_cell_kernel1_xdir(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5) {

  ops_arg args[6] = { arg0, arg1, arg2, arg3, arg4, arg5};


  ops_timing_realloc(7,"advec_cell_kernel1_xdir");
  OPS_kernels[7].count++;

  //compute locally allocated range for the sub-block
  int start[3];
  int end[3];
  #ifdef OPS_MPI
  sub_block_list sb = OPS_sub_block_list[block->index];
  if (!sb->owned) return;
  for ( int n=0; n<3; n++ ){
    start[n] = sb->decomp_disp[n];end[n] = sb->decomp_disp[n]+sb->decomp_size[n];
    if (start[n] >= range[2*n]) {
      start[n] = 0;
    }
    else {
      start[n] = range[2*n] - start[n];
    }
    if (sb->id_m[n]==MPI_PROC_NULL && range[2*n] < 0) start[n] = range[2*n];
    if (end[n] >= range[2*n+1]) {
      end[n] = range[2*n+1] - sb->decomp_disp[n];
    }
    else {
      end[n] = sb->decomp_size[n];
    }
    if (sb->id_p[n]==MPI_PROC_NULL && (range[2*n+1] > sb->decomp_disp[n]+sb->decomp_size[n]))
      end[n] += (range[2*n+1]-sb->decomp_disp[n]-sb->decomp_size[n]);
  }
  #else //OPS_MPI
  for ( int n=0; n<3; n++ ){
    start[n] = range[2*n];end[n] = range[2*n+1];
  }
  #endif //OPS_MPI

  int x_size = MAX(0,end[0]-start[0]);
  int y_size = MAX(0,end[1]-start[1]);
  int z_size = MAX(0,end[2]-start[2]);

  int xdim0 = args[0].dat->size[0]*args[0].dat->dim;
  int ydim0 = args[0].dat->size[1];
  int xdim1 = args[1].dat->size[0]*args[1].dat->dim;
  int ydim1 = args[1].dat->size[1];
  int xdim2 = args[2].dat->size[0]*args[2].dat->dim;
  int ydim2 = args[2].dat->size[1];
  int xdim3 = args[3].dat->size[0]*args[3].dat->dim;
  int ydim3 = args[3].dat->size[1];
  int xdim4 = args[4].dat->size[0]*args[4].dat->dim;
  int ydim4 = args[4].dat->size[1];
  int xdim5 = args[5].dat->size[0]*args[5].dat->dim;
  int ydim5 = args[5].dat->size[1];


  //Timing
  double t1,t2,c1,c2;
  ops_timers_core(&c2,&t2);

  if (OPS_kernels[7].count == 1) {
    cudaMemcpyToSymbol( xdim0_advec_cell_kernel1_xdir, &xdim0, sizeof(int) );
    cudaMemcpyToSymbol( ydim0_advec_cell_kernel1_xdir, &ydim0, sizeof(int) );
    cudaMemcpyToSymbol( xdim1_advec_cell_kernel1_xdir, &xdim1, sizeof(int) );
    cudaMemcpyToSymbol( ydim1_advec_cell_kernel1_xdir, &ydim1, sizeof(int) );
    cudaMemcpyToSymbol( xdim2_advec_cell_kernel1_xdir, &xdim2, sizeof(int) );
    cudaMemcpyToSymbol( ydim2_advec_cell_kernel1_xdir, &ydim2, sizeof(int) );
    cudaMemcpyToSymbol( xdim3_advec_cell_kernel1_xdir, &xdim3, sizeof(int) );
    cudaMemcpyToSymbol( ydim3_advec_cell_kernel1_xdir, &ydim3, sizeof(int) );
    cudaMemcpyToSymbol( xdim4_advec_cell_kernel1_xdir, &xdim4, sizeof(int) );
    cudaMemcpyToSymbol( ydim4_advec_cell_kernel1_xdir, &ydim4, sizeof(int) );
    cudaMemcpyToSymbol( xdim5_advec_cell_kernel1_xdir, &xdim5, sizeof(int) );
    cudaMemcpyToSymbol( ydim5_advec_cell_kernel1_xdir, &ydim5, sizeof(int) );
  }



  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, z_size);
  dim3 tblock(OPS_block_size_x,OPS_block_size_y,1);



  int dat0 = args[0].dat->elem_size;
  int dat1 = args[1].dat->elem_size;
  int dat2 = args[2].dat->elem_size;
  int dat3 = args[3].dat->elem_size;
  int dat4 = args[4].dat->elem_size;
  int dat5 = args[5].dat->elem_size;

  char *p_a[6];

  //set up initial pointers
  int d_m[OPS_MAX_DIM];
  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d] + OPS_sub_dat_list[args[0].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[0].dat->d_m[d];
  #endif //OPS_MPI
  int base0 = dat0 * 1 * 
  (start[0] * args[0].stencil->stride[0] - args[0].dat->base[0] - d_m[0]);
  base0 = base0+ dat0 *
    args[0].dat->size[0] *
    (start[1] * args[0].stencil->stride[1] - args[0].dat->base[1] - d_m[1]);
  base0 = base0+ dat0 *
    args[0].dat->size[0] *
    args[0].dat->size[1] *
    (start[2] * args[0].stencil->stride[2] - args[0].dat->base[2] - d_m[2]);
  p_a[0] = (char *)args[0].data_d + base0;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d] + OPS_sub_dat_list[args[1].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[1].dat->d_m[d];
  #endif //OPS_MPI
  int base1 = dat1 * 1 * 
  (start[0] * args[1].stencil->stride[0] - args[1].dat->base[0] - d_m[0]);
  base1 = base1+ dat1 *
    args[1].dat->size[0] *
    (start[1] * args[1].stencil->stride[1] - args[1].dat->base[1] - d_m[1]);
  base1 = base1+ dat1 *
    args[1].dat->size[0] *
    args[1].dat->size[1] *
    (start[2] * args[1].stencil->stride[2] - args[1].dat->base[2] - d_m[2]);
  p_a[1] = (char *)args[1].data_d + base1;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d] + OPS_sub_dat_list[args[2].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[2].dat->d_m[d];
  #endif //OPS_MPI
  int base2 = dat2 * 1 * 
  (start[0] * args[2].stencil->stride[0] - args[2].dat->base[0] - d_m[0]);
  base2 = base2+ dat2 *
    args[2].dat->size[0] *
    (start[1] * args[2].stencil->stride[1] - args[2].dat->base[1] - d_m[1]);
  base2 = base2+ dat2 *
    args[2].dat->size[0] *
    args[2].dat->size[1] *
    (start[2] * args[2].stencil->stride[2] - args[2].dat->base[2] - d_m[2]);
  p_a[2] = (char *)args[2].data_d + base2;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[3].dat->d_m[d] + OPS_sub_dat_list[args[3].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[3].dat->d_m[d];
  #endif //OPS_MPI
  int base3 = dat3 * 1 * 
  (start[0] * args[3].stencil->stride[0] - args[3].dat->base[0] - d_m[0]);
  base3 = base3+ dat3 *
    args[3].dat->size[0] *
    (start[1] * args[3].stencil->stride[1] - args[3].dat->base[1] - d_m[1]);
  base3 = base3+ dat3 *
    args[3].dat->size[0] *
    args[3].dat->size[1] *
    (start[2] * args[3].stencil->stride[2] - args[3].dat->base[2] - d_m[2]);
  p_a[3] = (char *)args[3].data_d + base3;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[4].dat->d_m[d] + OPS_sub_dat_list[args[4].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[4].dat->d_m[d];
  #endif //OPS_MPI
  int base4 = dat4 * 1 * 
  (start[0] * args[4].stencil->stride[0] - args[4].dat->base[0] - d_m[0]);
  base4 = base4+ dat4 *
    args[4].dat->size[0] *
    (start[1] * args[4].stencil->stride[1] - args[4].dat->base[1] - d_m[1]);
  base4 = base4+ dat4 *
    args[4].dat->size[0] *
    args[4].dat->size[1] *
    (start[2] * args[4].stencil->stride[2] - args[4].dat->base[2] - d_m[2]);
  p_a[4] = (char *)args[4].data_d + base4;

  #ifdef OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[5].dat->d_m[d] + OPS_sub_dat_list[args[5].dat->index]->d_im[d];
  #else //OPS_MPI
  for (int d = 0; d < dim; d++) d_m[d] = args[5].dat->d_m[d];
  #endif //OPS_MPI
  int base5 = dat5 * 1 * 
  (start[0] * args[5].stencil->stride[0] - args[5].dat->base[0] - d_m[0]);
  base5 = base5+ dat5 *
    args[5].dat->size[0] *
    (start[1] * args[5].stencil->stride[1] - args[5].dat->base[1] - d_m[1]);
  base5 = base5+ dat5 *
    args[5].dat->size[0] *
    args[5].dat->size[1] *
    (start[2] * args[5].stencil->stride[2] - args[5].dat->base[2] - d_m[2]);
  p_a[5] = (char *)args[5].data_d + base5;


  ops_H_D_exchanges_device(args, 6);
  ops_halo_exchanges(args,6,range);

  ops_timers_core(&c1,&t1);
  OPS_kernels[7].mpi_time += t1-t2;


  //call kernel wrapper function, passing in pointers to data
  ops_advec_cell_kernel1_xdir<<<grid, tblock >>> (  (double *)p_a[0], (double *)p_a[1],
           (double *)p_a[2], (double *)p_a[3],
           (double *)p_a[4], (double *)p_a[5],x_size, y_size, z_size);

  if (OPS_diags>1) {
    cutilSafeCall(cudaDeviceSynchronize());
  }
  ops_timers_core(&c2,&t2);
  OPS_kernels[7].time += t2-t1;
  ops_set_dirtybit_device(args, 6);
  ops_set_halo_dirtybit3(&args[0],range);
  ops_set_halo_dirtybit3(&args[1],range);

  //Update kernel record
  OPS_kernels[7].transfer += ops_compute_transfer(dim, range, &arg0);
  OPS_kernels[7].transfer += ops_compute_transfer(dim, range, &arg1);
  OPS_kernels[7].transfer += ops_compute_transfer(dim, range, &arg2);
  OPS_kernels[7].transfer += ops_compute_transfer(dim, range, &arg3);
  OPS_kernels[7].transfer += ops_compute_transfer(dim, range, &arg4);
  OPS_kernels[7].transfer += ops_compute_transfer(dim, range, &arg5);
}

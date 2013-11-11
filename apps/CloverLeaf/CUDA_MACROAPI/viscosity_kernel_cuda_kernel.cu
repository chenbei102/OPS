//
// auto-generated by ops.py on 2013-11-11 15:26
//

//user function
#include "viscosity_kernel.h"

__global__ void ops_viscosity_kernel(
const double* __restrict arg0,
const double* __restrict arg1,
const double* __restrict arg2,
const double* __restrict arg3,
const double* __restrict arg4,
const double* __restrict arg5,
double* __restrict arg6,
int size0,
int size1 ){

  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1 + idx_y * 1 * xdim0_accel;
  arg1 += idx_x * 1 + idx_y * 1 * xdim1_accel;
  arg2 += idx_x * 1 + idx_y * 0 * xdim2_accel;
  arg3 += idx_x * 0 + idx_y * 1 * xdim3_accel;
  arg4 += idx_x * 1 + idx_y * 1 * xdim4_accel;
  arg5 += idx_x * 1 + idx_y * 1 * xdim5_accel;
  arg6 += idx_x * 1 + idx_y * 1 * xdim6_accel;
  if (idx_x < size0 && idx_y < size1) {
    viscosity_kernel(arg0 ,arg1 ,arg2 ,arg3 ,
arg4 ,arg5 ,arg6 );
  }
}

// host stub function
void ops_par_loop_viscosity_kernel(char const *name, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5, ops_arg arg6) {

  ops_arg args[7] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6};



  int x_size = range[1]-range[0];
  int y_size = range[3]-range[2];

  int xdim0 = args[0].dat->block_size[0];
  int xdim1 = args[1].dat->block_size[0];
  int xdim2 = args[2].dat->block_size[0];
  int xdim3 = args[3].dat->block_size[0];
  int xdim4 = args[4].dat->block_size[0];
  int xdim5 = args[5].dat->block_size[0];
  int xdim6 = args[6].dat->block_size[0];

  cudaMemcpyToSymbol( xdim0_accel, &xdim0, sizeof(int) );
  cudaMemcpyToSymbol( xdim1_accel, &xdim1, sizeof(int) );
  cudaMemcpyToSymbol( xdim2_accel, &xdim2, sizeof(int) );
  cudaMemcpyToSymbol( xdim3_accel, &xdim3, sizeof(int) );
  cudaMemcpyToSymbol( xdim4_accel, &xdim4, sizeof(int) );
  cudaMemcpyToSymbol( xdim5_accel, &xdim5, sizeof(int) );
  cudaMemcpyToSymbol( xdim6_accel, &xdim6, sizeof(int) );
  cudaMemcpyToSymbol( dt_device,  &dt, sizeof(double) );

  char *p_a[7];


  //set up initial pointers
  p_a[0] = &args[0].data_d[
  + args[0].dat->size * args[0].dat->block_size[0] * ( range[2] * 1 - args[0].dat->offset[1] )
  + args[0].dat->size * ( range[0] * 1 - args[0].dat->offset[0] ) ];

  p_a[1] = &args[1].data_d[
  + args[1].dat->size * args[1].dat->block_size[0] * ( range[2] * 1 - args[1].dat->offset[1] )
  + args[1].dat->size * ( range[0] * 1 - args[1].dat->offset[0] ) ];

  p_a[2] = &args[2].data_d[
  + args[2].dat->size * args[2].dat->block_size[0] * ( range[2] * 0 - args[2].dat->offset[1] )
  + args[2].dat->size * ( range[0] * 1 - args[2].dat->offset[0] ) ];

  p_a[3] = &args[3].data_d[
  + args[3].dat->size * args[3].dat->block_size[0] * ( range[2] * 1 - args[3].dat->offset[1] )
  + args[3].dat->size * ( range[0] * 0 - args[3].dat->offset[0] ) ];

  p_a[4] = &args[4].data_d[
  + args[4].dat->size * args[4].dat->block_size[0] * ( range[2] * 1 - args[4].dat->offset[1] )
  + args[4].dat->size * ( range[0] * 1 - args[4].dat->offset[0] ) ];

  p_a[5] = &args[5].data_d[
  + args[5].dat->size * args[5].dat->block_size[0] * ( range[2] * 1 - args[5].dat->offset[1] )
  + args[5].dat->size * ( range[0] * 1 - args[5].dat->offset[0] ) ];

  p_a[6] = &args[6].data_d[
  + args[6].dat->size * args[6].dat->block_size[0] * ( range[2] * 1 - args[6].dat->offset[1] )
  + args[6].dat->size * ( range[0] * 1 - args[6].dat->offset[0] ) ];


  ops_halo_exchanges_cuda(args, 7);

  int block_size = 16;
  dim3 grid( (x_size-1)/block_size+ 1, (y_size-1)/block_size + 1, 1);
  dim3 block(16,16,1);

  //call kernel wrapper function, passing in pointers to data
  ops_viscosity_kernel<<<grid, block >>> (  (double *)p_a[0], (double *)p_a[1],
           (double *)p_a[2], (double *)p_a[3],
           (double *)p_a[4], (double *)p_a[5],
           (double *)p_a[6],x_size, y_size);

  cudaDeviceSynchronize();
  ops_set_dirtybit_cuda(args, 7);
  ops_halo_exchanges(args, 7);
}

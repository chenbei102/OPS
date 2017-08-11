//
// auto-generated by ops.py
//
__constant__ int xdim0_initialise_chunk_kernel_volume;
int xdim0_initialise_chunk_kernel_volume_h = -1;
__constant__ int ydim0_initialise_chunk_kernel_volume;
int ydim0_initialise_chunk_kernel_volume_h = -1;
__constant__ int xdim1_initialise_chunk_kernel_volume;
int xdim1_initialise_chunk_kernel_volume_h = -1;
__constant__ int ydim1_initialise_chunk_kernel_volume;
int ydim1_initialise_chunk_kernel_volume_h = -1;
__constant__ int xdim2_initialise_chunk_kernel_volume;
int xdim2_initialise_chunk_kernel_volume_h = -1;
__constant__ int ydim2_initialise_chunk_kernel_volume;
int ydim2_initialise_chunk_kernel_volume_h = -1;
__constant__ int xdim3_initialise_chunk_kernel_volume;
int xdim3_initialise_chunk_kernel_volume_h = -1;
__constant__ int ydim3_initialise_chunk_kernel_volume;
int ydim3_initialise_chunk_kernel_volume_h = -1;
__constant__ int xdim4_initialise_chunk_kernel_volume;
int xdim4_initialise_chunk_kernel_volume_h = -1;
__constant__ int ydim4_initialise_chunk_kernel_volume;
int ydim4_initialise_chunk_kernel_volume_h = -1;
__constant__ int xdim5_initialise_chunk_kernel_volume;
int xdim5_initialise_chunk_kernel_volume_h = -1;
__constant__ int ydim5_initialise_chunk_kernel_volume;
int ydim5_initialise_chunk_kernel_volume_h = -1;
__constant__ int xdim6_initialise_chunk_kernel_volume;
int xdim6_initialise_chunk_kernel_volume_h = -1;
__constant__ int ydim6_initialise_chunk_kernel_volume;
int ydim6_initialise_chunk_kernel_volume_h = -1;

#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3
#undef OPS_ACC4
#undef OPS_ACC5
#undef OPS_ACC6


#define OPS_ACC0(x,y,z) (x+xdim0_initialise_chunk_kernel_volume*(y)+xdim0_initialise_chunk_kernel_volume*ydim0_initialise_chunk_kernel_volume*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_initialise_chunk_kernel_volume*(y)+xdim1_initialise_chunk_kernel_volume*ydim1_initialise_chunk_kernel_volume*(z))
#define OPS_ACC2(x,y,z) (x+xdim2_initialise_chunk_kernel_volume*(y)+xdim2_initialise_chunk_kernel_volume*ydim2_initialise_chunk_kernel_volume*(z))
#define OPS_ACC3(x,y,z) (x+xdim3_initialise_chunk_kernel_volume*(y)+xdim3_initialise_chunk_kernel_volume*ydim3_initialise_chunk_kernel_volume*(z))
#define OPS_ACC4(x,y,z) (x+xdim4_initialise_chunk_kernel_volume*(y)+xdim4_initialise_chunk_kernel_volume*ydim4_initialise_chunk_kernel_volume*(z))
#define OPS_ACC5(x,y,z) (x+xdim5_initialise_chunk_kernel_volume*(y)+xdim5_initialise_chunk_kernel_volume*ydim5_initialise_chunk_kernel_volume*(z))
#define OPS_ACC6(x,y,z) (x+xdim6_initialise_chunk_kernel_volume*(y)+xdim6_initialise_chunk_kernel_volume*ydim6_initialise_chunk_kernel_volume*(z))

//user function
__device__

void initialise_chunk_kernel_volume_gpu(double *volume, const double *celldy, double *xarea,
                                         const double *celldx, double *yarea, const double *celldz, double *zarea) {

  double d_x, d_y, d_z;

  d_x = (grid.xmax - grid.xmin)/(double)grid.x_cells;
  d_y = (grid.ymax - grid.ymin)/(double)grid.y_cells;
  d_z = (grid.zmax - grid.zmin)/(double)grid.z_cells;

  volume[OPS_ACC0(0,0,0)] = d_x*d_y*d_z;
  xarea[OPS_ACC2(0,0,0)] = celldy[OPS_ACC1(0,0,0)]*celldz[OPS_ACC5(0,0,0)];
  yarea[OPS_ACC4(0,0,0)] = celldx[OPS_ACC3(0,0,0)]*celldz[OPS_ACC5(0,0,0)];
  zarea[OPS_ACC6(0,0,0)] = celldx[OPS_ACC3(0,0,0)]*celldy[OPS_ACC1(0,0,0)];
}



#undef OPS_ACC0
#undef OPS_ACC1
#undef OPS_ACC2
#undef OPS_ACC3
#undef OPS_ACC4
#undef OPS_ACC5
#undef OPS_ACC6


__global__ void ops_initialise_chunk_kernel_volume(
double* __restrict arg0,
const double* __restrict arg1,
double* __restrict arg2,
const double* __restrict arg3,
double* __restrict arg4,
const double* __restrict arg5,
double* __restrict arg6,
int size0,
int size1,
int size2 ){


  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1*1 + idx_y * 1*1 * xdim0_initialise_chunk_kernel_volume + idx_z * 1*1 * xdim0_initialise_chunk_kernel_volume * ydim0_initialise_chunk_kernel_volume;
  arg1 += idx_x * 0*1 + idx_y * 1*1 * xdim1_initialise_chunk_kernel_volume + idx_z * 0*1 * xdim1_initialise_chunk_kernel_volume * ydim1_initialise_chunk_kernel_volume;
  arg2 += idx_x * 1*1 + idx_y * 1*1 * xdim2_initialise_chunk_kernel_volume + idx_z * 1*1 * xdim2_initialise_chunk_kernel_volume * ydim2_initialise_chunk_kernel_volume;
  arg3 += idx_x * 1*1 + idx_y * 0*1 * xdim3_initialise_chunk_kernel_volume + idx_z * 0*1 * xdim3_initialise_chunk_kernel_volume * ydim3_initialise_chunk_kernel_volume;
  arg4 += idx_x * 1*1 + idx_y * 1*1 * xdim4_initialise_chunk_kernel_volume + idx_z * 1*1 * xdim4_initialise_chunk_kernel_volume * ydim4_initialise_chunk_kernel_volume;
  arg5 += idx_x * 0*1 + idx_y * 0*1 * xdim5_initialise_chunk_kernel_volume + idx_z * 1*1 * xdim5_initialise_chunk_kernel_volume * ydim5_initialise_chunk_kernel_volume;
  arg6 += idx_x * 1*1 + idx_y * 1*1 * xdim6_initialise_chunk_kernel_volume + idx_z * 1*1 * xdim6_initialise_chunk_kernel_volume * ydim6_initialise_chunk_kernel_volume;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    initialise_chunk_kernel_volume_gpu(arg0, arg1, arg2, arg3,
                   arg4, arg5, arg6);
  }

}

// host stub function
// host stub function
void ops_par_loop_initialise_chunk_kernel_volume_execute(ops_kernel_descriptor *desc) {
  #ifdef OPS_MPI
  ops_block block = desc->block;
  #endif
  int dim = desc->dim;
  int *range = desc->range;
  ops_arg arg0 = desc->args[0];
  ops_arg arg1 = desc->args[1];
  ops_arg arg2 = desc->args[2];
  ops_arg arg3 = desc->args[3];
  ops_arg arg4 = desc->args[4];
  ops_arg arg5 = desc->args[5];
  ops_arg arg6 = desc->args[6];

  //Timing
  double t1,t2,c1,c2;

  ops_arg args[7] = { arg0, arg1, arg2, arg3, arg4, arg5, arg6};


  #ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args,7,range,55)) return;
  #endif

  if (OPS_diags > 1) {
    ops_timing_realloc(55,"initialise_chunk_kernel_volume");
    OPS_kernels[55].count++;
    ops_timers_core(&c1,&t1);
  }

  //compute locally allocated range for the sub-block
  int start[3];
  int end[3];

  for ( int n=0; n<3; n++ ){
    start[n] = range[2*n];end[n] = range[2*n+1];
  }


  int x_size = MAX(0,end[0]-start[0]);
  int y_size = MAX(0,end[1]-start[1]);
  int z_size = MAX(0,end[2]-start[2]);

  int xdim0 = args[0].dat->size[0];
  int ydim0 = args[0].dat->size[1];
  int xdim1 = args[1].dat->size[0];
  int ydim1 = args[1].dat->size[1];
  int xdim2 = args[2].dat->size[0];
  int ydim2 = args[2].dat->size[1];
  int xdim3 = args[3].dat->size[0];
  int ydim3 = args[3].dat->size[1];
  int xdim4 = args[4].dat->size[0];
  int ydim4 = args[4].dat->size[1];
  int xdim5 = args[5].dat->size[0];
  int ydim5 = args[5].dat->size[1];
  int xdim6 = args[6].dat->size[0];
  int ydim6 = args[6].dat->size[1];

  if (xdim0 != xdim0_initialise_chunk_kernel_volume_h || ydim0 != ydim0_initialise_chunk_kernel_volume_h || xdim1 != xdim1_initialise_chunk_kernel_volume_h || ydim1 != ydim1_initialise_chunk_kernel_volume_h || xdim2 != xdim2_initialise_chunk_kernel_volume_h || ydim2 != ydim2_initialise_chunk_kernel_volume_h || xdim3 != xdim3_initialise_chunk_kernel_volume_h || ydim3 != ydim3_initialise_chunk_kernel_volume_h || xdim4 != xdim4_initialise_chunk_kernel_volume_h || ydim4 != ydim4_initialise_chunk_kernel_volume_h || xdim5 != xdim5_initialise_chunk_kernel_volume_h || ydim5 != ydim5_initialise_chunk_kernel_volume_h || xdim6 != xdim6_initialise_chunk_kernel_volume_h || ydim6 != ydim6_initialise_chunk_kernel_volume_h) {
    cudaMemcpyToSymbolAsync( xdim0_initialise_chunk_kernel_volume, &xdim0, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    xdim0_initialise_chunk_kernel_volume_h = xdim0;
    cudaMemcpyToSymbolAsync( ydim0_initialise_chunk_kernel_volume, &ydim0, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    ydim0_initialise_chunk_kernel_volume_h = ydim0;
    cudaMemcpyToSymbolAsync( xdim1_initialise_chunk_kernel_volume, &xdim1, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    xdim1_initialise_chunk_kernel_volume_h = xdim1;
    cudaMemcpyToSymbolAsync( ydim1_initialise_chunk_kernel_volume, &ydim1, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    ydim1_initialise_chunk_kernel_volume_h = ydim1;
    cudaMemcpyToSymbolAsync( xdim2_initialise_chunk_kernel_volume, &xdim2, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    xdim2_initialise_chunk_kernel_volume_h = xdim2;
    cudaMemcpyToSymbolAsync( ydim2_initialise_chunk_kernel_volume, &ydim2, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    ydim2_initialise_chunk_kernel_volume_h = ydim2;
    cudaMemcpyToSymbolAsync( xdim3_initialise_chunk_kernel_volume, &xdim3, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    xdim3_initialise_chunk_kernel_volume_h = xdim3;
    cudaMemcpyToSymbolAsync( ydim3_initialise_chunk_kernel_volume, &ydim3, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    ydim3_initialise_chunk_kernel_volume_h = ydim3;
    cudaMemcpyToSymbolAsync( xdim4_initialise_chunk_kernel_volume, &xdim4, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    xdim4_initialise_chunk_kernel_volume_h = xdim4;
    cudaMemcpyToSymbolAsync( ydim4_initialise_chunk_kernel_volume, &ydim4, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    ydim4_initialise_chunk_kernel_volume_h = ydim4;
    cudaMemcpyToSymbolAsync( xdim5_initialise_chunk_kernel_volume, &xdim5, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    xdim5_initialise_chunk_kernel_volume_h = xdim5;
    cudaMemcpyToSymbolAsync( ydim5_initialise_chunk_kernel_volume, &ydim5, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    ydim5_initialise_chunk_kernel_volume_h = ydim5;
    cudaMemcpyToSymbolAsync( xdim6_initialise_chunk_kernel_volume, &xdim6, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    xdim6_initialise_chunk_kernel_volume_h = xdim6;
    cudaMemcpyToSymbolAsync( ydim6_initialise_chunk_kernel_volume, &ydim6, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    ydim6_initialise_chunk_kernel_volume_h = ydim6;
  }



  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, z_size);
  dim3 tblock(OPS_block_size_x,OPS_block_size_y,1);




  char *p_a[7];
  int dat0 = args[0].dat->elem_size;
  int dat1 = args[1].dat->elem_size;
  int dat2 = args[2].dat->elem_size;
  int dat3 = args[3].dat->elem_size;
  int dat4 = args[4].dat->elem_size;
  int dat5 = args[5].dat->elem_size;
  int dat6 = args[6].dat->elem_size;

  //set up initial pointers
  int base0 = args[0].dat->base_offset;
  base0 += dat0 * (start[0] * args[0].stencil->stride[0]);
  base0 += dat0 *
    args[0].dat->size[0] *
    (start[1] * args[0].stencil->stride[1]);
  base0 += dat0 *
    args[0].dat->size[0] *
    args[0].dat->size[1] *
    (start[2] * args[0].stencil->stride[2]);
  p_a[0] = (char *)args[0].dat->data_d + base0;

  int base1 = args[1].dat->base_offset;
  base1 += dat1 * (start[0] * args[1].stencil->stride[0]);
  base1 += dat1 *
    args[1].dat->size[0] *
    (start[1] * args[1].stencil->stride[1]);
  base1 += dat1 *
    args[1].dat->size[0] *
    args[1].dat->size[1] *
    (start[2] * args[1].stencil->stride[2]);
  p_a[1] = (char *)args[1].dat->data_d + base1;

  int base2 = args[2].dat->base_offset;
  base2 += dat2 * (start[0] * args[2].stencil->stride[0]);
  base2 += dat2 *
    args[2].dat->size[0] *
    (start[1] * args[2].stencil->stride[1]);
  base2 += dat2 *
    args[2].dat->size[0] *
    args[2].dat->size[1] *
    (start[2] * args[2].stencil->stride[2]);
  p_a[2] = (char *)args[2].dat->data_d + base2;

  int base3 = args[3].dat->base_offset;
  base3 += dat3 * (start[0] * args[3].stencil->stride[0]);
  base3 += dat3 *
    args[3].dat->size[0] *
    (start[1] * args[3].stencil->stride[1]);
  base3 += dat3 *
    args[3].dat->size[0] *
    args[3].dat->size[1] *
    (start[2] * args[3].stencil->stride[2]);
  p_a[3] = (char *)args[3].dat->data_d + base3;

  int base4 = args[4].dat->base_offset;
  base4 += dat4 * (start[0] * args[4].stencil->stride[0]);
  base4 += dat4 *
    args[4].dat->size[0] *
    (start[1] * args[4].stencil->stride[1]);
  base4 += dat4 *
    args[4].dat->size[0] *
    args[4].dat->size[1] *
    (start[2] * args[4].stencil->stride[2]);
  p_a[4] = (char *)args[4].dat->data_d + base4;

  int base5 = args[5].dat->base_offset;
  base5 += dat5 * (start[0] * args[5].stencil->stride[0]);
  base5 += dat5 *
    args[5].dat->size[0] *
    (start[1] * args[5].stencil->stride[1]);
  base5 += dat5 *
    args[5].dat->size[0] *
    args[5].dat->size[1] *
    (start[2] * args[5].stencil->stride[2]);
  p_a[5] = (char *)args[5].dat->data_d + base5;

  int base6 = args[6].dat->base_offset;
  base6 += dat6 * (start[0] * args[6].stencil->stride[0]);
  base6 += dat6 *
    args[6].dat->size[0] *
    (start[1] * args[6].stencil->stride[1]);
  base6 += dat6 *
    args[6].dat->size[0] *
    args[6].dat->size[1] *
    (start[2] * args[6].stencil->stride[2]);
  p_a[6] = (char *)args[6].dat->data_d + base6;


  ops_H_D_exchanges_device(args, 7);
  ops_halo_exchanges(args,7,range);

  if (OPS_diags > 1) {
    ops_timers_core(&c2,&t2);
    OPS_kernels[55].mpi_time += t2-t1;
  }


  //call kernel wrapper function, passing in pointers to data
  ops_initialise_chunk_kernel_volume<<<grid, tblock, 0, stream >>> (  (double *)p_a[0], (double *)p_a[1],
           (double *)p_a[2], (double *)p_a[3],
           (double *)p_a[4], (double *)p_a[5],
           (double *)p_a[6],x_size, y_size, z_size);

  if (OPS_diags>1) {
    cutilSafeCall(cudaStreamSynchronize(stream));
    ops_timers_core(&c1,&t1);
    OPS_kernels[55].time += t1-t2;
  }

  ops_set_dirtybit_device(args, 7);
  ops_set_halo_dirtybit3(&args[0],range);
  ops_set_halo_dirtybit3(&args[2],range);
  ops_set_halo_dirtybit3(&args[4],range);
  ops_set_halo_dirtybit3(&args[6],range);

  if (OPS_diags > 1) {
    //Update kernel record
    ops_timers_core(&c2,&t2);
    OPS_kernels[55].mpi_time += t2-t1;
    OPS_kernels[55].transfer += ops_compute_transfer(dim, start, end, &arg0);
    OPS_kernels[55].transfer += ops_compute_transfer(dim, start, end, &arg1);
    OPS_kernels[55].transfer += ops_compute_transfer(dim, start, end, &arg2);
    OPS_kernels[55].transfer += ops_compute_transfer(dim, start, end, &arg3);
    OPS_kernels[55].transfer += ops_compute_transfer(dim, start, end, &arg4);
    OPS_kernels[55].transfer += ops_compute_transfer(dim, start, end, &arg5);
    OPS_kernels[55].transfer += ops_compute_transfer(dim, start, end, &arg6);
  }
}

void ops_par_loop_initialise_chunk_kernel_volume(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3, ops_arg arg4, ops_arg arg5, ops_arg arg6) {
  ops_kernel_descriptor *desc = (ops_kernel_descriptor *)malloc(sizeof(ops_kernel_descriptor));
  desc->name = name;
  desc->block = block;
  desc->dim = dim;
  desc->index = 55;
  desc->hash = 5381;
  desc->hash = ((desc->hash << 5) + desc->hash) + 55;
  for ( int i=0; i<6; i++ ){
    desc->range[i] = range[i];
    desc->orig_range[i] = range[i];
    desc->hash = ((desc->hash << 5) + desc->hash) + range[i];
  }
  desc->nargs = 7;
  desc->args = (ops_arg*)malloc(7*sizeof(ops_arg));
  desc->args[0] = arg0;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg0.dat->index;
  desc->args[1] = arg1;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg1.dat->index;
  desc->args[2] = arg2;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg2.dat->index;
  desc->args[3] = arg3;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg3.dat->index;
  desc->args[4] = arg4;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg4.dat->index;
  desc->args[5] = arg5;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg5.dat->index;
  desc->args[6] = arg6;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg6.dat->index;
  desc->function = ops_par_loop_initialise_chunk_kernel_volume_execute;
  if (OPS_diags > 1) {
    ops_timing_realloc(55,"initialise_chunk_kernel_volume");
  }
  ops_enqueue_kernel(desc);
}

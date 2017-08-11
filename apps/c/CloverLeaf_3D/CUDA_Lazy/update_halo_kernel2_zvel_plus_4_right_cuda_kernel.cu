//
// auto-generated by ops.py
//
__constant__ int xdim0_update_halo_kernel2_zvel_plus_4_right;
int xdim0_update_halo_kernel2_zvel_plus_4_right_h = -1;
__constant__ int ydim0_update_halo_kernel2_zvel_plus_4_right;
int ydim0_update_halo_kernel2_zvel_plus_4_right_h = -1;
__constant__ int xdim1_update_halo_kernel2_zvel_plus_4_right;
int xdim1_update_halo_kernel2_zvel_plus_4_right_h = -1;
__constant__ int ydim1_update_halo_kernel2_zvel_plus_4_right;
int ydim1_update_halo_kernel2_zvel_plus_4_right_h = -1;

#undef OPS_ACC0
#undef OPS_ACC1


#define OPS_ACC0(x,y,z) (x+xdim0_update_halo_kernel2_zvel_plus_4_right*(y)+xdim0_update_halo_kernel2_zvel_plus_4_right*ydim0_update_halo_kernel2_zvel_plus_4_right*(z))
#define OPS_ACC1(x,y,z) (x+xdim1_update_halo_kernel2_zvel_plus_4_right*(y)+xdim1_update_halo_kernel2_zvel_plus_4_right*ydim1_update_halo_kernel2_zvel_plus_4_right*(z))

//user function
__device__

inline void update_halo_kernel2_zvel_plus_4_right_gpu(double *zvel0, double *zvel1, const int* fields)
{
  if((*fields) & FIELD_ZVEL0) zvel0[OPS_ACC0(0,0,0)] = zvel0[OPS_ACC0(-4,0,0)];
  if((*fields) & FIELD_ZVEL1) zvel1[OPS_ACC1(0,0,0)] = zvel1[OPS_ACC1(-4,0,0)];
}



#undef OPS_ACC0
#undef OPS_ACC1


__global__ void ops_update_halo_kernel2_zvel_plus_4_right(
double* __restrict arg0,
double* __restrict arg1,
const int arg2,
int size0,
int size1,
int size2 ){


  int idx_z = blockDim.z * blockIdx.z + threadIdx.z;
  int idx_y = blockDim.y * blockIdx.y + threadIdx.y;
  int idx_x = blockDim.x * blockIdx.x + threadIdx.x;

  arg0 += idx_x * 1*1 + idx_y * 1*1 * xdim0_update_halo_kernel2_zvel_plus_4_right + idx_z * 1*1 * xdim0_update_halo_kernel2_zvel_plus_4_right * ydim0_update_halo_kernel2_zvel_plus_4_right;
  arg1 += idx_x * 1*1 + idx_y * 1*1 * xdim1_update_halo_kernel2_zvel_plus_4_right + idx_z * 1*1 * xdim1_update_halo_kernel2_zvel_plus_4_right * ydim1_update_halo_kernel2_zvel_plus_4_right;

  if (idx_x < size0 && idx_y < size1 && idx_z < size2) {
    update_halo_kernel2_zvel_plus_4_right_gpu(arg0, arg1, &arg2);
  }

}

// host stub function
// host stub function
void ops_par_loop_update_halo_kernel2_zvel_plus_4_right_execute(ops_kernel_descriptor *desc) {
  #ifdef OPS_MPI
  ops_block block = desc->block;
  #endif
  int dim = desc->dim;
  int *range = desc->range;
  ops_arg arg0 = desc->args[0];
  ops_arg arg1 = desc->args[1];
  ops_arg arg2 = desc->args[2];

  //Timing
  double t1,t2,c1,c2;

  ops_arg args[3] = { arg0, arg1, arg2};


  #ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args,3,range,99)) return;
  #endif

  if (OPS_diags > 1) {
    ops_timing_realloc(99,"update_halo_kernel2_zvel_plus_4_right");
    OPS_kernels[99].count++;
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

  if (xdim0 != xdim0_update_halo_kernel2_zvel_plus_4_right_h || ydim0 != ydim0_update_halo_kernel2_zvel_plus_4_right_h || xdim1 != xdim1_update_halo_kernel2_zvel_plus_4_right_h || ydim1 != ydim1_update_halo_kernel2_zvel_plus_4_right_h) {
    cudaMemcpyToSymbolAsync( xdim0_update_halo_kernel2_zvel_plus_4_right, &xdim0, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    xdim0_update_halo_kernel2_zvel_plus_4_right_h = xdim0;
    cudaMemcpyToSymbolAsync( ydim0_update_halo_kernel2_zvel_plus_4_right, &ydim0, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    ydim0_update_halo_kernel2_zvel_plus_4_right_h = ydim0;
    cudaMemcpyToSymbolAsync( xdim1_update_halo_kernel2_zvel_plus_4_right, &xdim1, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    xdim1_update_halo_kernel2_zvel_plus_4_right_h = xdim1;
    cudaMemcpyToSymbolAsync( ydim1_update_halo_kernel2_zvel_plus_4_right, &ydim1, sizeof(int),0,cudaMemcpyHostToDevice,stream );
    ydim1_update_halo_kernel2_zvel_plus_4_right_h = ydim1;
  }



  dim3 grid( (x_size-1)/OPS_block_size_x+ 1, (y_size-1)/OPS_block_size_y + 1, z_size);
  dim3 tblock(OPS_block_size_x,OPS_block_size_y,1);




  char *p_a[3];
  int dat0 = args[0].dat->elem_size;
  int dat1 = args[1].dat->elem_size;

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


  ops_H_D_exchanges_device(args, 3);
  ops_halo_exchanges(args,3,range);

  if (OPS_diags > 1) {
    ops_timers_core(&c2,&t2);
    OPS_kernels[99].mpi_time += t2-t1;
  }


  //call kernel wrapper function, passing in pointers to data
  ops_update_halo_kernel2_zvel_plus_4_right<<<grid, tblock, 0, stream >>> (  (double *)p_a[0], (double *)p_a[1],
           *(int *)arg2.data,x_size, y_size, z_size);

  if (OPS_diags>1) {
    cutilSafeCall(cudaStreamSynchronize(stream));
    ops_timers_core(&c1,&t1);
    OPS_kernels[99].time += t1-t2;
  }

  ops_set_dirtybit_device(args, 3);
  ops_set_halo_dirtybit3(&args[0],range);
  ops_set_halo_dirtybit3(&args[1],range);

  if (OPS_diags > 1) {
    //Update kernel record
    ops_timers_core(&c2,&t2);
    OPS_kernels[99].mpi_time += t2-t1;
    OPS_kernels[99].transfer += ops_compute_transfer(dim, start, end, &arg0);
    OPS_kernels[99].transfer += ops_compute_transfer(dim, start, end, &arg1);
  }
}

void ops_par_loop_update_halo_kernel2_zvel_plus_4_right(char const *name, ops_block block, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2) {
  ops_kernel_descriptor *desc = (ops_kernel_descriptor *)malloc(sizeof(ops_kernel_descriptor));
  desc->name = name;
  desc->block = block;
  desc->dim = dim;
  desc->index = 99;
  desc->hash = 5381;
  desc->hash = ((desc->hash << 5) + desc->hash) + 99;
  for ( int i=0; i<6; i++ ){
    desc->range[i] = range[i];
    desc->orig_range[i] = range[i];
    desc->hash = ((desc->hash << 5) + desc->hash) + range[i];
  }
  desc->nargs = 3;
  desc->args = (ops_arg*)malloc(3*sizeof(ops_arg));
  desc->args[0] = arg0;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg0.dat->index;
  desc->args[1] = arg1;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg1.dat->index;
  desc->args[2] = arg2;
  char *tmp = (char*)malloc(1*sizeof(int));
  memcpy(tmp, arg2.data,1*sizeof(int));
  desc->args[2].data = tmp;
  desc->function = ops_par_loop_update_halo_kernel2_zvel_plus_4_right_execute;
  if (OPS_diags > 1) {
    ops_timing_realloc(99,"update_halo_kernel2_zvel_plus_4_right");
  }
  ops_enqueue_kernel(desc);
}

//
// auto-generated by ops.py
//
#define OPS_ACC0(x, y, z)                                                      \
  (n_x * 1 + n_y * xdim0_update_halo_kernel2_zvel_plus_2_left * 1 +            \
   n_z * xdim0_update_halo_kernel2_zvel_plus_2_left *                          \
       ydim0_update_halo_kernel2_zvel_plus_2_left * 1 +                        \
   x + xdim0_update_halo_kernel2_zvel_plus_2_left * (y) +                      \
   xdim0_update_halo_kernel2_zvel_plus_2_left *                                \
       ydim0_update_halo_kernel2_zvel_plus_2_left * (z))
#define OPS_ACC1(x, y, z)                                                      \
  (n_x * 1 + n_y * xdim1_update_halo_kernel2_zvel_plus_2_left * 1 +            \
   n_z * xdim1_update_halo_kernel2_zvel_plus_2_left *                          \
       ydim1_update_halo_kernel2_zvel_plus_2_left * 1 +                        \
   x + xdim1_update_halo_kernel2_zvel_plus_2_left * (y) +                      \
   xdim1_update_halo_kernel2_zvel_plus_2_left *                                \
       ydim1_update_halo_kernel2_zvel_plus_2_left * (z))

// user function

// host stub function
void ops_par_loop_update_halo_kernel2_zvel_plus_2_left_execute(
    ops_kernel_descriptor *desc) {
  ops_block block = desc->block;
  int dim = desc->dim;
  int *range = desc->range;
  ops_arg arg0 = desc->args[0];
  ops_arg arg1 = desc->args[1];
  ops_arg arg2 = desc->args[2];

  // Timing
  double t1, t2, c1, c2;

  ops_arg args[3] = {arg0, arg1, arg2};

#ifdef CHECKPOINTING
  if (!ops_checkpointing_before(args, 3, range, 98))
    return;
#endif

  if (OPS_diags > 1) {
    OPS_kernels[98].count++;
    ops_timers_core(&c2, &t2);
  }

  // compute locally allocated range for the sub-block
  int start[3];
  int end[3];

  for (int n = 0; n < 3; n++) {
    start[n] = range[2 * n];
    end[n] = range[2 * n + 1];
  }

#ifdef OPS_DEBUG
  ops_register_args(args, "update_halo_kernel2_zvel_plus_2_left");
#endif

  // set up initial pointers and exchange halos if necessary
  int base0 = args[0].dat->base_offset;
  double *__restrict__ zvel0 = (double *)(args[0].data + base0);

  int base1 = args[1].dat->base_offset;
  double *__restrict__ zvel1 = (double *)(args[1].data + base1);

  const int *__restrict__ fields = (int *)args[2].data;

  // initialize global variable with the dimension of dats
  int xdim0_update_halo_kernel2_zvel_plus_2_left = args[0].dat->size[0];
  int ydim0_update_halo_kernel2_zvel_plus_2_left = args[0].dat->size[1];
  int xdim1_update_halo_kernel2_zvel_plus_2_left = args[1].dat->size[0];
  int ydim1_update_halo_kernel2_zvel_plus_2_left = args[1].dat->size[1];

  if (OPS_diags > 1) {
    ops_timers_core(&c1, &t1);
    OPS_kernels[98].mpi_time += t1 - t2;
  }

#pragma omp parallel for collapse(2)
  for (int n_z = start[2]; n_z < end[2]; n_z++) {
    for (int n_y = start[1]; n_y < end[1]; n_y++) {
#ifdef intel
#pragma loop_count(10000)
#pragma omp simd aligned(zvel0, zvel1)
#else
#pragma simd
#endif
      for (int n_x = start[0]; n_x < end[0]; n_x++) {

        if ((*fields) & FIELD_ZVEL0)
          zvel0[OPS_ACC0(0, 0, 0)] = zvel0[OPS_ACC0(2, 0, 0)];
        if ((*fields) & FIELD_ZVEL1)
          zvel1[OPS_ACC1(0, 0, 0)] = zvel1[OPS_ACC1(2, 0, 0)];
      }
    }
  }
  if (OPS_diags > 1) {
    ops_timers_core(&c2, &t2);
    OPS_kernels[98].time += t2 - t1;
  }

  if (OPS_diags > 1) {
    // Update kernel record
    ops_timers_core(&c1, &t1);
    OPS_kernels[98].mpi_time += t1 - t2;
    OPS_kernels[98].transfer += ops_compute_transfer(dim, start, end, &arg0);
    OPS_kernels[98].transfer += ops_compute_transfer(dim, start, end, &arg1);
  }
}
#undef OPS_ACC0
#undef OPS_ACC1

void ops_par_loop_update_halo_kernel2_zvel_plus_2_left(char const *name,
                                                       ops_block block, int dim,
                                                       int *range, ops_arg arg0,
                                                       ops_arg arg1,
                                                       ops_arg arg2) {
  ops_kernel_descriptor *desc =
      (ops_kernel_descriptor *)malloc(sizeof(ops_kernel_descriptor));
  desc->name = name;
  desc->block = block;
  desc->dim = dim;
  desc->index = 98;
  desc->hash = 5381;
  desc->hash = ((desc->hash << 5) + desc->hash) + 98;
  for (int i = 0; i < 6; i++) {
    desc->range[i] = range[i];
    desc->orig_range[i] = range[i];
    desc->hash = ((desc->hash << 5) + desc->hash) + range[i];
  }
  desc->nargs = 3;
  desc->args = (ops_arg *)malloc(3 * sizeof(ops_arg));
  desc->args[0] = arg0;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg0.dat->index;
  desc->args[1] = arg1;
  desc->hash = ((desc->hash << 5) + desc->hash) + arg1.dat->index;
  desc->args[2] = arg2;
  char *tmp = (char *)malloc(1 * sizeof(int));
  memcpy(tmp, arg2.data, 1 * sizeof(int));
  desc->args[2].data = tmp;
  desc->function = ops_par_loop_update_halo_kernel2_zvel_plus_2_left_execute;
  if (OPS_diags > 1) {
    ops_timing_realloc(98, "update_halo_kernel2_zvel_plus_2_left");
  }
  ops_enqueue_kernel(desc);
}

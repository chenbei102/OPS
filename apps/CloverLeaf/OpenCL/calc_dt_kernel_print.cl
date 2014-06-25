//
// auto-generated by ops.py on 2014-06-25 15:24
//


#pragma OPENCL EXTENSION cl_khr_fp64:enable

#include "user_types.h"
#include "ops_opencl_reduction.h"

#ifndef MIN
#define MIN(a,b) ((a<b) ? (a) : (b))
#endif
#ifndef MAX
#define MAX(a,b) ((a>b) ? (a) : (b))
#endif
#ifndef SIGN
#define SIGN(a,b) ((b<0.0) ? (a*(-1)) : (a))
#endif
#define OPS_READ 0
#define OPS_WRITE 1
#define OPS_RW 2
#define OPS_INC 3
#define OPS_MIN 4
#define OPS_MAX 5
#define ZERO_double 0.0;
#define INFINITY_double INFINITY;
#define ZERO_float 0.0f;
#define INFINITY_float INFINITY;
#define ZERO_int 0;
#define INFINITY_int INFINITY;
#define ZERO_uint 0;
#define INFINITY_uint INFINITY;
#define ZERO_ll 0;
#define INFINITY_ll INFINITY;
#define ZERO_ull 0;
#define INFINITY_ull INFINITY;
#define ZERO_bool 0;
#define OPS_ACC0(x,y) (x+xdim0_calc_dt_kernel_print*(y))
#define OPS_ACC1(x,y) (x+xdim1_calc_dt_kernel_print*(y))
#define OPS_ACC2(x,y) (x+xdim2_calc_dt_kernel_print*(y))
#define OPS_ACC3(x,y) (x+xdim3_calc_dt_kernel_print*(y))
#define OPS_ACC4(x,y) (x+xdim4_calc_dt_kernel_print*(y))
#define OPS_ACC5(x,y) (x+xdim5_calc_dt_kernel_print*(y))


//user function
void calc_dt_kernel_print(const __global double * restrict xvel0, const __global double * restrict yvel0, const __global double * restrict density0, 
const __global double * restrict energy0, const __global double * restrict pressure, const __global double * restrict soundspeed,  double * restrict output)

  {
  output[0] = xvel0[OPS_ACC0(1,0)];
  output[1] = yvel0[OPS_ACC1(1,0)];
  output[2] = xvel0[OPS_ACC0(-1,0)];
  output[3] = yvel0[OPS_ACC1(-1,0)];
  output[4] = xvel0[OPS_ACC0(0,1)];
  output[5] = yvel0[OPS_ACC1(0,1)];
  output[6] = xvel0[OPS_ACC0(0,-1)];
  output[7] = yvel0[OPS_ACC1(0,-1)];
  output[8] = density0[OPS_ACC2(0,0)];
  output[9] = energy0[OPS_ACC3(0,0)];
  output[10]= pressure[OPS_ACC4(0,0)];
  output[11]= soundspeed[OPS_ACC5(0,0)];

}



 #undef OPS_ACC0
 #undef OPS_ACC1
 #undef OPS_ACC2
 #undef OPS_ACC3
 #undef OPS_ACC4
 #undef OPS_ACC5


 __kernel void ops_calc_dt_kernel_print(
 __global const double* restrict arg0,
 __global const double* restrict arg1,
 __global const double* restrict arg2,
 __global const double* restrict arg3,
 __global const double* restrict arg4,
 __global const double* restrict arg5,
 __global double* restrict arg6,
 __local double* scratch6,
 int r_bytes6,
 const int base0,
 const int base1,
 const int base2,
 const int base3,
 const int base4,
 const int base5,
 const int size0,
 const int size1 ){

   arg6 += r_bytes6;
   double arg6_l[12];
   for (int d=0; d<12; d++) arg6_l[d] = ZERO_double;

   int idx_y = get_global_id(1);
   int idx_x = get_global_id(0);

   if (idx_x < size0 && idx_y < size1) {
     calc_dt_kernel_print(&arg0[base0 + idx_x * 1 + idx_y * 1 * xdim0_calc_dt_kernel_print],
                    &arg1[base1 + idx_x * 1 + idx_y * 1 * xdim1_calc_dt_kernel_print],
                    &arg2[base2 + idx_x * 1 + idx_y * 1 * xdim2_calc_dt_kernel_print],
                    &arg3[base3 + idx_x * 1 + idx_y * 1 * xdim3_calc_dt_kernel_print],
                    &arg4[base4 + idx_x * 1 + idx_y * 1 * xdim4_calc_dt_kernel_print],
                    &arg5[base5 + idx_x * 1 + idx_y * 1 * xdim5_calc_dt_kernel_print],
                    arg6_l);
   }
   reduce_double(arg6_l[0], scratch6, arg6, OPS_INC);

 }

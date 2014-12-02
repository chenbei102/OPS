//
// auto-generated by ops.py
//
#include "./OpenACC/shsgc_common.h"

#define OPS_GPU

int xdim0_tvd_kernel;
int xdim1_tvd_kernel;


#define OPS_ACC_MD0(d,x) ((x)*3+(d))
#define OPS_ACC_MD1(d,x) ((x)*3+(d))
//user function
inline 
void tvd_kernel(const double *tht, double* ep2) {
    double maxim;
		for (int m=0; m < 3 ;m++) {
			if (tht[OPS_ACC_MD1(m,0)] > tht[OPS_ACC_MD1(m,1)])
				maxim = tht[OPS_ACC_MD1(m,0)];
			else
				maxim = tht[OPS_ACC_MD1(m,1)];
			ep2[OPS_ACC_MD1(m,0)] = akap2 * maxim;
		}
}



#undef OPS_ACC_MD0
#undef OPS_ACC_MD1


void tvd_kernel_c_wrapper(
  double *p_a0,
  double *p_a1,
  int x_size) {
  #ifdef OPS_GPU
  #pragma acc parallel deviceptr(p_a0,p_a1)
  #pragma acc loop
  #endif
  for ( int n_x=0; n_x<x_size; n_x++ ){
    tvd_kernel(  p_a0 + n_x*1*3,
           p_a1 + n_x*1*3 );

  }
}

//
// auto-generated by ops.py on 2013-10-21 16:57
//

#include "lib.h"
#ifdef _OPENMP
#include <omp.h>
#endif
//user function
#include "advec_mom_kernel.h"

// host stub function
void ops_par_loop_advec_mom_kernel1_y(char const *name, int dim, int* range,
 ops_arg arg0, ops_arg arg1, ops_arg arg2, ops_arg arg3,
 ops_arg arg4, ops_arg arg5) {

  ops_arg args[6] = { arg0, arg1, arg2, arg3, arg4, arg5};

  int  offs[6][2];

  for ( int i=0; i<6; i++ ){
    if (args[i].stencil!=NULL) {
      offs[i][0] = 1;  //unit step in x dimension
      offs[i][1] = ops_offs_set(range[0],range[2]+1, args[i]) - ops_offs_set(range[1],range[2], args[i]);
      //stride in y as x stride is 0
      if (args[i].stencil->stride[0] == 0) {
        offs[i][0] = 0;
        offs[i][1] = args[i].dat->block_size[0];
      }
      //stride in x as y stride is 0
      else if (args[i].stencil->stride[1] == 0) {
        offs[i][0] = 1;
        offs[i][1] = -( range[1] - range[0] );
      }
    }
  }

  #ifdef _OPENMP
  int nthreads = omp_get_max_threads( );
  #else
  int nthreads = 1;
  #endif


  int y_size = range[3]-range[2];
  #pragma omp parallel for
  for ( int thr=0; thr<nthreads; thr++ ){

    char **p_a[6];

    //store index of non_gbl args
    int non_gbl[6] = {0, 0, 0, 0, 0, 0};

    int g = 0;
    for ( int i=0; i<6; i++ ){
      if (args[i].argtype == OPS_ARG_DAT) {
        p_a[i] = (char **)malloc(args[i].stencil->points * sizeof(char *));
        non_gbl[g++] = i;
      }
      else if (args[i].argtype == OPS_ARG_GBL) {
        p_a[i] = (char **)malloc(args[i].dim * sizeof(char *));
      }
    }

    int start = range[2] + ((y_size-1)/nthreads+1)*thr;
    int finish = range[2] +  MIN(((y_size-1)/nthreads+1)*(thr+1),y_size);

    //set up initial pointers
    ops_args_set(range[0], start, 6, args,p_a); //set up the initial possition

    for ( int n_y=start; n_y<finish; n_y++ ){
      for ( int n_x=range[0]; n_x<range[1]; n_x++ ){
        //call kernel function, passing in pointers to data

        advec_mom_kernel1_y(  (double **)p_a[0], (double **)p_a[1],
           (double **)p_a[2], (double **)p_a[3],
           (double **)p_a[4], (double **)p_a[5] );

        int a = 0;
        //shift pointers to data x direction
        for ( int i=0; i<g; i++ ){
          a = non_gbl[i];
          for ( int np=0; np<args[a].stencil->points; np++ ){
            p_a[a][np] = p_a[a][np] + (args[a].dat->size * offs[a][0]);
          }
        }
      }

      int a = 0;
      //shift pointers to data y direction
      for ( int i=0; i<g; i++ ){
        a = non_gbl[i];
        for ( int np=0; np<args[a].stencil->points; np++ ){
          p_a[a][np] = p_a[a][np] + (args[a].dat->size * offs[a][1]);
        }
      }
    }

    for ( int i=0; i<6; i++ ){
      free(p_a[i]);
    }
  }
}

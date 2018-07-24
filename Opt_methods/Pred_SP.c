//#include "Opt_cordic-32bits.h"
#include <math.h> // for testing only!
#include <stdio.h>
#include <time.h>

#define cordic_1K 0x000026DD
#define half_pi 0x00006487
#define MUL 16384.000000
#define CORDIC_NTAB 16
#include <stdint.h>


//Cordic in 16 bit signed fixed point math

//Constants

int cordic_ctab [] = {0x00003243, 0x00001DAC, 0x00000FAD, 0x000007F5, 0x000003FE, 0x000001FF, 0x000000FF, 0x0000007F, 0x0000003F, 0x0000001F, 0x0000000F, 0x00000007, 0x00000003, 0x00000001, 0x00000000, 0x00000000, };

int cordic(int theta,int n)
{
  register int k, d, tx, ty, tz,z_temp;
  int32_t xy = 0;
  int x=cordic_1K,y=0,z=theta;
  int cordic_temp = cordic_ctab[0];
  n = (n>CORDIC_NTAB) ? CORDIC_NTAB : n;
  d = z>>15;
  for (k=0; k<n; ++k)
  {
    
    //get sign. for other architectures, you might want to use the more portable version
    //d = z>=0 ? 0 : -1;
    z_temp = z - ((cordic_temp ^ d) - d);
    cordic_temp = cordic_ctab[k+1];
    tx = x - (((y>>k) ^ d) - d);
    ty = y + (((x>>k) ^ d) - d);
    tz = z_temp;
    x = tx; y = ty; z = tz;
    d = z>>15;
    
/*      if(z>=0){
	tx = x-(y>>k);
	ty = y+(x>>k);
	tz = z-cordic_ctab[k];
	x = tx; y = ty; z = tz;
      }
      else{
	tx = tx = x - (((y>>k) ^ (-1)) +1);
	ty = y + (((x>>k) ^ (-1)) +1);
	tz = z - ((cordic_ctab[k] ^ (-1)) +1);
	x = tx; y = ty; z = tz;
      }   */
    }
    
    z_temp = z - ((cordic_temp ^ d) - d);
    tx = x - (((y>>k) ^ d) - d);
    ty = y + (((x>>k) ^ d) - d);
    tz = z_temp;
    x = tx; y = ty; z = tz;
    
  xy = (xy | x)<<16;
  xy = xy | y;
  return xy;
 // printf("x is %d, y is%d, xy is %d\n", x, y, xy);
 //*c = x; *s = y;
}




//Print out sin(x) vs fp CORDIC sin(x)
int main(int argc, char **argv)
{
    

    clock_t begin = clock();
    //volatile double p;  //Comment this line because of using local variable
    
    int16_t c,s;
    register  int i ;
    int32_t xy = 0;
    double invi = 0.0000002;
    double invpi = M_PI/2;
    for(i=0;i<5000000;i+=2)
    {
      
	register double p_temp;
        p_temp = i*invi*invpi;        
        //use 32 iterations
        xy = cordic((p_temp*MUL),16);
	s = xy & 0x0000FFFF;
	c = xy>>16;
        //these values should be nearly equal
        printf("%f : %f\n", s/MUL, sin(p_temp));
	
	p_temp = (i+1)*invi*invpi;         // Loop unrolling
        xy = cordic((p_temp*MUL),16);
	s = xy & 0x0000FFFF;
	c = xy>>16;
        printf("%f : %f\n", s/MUL, sin(p_temp)); 

    }
    
    clock_t end = clock();		//Print the time needed
    double time = (double)(end - begin);
    printf("we need %f to complete.",time);
}


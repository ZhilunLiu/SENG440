# SENG440
Embedded system


This project is to Optimize the Coridc Calculator

Contributors: Zhilun Liu, Linfeng Xu

To compile in arm:
  arm-linux-gcc -static -o file.exe file.c -lm
TO run in arm: 
  qemu-arm file.exe
To see the assembly code in arm:
  /opt/arm/4.3.2/bin/arm-linux-gcc -mfloat-abi=softfp -mfpu=neon -static -O3 -S file.c -lm
  
Notes: Optimized codes are in the Opt_methods folder.

cordic-test.c is the original code
and all the optimization methods we used are in the Opt_methods folder

SP : softeware pipelining
Local_V : Local variable
Loop_U: Loop unrolling
Pred: Predicate opreation
Pred_Sp: Predicate with Software piplining 

For more details of optimization datas, please read the report of the project



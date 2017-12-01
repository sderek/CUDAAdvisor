#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <cuda.h>
#include <cuda_runtime.h>

//extern __device__ int testxyz[1000];
//int localtrace[10000];
//__device__ float* tracehandle;

__device__ float foo_CC(float a)
{
	return a*0.9;
}

__device__ int foo_DD(float a)
{
        if (threadIdx.x < 2 || threadIdx.y > 2)
                return (int) a;
        else
                return a+2;
}

__device__ float foo_BB(float a)
{
	if (threadIdx.x > 3 || threadIdx.y > 11)
		return a + foo_CC(a);
	else 
		return a + (float)foo_DD(a) /2;
}

__device__ float foo_AA( float a, float b)
{
        if (threadIdx.x < 8  || threadIdx.y > 4)
                return a*3.1415+1;
        else
                return (b*a)*0.5 + foo_BB(b);
}


__global__ void axpy_kernel2(float a, float* x, float* y)
{
	//tracehandle = newbu;
	int blockId = blockIdx.x + blockIdx.y * gridDim.x;
	int threadId = blockId * (blockDim.x * blockDim.y) + (threadIdx.y * blockDim.x) + threadIdx.x;
	int index = threadId;

	float aa = y[index] + x[index] + 1.1;
	float b = 0.5*y[index] + 0.25* x[index] + 1.0;
	y[index] += ( x[index]*1.67 +  foo_AA(aa, b) );
//	y[index] += ( x[index]*1.67 +  aa + b );
}

__global__ void axpy_kernel1(float a, float* x, float* y) 
{
        int blockId = blockIdx.x + blockIdx.y * gridDim.x;
	int threadId = blockId * (blockDim.x * blockDim.y) + (threadIdx.y * blockDim.x) + threadIdx.x;
	int index = threadId;

	y[index] = x[index]*0.3;
	
	if (index>2)
		y[index] += 99;
	else
		y[index] += 999 + foo_CC(a);

}

int main(int argc, char* argv[]) 
{
  	//const int kDataLen2 = 128;
	float a = 2.0f;
	//int blocks2 = 600; 
	cudaSetDevice(0);

        if (argc != 5)
	{
		printf("usage: ./axpy [blocks_x] [blocks_y] [threads_x] [threads_y]\n");
		exit(1);
	}

	int blocksx = atoi(argv[1]) ;
	int blocksy = atoi(argv[2]) ;
	int kDataLenx = atoi(argv[3]);
	int kDataLeny = atoi(argv[4]);

	int sizen = blocksx *blocksy *kDataLenx *kDataLeny;
//	cudaThreadSetLimit(cudaLimitMallocHeapSize, 1024*1024); //sderek
	cudaDeviceSetLimit(cudaLimitMallocHeapSize, 1024*1024*500); //sderek

//	tracetest = (int*)malloc( 1234);

//	float host_y[blocks*kDataLen];
//	float host_y[blocks*kDataLen];
	float* host_x = (float*) malloc( sizen* sizeof(float));
	float* host_y = (float*) malloc( sizen* sizeof(float));
	void* host_newbu = (void*) malloc( 1000 );

	int ii;
	for( ii=0; ii<sizen; ii++)
		host_x[ii] = ii%8;
 	for( ii=0; ii<sizen; ii++)
                host_y[ii] = ii%5;
/*	int x[5];
	x[0] = 13;
	printf("%p\n",x);
	printf("%p\n",&x);
	printf("%d\n",*x);
	printf("%d\n",*(x+1));
*/

  // Copy input data to device.
  float* device_x;
  float* device_y;
//	void* newbu;

//	printf(" %p\n", device_x);
  cudaMalloc((void**)&device_x, sizen * sizeof(float));
//	printf(" %p\n", device_x);
//	printf(" %p\n", device_y);
  cudaMalloc((void**)&device_y, sizen * sizeof(float) + 18);
//	printf(" %p\n", device_y);

//	printf(" %p\n", newbu);
//	cudaMalloc(&newbu, 1000);
//	printf(" %p\n", newbu);
	
/*	std::cout << &(device_x) << "\n";
        std::cout << &(device_y) << "\n";
	std::cout << &(*device_x) << "\n";
        std::cout << &(*device_y) << "\n";
	std::cout << (device_x) << "\n";
        std::cout << (device_y) << "\n";
*/
	cudaMemcpy(device_x, host_x, sizen * sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(device_y, host_y, sizen * sizeof(float), cudaMemcpyHostToDevice);

	dim3 CTAs(blocksx, blocksy);
	dim3 Threads(kDataLenx, kDataLeny);
	std::cout << "launching kernel...\n";
	axpy_kernel1<<<CTAs, Threads>>>(a, device_x, device_y);
	cudaDeviceSynchronize();

	axpy_kernel2<<<CTAs, Threads>>>(a, device_x, device_y);
	cudaDeviceSynchronize();
	cudaMemcpy(host_y, device_y, sizen* sizeof(float), cudaMemcpyDeviceToHost);

//	cudaMemcpy(host_newbu, newbu, 1000, cudaMemcpyDeviceToHost);

	free(host_newbu);
//	cudaFree(newbu);

	int verify = 0;
  	for (int ii = 0; ii < 8; ii++)
    		std::cout << "y[" << ii << "] = " << host_y[ii] << "\n";
		
  	for (int ii = 0; ii < sizen; ii++) {
                if( host_y[ii] == ii%5)
			verify ++;
//    		std::cout << "y[" << i << "] = " << host_y[i] << "\n";
  	}
	std::cout << "\n\n[TOOL verify] There are a total of\t" << verify << " incorrect numbers." << std::endl;
	if (verify==0)
		std::cout << "[TOOL verify] passed!" << std::endl << std::endl;
		
		

//	for (int i = 0; i < 20; ++i) {
//                std::cout << "newtrace [" << i << "] = " << host_newbu[i] << "\n";
//    std::cout << & (host_y[i] )<< "\n";
//        }

/*        cudaMemcpyFromSymbol(localtrace, testxyz, 40*sizeof(int), 0, cudaMemcpyDeviceToHost);
        for (int i = 0; i < 20; ++i)
                printf("%d\t", localtrace[i] );
        std::cout << std::endl;

	cudaMemcpyFromSymbol(localtrace+8, testxyz, 40*sizeof(int), 0, cudaMemcpyDeviceToHost);
	for (int i = 0; i < 20; ++i)
		printf("%d\t", localtrace[i] );
	std::cout << std::endl;
*/
//	int* show_h;
//	cudaMemcpyFromSymbol(show_h, show, sizeof(int), 0, cudaMemcpyDeviceToHost);
//	msg = cudaGetSymbolAddress((void **)&d_G, test);
//		printf("the address is %p\n", d_G);
//	if (msg == cudaSuccess)
//	{
	//	int tmp[4];
	//	printf("before %d %d %d %d@ %p\n", *tmp,  *(tmp+1), *(tmp+2), *(tmp+3), tmp);
	//	cudaMemcpyFromSymbol(tracetest, test1, 4*sizeof(int), 0, cudaMemcpyDeviceToHost);
	//	cudaMemcpyFromSymbol(tmp, test2, 4*sizeof(int), 0, cudaMemcpyDeviceToHost);
	//	printf("copy %d %d %d %d@ %p\n",  *tmp, *(tmp+1), *(tmp+2), *(tmp+3), tmp);
	//	cudaMemcpyFromSymbol(tmp, test2, 4*sizeof(int), 0, cudaMemcpyDeviceToHost);
	//	printf("after %d %d %d %d@ %p\n",  tmp[0], tmp[1], tmp[2], tmp[3], tmp);
//	}
	//else
	//	std::cout << cudaGetErrorString(msg)  <<  "\n\n";

	cudaFree(device_x);
	cudaFree(device_y);
  	cudaDeviceReset();
  	return 0;
}

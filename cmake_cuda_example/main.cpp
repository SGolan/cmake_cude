#include <iostream>
#include "libcuda.h"

using std::cout;
using std::endl;

constexpr int C_DATA_SIZE = 1000000;


int main()
{
    // allocate and initialize a vector
    float *v = new float [C_DATA_SIZE];
    for(int i=0; i<1e6; i++)
        v[i] = i;

    // invoke cuda kernel for in-place element-wise scalar add 
    CcuVectorAddScalar  cuVectorAddScalar;
    int error_code =cuVectorAddScalar.Add(v, 5);
    if(error_code)
       exit(1);

    // verify the result
    for(int i=0; i<C_DATA_SIZE; i++)
    {
        if(v[i] != i+5) 
        {  
            cout << "-vv- Error : (v[" << i << "]=" << v[i] << ") != " << i+5;
            exit(2);
        } 
        
    }

    cout << "-vv- Done" << endl;
    return 0;
}
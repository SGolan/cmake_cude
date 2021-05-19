#include <iostream>
#include "libcuda.h"

using std::cout;
using std::endl;


int main()
{
    // allocate and initialize a vector
    float *v = new float [1000000];
    for(int i=0; i<1e6; i++)
        v[i] = i;

    // invoke cuda kernel for in-place element-wise scalar add 
    CcuVectorAddScalar  cuVectorAddScalar;
    int error_code =cuVectorAddScalar.Add(v, 5);
    if(error_code)
       exit(1);

    // verify the result
    for(int i=0; i<1e6; i++)
    {
        if(v[i] != i+5) 
        {  
            cout << "Error : (v[" << i << "]=" << v[i] << ") != " << i+5;
            exit(2);
        } 
        
    }

    cout << "Done" << endl;
    return 0;
}
#include <iostream>
using namespace std;
 



void merge(int arr[],int low,int mid,int high){
    auto subArrayOne=mid-low+1;
    auto subArrayTwo=high-mid;

    auto *leftArray = new int[subArrayOne],*rightArray= new int[subArrayTwo];

    for(int i=0;i<subArrayOne;i++){
        leftArray[i]=arr[low+i];

    }
    for(int j=0;j<subArrayTwo;j++){
        rightArray[j]=arr[mid+1+j];
    }
    auto indexOfSubArrayOne=0,indexOfSubArrayTwo=0;
    int indexOfMergedArray=low;

    while(indexOfSubArrayOne<subArrayOne && indexOfSubArrayTwo<subArrayTwo){
        if(leftArray[indexOfSubArrayOne]<=rightArray[indexOfSubArrayTwo]){
            arr[indexOfMergedArray]=leftArray[indexOfSubArrayOne];
            indexOfSubArrayOne++;
        }
        else{
            arr[indexOfMergedArray]=rightArray[indexOfSubArrayTwo];
            indexOfSubArrayTwo++;
        }
        indexOfMergedArray++;
    }
    
    
    while(indexOfSubArrayOne < subArrayOne){
        arr[indexOfMergedArray]=leftArray[indexOfSubArrayOne];
        indexOfSubArrayOne++;
        indexOfMergedArray++;
    }
    while(indexOfSubArrayTwo < subArrayTwo){
        arr[indexOfMergedArray]=rightArray[indexOfSubArrayTwo];
        indexOfSubArrayTwo++;
        indexOfMergedArray++;
    }
    delete[] leftArray;
    delete[] rightArray;
    
}
void mergeSort(int arr[],int low,int high){
    if(low>=high){
        return;
    }
    auto mid = low + (high-low)/2;
    mergeSort(arr,low,mid);
    mergeSort(arr,mid+1,high);
    merge(arr,low,mid,high);
    

}
// Driver Code
void printArray(int arr[],int arr_size){
    for(int i=0;i<=arr_size;i++){
        cout<< arr[i]<<" ";

    }
}
int main()
{
    int arr[] = {12,11,13,5,6,7} ;
    auto arr_size = sizeof(arr) / sizeof(arr[0]);

    cout<<"Given array is \n";
    printArray(arr, arr_size-1);

    mergeSort(arr, 0, arr_size-1);
    


    // cin>>a;
    cout << "\nsorted array is \n";
    printArray(arr, arr_size-1);
    
 
    return 0;
}


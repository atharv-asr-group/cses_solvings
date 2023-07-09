#include<iostream>
#include<vector>
#define ll long long
using namespace std;
 
int main(){
    ll a;
    cin>>a;
    cout<<a<<" ";
    while(a!=1){
    if(a%2==0){
        a=a/2;
        
    }else{
        a=a*3+1;
    }
    cout<<a<<" ";
    }
}
#include<iostream>
#include<vector>
#define ll long long
using namespace std;
//what's with the formula, how does he get the intuition.
int main(){
   ll n;
   cin>>n;
   for(int k=1;k<=n;++k){
    ll a1=k*k, a2=a1*(a1-1)/2;
    if(k>2){
        a2-=4*(k-1)*(k-2);
    }
    cout<< a2<<"\n";
   }
}
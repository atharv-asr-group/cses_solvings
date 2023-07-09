#include<iostream>
#include<vector>
#define ll long long
using namespace std;
int main(){
   ll t;
   cin>>t;
   ll a;
   ll b;
   for(ll i=0;i<t;i++){
    cin>>a>>b;
    cout<<((a+b)%3==0&&2*a>=b&&2*b>=a?"YES":"NO")<<"\n";
   }
   
}
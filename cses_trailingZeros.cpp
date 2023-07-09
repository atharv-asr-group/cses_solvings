#include<iostream>
#include<vector>
#define ll long long
using namespace std;
int main(){
   ll n;
   cin>>n;
   ll ans=0;

   while(n){
    ans+=n/5;
    n=n/5;
   }

   cout<<ans;
}
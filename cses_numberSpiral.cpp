#include<iostream>
#include<vector>
#define ll long long
using namespace std;

int main(){
   ll a;
   cin>>a;
   ll x;
   ll y;
//    for(ll i=0;i<a;i++){
//         cin>>x;
//         cin>>y;
//    }
//learn the formula
while(a--){
    cin>>y>>x;
    ll z=max(y,x);
    ll z2=(z-1)*(z-1),ans;
    if(z%2){
        if(y==z){
            ans=z2+x;
        }else{
            ans=z2+2*z-y;
        }
    }else{
        if(x==z){
            ans=z2+y;
        }else{
            ans=z2+2*z-x;
        }
    }
    cout<<ans<<"\n";
    }
}
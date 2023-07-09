#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array

int n,x; 
const int mxN=2e5;


int main(){
    cin>>n;
    ll ans=-1e18, msf=-1e18;
    for(int i=0;i<n;++i){
        ll a;
        cin>>a;
        msf=max(a,msf+a);
        ans=max(ans,msf);
    }
    cout<<ans;
}
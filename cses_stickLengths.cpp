#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array

ll n,x; 
const int mxN=2e5;
ll p[mxN];

int main(){
    cin>>n;
    ll avg=0;
    for(ll i=0;i<n;i++){
        cin>>p[i];
    }
    sort(p,p+n);
    ll x=p[n/2];
    ll ans=0;
    for(ll i=0;i<n;++i){
        ans+=abs(p[i]-x);

    }
    cout<<ans;

}
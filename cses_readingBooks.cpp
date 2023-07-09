#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array

const int mxN=2e5;
ll n, a[mxN];
int main(){
    cin>>n;
    ll s=0;
    for(int i=0; i<n; ++i){
        cin>> a[i], s+=a[i];
    }
    sort(a,a+n);
    cout<<max(s,2ll*a[n-1]);
}
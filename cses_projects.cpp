#include<iostream>
#include<vector>
#include<queue>
#include<functional>
#include<cstring>
#include<array>
#include<set>
#include<numeric>//for iota
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array
//this is like weighted interval
//first need to sort everything by their ending time
const int mxN=2e5;
int n;
ar<int,3> a[mxN];
int main(){
    cin>>n;
    for(int i=0; i<n; ++i){
        cin>>a[i][1]>>a[i][0]>>a[i][2];
    }
    sort(a,a+n);
    set<ar<ll,2>> dp;//have a set of dp
    dp.insert({0,0});
    ll ldp=0;//this is to keep track of the last dp value
    for(int i=0; i<n; ++i){
        auto it=dp.lower_bound({a[i][1]});//go through all of the intervals
        --it;//want to search for, the first interval that has the ending time less than the starting time  
        ldp=max(ldp, (*it)[1]+a[i][2]);
        dp.insert({a[i][0],ldp});//insert the ending time into the set.
    }
    cout<<ldp;//answer will be end of the dp
    
}
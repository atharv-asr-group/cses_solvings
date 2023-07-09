#include<iostream>
#include<vector>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array
//not able to understand.
ll n,x; 
const int mxN=2e5;
ll p[mxN];
int main(){
    cin>>n;
    map<int,int> mp;
    int ans=0;
    for(int i=0; i<n;++i){
        cin>>p[i];
    }
    for(int i=0, j=0; i<n; ++i){
        while(j<n&&mp[p[j]]<1){
            mp[p[j]]++;
            ++j;
    }
    ans=max(j-i,ans);
    mp[p[i]]--;  
    }
    cout<< ans;
}
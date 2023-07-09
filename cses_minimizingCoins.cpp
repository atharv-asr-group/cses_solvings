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
//standard problem
const int mxN=100, mxX=1e6 ,M=1e9+7;
int n,c[mxN],x;
ll dp[mxX+1];
int main(){
    cin>>n>>x;
    for(int i=0;i<n;++i)
        cin>>c[i];
    for(int i=1; i<=x; ++i){
        dp[i]=1e9;
        for(int j=0;j<n;++j){
            if(c[j]<=i){
                dp[i]=min(dp[i],dp[i-c[j]]+1);}}}
    // cout<<dp[x];
    if(dp[x]>=1e9)
        cout<<-1;
    else
        cout<<dp[x];
}
     



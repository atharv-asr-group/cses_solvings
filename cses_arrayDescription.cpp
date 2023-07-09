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
//standard knapsak dp problem

const int mxN=1e5,mxM=100, M=1e9+7;
int n,m, a[mxN];
ll dp[mxN][mxM];

int main(){
    cin>>n>>m;
    for(int i=0; i<n; ++i){
        cin>>a[i], --a[i];
    for(int i=0; i<n; ++i){
        if(i){
        for(int j=0; j<m; ++j){
            dp[i][j]=dp[i-1][j];
            if(j)
                dp[i][j]+=dp[i-1][j-1];
            if(j<m-1)
                dp[i][j]+=dp[i-1][j+1];
            dp[i][j]%=M;
        }}else{
            for(int j=0; j<m;++j)
                dp[0][j]=1;}
        if(~a[i])
            for(int j=0; j<m; ++j)
                if(j^a[i])
                    dp[i][j]=0;
    }
    }
    ll ans=0;
    for(int i=0;i<m;++i)
        ans+=dp[n-1][i];
    cout<<ans%M;
}
   


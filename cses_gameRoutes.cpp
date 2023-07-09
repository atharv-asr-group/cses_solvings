#include<iostream>
#include<vector>
#include<queue>
#include<functional>
#include<cstring>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array

//dp on a graph.

const int mxN=1e5,M=1e9+7;
int n,m,p[mxN],dp[mxN];
vector<int> adj[mxN],ans;
bool vis[mxN];


void dfs(int u){
    dp[u]=u==n-1?1:0;
    vis[u]=1;
    for(int v: adj[u]){
        if(!vis[v]){
            p[v]=u;
            dfs(v);
        }
        dp[u]=(dp[u]+dp[v])%M;
    }
}


int main(){
   cin>>n>>m;
   for(int i=0;i<m;++i){
        ll a,b;
        cin>>a>>b,--a,--b;
        adj[a].push_back(b);
   }
   for(int i=0; i<n; ++i){
        if(!vis[i]){
            dfs(i);
        }
   }
   cout<<dp[0];
}
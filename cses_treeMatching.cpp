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

//dp on a tree

const int mxN=2e5;
int n, dp0[mxN], dp1[mxN];
vector<int> adj[mxN];

void dfs(int u=0, int p=-1){
    
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        dfs(v,u);
        dp1[u]=max(dp1[u]+max(dp0[v],dp1[v]),dp0[u]+dp0[v]+1);
        dp0[u]+=max(dp0[v],dp1[v]);
    }
}


int main(){
    cin>>n;
    for(int i=1;i<n;++i){
        int p,q;
        cin>>p>>q,--p,--q;
        adj[p].push_back(q);
        adj[q].push_back(p);
    }
    dfs();
    cout<< max(dp0[0], dp1[0]);   
}
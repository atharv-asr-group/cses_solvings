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

//after finding the heights, do a second dfs to get the answer

const int mxN=2e5;
int n, d[mxN], ans[mxN];
vector<int> adj[mxN];

void dfs(int u=0, int p=-1){
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        dfs(v,u);
        // ans=max(d[u]+d[v]+1, ans);
        d[u]=max(d[u], d[v]+1);
         
    }
}
//p is parent and pd is distance from parent.
//d[u] is the height of the subtree
void dfs2(int u=0, int p=-1, int pd=0){
    ans[u]=max(d[u],pd);
    vector<ar<int,2>> w{{pd,-1}};//vector array of distances
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        w.push_back({d[v]+1,v});
    }
    w.push_back({0,-1});
    sort(w.begin(),w.end(),greater<ar<int,2>>());
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        dfs2(v,u,w[0][1]==v?w[1][0]+1:w[0][0]+1);
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
    dfs2();
    for(int i=0; i<n; ++i){
        cout<<ans[i]<<" ";
    }
    
}
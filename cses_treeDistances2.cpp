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
                        
//sum of subtree sizes

const int mxN=2e5;
int n, d[mxN];
ll ans[mxN], s[mxN];
vector<int> adj[mxN];

void dfs(int u=0, int p=-1){
    s[u]=1;
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        d[v]=d[u]+1;
        dfs(v,u);
        // ans=max(d[u]+d[v]+1, ans);
        s[u]+=s[v];
        
    }
}
//p is parent and pd is distance from parent.
//d[u] is the height of the subtree
void dfs2(int u, ll pd, int p=-1){
    ans[u]=pd;
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        dfs2(v,pd-s[v]+(n-s[v]),u);
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
    ll sd=0;
    for(int i=0; i<n; ++i){
        sd+=d[i];
    }
    dfs2(0,sd);
    for(int i=0; i<n; ++i){
        cout<<ans[i]<<" ";
    }
}
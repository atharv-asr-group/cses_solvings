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
//VERY SIMILAR TO COMPANY QUERIES 2, 
//ONLY ONE LINE CHANGE FROM IT, IN THE COUT STATEMENT
const int mxN=2e5;
int n, d[mxN], anc[mxN][19],q,p;//d is for depth and anc is for ancestor
vector<int> adj[mxN];

void dfs(int u=0, int p=-1){
    anc[u][0]=p;
    //constructing the binary lifting table.
    for(int i=1;i<19;++i){
        anc[u][i]=~anc[u][i-1]?anc[anc[u][i-1]][i-1]:-1;
    }
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        d[v]=d[u]+1;
        dfs(v,u);
        
        
    }
}
//lca-lowest common ancester
int lca(int u, int v){
    if(d[u]<d[v]){
        swap(u,v);
    }
    for(int i=18; ~i;--i){
        if(d[u]-(1<<i)>=d[v]){
            u=anc[u][i];
        }
    }
    if(u==v)
        return u;
    for(int i=18; ~i; --i)
        if(anc[u][i]^anc[v][i]){
            u=anc[u][i], v=anc[v][i];
        }
    return anc[u][0];
}
int main(){
    cin>>n>>q;
    for(int i=1;i<n;++i){
        int p,q;
        cin>>p>>q,--p,--q;
        adj[p].push_back(q);
        adj[q].push_back(p);
        // cin>>p,--p;
        // adj[p].push_back(i);
    }
    dfs();
    while(q--){
        int x,k;
        cin>>x>>k , --x, --k;
        cout<< d[x]+d[k]-2*d[lca(x,k)]<<"\n";
    }
}
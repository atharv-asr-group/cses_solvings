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
 
//calculate the depth(he said depth I believe)/heights of all the nodes
 
const int mxN=2e5;
int n, d[mxN], ans;
vector<int> adj[mxN];
 
void dfs(int u=0, int p=-1){
    
    for(int v: adj[u]){
        if(v==p){
            continue;
        }
        dfs(v,u);
        ans=max(d[u]+d[v]+1, ans);
        d[u]=max(d[u], d[v]+1);
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
    cout <<ans;
}
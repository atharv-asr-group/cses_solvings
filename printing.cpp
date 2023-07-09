//shortest route 1, flight routes, high score, cycle finding, investigation//edit distance(initialisation), money sums, projects(understand it)
#include <bits/stdc++.h>
#include <vector> // header file includes every Standard library
using namespace std;
#define ll long long
#define ar array
const int mxN=1e5;
int n,m,ans,a,b;
vector<int> adj[mxN],ans;
int c[mxN];
dfs(int u){
    
}

int main(){
    cin>>n>>m;
    for(int i=0, a,b;i<m;++i){
        cin>>a>>b,--a,--b;
        adj[a].push_back(b);
        adj[b].push_back(a);
    }
    memset(p,-1,4*n);
   for(int i=0; i<n; ++i){
    if(!vis[i]){
        dfs(i);
    }
   }
   cout<<"IMPOSSIBLE";
}
// subordinate, tree diameter(in notes), tree distance 1(in notes), 
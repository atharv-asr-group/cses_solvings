#include<iostream>
#include<vector>
#include<queue>
#include<array>
#include<set>
#include<algorithm>
#include<map>
#define ll long long
using namespace std;
#define ar array

//need to connect components

const int mxN=1e5;
int n,m;
vector<int> adj[mxN], ans;
bool vis[mxN];

void dfs(int u){
    vis[u]=1;
    for(int v: adj[u]){
        if(!vis[v]){
            dfs(v);
        }
    }
}
int main(){
    cin>>n>>m;
    for(int i=0, a,b;i<m;++i){
        cin>>a>>b,--a,--b;
        adj[a].push_back(b);
        adj[b].push_back(a);
    }
    for(int i=0;i<n; ++i){
        if(!vis[i]){
            ans.push_back(i);
            dfs(i);
        }
    }
    cout<<ans.size()-1<<"\n";
    for(int i=1;i<ans.size();++i){
        cout<<ans[0]+1<<" "<<ans[i]+1<<"\n";
}
}

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

//topological sort

const int mxN=1e5;
int n,m,p[mxN];
vector<int> adj[mxN],ans;
bool vis[mxN], act[mxN];


void dfs(int u){
    vis[u]=1;
    act[u]=1;
    for(int v: adj[u]){
        if(act[v]){//this is to detect cycle, if there is a cycle no solution is possible
            cout<<"IMPOSSIBLE";
            exit(0);
        }
        else{
            if(!vis[v]){
                p[v]=u;
                dfs(v);
            }
        }
    }
    act[u]=0;
    ans.push_back(u);
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
   reverse(ans.begin(),ans.end());
   for(int u: ans){
    cout<<u+1<<" ";
   }  
}